/*******************************************************************************
* Tic Tac Toe example - Function Set used for Tic Tac Toe game
* ------------------------------------------------------------------------------
* Simple demonstration of Tic Tac Toe game.
* Game can be played on one mikromedia as well as on two (using RF module)
*******************************************************************************/

#include "mikromedia_STM32plus_objects.h"
#include "mikromedia_STM32plus_resources.h"
#include "built_in.h"
#include "__Lib_nRF24L01.h"
#include "nRF24L01_defs.h"
#define RF_STOP                0x01

// nRF24L01+ connections
extern sfr sbit nRF_CS;
extern sfr sbit nRF_CE;
extern sfr sbit nRF_IRQ;

// bRF externals
TnRF_Status nRFStatus;
TRF_Config rfConfig;
unsigned char rfState;

// extern functions
void RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset);
char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num);

extern const unsigned long game_table_bmp;
extern char TTT_flag;

// globaks
char RF_used;

/*******************************************************************************
* Interrupt initialiation code
* ------------------------------------------------------------------------------
* Timer 5: Timer5 Prescaler : 1199
* Preload = 62500
* Actual Interrupt Time = 1s
*******************************************************************************/
void InitTimer5(){
  RCC_APB1ENR.TIM5EN = 1;
  TIM5_CR1.CEN = 0;
  TIM5_PSC = 1199;
  TIM5_ARR = 62500;
//  NVIC_IntEnable(IVT_INT_TIM5);
  TIM5_DIER.UIE = 1;
  TIM5_CR1.CEN = 1;
}

/*******************************************************************************
* Interrupt initialiation code
* ------------------------------------------------------------------------------
* Timer 2: Timer2 Prescaler : 0
* Preload = 1200
* Actual Interrupt Time = 16us
*******************************************************************************/
void InitTimer2(){
  // Initialize TIMER2 module for CE pulse
  RCC_APB1ENR.TIM2EN = 1;       // Enable clock gating for timer module 2
  TIM2_CR1.CEN = 0;             // Disable timer
  TIM2_PSC = 0;                 // Set timer prescaler.
  TIM2_ARR = 1200;
  NVIC_IntEnable(IVT_INT_TIM2); // Enable timer interrupt
  TIM2_DIER.UIE = 1;            // Update interrupt enable

  TIM2_CR1.CEN = 0;
}

/*******************************************************************************
* Interrupt initialiation code
* ------------------------------------------------------------------------------
* EXTI10: External interrupt on PG10
* Falling edge
*******************************************************************************/
void InitExt(){
  SYSCFGEN_bit = 1;                    // Enable clock for alternate pin functions
  SYSCFG_EXTICR3 = 0x00000600;         // Map external interrupt on PG10
  EXTI_RTSR = 0x00000000;              // Set interrupt on Rising edge (none)
  EXTI_FTSR = 0x00000400;              // Set Interrupt on Falling edge (PG10)
  EXTI_IMR |= 0x00000400;              // Set mask

  NVIC_IntEnable(IVT_INT_EXTI15_10);   // Enable External interrupt
}

