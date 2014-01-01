#line 1 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_driver.c"
#line 1 "c:/program files (x86)/mikroc pro for arm/include/built_in.h"
#line 14 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_driver.c"
const char WRITE_CODE = 0x02;
const char READ_CODE = 0x03;

const char SCI_BASE_ADDR = 0x00;
const char SCI_MODE_ADDR = 0x00;
const char SCI_STATUS_ADDR = 0x01;
const char SCI_BASS_ADDR = 0x02;
const char SCI_CLOCKF_ADDR = 0x03;
const char SCI_DECODE_TIME_ADDR = 0x04;
const char SCI_AUDATA_ADDR = 0x05;
const char SCI_WRAM_ADDR = 0x06;
const char SCI_WRAMADDR_ADDR = 0x07;
const char SCI_HDAT0_ADDR = 0x08;
const char SCI_HDAT1_ADDR = 0x09;
const char SCI_AIADDR_ADDR = 0x0A;
const char SCI_VOL_ADDR = 0x0B;
const char SCI_AICTRL0_ADDR = 0x0C;
const char SCI_AICTRL1_ADDR = 0x0D;
const char SCI_AICTRL2_ADDR = 0x0E;
const char SCI_AICTRL3_ADDR = 0x0F;
#line 38 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_driver.c"
extern sfr sbit Mmc_Chip_Select;
extern sfr sbit MP3_CS;
extern sfr sbit MP3_RST;
extern sfr sbit BSYNC;
extern sfr sbit DREQ;
#line 51 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_driver.c"
void MP3_SCI_Write(char address, unsigned int data_in) {
 BSYNC = 1;

 MP3_CS = 0;
 SPI2_Write(WRITE_CODE);
 SPI2_Write(address);
 SPI2_Write( ((char *)&data_in)[1] );
 SPI2_Write( ((char *)&data_in)[0] );
 MP3_CS = 1;
 while (DREQ == 0);
}
#line 70 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_driver.c"
void MP3_SCI_Read(char start_address, char words_count, unsigned int *data_buffer) {
 unsigned int temp;

 MP3_CS = 0;
 SPI2_Write(READ_CODE);
 SPI2_Write(start_address);

 while (words_count--) {
 temp = SPI2_Read(0);
 temp <<= 8;
 temp += SPI2_Read(0);
 *(data_buffer++) = temp;
 }
 MP3_CS = 1;
 while (DREQ == 0);
}
#line 94 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_driver.c"
void MP3_SDI_Write(char data_) {

 MP3_CS = 1;
 BSYNC = 0;

 while (DREQ == 0);

 SPI2_Write(data_);
 BSYNC = 1;
}
#line 112 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_driver.c"
void MP3_Reset_Time(){
 MP3_SCI_Write(SCI_DECODE_TIME_ADDR, 0);
}
#line 123 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_driver.c"
void MP3_Get_Decode_Time(unsigned int *time){
 MP3_SCI_Read(SCI_DECODE_TIME_ADDR, 1, time);
}
#line 134 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_driver.c"
void MP3_SDI_Write_32(char *data_) {
 char i;

 MP3_CS = 1;
 BSYNC = 0;

 while (DREQ == 0);

 for (i=0; i<32; i++)
 SPI2_Write(data_[i]);
 BSYNC = 1;
}
#line 154 "C:/Users/Jemmi/Desktop/Ducati_Mikro/mikromedia_STM32plus_Code/mikroC PRO for ARM/MP3_driver.c"
void MP3_Set_Volume(char left, char right) {
 unsigned int volume;

 volume = (left<<8) + right;
 MP3_SCI_Write(SCI_VOL_ADDR, volume);
}

void MP3_Set_default_Mode(){
 BSYNC = 1;
 MP3_CS = 1;


 MP3_RST = 0;
 Delay_ms(10);
 MP3_RST = 1;

 while (DREQ == 0);

 MP3_SCI_Write(SCI_MODE_ADDR, 0x0800);
 MP3_SCI_Write(SCI_BASS_ADDR, 0x7A00);
 MP3_SCI_Write(SCI_CLOCKF_ADDR, 0xC000);


}
