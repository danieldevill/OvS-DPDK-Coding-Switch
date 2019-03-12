#include "dpdk_encode.h"

static void 
net_encode(kodoc_factory_t *encoder_factory)
{
	//Loop through each dst_addr in the MAC table and check if the ring is full. If the ring is full then begin encoding on that queue.
	for(uint i=0;i<=mac_counter;i++)
	{
		char ring_name[30];
		sprintf(ring_name,"encoding_ring%d",i);

		struct rte_ring* encode_ring_ptr = rte_ring_lookup(ring_name);

		if(encode_ring_ptr!=NULL)
		{
			if(rte_ring_count(encode_ring_ptr)==MAX_SYMBOLS-1) //Check if ring is fulled, if so, begin encoding. Also need to add if the time limit is reached as an OR.
			{
				//Begin decoding on rings.
				uint* obj_left = 0;
				//rte_mbuf to hold the dequeued data.
				struct rte_mbuf *dequeued_data[MAX_SYMBOLS-1];
				rte_pktmbuf_alloc_bulk(codingmbuf_pool,dequeued_data,MAX_SYMBOLS);
				rte_ring_dequeue_bulk(encode_ring_ptr,(void **)dequeued_data,MAX_SYMBOLS-1,obj_left);
				if(rte_ring_count(encode_ring_ptr)==0) //Checks if dequeued correctly.
				{
					kodoc_coder_t encoder = kodoc_factory_build_coder(*encoder_factory);

					kodoc_set_systematic_off(encoder);

					uint32_t block_size = kodoc_block_size(encoder);

					//Create Mbuf for data_in and payload.
					struct rte_mbuf* rte_mbuf_data_in = rte_pktmbuf_alloc(codingmbuf_pool);

					uint8_t* data_in = rte_pktmbuf_mtod(rte_mbuf_data_in, void *);

					//Process data to be used by encoder.
					for(uint pkt=0;pkt<MAX_SYMBOLS-1;pkt++)
					{
						//Get recieved packet
						struct rte_mbuf *m = dequeued_data[pkt];
						const unsigned char* data = rte_pktmbuf_mtod(m, void *); //Convert data to char.

						//Fill data_in with data.
						for(uint j=0;j<rte_pktmbuf_data_len(m);j++)
						{
							data_in[((MAX_SYMBOL_SIZE)*pkt)+j] = data[j+(2*ETHER_ADDR_LEN)]; //Data starts at 12th byte position, after src and dst. Include eth_type.
						}
					}

					//Assign data buffer to encoder
					kodoc_set_const_symbols(encoder, data_in, block_size);

					//Loop through each packet in the queue.
					for(uint pkt=0;pkt<MAX_SYMBOLS-1;pkt++)
					{
						//Get recieved packet
						struct rte_mbuf *m = dequeued_data[pkt];
						const unsigned char* data = rte_pktmbuf_mtod(m, void *); //Convert data to char.
						//Get ethernet dst and src
						struct ether_addr d_addr;
						rte_memcpy(d_addr.addr_bytes,data,ETHER_ADDR_LEN);
						struct ether_addr s_addr;
						rte_memcpy(s_addr.addr_bytes,data+ETHER_ADDR_LEN,ETHER_ADDR_LEN);
						//Allocate payload buffer
						struct rte_mbuf* rte_mbuf_payload = rte_pktmbuf_alloc(codingmbuf_pool);
						uint8_t* payload = rte_pktmbuf_mtod(rte_mbuf_payload, void *);

						//Writes a symbol to the payload buffer.
						int bytes_used = kodoc_write_payload(encoder, payload);
						printf("EncodedPkt Generated: rank:%d bytes_used:%d\n", kodoc_rank(encoder), bytes_used);

						//Use first symbol payload "random data" for generationID
						//Instead generate random array of characters. 
						//Create generationID 
						char genID[GENID_LEN];
						if(pkt == 0) //Create genID only during first pkt. use this genID for all other pkts in generation.
						{
							int genChar;
							for(genChar=0;genChar<GENID_LEN;genChar++)
							{
								genID[genChar] = 'A' + (random() % 26);
							}
						}

						//Create mbuf for encoded reply
						struct rte_mbuf* encoded_mbuf = rte_pktmbuf_alloc(l2fwd_pktmbuf_pool);
						char* encoded_data = rte_pktmbuf_append(encoded_mbuf,rte_pktmbuf_data_len(m)+GENID_LEN+10);
						struct ether_hdr eth_hdr = {	
							d_addr, //Same as incoming source addr.
							s_addr, //Port mac address
							0x2020 //My custom NC Ether type?
						};
						encoded_data = rte_memcpy(encoded_data,&eth_hdr,ETHER_HDR_LEN); //Add eth_hdr
						encoded_data = rte_memcpy(encoded_data+ETHER_HDR_LEN,genID,sizeof(genID)); //Add generationID
						encoded_data = rte_memcpy(encoded_data+sizeof(genID),payload,kodoc_payload_size(encoder)); //Add payload

						struct dst_addr_status status = dst_mac_status(m, 0);
					  	l2fwd_learning_forward(encoded_mbuf, &status);
					  	rte_pktmbuf_free(rte_mbuf_payload);
					  	rte_pktmbuf_free(encoded_mbuf);
					  	//rte_pktmbuf_free();

					  	//Temp print encoded packet
					  	//rte_mempool_dump(stdout,l2fwd_pktmbuf_pool);
						//rte_pktmbuf_dump(stdout,encoded_mbuf,100);
					}

					rte_pktmbuf_free(rte_mbuf_data_in);
					kodoc_delete_coder(encoder);
				}
				else
				{
					printf("Encoding error occured. Packets not encoded due to queue being empty.\n");
				}
			}
		}
	} 
}