/*******************************************************************************
* Function InitRF()
* ------------------------------------------------------------------------------
* Overview: Function initialize appropriate interrupts
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void InitRF(){
  // set output functions for RGB
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
  GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);

  nRF_CE = 0;
  nRF_CS = 1;

  InitTimer2();
  InitExt();

  // Initialize SPI1 module
  SPI2_Init_Advanced(_SPI_FPCLK_DIV16, _SPI_MASTER  | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                     _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI2_PB13_14_15);
}

/*******************************************************************************
* Function Start_nRF()
* ------------------------------------------------------------------------------
* Overview: Function starts nRF module and sets flags for game
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Start_nRF(){
  //nRF Config Settings
  rfConfig.autoTransmitDelay = nRF_AUTO_RETRANSMIT_DELAY_4000us;
  rfConfig.autoTransmitCount = nRF_AUTO_RETRANSMIT_COUNT_05;
  rfConfig.channel           = 64;
  rfConfig.outputPower       = nRF_OUTPUT_POWER_0dBm;
  rfConfig.dataRate          = nRF_DATA_RATE_1Mbps;

  // init module
  nRF_Init();
  InitRF();
  Delay_ms(100);

  rfState = RF_STOP;
  // configure module as RX
  nRF_RX_Mode_Init_Advanced(rfConfig.dataRate, rfConfig.outputPower, rfConfig.channel);
  
  // configure Timer 5 and set invert flag
  InitTimer5();
  NVIC_IntDisable(IVT_INT_TIM5);
  
  if (RF_used == 1)
    RF_used = 0;
  else
    RF_used = 1;
}

// extern connections for RGB
extern sfr sbit LED_R;
extern sfr sbit LED_G;
extern sfr sbit LED_B;
extern sfr sbit TFT_CS;


unsigned int O_color = 0xDB27;
unsigned int X_color = 0x35E8;
char victory = 0;
char Myturn = 0;

// my messages
static char OsTurn_cap[]   = "O's turn";
static char XsTurn_cap[]   = "X's turn";
static char Draw_cap[]     = "Draw";
static char XWin_cap[]     = "X wins!";
static char OWin_cap[]     = "O wins!";
static char YouWin_cap[]   = "Winner!";
static char YouLose_cap[]  = "Looser!";
static char XO_X_caption[] = "X";
static char XO_O_caption[] = "O";

int RF_cnt = 0;
char RF_Send_Failed = 0;

unsigned int TicTacToe_seconds_cnt;

// game matrix        i  j
static char XO_matrix[3][3] = {{0, 0, 0},        // 0 - empty
                               {0, 0, 0},        // 1 = X
                               {0, 0, 0}};       // 2 - O
static char XO_Turn = 1;     // 1 - X, 2 - O


static char XO_ID = 2, XO_First_Move = 1;
static char XO_ID2 = 2;
TLabel *LabelArray[9] = {&XO1, &XO2, &XO3, &XO4, &XO5, &XO6, &XO7, &XO8, &XO9};
TButton *ButtonArray[9] = {&Button1, &Button2, &Button3, &Button4, &Button5, &Button6, &Button7, &Button8, &Button9};

// package truct
struct Tpacket {
  char ID;
  char first_move;
  char Mat[3][3];
  char turn;
} packet;

char XO_Set_New_State(char MatNo);
void UpdateLabel(TLabel * Label, char xo);
void UpdateStatus(char xo);
char XO_Check_For_Victory();
void XO_Victory(char victory_flag);
void LED_Victory_Blink();
void LED_Move();
void Test_Victory();
void XO_Reset();

/*******************************************************************************
* Functions used for Buzzer
* ------------------------------------------------------------------------------
* Overview: Simple tones that follows every move.
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void ToneA() {
  Sound_Play( 880, 50);
}
void ToneC() {
  Sound_Play(1046, 50);
}
void ToneE() {
  Sound_Play(1318, 50);
}

void LED_Move(){
  Sound_Play(1318, 50);
  Sound_Play(1567, 50);
}

void LED_Victory_Blink(){
char i;
  for (i = 0; i < 5; i ++){
    LED_R = 1;
    ToneA();
    Delay_ms(20);
    LED_R = 0;
    LED_G = 1;
    ToneC();
    Delay_ms(20);
    LED_G = 0;
    LED_B = 1;
    ToneE();
    Delay_ms(20);
  }
  LED_B = 0;
}

/*******************************************************************************
* Function doTicTacToeISR()
* ------------------------------------------------------------------------------
* Overview: updates game duration Label (should be called from 1s interrupt)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void doTicTacToeISR(){
  Label39_Caption[6] = (TicTacToe_seconds_cnt / 60) / 10 + 48;
  Label39_Caption[7] = (TicTacToe_seconds_cnt / 60) % 10 + 48;
  Label39_Caption[9] = (TicTacToe_seconds_cnt % 60) / 10 + 48;
  Label39_Caption[10] = (TicTacToe_seconds_cnt % 60) % 10 + 48;
  RedrawLabel(Box8.Color, &Label39, 100, 22);
}

/*******************************************************************************
* Function UpdateLabel38(char *text, unsigned int color)
* ------------------------------------------------------------------------------
* Overview: Function updates game Status
* Input: desired text, text color
* Output: Nothing
*******************************************************************************/
void UpdateLabel38(char *text, unsigned int color){
  Label38.Font_Color = color;
  Label38.Caption = text;
  RedrawLabel(Box8.Color, &Label38, 120, 50);
}

