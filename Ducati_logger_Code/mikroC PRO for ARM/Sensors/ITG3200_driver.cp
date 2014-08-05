#line 1 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
#line 1 "c:/users/jjmcdo1/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 79 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
char gyrodata_[10];
#line 87 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
static void ITG3200_Write(unsigned short address, unsigned short data1) {
 I2C2_Start();
 gyrodata_[0] = address;
 gyrodata_[1] = data1;
 I2C2_Write( 0x68 , gyrodata_, 2, END_MODE_STOP);
}
#line 101 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
void ITG3200_Read(int *data_X, int *data_Y, int *data_Z){
 gyrodata_[0] = _DATAX0;
 I2C2_Start();
 I2C2_Write( 0x68 , gyrodata_, 1, END_MODE_RESTART);
 I2C2_Read( 0x68 , gyrodata_, 6, END_MODE_STOP);

 *data_X = gyrodata_[0] + (gyrodata_[1] << 8);
 *data_Y = gyrodata_[2] + (gyrodata_[3] << 8);
 *data_Z = gyrodata_[4] + (gyrodata_[5] << 8);
}
#line 119 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
static unsigned short ITG3200_Read_Register(unsigned short address) {
 I2C2_Start();
 gyrodata_[0] = address;
 I2C2_Write( 0x68 , gyrodata_, 1, END_MODE_RESTART);
 I2C2_Read( 0x68 , gyrodata_, 1, END_MODE_STOP);
 return gyrodata_[0];
}
#line 134 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
char ITG3200_Init() {
 char id = 0x00;

 ITG3200_Write(0x2D, 0x00);
 id = ITG3200_Read_Register(0x00);
 if (id != 0xE5) {
 return _GYRO_ERROR;
 }
 else {



 ITG3200_Write(SMPLRT_DIV, 0x09);



 return 0x00;
 }
}
