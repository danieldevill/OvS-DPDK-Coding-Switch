#ifndef ENCODE_H_INCLUDED
#define ENCODE_H_INCLUDED

static void net_encode(kodoc_factory_t *encoder_factory);
static void net_decode(kodoc_factory_t *decoder_factory);
static struct rte_ring* genID_in_genTable(char *generationID);

enum {VIRTIO_RXQ, VIRTIO_TXQ, VIRTIO_QNUM};

struct vhost_queue {
	struct rte_vhost_vring	vr;
	uint16_t		last_avail_idx;
	uint16_t		last_used_idx;
};

static struct ether_addr base_eth_addr = {
	.addr_bytes = {
		0x56 /* V */,
		0x48 /* H */,
		0x4F /* O */,
		0x53 /* S */,
		0x54 /* T */,
		0x00
	}
};

struct vhost_dev {
	/**< Number of memory regions for gpa to hpa translation. */
	uint32_t nregions_hpa;
	/**< Device MAC address (Obtained on first TX packet). */
	struct ether_addr mac_address;
	/**< RX VMDQ queue number. */
	uint16_t vmdq_rx_q;
	/**< Vlan tag assigned to the pool */
	uint32_t vlan_tag;
	/**< Data core that the device is added to. */
	uint16_t coreid;
	/**< A device is set as ready if the MAC address has been set. */
	volatile uint8_t ready;
	/**< Device is marked for removal from the data core. */
	volatile uint8_t remove;

	int vid;
	uint64_t features;
	size_t hdr_len;
	uint16_t nr_vrings;
	struct rte_vhost_memory *mem;
	TAILQ_ENTRY(vhost_dev) global_vdev_entry;
	TAILQ_ENTRY(vhost_dev) lcore_vdev_entry;

#define MAX_QUEUE_PAIRS	4
	struct vhost_queue queues[MAX_QUEUE_PAIRS * 2];
} __rte_cache_aligned;

TAILQ_HEAD(vhost_dev_tailq_list, vhost_dev);

#endif