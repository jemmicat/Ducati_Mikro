#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
#line 1 "c:/users/jemmi/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 22 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
char data_[10];
#line 30 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
static void ADXL345_Write(unsigned short address, unsigned short data1) {
 I2C1_Start();
 data_[0] = address;
 data_[1] = data1;
 I2C1_Write( 0x53 , data_, 2, END_MODE_STOP);
}
#line 44 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
void ADXL345_Read(int *data_X, int *data_Y, int *data_Z){
 data_[0] =  0x32 ;
 I2C1_Start();
 I2C1_Write( 0x53 , data_, 1, END_MODE_RESTART);
 I2C1_Read( 0x53 , data_, 6, END_MODE_STOP);

 *data_X = data_[0] + (data_[1] << 8);
 *data_Y = data_[2] + (data_[3] << 8);
 *data_Z = data_[4] + (data_[5] << 8);
}
#line 62 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
static unsigned short ADXL345_Read_Register(unsigned short address) {
 I2C1_Start();
 data_[0] = address;
 I2C1_Write( 0x53 , data_, 1, END_MODE_RESTART);
 I2C1_Read( 0x53 , data_, 1, END_MODE_STOP);
 return data_[0];
}
#line 77 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
char ADXL345_Init() {
 char id = 0x00;

 ADXL345_Write(0x2D, 0x00);
 id = ADXL345_Read_Register(0x00);
 if (id != 0xE5) {
 return  0x02 ;
 }
 else {
 ADXL345_Write( 0x31 , 0x08);
 ADXL345_Write( 0x2C , 0x0A);
 ADXL345_Write( 0x38 , 0x80);
 ADXL345_Write( 0x2D , 0x08);
 return 0x00;
 }
}
