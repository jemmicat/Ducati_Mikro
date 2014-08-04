#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_driver.c"
#line 1 "c:/users/jemmi/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 8 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_driver.c"
const unsigned char OSS = 0;


int ac1;
int ac2;
int ac3;
unsigned int ac4;
unsigned int ac5;
unsigned int ac6;
int bb1;
int bb2;
int mmb;
int mmc;
int mmd;


char Pressuredata_[10];




long bb5;

short temperature;
long pressure;


const float p0 = 101325;





int bmp085ReadInt(unsigned char address)
{
 unsigned char msb, lsb;
#line 55 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_driver.c"
 return (int) msb<<8 | lsb;
}







void bmp085Calibration()
{
 ac1 = bmp085ReadInt(0xAA);
 ac2 = bmp085ReadInt(0xAC);
 ac3 = bmp085ReadInt(0xAE);
 ac4 = bmp085ReadInt(0xB0);
 ac5 = bmp085ReadInt(0xB2);
 ac6 = bmp085ReadInt(0xB4);
 bb1 = bmp085ReadInt(0xB6);
 bb2 = bmp085ReadInt(0xB8);
 mmb = bmp085ReadInt(0xBA);
 mmc = bmp085ReadInt(0xBC);
 mmd = bmp085ReadInt(0xBE);
}



short bmp085GetTemperature(unsigned int ut)
{
 long x1, x2;

 x1 = (((long)ut - (long)ac6)*(long)ac5) >> 15;
 x2 = ((long)mmc << 11)/(x1 + mmd);
 bb5 = x1 + x2;

 return ((bb5 + 8)>>4);
}





long bmp085GetPressure(unsigned long up)
{
 long x1, x2, x3, b3, b6, p;
 unsigned long b4, b7;

 b6 = b5 - 4000;

 x1 = (b2 * (b6 * b6)>>12)>>11;
 x2 = (ac2 * b6)>>11;
 x3 = x1 + x2;
 b3 = (((((long)ac1)*4 + x3)<<OSS) + 2)>>2;


 x1 = (ac3 * b6)>>13;
 x2 = (b1 * ((b6 * b6)>>12))>>16;
 x3 = ((x1 + x2) + 2)>>2;
 b4 = (ac4 * (unsigned long)(x3 + 32768))>>15;

 b7 = ((unsigned long)(up - b3) * (50000>>OSS));
 if (b7 < 0x80000000)
 p = (b7<<1)/b4;
 else
 p = (b7/b4)<<1;

 x1 = (p>>8) * (p>>8);
 x1 = (x1 * 3038)>>16;
 x2 = (-7357 * p)>>16;
 p += (x1 + x2 + 3791)>>4;

 return p;
}


char bmp085Read(unsigned char address)
{
 unsigned char data;
#line 142 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_driver.c"
}




unsigned int bmp085ReadUT()
{
 unsigned int ut;
#line 162 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_driver.c"
 ut = bmp085ReadInt(0xF6);
 return ut;
}


unsigned long bmp085ReadUP()
{
 unsigned char msb, lsb, xlsb;
 unsigned long up = 0;
#line 194 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/BMP085_driver.c"
 up = (((unsigned long) msb << 16) | ((unsigned long) lsb << 8) | (unsigned long) xlsb) >> (8-OSS);

 return up;
}