void XO_Process_Packet(char *receved_packet);
char RF_Send_Move();
/*******************************************************************************
* Function doTicTacToe()
* ------------------------------------------------------------------------------
* Overview: Polls if there is incomming messages from RF (should be called frequently)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void doTicTacToe(){
  // update game duration (flag is set in interrupt)
  if (TTT_flag){
    doTicTacToeISR();
    TTT_flag = 0;
  }
  // if we play agains RF oponent ...
  if (RF_used == 1){
    // packet is received
    if (nRF_Receive_Packet()){
      LED_B = 1;
      nRF_Process(&nRFStatus);
      LED_B = 1;
      if(nRFStatus._status == nRF_RX_DR){
        XO_Process_Packet(RX_pload);
      }
      LED_B = 0;
    }
    // if previous send failed repeat
    if (RF_Send_Failed == 1){
      if (RF_cnt > 1250){
        LED_B = ~LED_B;
        if (RF_Send_Move() == 0)
          RF_Send_Failed = 1;
        else{
          RF_Send_Failed = 0;
          LED_B = 0;
        }
        Delay_ms(10);
        nRF_RX_Mode_Init(64);
        RF_cnt = 0;
      }
      else
        RF_cnt ++;
    }
  }
}

/*******************************************************************************
* Function RF_Send_Move()
* ------------------------------------------------------------------------------
* Overview: Function sends packet over RF
* Input: Nothing
* Output: Nothing
*******************************************************************************/
char RF_Send_Move(){
char i;
char *pMat;
char attempts = 0;

  LED_B = 1;
  // init TX mode
  nRF_TX_Mode_Init(64);
  pMat = (char*)XO_matrix;
  TX_pload[0] = XO_ID;
  TX_pload[1] = XO_First_Move;
  for (i = 0; i < 9; i ++)
    TX_pload[i + 2] = *pMat ++;
  TX_pload[11] = XO_Turn;
  // try to send
  while (attempts < 2){
    nRF_Send_Packet();
    Delay_ms(50);
    // do process and check for ACK status
    nRF_Process(&nRFStatus);
    Delay_ms(20);
    if (nRFStatus._status == nRF_TX_DS){
      attempts = 7;
      LED_B = 0;
      return 1;
    }
    else
      attempts ++;
    Delay_ms(10);
    LED_B = ~LED_B;
  }

  LED_B = 0;
  return 0;
}

/*******************************************************************************
* Function XO_Process(char No)
* ------------------------------------------------------------------------------
* Overview: Function processes new move
* Input: Number of the received character
* Output: Nothing
*******************************************************************************/
void XO_Process(char No){
char temp_i, temp_j;

  temp_i = No / 3;
  temp_j = No % 3;

  if (victory == 0){
    if (XO_matrix[temp_i][temp_j] == 2){
      UpdateLabel(LabelArray[No], 1);
      UpdateStatus(1);
    }
    else if (XO_matrix[temp_i][temp_j] == 1){
      UpdateLabel(LabelArray[No], 0);
      UpdateStatus(0);
    }
  }
}

