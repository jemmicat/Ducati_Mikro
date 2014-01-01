
#define _ETHERNET_HALFDUPLEX   0b1
#define _ETHERNET_FULLDUPLEX   0b10
#define _ETHERNET_SPD10        0b100
#define _ETHERNET_SPD100       0b1000
#define _ETHERNET_AUTO_NEGOTIATION    0b10000
#define _ETHERNET_MANUAL_NEGOTIATION  0b100000

// Filter defines//////////////////////////////////////////////////////////////

// Ethernet receive all
#define _ETHERNET_FILTER_RECEIVE_ALL_EN                                         ((unsigned long)0b1)
#define _ETHERNET_FILTER_RECEIVE_ALL_DIS                                        ((unsigned long)0b10)

// Ethernet Broadcast Frames Reception
#define _ETHERNET_FILTER_BROADCAST_RECEIVE_EN                                   ((unsigned long)0b100)
#define _ETHERNET_FILTER_BROADCAST_RECEIVE_DIS                                  ((unsigned long)0b1000)

// Ethernet Multicast Frames Reception
#define _ETHERNET_FILTER_MULTICAST_RECEIVE_ALL                                  ((unsigned long)0b10000)
#define _ETHERNET_FILTER_MULTICAST_FILTER_PERFECT                               ((unsigned long)0b100000)
#define _ETHERNET_FILTER_MULTICAST_FILTER_HASH_TABLE                            ((unsigned long)0b1000000)
#define _ETHERNET_FILTER_MULTICAST_FILTER_PERFECT_HASH_TABLE                    ((unsigned long)0b10000000)

// Ethernet Unicast Filter Reception
#define _ETHERNET_FILTER_UNICAST_HASH_TABLE                                     ((unsigned long)0b100000000)
#define _ETHERNET_FILTER_UNICAST_HASH_PERFECT                                   ((unsigned long)0b1000000000)






/*
 * library globals
 */
typedef struct
        {
        unsigned char   valid;                         // valid/invalid entry flag
        unsigned long   tmr;                           // timestamp
        unsigned char   ip[4];                         // IP address
        unsigned char   mac[6];                        // MAC address behind the IP address
        } Net_Ethernet_Intern_arpCacheStruct;

extern Net_Ethernet_Intern_arpCacheStruct Net_Ethernet_Intern_arpCache[];    // ARP cash, 3 entries max

extern unsigned char    Net_Ethernet_Intern_macAddr[6];           // MAC address of the controller
extern unsigned char    Net_Ethernet_Intern_ipAddr[4];            // IP address of the device
extern unsigned char    Net_Ethernet_Intern_gwIpAddr[4];          // GW
extern unsigned char    Net_Ethernet_Intern_ipMask[4];            // network mask
extern unsigned char    Net_Ethernet_Intern_dnsIpAddr[4];         // DNS serveur IP
extern unsigned char    Net_Ethernet_Intern_rmtIpAddr[4];         // remote IP Address of host (DNS server reply)

extern unsigned long    Net_Ethernet_Intern_userTimerSec;         // must be incremented by user 1 time per second


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

typedef struct {
  char remoteIP[4];              // Remote IP address
  char remoteMAC[6];             // Remote MAC address
  unsigned int remotePort;       // Remote TCP port
  unsigned int destPort;         // Destination TCP port
  unsigned int dataLength;       // Current TCP payload size
  unsigned int broadcastMark;    // =0 -> Not broadcast; =1 -> Broadcast
} UDP_Intern_Dsc;
// Each field refers to the last received package

