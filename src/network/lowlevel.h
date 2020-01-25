/**
 * fms/src/network/lowlevel.c
 *
 * Defines functions that interface directly with the OS network API
 *
 * @author Connor Henley, @thatging3rkid
 */
#ifndef __FMS_NETWORK_LOW_LEVEL_NET
#define __FMS_NETWORK_LOW_LEVEL_NET

// allow C++ to parse this
#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>

#include "core/network/lowlevel.h"

/**
 * Starts a thread that accepts new TCP connections. After a new connection is
 * started, the thread sets up the data structure for this connection and starts
 * the listeners for TCP and UDP.
 *
 * @param (*on_connect) the handler function that is called after every new 
 *        connection. The function is passed a pointer to a structure that can
 *        contains connection data and can be used to send a packet.
 * @param (*on_packet) the handler function that gets called on every incoming
 *        packet. This function is passed a pointer to a TLV structure that
 *        contains the recieved data.
 * @note this should only be run on the server-side of the connection (i.e. FMS)
 */
void llnet_acceptor_start(void (*on_connect)(NetworkConnection_t*), 
    void (*on_packet)(IntermediateTLV_t*));

#ifdef __cplusplus
}
#endif

#endif
