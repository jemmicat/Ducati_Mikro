#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Ethernet_main.c"
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/mikromedia_stm32plus_objects.h"
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct {
 unsigned int X_Min;
 unsigned int X_Max;
 unsigned int Y_Min;
 unsigned int Y_Max;
 char Rotate;
} TTPConstants;

typedef struct Button {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef struct Circle {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Radius;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCircle;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

typedef struct CheckBox {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Checked;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Rounded;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCheckBox;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int ButtonsCount;
 TButton * const code *Buttons;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int CirclesCount;
 TCircle * const code *Circles;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 unsigned int CheckBoxesCount;
 TCheckBox * const code *CheckBoxes;
};

extern TScreen Home;
extern TImage Image1;
extern TImage Image3;
extern TLabel Label5;
extern TLabel Label7;
extern TLabel Label8;
extern TImage Image6;
extern TLabel Label14;
extern TImage Image10;
extern TLabel Label19;
extern TImage Image9;
extern TLabel Label20;
extern TImage Image16;
extern TLabel Label25;
extern TImage Image24;
extern TLabel Label30;
extern TImage Image18;
extern TLabel Label34;
extern TImage TicTacToe;
extern TLabel Label40;
extern TImage BatteryStatus;
extern TLabel * const code Screen1_Labels[10];
extern TImage * const code Screen1_Images[10];

extern TScreen Accelerometer;
extern TBox Box23;
extern TBox Box1;
extern TImage Image2;
extern TLabel Label1;
extern TLabel Label2;
extern TLabel Label3;
extern TLabel Label4;
extern TLabel * const code Screen2_Labels[4];
extern TImage * const code Screen2_Images[1];
extern TBox * const code Screen2_Boxes[2];

extern TScreen RGBLight;
extern TBox Box22;
extern TLabel Label9;
extern TImage Image5;
extern TLabel Label10;
extern TCircle Circle1;
extern TLabel Label11;
extern TLabel Label12;
extern TLabel Label13;
extern TBox RGB_Active_area;
extern TLabel * const code Screen3_Labels[5];
extern TImage * const code Screen3_Images[1];
extern TCircle * const code Screen3_Circles[1];
extern TBox * const code Screen3_Boxes[2];

extern TScreen Clock;
extern TBox Box16;
extern TBox Box15;
extern TBox Box13;
extern TBox Box12;
extern TLabel Label15;
extern TBox Box2;
extern TBox Box3;
extern TLabel Label16;
extern TImage ClockBack;
extern TLabel Label17;
extern TLabel Label18;
extern TImage SyncIcon;
extern TImage Image8;
extern TBox Box4;
extern TBox Box5;
extern TImage Image7;
extern TLabel Label42;
extern TImage Image17;
extern TBox Box14;
extern TLabel * const code Screen4_Labels[5];
extern TImage * const code Screen4_Images[5];
extern TBox * const code Screen4_Boxes[9];

extern TScreen Sensors;
extern TBox Box21;
extern TBox Diagram5_Box1;
extern TImage TempIcon;
extern TImage LightIcon;
extern TLabel Diagram5_Label1;
extern TLabel Diagram5_Label2;
extern TLabel Diagram5_Label3;
extern TLabel Diagram5_Label4;
extern TLabel Diagram5_Label5;
extern TImage BackIconSensors;
extern TLabel Diagram5_Label6;
extern TLabel Label21;
extern TLabel * const code Screen5_Labels[7];
extern TImage * const code Screen5_Images[3];
extern TBox * const code Screen5_Boxes[2];

extern TScreen MP3_SD;
extern TBox Box20;
extern TLabel Label22;
extern TLabel Label23;
extern TImage Image11;
extern TImage Image12;
extern TImage Image13;
extern TImage Image14;
extern TImage mp3_back_icon;
extern TLabel * const code Screen6_Labels[2];
extern TImage * const code Screen6_Images[5];
extern TBox * const code Screen6_Boxes[1];

extern TScreen MP3_SongList;
extern TBox Box19;
extern TBox Box6;
extern TLabel Label24;
extern TImage mp3_back_icon2;
extern TLabel Label26;
extern TImage folder_icon;
extern TImage file_icon;
extern TLabel * const code Screen7_Labels[2];
extern TImage * const code Screen7_Images[3];
extern TBox * const code Screen7_Boxes[2];

extern TScreen MP3_Player;
extern TBox Box17;
extern TLabel Label27;
extern TImage Icon_back_mp3;
extern TBox VolmeBar;
extern TImage Image15;
extern TBox ProgressBar;
extern TLabel Label28;
extern TImage previous_icon;
extern TImage pause_icon;
extern TImage Play_icon;
extern TImage stop_icon;
extern TImage next_icon;
extern TImage songlist_icon;
extern TLabel Label6;
extern TLabel * const code Screen8_Labels[3];
extern TImage * const code Screen8_Images[8];
extern TBox * const code Screen8_Boxes[3];

extern TScreen Paint;
extern TBox Box18;
extern TImage Image4;
extern TImage NewScreen;
extern TImage Image25;
extern TImage Pen;
extern TImage Image27;
extern TImage Eraser;
extern TImage Image29;
extern TBox DrawingArea;
extern TImage icon_paint_back;
extern TLabel Label29;
extern TBox Color01;
extern TBox Color02;
extern TBox Color03;
extern TBox Color04;
extern TBox Color05;
extern TBox Color06;
extern TBox Color07;
extern TBox Color08;
extern TBox Color09;
extern TBox Color10;
extern TBox Color11;
extern TBox Color12;
extern TBox Color13;
extern TBox Color14;
extern TBox Color15;
extern TBox Color16;
extern TBox Color17;
extern TBox Color18;
extern TBox Color19;
extern TBox Color20;
extern TBox Color21;
extern TBox Color22;
extern TBox Color23;
extern TBox Color24;
extern TBox Color25;
extern TBox Color26;
extern TBox Color27;
extern TBox Color28;
extern TBox Color29;
extern TBox Color30;
extern TImage BackGroundColor;
extern TBox Pen1;
extern TBox Pen2;
extern TBox Pen3;
extern TLabel * const code Screen9_Labels[1];
extern TImage * const code Screen9_Images[9];
extern TBox * const code Screen9_Boxes[35];

extern TScreen SlideShow;
extern TBox Box7;
extern TBox icon_previous_box;
extern TBox Icon_next_box;
extern TLabel Label31;
extern TImage back_slide_show;
extern TLabel Label32;
extern TLabel Label33;
extern TImage icon_previous;
extern TImage Icon_next;
extern TLabel Label35;
extern TBox Slide_Active_area;
extern TLabel * const code Screen10_Labels[4];
extern TImage * const code Screen10_Images[3];
extern TBox * const code Screen10_Boxes[4];

extern TScreen Tic_Tac_Toe;
extern TBox Box10;
extern TBox Box11;
extern TBox Box9;
extern TButton Button9;
extern TButton Button8;
extern TButton Button7;
extern TButton Button6;
extern TButton Button5;
extern TButton Button4;
extern TButton Button3;
extern TButton Button2;
extern TButton Button1;
extern TBox Box8;
extern TLabel Label36;
extern TImage Image20;
extern TLabel Label37;
extern TImage Image21;
extern TLabel Label38;
extern TLabel Label39;
extern TLabel XO1;
extern TLabel XO2;
extern TLabel XO3;
extern TLabel XO4;
extern TLabel XO5;
extern TLabel XO6;
extern TLabel XO7;
extern TLabel XO8;
extern TLabel XO9;
extern TCheckBox CheckBox1;
extern TLabel Label41;
extern TButton * const code Screen11_Buttons[9];
extern TLabel * const code Screen11_Labels[14];
extern TImage * const code Screen11_Images[2];
extern TBox * const code Screen11_Boxes[4];
extern TCheckBox * const code Screen11_CheckBoxes[1];




void BackGroundColorOnPress();
void BackIconSensorsOnPress();
void Box10OnClick();
void Box11OnPress();
void Box12OnClick();
void Box12OnPress();
void Box13OnClick();
void Box14OnPress();
void Box2OnPress();
void Box3OnPress();
void Box4OnPress();
void Box5OnPress();
void Box6OnClick();
void Box6OnPress();
void Box7OnDown();
void Box9OnPress();
void Button1OnClick();
void Button2OnClick();
void Button3OnClick();
void Button4OnClick();
void Button5OnClick();
void Button6OnClick();
void Button7OnClick();
void Button8OnClick();
void Button9OnClick();
void CheckBox1OnClick();
void ClockBackOnPress();
void Color01OnPress();
void Color02OnPress();
void Color03OnPress();
void Color04OnPress();
void Color05OnPress();
void Color06OnPress();
void Color07OnPress();
void Color08OnPress();
void Color09OnPress();
void Color10OnPress();
void Color11OnPress();
void Color12OnPress();
void Color13OnPress();
void Color14OnPress();
void Color15OnPress();
void Color16OnPress();
void Color17OnPress();
void Color18OnPress();
void Color19OnPress();
void Color20OnPress();
void Color21OnPress();
void Color22OnPress();
void Color23OnPress();
void Color24OnPress();
void Color25OnPress();
void Color26OnPress();
void Color27OnPress();
void Color28OnPress();
void Color29OnPress();
void Color30OnPress();
void DrawingAreaOnPress();
void EraserOnPress();
void Icon_back_mp3OnClick();
void Icon_next_boxOnPress();
void icon_paint_backOnPress();
void icon_previous_boxOnPress();
void Image15OnPress();
void Image16OnClick();
void Image18OnClick();
void Image1OnPress();
void Image22OnClick();
void Image24OnPress();
void Image2OnPress();
void Image3OnPress();
void Image4OnPress();
void Image5OnPress();
void Image6OnClick();
void Image8OnPress();
void Image9OnPress();
void Label22OnPress();
void Label24OnPress();
void Label27OnPress();
void mp3_back_iconOnPress();
void NewScreenOnPress();
void next_iconOnDown();
void pause_iconOnPress();
void Pen1OnPress();
void Pen2OnPress();
void Pen3OnPress();
void PenOnPress();
void Play_iconOnDown();
void previous_iconOnDown();
void ProgreesBarOnPress();
void RGB_Active_areaOnPress();
void Slide_Active_areaOnPress();
void songlist_iconOnPress();
void stop_iconOnDown();
void VolmeBarOnPress();




extern char Image1_Caption[];
extern char Image3_Caption[];
extern char Label5_Caption[];
extern char Label7_Caption[];
extern char Label8_Caption[];
extern char Image6_Caption[];
extern char Label14_Caption[];
extern char Image10_Caption[];
extern char Label19_Caption[];
extern char Image9_Caption[];
extern char Label20_Caption[];
extern char Image16_Caption[];
extern char Label25_Caption[];
extern char Image24_Caption[];
extern char Label30_Caption[];
extern char Image18_Caption[];
extern char Label34_Caption[];
extern char TicTacToe_Caption[];
extern char Label40_Caption[];
extern char BatteryStatus_Caption[];
extern char Box23_Caption[];
extern char Box1_Caption[];
extern char Image2_Caption[];
extern char Label1_Caption[];
extern char Label2_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char Box22_Caption[];
extern char Label9_Caption[];
extern char Image5_Caption[];
extern char Label10_Caption[];
extern char Circle1_Caption[];
extern char Label11_Caption[];
extern char Label12_Caption[];
extern char Label13_Caption[];
extern char RGB_Active_area_Caption[];
extern char Box16_Caption[];
extern char Box15_Caption[];
extern char Box13_Caption[];
extern char Box12_Caption[];
extern char Label15_Caption[];
extern char Box2_Caption[];
extern char Box3_Caption[];
extern char Label16_Caption[];
extern char ClockBack_Caption[];
extern char Label17_Caption[];
extern char Label18_Caption[];
extern char SyncIcon_Caption[];
extern char Image8_Caption[];
extern char Box4_Caption[];
extern char Box5_Caption[];
extern char Image7_Caption[];
extern char Label42_Caption[];
extern char Image17_Caption[];
extern char Box14_Caption[];
extern char Box21_Caption[];
extern char Diagram5_Box1_Caption[];
extern char TempIcon_Caption[];
extern char LightIcon_Caption[];
extern char Diagram5_Label1_Caption[];
extern char Diagram5_Label2_Caption[];
extern char Diagram5_Label3_Caption[];
extern char Diagram5_Label4_Caption[];
extern char Diagram5_Label5_Caption[];
extern char BackIconSensors_Caption[];
extern char Diagram5_Label6_Caption[];
extern char Label21_Caption[];
extern char Box20_Caption[];
extern char Label22_Caption[];
extern char Label23_Caption[];
extern char Image11_Caption[];
extern char Image12_Caption[];
extern char Image13_Caption[];
extern char Image14_Caption[];
extern char mp3_back_icon_Caption[];
extern char Box19_Caption[];
extern char Box6_Caption[];
extern char Label24_Caption[];
extern char mp3_back_icon2_Caption[];
extern char Label26_Caption[];
extern char folder_icon_Caption[];
extern char file_icon_Caption[];
extern char Box17_Caption[];
extern char Label27_Caption[];
extern char Icon_back_mp3_Caption[];
extern char VolmeBar_Caption[];
extern char Image15_Caption[];
extern char ProgressBar_Caption[];
extern char Label28_Caption[];
extern char previous_icon_Caption[];
extern char pause_icon_Caption[];
extern char Play_icon_Caption[];
extern char stop_icon_Caption[];
extern char next_icon_Caption[];
extern char songlist_icon_Caption[];
extern char Label6_Caption[];
extern char Box18_Caption[];
extern char Image4_Caption[];
extern char NewScreen_Caption[];
extern char Image25_Caption[];
extern char Pen_Caption[];
extern char Image27_Caption[];
extern char Eraser_Caption[];
extern char Image29_Caption[];
extern char DrawingArea_Caption[];
extern char icon_paint_back_Caption[];
extern char Label29_Caption[];
extern char Color01_Caption[];
extern char Color02_Caption[];
extern char Color03_Caption[];
extern char Color04_Caption[];
extern char Color05_Caption[];
extern char Color06_Caption[];
extern char Color07_Caption[];
extern char Color08_Caption[];
extern char Color09_Caption[];
extern char Color10_Caption[];
extern char Color11_Caption[];
extern char Color12_Caption[];
extern char Color13_Caption[];
extern char Color14_Caption[];
extern char Color15_Caption[];
extern char Color16_Caption[];
extern char Color17_Caption[];
extern char Color18_Caption[];
extern char Color19_Caption[];
extern char Color20_Caption[];
extern char Color21_Caption[];
extern char Color22_Caption[];
extern char Color23_Caption[];
extern char Color24_Caption[];
extern char Color25_Caption[];
extern char Color26_Caption[];
extern char Color27_Caption[];
extern char Color28_Caption[];
extern char Color29_Caption[];
extern char Color30_Caption[];
extern char BackGroundColor_Caption[];
extern char Pen1_Caption[];
extern char Pen2_Caption[];
extern char Pen3_Caption[];
extern char Box7_Caption[];
extern char icon_previous_box_Caption[];
extern char Icon_next_box_Caption[];
extern char Label31_Caption[];
extern char back_slide_show_Caption[];
extern char Label32_Caption[];
extern char Label33_Caption[];
extern char icon_previous_Caption[];
extern char Icon_next_Caption[];
extern char Label35_Caption[];
extern char Slide_Active_area_Caption[];
extern char Box10_Caption[];
extern char Box11_Caption[];
extern char Box9_Caption[];
extern char Button9_Caption[];
extern char Button8_Caption[];
extern char Button7_Caption[];
extern char Button6_Caption[];
extern char Button5_Caption[];
extern char Button4_Caption[];
extern char Button3_Caption[];
extern char Button2_Caption[];
extern char Button1_Caption[];
extern char Box8_Caption[];
extern char Label36_Caption[];
extern char Image20_Caption[];
extern char Label37_Caption[];
extern char Image21_Caption[];
extern char Label38_Caption[];
extern char Label39_Caption[];
extern char XO1_Caption[];
extern char XO2_Caption[];
extern char XO3_Caption[];
extern char XO4_Caption[];
extern char XO5_Caption[];
extern char XO6_Caption[];
extern char XO7_Caption[];
extern char XO8_Caption[];
extern char XO9_Caption[];
extern char CheckBox1_Caption[];
extern char Label41_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawButton(TButton *aButton);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawCircle(TCircle *ACircle);
void DrawBox(TBox *ABox);
void DrawCheckBox(TCheckBox *ACheckBox);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__netethinternal.h"
#line 37 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__netethinternal.h"
typedef struct
 {
 unsigned char valid;
 unsigned long tmr;
 unsigned char ip[4];
 unsigned char mac[6];
 } Net_Ethernet_Intern_arpCacheStruct;

extern Net_Ethernet_Intern_arpCacheStruct Net_Ethernet_Intern_arpCache[];

extern unsigned char Net_Ethernet_Intern_macAddr[6];
extern unsigned char Net_Ethernet_Intern_ipAddr[4];
extern unsigned char Net_Ethernet_Intern_gwIpAddr[4];
extern unsigned char Net_Ethernet_Intern_ipMask[4];
extern unsigned char Net_Ethernet_Intern_dnsIpAddr[4];
extern unsigned char Net_Ethernet_Intern_rmtIpAddr[4];

extern unsigned long Net_Ethernet_Intern_userTimerSec;




typedef struct {
 char remoteIP[4];
 char remoteMAC[6];
 unsigned int remotePort;
 unsigned int destPort;
 unsigned int dataLength;
 unsigned int broadcastMark;
} UDP_Intern_Dsc;


extern UDP_Intern_Dsc udpRecord_Intern;




typedef struct {
 char remoteIP[4];
 char remoteMAC[6];
 unsigned int remotePort;
 unsigned int destPort;

 unsigned int dataLength;
 unsigned int remoteMSS;
 unsigned int myWin;
 unsigned int myMSS;
 unsigned long mySeq;
 unsigned long myACK;

 char stateTimer;
 char retransmitTimer;
 unsigned int packetID;
 char open;
 char ID;
 char broadcastMark;
 char state;









 unsigned int nextSend;
 unsigned int lastACK;
 unsigned int lastSent;
 unsigned int lastWritten;
 unsigned int numToSend;
 char buffState;
 char *txBuffer;


} SOCKET_Intern_Dsc;


extern const char NUM_OF_SOCKET_Intern;
extern const unsigned int TCP_TX_SIZE_Intern;
extern const unsigned int MY_MSS_Intern;
extern const unsigned int SYN_FIN_WAIT_Intern;
extern const unsigned int RETRANSMIT_WAIT_Intern;

extern char tx_buffers_Intern[][];
extern SOCKET_Intern_Dsc socket_Intern[];
#line 127 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__netethinternal.h"
extern void Net_Ethernet_Intern_Init(unsigned char *mac, unsigned char *ip, unsigned long configuration);
extern unsigned char Net_Ethernet_Intern_doPacket();
extern void Net_Ethernet_Intern_putByte(unsigned char b);
extern void Net_Ethernet_Intern_putBytes(unsigned char *ptr, unsigned int n);
extern void Net_Ethernet_Intern_putConstBytes(const unsigned char *ptr, unsigned int n);
extern unsigned char Net_Ethernet_Intern_getByte();
extern void Net_Ethernet_Intern_getBytes(unsigned char *ptr, unsigned long addr, unsigned int n);
extern unsigned int Net_Ethernet_Intern_UserUDP(UDP_Intern_Dsc *udpDsc);
extern void Net_Ethernet_Intern_payloadInitUDP();
extern void Net_Ethernet_Intern_UserTCP(SOCKET_Intern_Dsc *socket);
extern void Net_Ethernet_Intern_confNetwork(char *ipMask, char *gwIpAddr, char *dnsIpAddr);

extern char Net_Ethernet_Intern_connectTCP(char *remoteIP, unsigned int remote_port ,unsigned int my_port, SOCKET_Intern_Dsc **used_socket);
extern char Net_Ethernet_Intern_disconnectTCP(SOCKET_Intern_Dsc *socket);

extern char Net_Ethernet_Intern_putByteTCP(char ch, SOCKET_Intern_Dsc *socket);
extern unsigned int Net_Ethernet_Intern_putBytesTCP(char *ptr,unsigned int n, SOCKET_Intern_Dsc *socket);
extern unsigned int Net_Ethernet_Intern_putConstBytesTCP(const char *ptr,unsigned int n, SOCKET_Intern_Dsc *socket);
extern unsigned int Net_Ethernet_Intern_putStringTCP(char *ptr, SOCKET_Intern_Dsc *socket);
extern unsigned int Net_Ethernet_Intern_putConstStringTCP(const char *ptr, SOCKET_Intern_Dsc *socket);
extern char Net_Ethernet_Intern_bufferEmptyTCP(SOCKET_Intern_Dsc *socket);
extern void Net_Ethernet_Intern_stackInitTCP();
extern char Net_Ethernet_Intern_startSendTCP(SOCKET_Intern_Dsc *socket);
#line 1 "c:/users/jemmi/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 1 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__time.h"
#line 27 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__time.h"
typedef struct
 {
 unsigned char ss ;
 unsigned char mn ;
 unsigned char hh ;
 unsigned char md ;
 unsigned char wd ;
 unsigned char mo ;
 unsigned int yy ;
 } TimeStruct ;
#line 41 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__time.h"
extern long Time_jd1970 ;
#line 46 "c:/users/jemmi/documents/github/ducati_mikro/mikromedia_stm32plus_code/mikroc pro for arm/__time.h"
long Time_dateToEpoch(TimeStruct *ts) ;
long Time_dateDiff(TimeStruct *t1, TimeStruct *t2);
void Time_epochToDate(long e, TimeStruct *ts) ;
#line 14 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Ethernet_main.c"
void InitTimer5();
void RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset);

char Time_Obtained = 0;

static const SUCCESS = 0;
static const NOT_SUCCESS = 1;

static unsigned char myMacAddr[6] = {0x00, 0x16, 0xA5, 0x52, 0x19, 0x3f};
static unsigned char myIpAddr[4] = {0, 0, 0, 0 };
static unsigned char IpServer[4] = {12, 10, 191, 251};

static SOCKET_Intern_Dsc *socketServer;
TimeStruct my_time;
static long epoch;
static unsigned int myPort = 1000;
static char acquaringComplete_mark = NOT_SUCCESS;
static char buff[4];
static char ethInitialized_mark = NOT_SUCCESS;
static char ethDhcp_mark = NOT_SUCCESS;
static char synReqSend_mark = 0;
#line 43 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Ethernet_main.c"
void Net_Ethernet_Intern_UserTCP(SOCKET_Intern_Dsc *socket) {
char i;


 if( (memcmp(socket->remoteIP,IpServer,4) != 0) )
 return;


 for (i = 0; i < 4; i ++)
 buff[i] = Net_Ethernet_Intern_getByte();


  ((char *)&epoch)[3]  = buff[0];
  ((char *)&epoch)[2]  = buff[1];
  ((char *)&epoch)[1]  = buff[2];
  ((char *)&epoch)[0]  = buff[3];

 epoch = epoch - 2208902400;
 Time_epochToDate(epoch, &my_time);
 acquaringComplete_mark = SUCCESS;
 Time_Obtained = 1;
}
#line 73 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Ethernet_main.c"
unsigned int Net_Ethernet_Intern_UserUDP(UDP_Intern_Dsc *udpDsc) {
 return 0;
}
#line 84 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Ethernet_main.c"
void Ethernet_Message(char *text){
 strcpy(Label42_Caption, text);
 RedrawLabel(Clock.Color, &Label42, 180, 20);
}
#line 96 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Ethernet_main.c"
static char Ethernet_Init() {
char result = SUCCESS;
#line 117 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Ethernet_main.c"
 return result;

}
#line 172 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Ethernet_main.c"
static void Ethernet_ReachTime() {
unsigned long timeout;
char connectedDetect_mark;
char i;

 for(i = 0; i < 5; i++) {

 timeout = Net_Ethernet_Intern_UserTimerSec + 5;
 acquaringComplete_mark = NOT_SUCCESS;
 synReqSend_mark = NOT_SUCCESS;
 connectedDetect_mark = 0;

 while((Net_Ethernet_Intern_UserTimerSec < timeout) && (acquaringComplete_mark == NOT_SUCCESS)){

 Net_Ethernet_Intern_doPacket();

 if (synReqSend_mark == NOT_SUCCESS) {
 Ethernet_Message("Connecting to Time Server");
 myPort++;

 synReqSend_mark = Net_Ethernet_Intern_connectTCP(IpServer, 37, myPort, &socketServer) ? SUCCESS : NOT_SUCCESS;

 if (synReqSend_mark != SUCCESS){
 break;
 }
 }

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
#line 232 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Ethernet_main.c"
void Start_Ethernet(){
#line 244 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/Ethernet_main.c"
}