extern UDP_Intern_Dsc udpRecord_Intern;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//** Socket structure definition
typedef struct {
  char          remoteIP[4];        // Remote IP address
  char          remoteMAC[6];       // Remote MAC address
  unsigned int  remotePort;         // Remote TCP port
  unsigned int  destPort;           // Destination TCP port

  unsigned int  dataLength;         // TCP payload size (refers to the last received package)
  unsigned int  remoteMSS;          // Remote Max Segment Size
  unsigned int  myWin;              // My Window
  unsigned int  myMSS;              // My Max Segment Size
  unsigned long mySeq;              // My Current sequence
  unsigned long myACK;              // ACK

  char          stateTimer;         // State timer
  char          retransmitTimer;    // Retransmit timer
  unsigned int  packetID;           // ID of packet
  char          open;               // =0 -> Socket busy;  =1 -> Socket free
  char          ID;                 // ID of socket
  char          broadcastMark;      // =0 -> Not broadcast; =1 -> Broadcast
  char          state;              // State table:
                                     //             0 - connection closed
                                     //             1 - remote SYN segment received, our SYN segment sent, and We wait for ACK (server mode)
                                     //             3 - connection established
                                     //             4 - our SYN segment sent, and We wait for SYN response (client mode)
                                     //             5 - FIN segment sent, wait for ACK.
                                     //             6 - Received ACK on our FIN, wait for remote FIN.
                                     //             7 - Expired ACK wait time. We retransmit last sent packet, and again set Wait-Timer. If this happen again
                                     //                 connection close.
  // Buffer....................//
  unsigned int nextSend;       //    // "Pointer" on first byte in buffer we want to send.
  unsigned int lastACK;        //    // "Pointer" on last acknowledged byte in buffer.
  unsigned int lastSent;       //    // "Pointer" on last sent byte in buffer.
  unsigned int lastWritten;    //    // "Pointer" on last written byte in buffer which not sent yet.
  unsigned int numToSend;      //    // Number of bytes in buffer to be sent.
  char         buffState;      //    // Private variable.
  char        *txBuffer;       //    // Pointer on Tx bafer.
  //...........................//

} SOCKET_Intern_Dsc;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

extern const char         NUM_OF_SOCKET_Intern;
extern const unsigned int TCP_TX_SIZE_Intern;
extern const unsigned int MY_MSS_Intern;
extern const unsigned int SYN_FIN_WAIT_Intern;
extern const unsigned int RETRANSMIT_WAIT_Intern;

extern char tx_buffers_Intern[][];
extern SOCKET_Intern_Dsc socket_Intern[];

/*
 * prototypes for public functions
 */
extern  void            Net_Ethernet_Intern_Init(unsigned char *mac, unsigned char *ip, unsigned long configuration);
extern  unsigned char   Net_Ethernet_Intern_doPacket();
extern  void            Net_Ethernet_Intern_putByte(unsigned char b);
extern  void            Net_Ethernet_Intern_putBytes(unsigned char *ptr, unsigned int n);
extern  void            Net_Ethernet_Intern_putConstBytes(const unsigned char *ptr, unsigned int n);
extern  unsigned char   Net_Ethernet_Intern_getByte();
extern  void            Net_Ethernet_Intern_getBytes(unsigned char *ptr, unsigned long addr, unsigned int n);
extern  unsigned int    Net_Ethernet_Intern_UserUDP(UDP_Intern_Dsc *udpDsc);
extern  void            Net_Ethernet_Intern_payloadInitUDP();
extern  void            Net_Ethernet_Intern_UserTCP(SOCKET_Intern_Dsc *socket);
extern  void            Net_Ethernet_Intern_confNetwork(char *ipMask, char *gwIpAddr, char *dnsIpAddr);

extern char Net_Ethernet_Intern_connectTCP(char *remoteIP, unsigned int remote_port ,unsigned int my_port, SOCKET_Intern_Dsc **used_socket);
extern char Net_Ethernet_Intern_disconnectTCP(SOCKET_Intern_Dsc *socket);

extern char         Net_Ethernet_Intern_putByteTCP(char ch, SOCKET_Intern_Dsc *socket);
extern unsigned int Net_Ethernet_Intern_putBytesTCP(char *ptr,unsigned int n, SOCKET_Intern_Dsc *socket);
extern unsigned int Net_Ethernet_Intern_putConstBytesTCP(const char *ptr,unsigned int n, SOCKET_Intern_Dsc *socket);
extern unsigned int Net_Ethernet_Intern_putStringTCP(char *ptr, SOCKET_Intern_Dsc *socket);
extern unsigned int Net_Ethernet_Intern_putConstStringTCP(const char *ptr, SOCKET_Intern_Dsc *socket);
extern char         Net_Ethernet_Intern_bufferEmptyTCP(SOCKET_Intern_Dsc *socket);
extern void         Net_Ethernet_Intern_stackInitTCP();
extern char         Net_Ethernet_Intern_startSendTCP(SOCKET_Intern_Dsc *socket);