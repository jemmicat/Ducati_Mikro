/*******************************************************************************
* RGB  - Function Set for RGB Example
* ------------------------------------------------------------------------------
* Reads color value from picture which is store in SD card
*   and sets RGB LED in the same color
*******************************************************************************/

#include "mikromedia_STM32plus_objects.h"

// external hardware connections
extern sfr sbit LED_R;
extern sfr sbit LED_G;
extern sfr sbit LED_B;

// external globals
extern unsigned int Xcoord, Ycoord;
extern const unsigned long rgb_bitmap_bmp;

// external functions
char* MyTFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num);
char Init_FAT();

// globals
static int xcoo, ycoo, color;
static unsigned int SoftPWM_pr, SoftPWM_duty;
static unsigned int pwm_period1, pwm_period2, pwm_period3;

// color struct
typedef struct Colors {
  char Red;
  char Green;
  char Blue;
  unsigned int color_16bit;
} TColors;

static TColors MyColors;

/*******************************************************************************
* Function InitTimer4()
* ------------------------------------------------------------------------------
* Overview: Function that initializes Timer4 (used for soft PWM on R diode)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static void InitTimer4(){
  RCC_APB1ENR.TIM4EN = 1;
  TIM4_CR1.CEN = 0;
  TIM4_PSC = 0;
  TIM4_ARR = 9375;
  NVIC_IntEnable(IVT_INT_TIM4);
  TIM4_DIER.UIE = 1;
  TIM4_CR1.CEN = 1;
}

/*******************************************************************************
* Function Timer4_SoftPWM_ISR()
* ------------------------------------------------------------------------------
* Overview: Function Generates SoftPWM on RGB Red dioge (Should be called from Timer4 ISR)
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Timer4_SoftPWM_ISR(){
  SoftPWM_pr++;
  if (SoftPWM_pr < SoftPWM_duty){
    LED_R = 1;
  }
  else {
    LED_R = 0;
  }
  if (SoftPWM_pr > 31)
    SoftPWM_pr = 0;
}

/*******************************************************************************
* Function RGB_Init()
* ------------------------------------------------------------------------------
* Overview: Function Initializes PWMs and RGB connection pins
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void RGB_Init() {
  pwm_period1 = PWM_TIM3_Init(5000);
  pwm_period2 = PWM_TIM2_Init(5000);

  PWM_TIM3_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);  // Set current duty for PWM_TIM1
  PWM_TIM2_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL2);  // Set current duty for PWM_TIM4

  PWM_TIM3_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM3_CH1_PB4);   // Starts PWM channel1 on PB4
  PWM_TIM2_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM2_CH2_PB3);   // Starts PWM channel2 on PB3

  if (Init_FAT())                                          // displays background picture
    TFT_Ext_Image(0, 38, rgb_bitmap_bmp, 1);
  
  GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);      // Sets default values for softPWM
  SoftPWM_pr = 0;
  SoftPWM_duty = 0;
  InitTimer4();
  
}

/*******************************************************************************
* Function GetColor_FromSD(unsigned long Img, unsigned int xc, unsigned int yc)
* ------------------------------------------------------------------------------
* Overview: Function Retreives color (16bit) from picture stored in SD card.
* Input: offset of the Image in RES file, coordinates of desired pixel in the picture
* Output: Nothing
*******************************************************************************/
static unsigned int GetColor_FromSD(unsigned long Img, unsigned int xc, unsigned int yc){
unsigned int color_temp;
unsigned long readed;
unsigned long offset;
char *ptr, i;
int count;

  // set offset
  offset = Img + 6 + ((long)(480) * (yc - 1) + xc) * 2;
  count = 2;
  
  // retreive pointer to desired pixel
  ptr = MyTFT_Get_Data(offset,count,&readed);

  // read 16bit color value
  color_temp = (*ptr++);
  color_temp += (*ptr) << 8;
    
  return color_temp;
}

