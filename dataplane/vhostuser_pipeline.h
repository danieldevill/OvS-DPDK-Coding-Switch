#ifndef ENCODE_H_INCLUDED
#define ENCODE_H_INCLUDED

static void net_encode(kodoc_factory_t *encoder_factory);
static void net_decode(kodoc_factory_t *decoder_factory);
static struct rte_ring* genID_in_genTable(char *generationID);

#endif