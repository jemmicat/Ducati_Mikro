/*******************************************************************************
* Scroll  - Function Set used to Scroll display
* ------------------------------------------------------------------------------
*  SSD1963 supports vertical scrolling. Scrolling zone should be defined first.
*
*          _______________________________________________________
*         |                                                       |
*         |                   Top Fixed Area                      |
*         |                                                       |
*         |_______________________________________________________|
*         |                                                       |
*         |                                                       |
*         |                Vertical Scroll Area                   |
*         |                                                       |
*         |                                                       |
*         |_______________________________________________________|
*         |                                                       |
*         |                  Bottom Fixed Area                    |
*         |_______________________________________________________|
*
*  After exiting screen where scrolling was used user have to call Scroll_Undone
*    function in order to display next csreen correctly.
*******************************************************************************/
#include "built_in.h"
extern sbit sfr TFT_CS;

const _DISPLAY_HEIGHT = 272;

/*******************************************************************************
* Write functions used by mikromedia
*******************************************************************************/
void TFT_Write_to_16bitPort(unsigned int _data);
void Write_Command(unsigned short cmd);
void Set_Index(unsigned short index);

/*******************************************************************************
* Function Scroll_Init_Scroll_area(unsigned int first, unsigned int last)
* ------------------------------------------------------------------------------
* Overview: Function Initializes Scroll Area
* Input: First line in Scroll area, Last line in Scroll area
* Output: Nothing
*******************************************************************************/
void Scroll_Init_Scroll_area(unsigned int first, unsigned int last){
unsigned int temp;
  TFT_CS = 0;
  Set_Index(0x33);
  Write_Command(Hi(first));
  Write_Command(Lo(first));
  temp = last - first;
  Write_Command(Hi(temp));
  Write_Command(Lo(temp));
  temp = _DISPLAY_HEIGHT - last;
  Write_Command(Hi(temp));
  Write_Command(Lo(temp));
  TFT_CS = 1;
}

/*******************************************************************************
* Function Scroll_Undone(unsigned int first, unsigned int last)
* ------------------------------------------------------------------------------
* Overview: Function Initializes Scroll Area and sets defaults position
* Input: First line in Scroll area, Last line in Scroll area
* Output: Nothing
*******************************************************************************/
void Scroll_Undone(unsigned int first, unsigned int last){
  Scroll_Init_Scroll_area(first, last);
  TFT_CS = 0;
  Set_Index(0x36);
  Write_Command(0x00);

  Set_Index(0x37);
  Write_Command(Hi(first));
  Write_Command(Lo(first));

  TFT_CS = 1;
}

/*******************************************************************************
* Function Scroll(unsigned int scroll)
* ------------------------------------------------------------------------------
* Overview: Function Scrolls Vertical Scroll area dor desired number of pixels
* Input: Number of pixels for scrolling
* Output: Nothing
*******************************************************************************/
void Scroll(unsigned int scroll) {
  TFT_CS = 0;

  Set_Index(0x36);
  Write_Command(0x00);

  Set_Index(0x37);
  Write_Command(Hi(scroll));
  Write_Command(Lo(scroll));

  TFT_CS = 1;
}