char Check_For_Draw();
/*******************************************************************************
* Function TestDraw()
* ------------------------------------------------------------------------------
* Overview: Function processes drawn game
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void TestDraw(){
  if (victory == 0)
    if (Check_For_Draw() == 1){
      NVIC_IntDisable(IVT_INT_TIM5);
      UpdateLabel38(Draw_cap, CL_WHITE);
      LED_G = 0;
      LED_B = 0;
      LED_R = 0;
    }
}

/*******************************************************************************
* Function XO_Process_Packet(char *receved_packet)
* ------------------------------------------------------------------------------
* Overview: Function processes receuived package
* Input: pointer to packet
* Output: Nothing
*******************************************************************************/
void XO_Process_Packet(char *receved_packet){
char *ptr1;
char *ptr2;
char i;

  ptr1 = (char*)&packet;
  // copy received packet into appropriate structure field
  for (i = 0; i < 12; i ++)
    *ptr1 ++ = *receved_packet ++;

  if (packet.ID != 0){
    ptr1 = (char*)&packet;
    ptr1 += 2;
    ptr2 = (char*)XO_matrix;

    if (packet.ID == XO_ID2){
      if (packet.turn == 0xFF){
        XO_Reset();
        return;
      }
      XO_Turn = packet.turn;
      if (Myturn == 0){
        MyTurn = XO_Turn;
          NVIC_IntEnable(IVT_INT_TIM5);
      }

      for (i = 0; i < 9; i ++){
        if (*ptr1 != *ptr2){
          *ptr2 = *ptr1;
          XO_Process(i);
          LED_G = 1;
          LED_R = 0;
        }
        ptr1 ++;
        ptr2 ++;
      }
      Test_Victory();
      TestDraw();
    }
  }
}

/*******************************************************************************
* Function XO_Set_New_State(char MatNo)
* ------------------------------------------------------------------------------
* Overview: Function Sets New State for the new move
* Input: matrix position
* Output: 1 if X played move
*         2 if O played move
*         0 if invalid move
*******************************************************************************/
char XO_Set_New_State(char MatNo){
char temp_i, temp_j;

  temp_i = MatNo / 3;
  temp_j = MatNo % 3;
  if (XO_matrix[temp_i][temp_j] == 0){
     if (XO_Turn == 1){
       XO_matrix[temp_i][temp_j] = 1;
       XO_Turn = 2;
       return 1;
     }
     else if (XO_Turn == 2){
       XO_matrix[temp_i][temp_j] = 2;
       XO_Turn = 1;
       return 2;
     }
  }
  else {
    return 0;
  }
}

/*******************************************************************************
* Function XO_Victory(char victory_flag)
* ------------------------------------------------------------------------------
* Overview: Function marks victory
* Input: victory flag
* Output: Nothing
*******************************************************************************/
void XO_Victory(char victory_flag){
  switch (victory_flag){
    case 1 : {
              TFT_Set_Pen(CL_WHITE, 2);
              TFT_Line(249, 68, 422, 59);
             }; break;
    case 2 : {
              TFT_Set_Pen(CL_WHITE, 2);
              TFT_Line(251, 141, 423, 132);
             }; break;
    case 3 : {
              TFT_Set_Pen(CL_WHITE, 2);
              TFT_Line(256, 211, 428, 202);
             }; break;
    case 4 : {
              TFT_Set_Pen(CL_WHITE, 2);
              TFT_Line(259, 46, 269, 231);
             }; break;
    case 5 : {
              TFT_Set_Pen(CL_WHITE, 2);
              TFT_Line(331, 39, 343, 229);
             }; break;
    case 6 : {
              TFT_Set_Pen(CL_WHITE, 2);
              TFT_Line(406, 36, 418, 226);
             }; break;
    case 7 : {
              TFT_Set_Pen(CL_WHITE, 2);
              TFT_Line(245, 50, 425, 219);
             }; break;
    case 8 : {
              TFT_Set_Pen(CL_WHITE, 2);
              TFT_Line(419, 43, 258, 225);
             }; break;
  }
}

