/*
 *   BSD LICENSE
 *
 *   Copyright(c) 2010-2014 Intel Corporation. All rights reserved.
 *   All rights reserved.
 *
 *   Redistribution and use in source and binary forms, with or without
 *   modification, are permitted provided that the following conditions
 *   are met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in
 *       the documentation and/or other materials provided with the
 *       distribution.
 *     * Neither the name of Intel Corporation nor the names of its
 *       contributors may be used to endorse or promote products derived
 *       from this software without specific prior written permission.
 *
 *   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

/*extended by DBB de Villiers*/

#include <getopt.h>

//Includes for Kodo-c library
#include <time.h>
#include </home/switch/dataplane/kodo-c/shared_kodoc/include/kodoc/kodoc.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <inttypes.h>
#include <sys/types.h>
#include <sys/queue.h>
#include <netinet/in.h>
#include <setjmp.h>
#include <stdarg.h>
#include <ctype.h>
#include <errno.h>
#include <getopt.h>
#include <signal.h>
#include <stdbool.h>

//#include <config.h>
#include <rte_common.h>
#include <rte_log.h>
#include <rte_malloc.h>
#include <rte_memory.h>
#include <rte_memcpy.h>
#include <rte_eal.h>
#include <rte_launch.h>
#include <rte_atomic.h>
#include <rte_cycles.h>
#include <rte_prefetch.h>
#include <rte_lcore.h>
#include <rte_per_lcore.h>
#include <rte_branch_prediction.h>
#include <rte_interrupts.h>
#include <rte_random.h>
#include <rte_debug.h>
#include <rte_ether.h>
#include <rte_ethdev.h>
#include <rte_mempool.h>
#include <rte_mbuf.h>
#include <rte_hash.h>
#include <rte_jhash.h>

// #include "util.h"

//#include "dpdk_encode.h"
#include "dpdkr_pipeline.h"

/* Number of packets to attempt to read from queue. */
#define PKT_READ_SIZE  ((uint16_t)10)

/* Define common names for structures shared between ovs_dpdk and client. */
#define MP_CLIENT_RXQ_NAME "dpdkr%u_tx"
#define MP_CLIENT_TXQ_NAME "dpdkr%u_rx"

#define RTE_LOGTYPE_APP RTE_LOGTYPE_USER1

static volatile bool force_quit;

#define ENCODING_RINGS 32
#define GENID_LEN 8
#define ETHER_TYPE_LEN 2

#define MAC_ENTRIES 200
#define NB_MBUF 8192
#define MAX_PKT_BURST 1024
#define MEMPOOL_CACHE_SIZE 512

uint32_t gentable_size = 0;

static unsigned genIDcounter = 0;

struct generationID {
    char ID[GENID_LEN];
};

/* GenerationID table: Used to store list of all generations still being decoded. */
struct generationID *genID_table;

/* Encoding rings array: Used to store all encoding rings based on dst_addr*/
struct rte_ring encoding_rings[ENCODING_RINGS];

/* Declare rte_rings for Encode, Decode and Recode */
struct rte_ring *encoding_rx_ring;
struct rte_ring *encoding_tx_ring;
struct rte_ring *decoding_rx_ring;
struct rte_ring *decoding_tx_ring;
struct rte_ring *recoding_rx_ring;
struct rte_ring *recoding_tx_ring;

static unsigned mac_counter = 0;

/* Mac Fwd TABLE to group generations by dst_addr */
struct mac_table_entry {
    struct ether_addr d_addr;
};
struct mac_table_entry *mac_fwd_table; 

//Kodo-c init:
//Define num symbols and size.
//Values are just selected from examples for now.
static uint32_t MAX_SYMBOLS = 8;
static uint32_t MAX_SYMBOL_SIZE = 1400; //Size of MTU datatgram.
//Select codec
static uint32_t codec = kodoc_full_vector; //Sliding window can make use of feedback.
//Finite field to use
static uint32_t finite_field = kodoc_binary8;

struct rte_mempool * codingmbuf_pool = NULL;

struct rte_mempool * l2fwd_pktmbuf_pool = NULL;

