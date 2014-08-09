/*******************************************************************************
* Ethernet  - Function Set used for Ethernet example
* ------------------------------------------------------------------------------
* For this example we are using Net_Ethernet library:
* http://www.libstock.com/projects/view/107/network-ethernet-library
*******************************************************************************/

#include "mikromedia_STM32plus_objects.h"
#include "__NetEthInternal.h"
#include <built_in.h>
#include "__Time.h"

// extern functions
void InitTimer5();
void RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset);

char Time_Obtained = 0;

static const SUCCESS     = 0;
static const NOT_SUCCESS = 1;

static unsigned char   myMacAddr[6] = {0x00, 0x16, 0xA5, 0x52, 0x19, 0x3f};   // my MAC address
static unsigned char   myIpAddr[4]  = {0, 0,  0, 0 };                         // my IP address (DHCP is used)
static unsigned char   IpServer[4]  = {12, 10, 191, 251};                     // IP of Time Server (time-nist.symmetricom.com )

static SOCKET_Intern_Dsc  *socketServer;
TimeStruct my_time;
static long epoch;
static unsigned int myPort = 1000;
static char acquaringComplete_mark = NOT_SUCCESS;
static char buff[4];
static char ethInitialized_mark = NOT_SUCCESS;
static char ethDhcp_mark = NOT_SUCCESS;
static char synReqSend_mark = 0;

/*******************************************************************************
* Function Net_Ethernet_Intern_UserTCP(SOCKET_Intern_Dsc *socket)
* ------------------------------------------------------------------------------
* Overview: Function is called from inside library and it should read or write to Ethernet buffer
* Input: pointer to a socket
* Output: Nothing
*******************************************************************************/
void Net_Ethernet_Intern_UserTCP(SOCKET_Intern_Dsc *socket) {
char i;

  // if there is no SYN response
  if( (memcmp(socket->remoteIP,IpServer,4) != 0) )
    return;

  // read from ethernet buffer
  for (i = 0; i < 4; i ++)
    buff[i] = Net_Ethernet_Intern_getByte();

  // convert 32bit time data to readable time
  Highest(epoch) = buff[0];
  Higher(epoch)  = buff[1];
  Hi(epoch) = buff[2];
  Lo(epoch) = buff[3];

  epoch = epoch - 2208902400;          // convert from seconds passed from 1.1.1900 to UNIOX time
  Time_epochToDate(epoch, &my_time);
  acquaringComplete_mark = SUCCESS;
  Time_Obtained = 1;
}

/*******************************************************************************
* Function Net_Ethernet_Intern_UserUDP(SOCKET_Intern_Dsc *socket)
* ------------------------------------------------------------------------------
* Overview: Function is called from inside library and it should read or write to Ethernet buffer
* Input: pointer to a socket
* Output: Number of wrtitten bytes.
*******************************************************************************/
unsigned int    Net_Ethernet_Intern_UserUDP(UDP_Intern_Dsc *udpDsc) {
  return 0;
}

/*******************************************************************************
* Function Ethernet_Message(char *text)
* ------------------------------------------------------------------------------
* Overview: Function writes appropriate message on TFT
* Input: text message
* Output: Nothing
*******************************************************************************/
void Ethernet_Message(char *text){
  strcpy(Label42_Caption, text);
  RedrawLabel(Clock.Color, &Label42, 180, 20);
}

/*******************************************************************************
* Function Ethernet_Init()
* ------------------------------------------------------------------------------
* Overview: Function initializes Ethernet module
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static char Ethernet_Init() {
char result = SUCCESS;
/*Net_Ethernet_Intern_stackInitTCP();
  if (ethInitialized_mark == NOT_SUCCESS) {
    // stack TCP init
    Net_Ethernet_Intern_stackInitTCP();

    Ethernet_Message("Ethernet initialization..");
    // ethernet initalization
    ethInitialized_mark = Net_Ethernet_Intern_Init(myMacAddr, myIpAddr, _ETHERNET_AUTO_NEGOTIATION, &_GPIO_MODULE_ETHERNET_G11_13_14);

    if (ethInitialized_mark == SUCCESS) {
      Ethernet_Message("Initialization success..");
    }
    else {
      Ethernet_Message("Initialization failed..");
      result = NOT_SUCCESS;
    }
    Delay_ms(2000);
  }
  Ethernet_Message("");*/
  return result;

}

