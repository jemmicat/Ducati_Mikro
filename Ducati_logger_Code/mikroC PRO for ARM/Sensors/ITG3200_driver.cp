#line 1 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
#line 1 "c:/users/jjmcdo1/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 16 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
char data_[10];
#line 24 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
static void ITG3200_Write(unsigned short address, unsigned short data1) {
 I2C2_Start();
 data_[0] = address;
 data_[1] = data1;
 I2C2_Write( 0x69 , data_, 2, END_MODE_STOP);
}
#line 38 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
void ITG3200_Read(int *data_X, int *data_Y, int *data_Z){
 data_[0] =  0x1D ;
 I2C2_Start();
 I2C2_Write( 0x69 , data_, 1, END_MODE_RESTART);
 I2C2_Read( 0x69 , data_, 6, END_MODE_STOP);

 *data_X = data_[0] + (data_[1] << 8);
 *data_Y = data_[2] + (data_[3] << 8);
 *data_Z = data_[4] + (data_[5] << 8);
}
#line 56 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
static unsigned short ITG3200_Read_Register(unsigned short address) {
 I2C2_Start();
 data_[0] = address;
 I2C2_Write( 0x69 , data_, 1, END_MODE_RESTART);
 I2C2_Read( 0x69 , data_, 1, END_MODE_STOP);
 return data_[0];
}
#line 71 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
char ITG3200_Init() {
 char id = 0x00;

 ITG3200_Write(0x2D, 0x00);
 id = ITG3200_Read_Register(0x00);
 if (id != 0xE5) {
 return  0x02 ;
 }
 else {



 ITG3200_Write( 0x15 , 0x09);



 return 0x00;
 }
}