static void
signal_handler(int signum)
{
    if (signum == SIGINT || signum == SIGTERM) {
        force_quit = true;
        rte_eal_cleanup();

        /* Free all encoding_rings */
        for(int i=0;i<ENCODING_RINGS;i++)
        {
            rte_ring_free(&encoding_rings[i]);
        }

        /* Free dpdkr rings */
        rte_ring_free(encoding_rx_ring);
        rte_ring_free(encoding_tx_ring);
        rte_ring_free(decoding_rx_ring);
        rte_ring_free(decoding_tx_ring);
        rte_ring_free(recoding_rx_ring);
        rte_ring_free(recoding_tx_ring);


        printf("Quiting..\n");
    }
}

/*
 * Application main function - loops through
 * receiving and processing packets. Never returns
 */
int
main(int argc, char *argv[])
{
    int retval = 0;
    void *pkts[PKT_READ_SIZE];

    mac_fwd_table = calloc(MAC_ENTRIES,MAC_ENTRIES * sizeof(struct mac_table_entry));
    genID_table = (struct generationID*)calloc(MAC_ENTRIES,MAC_ENTRIES * sizeof(struct generationID));

    if ((retval = rte_eal_init(argc, argv)) < 0) {
        return -1;
    }

    /* create the mbuf pool for packets going out. */
    l2fwd_pktmbuf_pool = rte_pktmbuf_pool_create("mbuf_pool", NB_MBUF,MEMPOOL_CACHE_SIZE, 0, RTE_MBUF_DEFAULT_BUF_SIZE,rte_socket_id());

    /* create the mbuf pool for data_in and payload for encoder. And for decoder. */
    codingmbuf_pool = rte_pktmbuf_pool_create("coding_pool",NB_MBUF,MEMPOOL_CACHE_SIZE,0,MAX_SYMBOLS*MAX_SYMBOL_SIZE,SOCKET_ID_ANY);

    /* Network coding factories */
    kodoc_factory_t encoder_factory = kodoc_new_encoder_factory(codec,finite_field,MAX_SYMBOLS-1,MAX_SYMBOL_SIZE);
    kodoc_factory_t decoder_factory = kodoc_new_decoder_factory(codec,finite_field,MAX_SYMBOLS-1,MAX_SYMBOL_SIZE);

    encoding_rx_ring = rte_ring_lookup("dpdkr10_rx");
    encoding_tx_ring = rte_ring_lookup("dpdkr11_tx");
    decoding_rx_ring = rte_ring_lookup("dpdkr20_rx");
    decoding_tx_ring = rte_ring_lookup("dpdkr21_tx");
    recoding_rx_ring = rte_ring_lookup("dpdkr30_rx");
    recoding_tx_ring = rte_ring_lookup("dpdkr31_tx");

    argc -= retval;
    argv += retval;

    RTE_LOG(INFO, APP, "Finished Process Init.\n");

    printf("[Press Ctrl-C to quit ...]\n");

    force_quit = false;
    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);

    while (!force_quit)
    {
        unsigned rx_pkts = PKT_READ_SIZE;

        /* Get packets for Encoding */
        while (rte_ring_dequeue_bulk(encoding_rx_ring, pkts, rx_pkts, NULL) != 0 && rx_pkts > 0) 
        {
            printf("encode rx pkts %d\n",rx_pkts);
            for(uint i=0;i<rx_pkts;i++)
            {
                int index = 0;
                struct rte_mbuf *m = pkts[i];
                //rte_pktmbuf_dump(stdout,m,100);

                /* Get recieved packet */
                const unsigned char* data = rte_pktmbuf_mtod(m, void *);
                /* Get ethernet dst and src */
                struct ether_addr d_addr;
                rte_memcpy(d_addr.addr_bytes,data,ETHER_ADDR_LEN);
                struct ether_addr s_addr;
                rte_memcpy(s_addr.addr_bytes,data+ETHER_ADDR_LEN,ETHER_ADDR_LEN);

                int mac_add = 0;
                for (int i=0;i<MAC_ENTRIES;i++)
                {
                    /* Check if table contains src address. */
                    if(memcmp(mac_fwd_table[i].d_addr.addr_bytes,s_addr.addr_bytes,sizeof(s_addr.addr_bytes)) == 0) 
                    {
                        /* Dont add mac address as it is already in the table. */
                        mac_add = 1;
                        index = i;
                    }
                }
                if(unlikely(mac_add==0))
                {
                    mac_fwd_table[mac_counter].d_addr = s_addr;

                    /* Create rte_ring for encoding queue, for each new MAC entry. */
                    char ring_name[30];
                    sprintf(ring_name,"encoding_ring%d",mac_counter);
                    encoding_rings[mac_counter] = *rte_ring_create((const char *)ring_name,MAX_SYMBOLS,-1,0);

                    mac_counter++;
                    index = i;

                    /* Print updated MAC table to Console. */
                    printf("\nUpdated MAC TABLE.\nD_ADDR\n");
                    for(uint i=0;i<mac_counter;i++)
                    {
                        if(mac_fwd_table[i].d_addr.addr_bytes[0] != 0)
                        {
                            for (uint j = 0; j < sizeof(mac_fwd_table[i].d_addr.addr_bytes); ++j)
                            {
                                printf("%02x:", mac_fwd_table[i].d_addr.addr_bytes[j]);
                            }
                        }
                    }
                }

                /* Add packet to encoding_ring */
                char ring_name[30];
                sprintf(ring_name,"encoding_ring%d",index);
                struct rte_ring* encode_ring_ptr = rte_ring_lookup(ring_name);
                rte_ring_enqueue(encode_ring_ptr,(void *)m);

                //Run encoder function.
                net_encode(&encoder_factory);
                printf("Pkt added to encoder.\n");

            }
            rx_pkts = (uint16_t)RTE_MIN(rte_ring_count(encoding_rx_ring), PKT_READ_SIZE);
        }
        /* Get packets for Decoding */
        while (rte_ring_dequeue_bulk(decoding_rx_ring, pkts, rx_pkts, NULL) != 0 && rx_pkts > 0) 
        {
            printf("decode rx pkts %d\n",rx_pkts);
            for(uint i=0;i<rx_pkts;i++)
            {
                struct rte_mbuf *m = pkts[i];
                rte_pktmbuf_dump(stdout,m,100);
            }
            rx_pkts = (uint16_t)RTE_MIN(rte_ring_count(decoding_rx_ring), PKT_READ_SIZE);
        }
        /* Get packets for Recoding */
        while (rte_ring_dequeue_bulk(recoding_rx_ring, pkts, rx_pkts, NULL) != 0 && rx_pkts > 0) 
        {
            printf("recode rx pkts %d\n",rx_pkts);
            for(uint i=0;i<rx_pkts;i++)
            {
                struct rte_mbuf *m = pkts[i];
                rte_pktmbuf_dump(stdout,m,100);
            }
            rx_pkts = (uint16_t)RTE_MIN(rte_ring_count(recoding_rx_ring), PKT_READ_SIZE);
        }

        /*while (rte_ring_dequeue_bulk(encoding_tx_ring, pkts,
                        rx_pkts, NULL) != 0 && rx_pkts > 0) {
            printf("encode tx pkts %d\n",rx_pkts);
            rx_pkts = (uint16_t)RTE_MIN(rte_ring_count(encoding_tx_ring), PKT_READ_SIZE);
        }
        while (rte_ring_dequeue_bulk(decoding_tx_ring, pkts,
                        rx_pkts, NULL) != 0 && rx_pkts > 0) {
            printf("decode tx pkts %d\n",rx_pkts);
            rx_pkts = (uint16_t)RTE_MIN(rte_ring_count(decoding_tx_ring), PKT_READ_SIZE);
        }
        while (rte_ring_dequeue_bulk(recoding_tx_ring, pkts,
                        rx_pkts, NULL) != 0 && rx_pkts > 0) {
            printf("recode tx pkts %d\n",rx_pkts);
            rx_pkts = (uint16_t)RTE_MIN(rte_ring_count(recoding_tx_ring), PKT_READ_SIZE);
        }*/
    }
}

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

                        //struct dst_addr_status status = dst_mac_status(m, 0);
                        //l2fwd_learning_forward(encoded_mbuf, &status);
                        rte_pktmbuf_free(rte_mbuf_payload);
                        rte_pktmbuf_free(encoded_mbuf);
                        //rte_pktmbuf_free();

                        //Temp print encoded packet
                        //rte_mempool_dump(stdout,l2fwd_pktmbuf_pool);
                        rte_pktmbuf_dump(stdout,encoded_mbuf,100);
                    }

                    rte_pktmbuf_free(rte_mbuf_data_in);
                    kodoc_delete_coder(encoder);
                }
                else
                {
                    printf("Encoding error occured. Packets not encoded due to queue being empty.\n");
                }
                rte_ring_free(encode_ring_ptr);

            }
        }
    } 
}