/*******************************************************************************
* Function Check_For_Draw()
* ------------------------------------------------------------------------------
* Overview: Function checks if the there is draw condition
* Input: Nothing
* Output: 1 if game is draw
*         0 if game is not finished yet
*******************************************************************************/
char Check_For_Draw(){
  char i, j;
  for (i = 0; i < 3; i ++){
    for (j = 0; j < 3; j ++){
      if (XO_matrix[i][j] == 0)
        return 0;
    }
  }
  return 1;
}

/*******************************************************************************
* Function XO_Check_For_Victory()
* ------------------------------------------------------------------------------
* Overview: Function checks if the there is victory condition
* Input: Nothing
* Output: victory flag which is different in all 8 possible scenarios
*******************************************************************************/
char XO_Check_For_Victory(){
char temp_i, temp_j;

  for (temp_i = 0; temp_i < 3; temp_i ++){
    if (XO_matrix[temp_i][0] != 0)
      if (XO_matrix[temp_i][0] == XO_matrix[temp_i][1])
        if (XO_matrix[temp_i][1] == XO_matrix[temp_i][2])
          return (temp_i + 1);
  }
  for (temp_j = 0; temp_j < 3; temp_j ++){
    if (XO_matrix[0][temp_j] != 0)
      if (XO_matrix[0][temp_j] == XO_matrix[1][temp_j])
        if (XO_matrix[1][temp_j] == XO_matrix[2][temp_j])
          return (temp_j + 4);
  }
  if (XO_matrix[0][0] != 0)
    if (XO_matrix[0][0] == XO_matrix[1][1])
      if (XO_matrix[1][1] == XO_matrix[2][2]){
        return 7;
      }
  if (XO_matrix[0][2] != 0)
    if (XO_matrix[0][2] == XO_matrix[1][1])
      if (XO_matrix[1][1] == XO_matrix[2][0]){
        return 8;
      }
  return 0;
}

/*******************************************************************************
* Function DrawImageLine_TTT(TImage *image, int line, int xcoo1, int xcoo2) NOT USED
* ------------------------------------------------------------------------------
* Overview: Function draws one picture line from flash (if game table is stored in flash)
* Input: pointer to Image, appropriate line, coordinates
* Output: Nothing
*******************************************************************************/
void DrawImageLine_TTT(TImage *image, int line, int xcoo1, int xcoo2){
  long count;
  volatile unsigned int color;
  const code char *ptr;
  unsigned long readed;
  unsigned int offset;

  offset = 6 + (unsigned long)(line - Image->Top) * Image->Width + (xcoo1 - Image->Left) * 2;
  TFT_CS = 0;
  ptr = Image->Picture_Name + offset;
  count = (xcoo2 - xcoo1) * 2 - 1;
  TFT_SSD1963_Set_Address_Ptr(xcoo1, line, xcoo2, line);
  color = *ptr++;
  color += (*ptr++) << 8;
  TFT_Write_Data_Ptr(color);
  count -= 2;
  TFT_CS = 1;
}

/*******************************************************************************
* Function ReDrawBackground(TImage *Image, int x1, int x2, int y1, int y)  NOT USED
* ------------------------------------------------------------------------------
* Overview: Function redraws Box inside Image (from flash)
* Input: Nothing
* Output: victory flag which is different in all 8 possible scenarios
*******************************************************************************/
void ReDrawBackground(TImage *Image, int x1, int x2, int y1, int y2){
int i;

  for (i = 0; i < y2 - y1; i ++){
    DrawImageLine_TTT(Image, y1 + i, x1, x2);
  }
}

