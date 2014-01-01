#line 1 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
#line 1 "c:/program files (x86)/mikroc pro for arm/include/built_in.h"
#line 25 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
extern sbit sfr TFT_CS;

const _DISPLAY_HEIGHT = 272;
#line 32 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
void TFT_Write_to_16bitPort(unsigned int _data);
void TFT_mikromedia_Write_Command(unsigned short cmd);
void TFT_mikromedia_Set_Index(unsigned short index);
#line 43 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
void Scroll_Init_Scroll_area(unsigned int first, unsigned int last){
unsigned int temp;
 TFT_CS = 0;
 TFT_mikromedia_Set_Index(0x33);
 TFT_mikromedia_Write_Command( ((char *)&first)[1] );
 TFT_mikromedia_Write_Command( ((char *)&first)[0] );
 temp = last - first;
 TFT_mikromedia_Write_Command( ((char *)&temp)[1] );
 TFT_mikromedia_Write_Command( ((char *)&temp)[0] );
 temp = _DISPLAY_HEIGHT - last;
 TFT_mikromedia_Write_Command( ((char *)&temp)[1] );
 TFT_mikromedia_Write_Command( ((char *)&temp)[0] );
 TFT_CS = 1;
}
#line 65 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
void Scroll_Undone(unsigned int first, unsigned int last){
 Scroll_Init_Scroll_area(first, last);
 TFT_CS = 0;
 TFT_mikromedia_Set_Index(0x36);
 TFT_mikromedia_Write_Command(0x00);

 TFT_mikromedia_Set_Index(0x37);
 TFT_mikromedia_Write_Command( ((char *)&first)[1] );
 TFT_mikromedia_Write_Command( ((char *)&first)[0] );

 TFT_CS = 1;
}
#line 85 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
void Scroll(unsigned int scroll) {
 TFT_CS = 0;

 TFT_mikromedia_Set_Index(0x36);
 TFT_mikromedia_Write_Command(0x00);

 TFT_mikromedia_Set_Index(0x37);
 TFT_mikromedia_Write_Command( ((char *)&scroll)[1] );
 TFT_mikromedia_Write_Command( ((char *)&scroll)[0] );

 TFT_CS = 1;
}
