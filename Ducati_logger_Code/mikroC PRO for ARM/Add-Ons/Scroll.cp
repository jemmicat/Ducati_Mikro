#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 25 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
extern sbit sfr TFT_CS;

const _DISPLAY_HEIGHT = 272;
#line 32 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
void TFT_Write_to_16bitPort(unsigned int _data);
void Write_Command(unsigned short cmd);
void Set_Index(unsigned short index);
#line 43 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
void Scroll_Init_Scroll_area(unsigned int first, unsigned int last){
unsigned int temp;
 TFT_CS = 0;
 Set_Index(0x33);
 Write_Command( ((char *)&first)[1] );
 Write_Command( ((char *)&first)[0] );
 temp = last - first;
 Write_Command( ((char *)&temp)[1] );
 Write_Command( ((char *)&temp)[0] );
 temp = _DISPLAY_HEIGHT - last;
 Write_Command( ((char *)&temp)[1] );
 Write_Command( ((char *)&temp)[0] );
 TFT_CS = 1;
}
#line 65 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
void Scroll_Undone(unsigned int first, unsigned int last){
 Scroll_Init_Scroll_area(first, last);
 TFT_CS = 0;
 Set_Index(0x36);
 Write_Command(0x00);

 Set_Index(0x37);
 Write_Command( ((char *)&first)[1] );
 Write_Command( ((char *)&first)[0] );

 TFT_CS = 1;
}
#line 85 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/Scroll.c"
void Scroll(unsigned int scroll) {
 TFT_CS = 0;

 Set_Index(0x36);
 Write_Command(0x00);

 Set_Index(0x37);
 Write_Command( ((char *)&scroll)[1] );
 Write_Command( ((char *)&scroll)[0] );

 TFT_CS = 1;
}