/*******************************************************************************
* Function GetColor_FromFlash(TImage *Img, unsigned int xc, unsigned int yc)
* ------------------------------------------------------------------------------
* Overview: Function Retreives color (16bit) from picture stored in flash.
* Input: Pointer of the Image in flash, coordinates of desired pixel in the picture
* Output: Nothing
*******************************************************************************/
static unsigned int GetColor_FromFlash(TImage *Img, unsigned int xc, unsigned int yc){
unsigned int color_temp;
const code char *pColor;
  pColor = Img->Picture_Name + 6;
  pColor = pColor + ((long)(Img->Width) * (yc - 1) + xc) * 2;
  color_temp = (*pColor++);
  color_temp += (*pColor) << 8;

  return color_temp;
}

/*******************************************************************************
* Function DisplayColor()
* ------------------------------------------------------------------------------
* Overview: Function Displays filled Circle in appropriate color on display
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static void DisplayColor(){
  Circle1.Color = MyColors.color_16bit;
  DrawCircle(&Circle1);
}

/*******************************************************************************
* Function Display_color_text(TLabel *label, short val)
* ------------------------------------------------------------------------------
* Overview: Function Displays appropriate value in desired label
* Input: Pointer to Label, value
* Output: Nothing
*******************************************************************************/
static void Display_color_text(TLabel *label, short val) {
char text[7];
char text1[10];
char *ptr;
  ptr = label->Caption;
  TFT_Set_Pen(RGBLight.Color,  0);
  TFT_Set_Brush(1, RGBLight.Color, 0, 0, 0, 0);
  ShortToStr(val, text);
  strcpy(text1, ptr);
  strcat(text1, text);
  TFT_Rectangle(label->Left, Label->Top, label->Left + 55, Label->Top + 20);
  label->Caption = text1;
  Drawlabel(label);
  label->Caption = ptr;
}

/*******************************************************************************
* Function Drive_RGB_Diode(TColors *colors)
* ------------------------------------------------------------------------------
* Overview: Function Outputs appropriate values to PWM outputs
* Input: Pointer to Colors struct
* Output: Nothing
*******************************************************************************/
static void Drive_RGB_Diode(TColors *colors){
  PWM_TIM2_Set_Duty((int)pwm_period2 / 64 * colors->Green, _PWM_NON_INVERTED, _PWM_CHANNEL2);
  PWM_TIM3_Set_Duty((int)pwm_period1 / 32 * colors->Blue, _PWM_NON_INVERTED, _PWM_CHANNEL1);
  SoftPWM_duty = colors->Red;
}

/*******************************************************************************
* Function RGB_OFF()
* ------------------------------------------------------------------------------
* Overview: Function turns off PWM modules, timers and turns off RGB diode
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void RGB_OFF(){
  PWM_TIM3_Stop(_PWM_CHANNEL1);
  PWM_TIM2_Stop(_PWM_CHANNEL2);
  TIM4_CR1.CEN = 0;
  TIM4_DIER.UIE = 0;
  NVIC_IntDisable(IVT_INT_TIM4);
  LED_R = 0;
}

/*******************************************************************************
* Function PickColor()
* ------------------------------------------------------------------------------
* Overview: Function reads coordinate of the touch and drives RGB accordingly
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void PickColor(){
unsigned int mycolor;
  ycoo = Ycoord - 38;
  xcoo = Xcoord;
  if (ycoo > 0){
//    mycolor = GetColor_FromFlash(&Image4, xcoo, ycoo);     // read color  frm flash
    mycolor = GetColor_FromSD(rgb_bitmap_bmp, xcoo, ycoo); // read color from Sd
    
    // fill color struct
    MyColors.color_16bit = mycolor;
    MyColors.Red = mycolor >> 11;
    MyColors.Green = (mycolor >> 5) & 0x3F;
    MyColors.Blue = mycolor & 0x1F;
  
    // display color on TFT
    DisplayColor();
    Display_color_text(&Label11, MyColors.Red);
    Display_color_text(&Label12, MyColors.Green);
    Display_color_text(&Label13, MyColors.Blue);
    
    // Drive RGB diode
    Drive_RGB_Diode(&MyColors);
  }
}