/*******************************************************************************
* Function UpdateLabel(TLabel * Label, char xo)
* ------------------------------------------------------------------------------
* Overview: Function updates lable in game table
* Input: pointer to Label, X or O
* Output: Nothing
*******************************************************************************/
void UpdateLabel(TLabel * Label, char xo){
  if (xo){
    Label->Caption = XO_O_caption;
    Label->Font_Color = O_color;
    DrawLabel(Label);
  }
  else{
    Label->Caption = XO_X_caption;
    Label->Font_Color = X_color;
    DrawLabel(Label);
  }
}

/*******************************************************************************
* Function UpdateStatus(char xo)
* ------------------------------------------------------------------------------
* Overview: Function updates player turn
* Input: X or O
* Output: Nothing
*******************************************************************************/
void UpdateStatus (char xo){
  if (xo){
    UpdateLabel38(XsTurn_cap, X_color);
  }
  else {
    UpdateLabel38(OsTurn_cap, O_color);
  }
}

/*******************************************************************************
* Function Test_Victory()
* ------------------------------------------------------------------------------
* Overview: Test if there were victory and displays it if so.
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Test_Victory(){
  victory = XO_Check_For_Victory();
  if (victory){
    NVIC_IntDisable(IVT_INT_TIM5);
    XO_Victory(victory);
    if (RF_used){
      if (XO_turn == MyTurn)
        UpdateLabel38(YouLose_cap, CL_BLUE);
      else
        UpdateLabel38(YouWin_cap, CL_RED);
    }
    else{
      if (XO_turn == 2)
        UpdateLabel38(XWin_cap, X_color);
      else if (Xo_turn == 1)
        UpdateLabel38(Owin_cap, O_color);
    }
    LED_Victory_Blink();
  }
  else
    LED_Move();
}

/*******************************************************************************
* Function XO_Reset()
* ------------------------------------------------------------------------------
* Overview: Function reset game into default state
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void XO_Reset(){
  // fill matrix with 0 (default state)
  memset(XO_matrix, 0, 9);
  victory = 0;
  XO_Turn = 0xFF;

  // disable second counter
  InitTimer5();
  NVIC_IntDisable(IVT_INT_TIM5);
  TicTacToe_seconds_cnt = 0;
  doTicTacToeISR();
  
  if (RF_used){
    RF_Send_Move();
    nRF_RX_Mode_Init(64);
  }
  XO_Turn = 1;
  XO_First_Move = 1;
  MyTurn = 0;
  LED_B = 0;
  LED_R = 0;
  LED_G = 0;

  // redraw game table
  TFT_Ext_Image(220, 16, game_table_bmp, 1);          // from SD card
  Label38.Caption = Label38_Caption;
  ReDrawLabel(Box8.Color, &Label38, 120, 50);
}

/*******************************************************************************
* Function ButtonClick(TButton *Butt, char No)
* ------------------------------------------------------------------------------
* Overview: Function processes pressed Button on game table
* Input: appropriate pointer to Button, number of the button
* Output: Nothing
*******************************************************************************/
void ButtonClick(TButton *Butt, char No){
  // play move only if game is not finished
  if (victory == 0){
    if (MyTurn == 0){               // first move detected
      MyTurn = XO_Turn;
      NVIC_IntEnable(IVT_INT_TIM5); // start to measure game duration
    }
    // if my turn
    if (XO_turn == MyTurn){
      // if valid move
      if (XO_Set_New_State(No)){
        // process my move
        XO_Process(No);
        // if RF is used send my move
        if (RF_used){
          LED_G = 0;
          LED_R = 1;
          // if sending failed ...
          if (RF_Send_Move() == 0)
            RF_Send_Failed = 1;
          else
            RF_Send_Failed = 0;
          // set RX mode
          nRF_RX_Mode_Init(64);
        }
        else{
          // if RF is not used, it is still my move
          MyTurn = XO_Turn;
          if (XO_Turn == 1){
            LED_G = 1;
            LED_B = 0;
          }
          else{
            LED_B = 1;
            LED_G = 0;
          }
        }
        // test if the game is not completed
        Test_Victory();
        TestDraw();
        XO_First_Move ++;
      }
    }
  }
}