/*******************************************************************************
* Function Ethernet_DHCP()
* ------------------------------------------------------------------------------
* Overview: Function initializes DHCP and obtains IP from DHCP server
* Input: Nothing
* Output: 0 if successful
*         1 if not successul
*******************************************************************************/
/*static char Ethernet_DHCP() {
char text[20], temp_text[7], i, result = SUCCESS;
unsigned long timeout;

  if (ethDhcp_mark == NOT_SUCCESS) {
    Ethernet_Message("Obtaining IP ...");
    timeout = 0;
    while((ethDhcp_mark == NOT_SUCCESS) && (timeout < 3)) {
      // init DHCP
      ethDhcp_mark = Net_Ethernet_Intern_initDHCP(5) ? SUCCESS : NOT_SUCCESS;
      timeout++;
    }

    if (ethDhcp_mark == SUCCESS){
      // Get obtained IP
      memcpy(myIpAddr, Net_Ethernet_Intern_getIpAddress(), 4);
      text[0] = 0;
      for (i = 0; i < 4; i ++){
        ByteToStr(myIpAddr[i], temp_text);
        strcat(text, temp_text);
        if(i != 3)
          strcat(text, ".");
      }
      // Display it on TFT
      Ethernet_Message(text);
    }
    else {
      Ethernet_Message("DHCP not respond");
      result = NOT_SUCCESS;
    }
    Delay_ms(2000);
  }
  Ethernet_Message("");
  return result;
}*/

/*******************************************************************************
* Function Ethernet_ReachTime()
* ------------------------------------------------------------------------------
* Overview: Function connects to time server and gets time in 32bit format (seconds passed since 1.1.1900)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static void Ethernet_ReachTime() {
unsigned long timeout;
char connectedDetect_mark;
char i;

  for(i = 0; i < 5; i++) {
    // we should not connect to time server more then once in every 5 seconds
    timeout = Net_Ethernet_Intern_UserTimerSec + 5;
    acquaringComplete_mark = NOT_SUCCESS;
    synReqSend_mark = NOT_SUCCESS;
    connectedDetect_mark = 0;

    while((Net_Ethernet_Intern_UserTimerSec < timeout) && (acquaringComplete_mark == NOT_SUCCESS)){

      Net_Ethernet_Intern_doPacket();

      if (synReqSend_mark == NOT_SUCCESS) {
        Ethernet_Message("Connecting to Time Server");
        myPort++;
        // try to connect to time server
        synReqSend_mark = Net_Ethernet_Intern_connectTCP(IpServer, 37, myPort, &socketServer) ? SUCCESS : NOT_SUCCESS;

        if (synReqSend_mark != SUCCESS){
          break;
        }
      }
      // if connected ...
      if ((socketServer->state == 3)&&(connectedDetect_mark == 0)) {
        connectedDetect_mark = 1;
        Ethernet_Message("Connected");
      }
    }

    if(acquaringComplete_mark == SUCCESS) {
      break;
    }
  }

  if(acquaringComplete_mark == SUCCESS) {
    Ethernet_Message("Acquaring GMT Time Success");
  }
  else if (socketServer->state == 3) {
    Ethernet_Message("Failed to Acquire GMT Time");
  }
  else {
    Ethernet_Message("Failed to Connect to server");
  }

  Delay_ms(2000);
  Ethernet_Message("");
  Net_Ethernet_Intern_disconnectTCP(socketServer);
}

/*******************************************************************************
* Function Start_Ethernet()
* ------------------------------------------------------------------------------
* Overview: Function performs Ethernat example
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Start_Ethernet(){
  // we should provide timer interrupt each second and increment Net_Ethernet_Intern_UserTimerSec
  /*InitTimer5();
  NVIC_IntEnable(IVT_INT_TIM5);
  EnableInterrupts();

  if(Ethernet_Init() != SUCCESS)
    return;
  if(Ethernet_DHCP() != SUCCESS)
    return;

  Ethernet_ReachTime();*/
}