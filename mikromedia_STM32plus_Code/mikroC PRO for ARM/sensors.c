/*******************************************************************************
* Sensors  - Function Set for Sensors Example
* ------------------------------------------------------------------------------
* Example reads values from light and temperature sensors
*******************************************************************************/

#include "mikromedia_STM32plus_objects.h"

const VREF = 2048 ;
static int Sensors_counter;
static short Light_intensity_cnt, FULL_BackLight;
static char current_intensity;

/*******************************************************************************
* Function Sensors_Init()
* ------------------------------------------------------------------------------
* Overview: Function Initializes Sensors example
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Sensors_Init(){
  Sensors_counter = 3100;
  // Select Analog channel
  GPIO_Analog_Input(&GPIOF_BASE, _GPIO_PINMASK_8);
  GPIO_Analog_Input(&GPIOF_BASE, _GPIO_PINMASK_9);
  // ADC Init
  ADC3_Init();                        // Initialize ADC
  
  FULL_BackLight = 1;
  current_intensity = 255;
}

/*******************************************************************************
* Function RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset)
* ------------------------------------------------------------------------------
* Overview: Function Initializes Sensors example
* Input: Beackground color, pointer to Label,offset which should be redrawn
* Output: Nothing
*******************************************************************************/
void RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset){
  TFT_Set_Brush(1, BackGround_Color, 0, 0, 0, 0);
  TFT_Set_Pen(BackGround_Color, 0);
  TFT_Rectangle(label->Left, Label->Top, label->Left + Xoffset, Label->Top + Yoffset);
  DrawLabel(Label);
}

/*******************************************************************************
* Function Display_Temp(unsigned long temperature, char CF)
* ------------------------------------------------------------------------------
* Overview: Function Displays measured temperature on TFT
* Input: temperature, flag if celsius or fahrenheit is selected
* Output: Nothing
*******************************************************************************/
static void Display_Temp(unsigned long temperature, char CF){
  char text1[11], text2[11];
  char *ptr1, *ptr2, temp;
  
  LongWordToStr(temperature, text1);
  ptr1 = text1;
  if (CF == 0)
    ptr2 = Diagram5_Label2.Caption;
  else
    ptr2 = Diagram5_Label5.Caption;
    
  while (*ptr1){
    if (*ptr1 != ' ')
      *ptr2++ = *ptr1;
    ptr1++;
  }
  ptr2--;
  temp = *ptr2;
  *ptr2++ = '.';
  *ptr2++ = temp;
  *ptr2++ = ' ';
  *ptr2++ = 'º';
  if (CF == 0)
    *ptr2++ = 'C';
  else
    *ptr2++ = 'F';
  *ptr2 = 0;
  
  if (CF == 0)
    RedrawLabel(Sensors.Color, &Diagram5_Label2, 135, 50);
  else
    RedrawLabel(Sensors.Color, &Diagram5_Label5, 75, 30);
}

/*******************************************************************************
* Function Get_Temperature()
* ------------------------------------------------------------------------------
* Overview: Function measures temperature
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static void Get_Temperature(){
  unsigned long temp;
  float temp2;

  // read temperature and display it in celsius degrees
  temp = ADC3_Get_Sample(6);
  temp = (unsigned long)(VREF * temp) / 4100;
  temp = temp - 500;
  Display_Temp(temp, 0);
  
  // convert and display in fahrenheit degrees
  temp2 = (float)(temp) / 10 * 1.8 + 32;
  temp2 = temp2 * 10;
  Display_Temp((unsigned long)temp2, 1);
}

/*******************************************************************************
* Function Dim_BackLight()
* ------------------------------------------------------------------------------
* Overview: Function dims backlight
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static void Dim_BackLight(char intensity){
  char intensity_cnt;
  if (intensity < current_intensity)
    for (intensity_cnt = current_intensity; intensity_cnt > intensity; intensity_cnt --){
      TFT_Set_DBC_SSD1963(intensity_cnt);
      Delay_ms(2);
    }
  else
    for (intensity_cnt = current_intensity; intensity_cnt < intensity; intensity_cnt ++){
      TFT_Set_DBC_SSD1963(intensity_cnt);
      Delay_ms(2);
    }
  current_intensity = intensity;
}

/*******************************************************************************
* Function Get_Light_Intensity()
* ------------------------------------------------------------------------------
* Overview: Function measures light intensity
* Input: Nothing
* Output: Nothing
*******************************************************************************/
static unsigned int Get_Light_Intensity(){
  unsigned int Light_Intensity;
  char *ptr1, *ptr2;
  char text[7], temp;
  
  Light_Intensity = ADC3_Get_Sample(7);
  Light_Intensity = Light_Intensity / 4; 

  if (Light_Intensity >= 1000)
    Light_Intensity = 1000;
  WordToStr(Light_Intensity, text);
  ptr1 = text;
  ptr2 = Diagram5_Label4_Caption;
  while (*ptr1){
    if (*ptr1 != ' ')
      *ptr2++ = *ptr1;
    ptr1++;
  }
  ptr2--;
  temp = *ptr2;
  *ptr2++ = '.';
  *ptr2++ = temp;
  *ptr2++ = ' ';
  *ptr2++ = '%';
  *ptr2 = 0;
  RedrawLabel(Diagram5_Box1.Color, &Diagram5_Label4, 140, 50);
  
  return Light_Intensity;
}

/*******************************************************************************
* Function Sensors_Read()
* ------------------------------------------------------------------------------
* Overview: Function reads Light and temperature Sensors and display its results
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Sensors_Read(){
unsigned int Light_temp;
  Sensors_counter++;
  if (Sensors_counter > 2000){
    Get_Temperature();
    Light_temp = Get_Light_Intensity();
    // dim backlight if there is low luminous flux
    if (Light_temp < 200){
      if (Light_intensity_cnt < 5)
        Light_intensity_cnt ++;
    }
    else
      if (Light_intensity_cnt > -5)
        Light_intensity_cnt --;
      
    if ((Light_intensity_cnt > 4) && (FULL_BackLight == 1)){
      Dim_BackLight(70);
      FULL_BackLight = 0;
      Light_intensity_cnt = 0;
    }
    else if ((Light_intensity_cnt < -4) && (FULL_BackLight == 0)){
      Dim_BackLight(255);
      FULL_BackLight = 1;
      Light_intensity_cnt = 0;
    }
    
    Sensors_counter = 0;
  }
}

/*******************************************************************************
* Function Stop_sensors()
* ------------------------------------------------------------------------------
* Overview: Function stops example and fade out screen
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void Stop_sensors(){
  Dim_BackLight(0);
}