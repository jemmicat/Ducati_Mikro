#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ADXL345_driver.c"
#line 1 "c:/users/jemmi/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 21 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ADXL345_driver.c"
char acceldata_[10];
#line 29 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ADXL345_driver.c"
static void ADXL345_Write(unsigned short address, unsigned short data1) {
 I2C2_Start();
 acceldata_[0] = address;
 acceldata_[1] = data1;
 I2C2_Write( 0x53 , acceldata_, 2, END_MODE_STOP);
}
#line 43 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ADXL345_driver.c"
void ADXL345_Read(int *data_X, int *data_Y, int *data_Z){
 acceldata_[0] =  0x32 ;
 I2C2_Start();
 I2C2_Write( 0x53 , acceldata_, 1, END_MODE_RESTART);
 I2C2_Read( 0x53 , acceldata_, 6, END_MODE_STOP);

 *data_X = acceldata_[0] + (acceldata_[1] << 8);
 *data_Y = acceldata_[2] + (acceldata_[3] << 8);
 *data_Z = acceldata_[4] + (acceldata_[5] << 8);
}
#line 61 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ADXL345_driver.c"
static unsigned short ADXL345_Read_Register(unsigned short address) {
 I2C2_Start();
 acceldata_[0] = address;
 I2C2_Write( 0x53 , acceldata_, 1, END_MODE_RESTART);
 I2C2_Read( 0x53 , acceldata_, 1, END_MODE_STOP);
 return acceldata_[0];
}
#line 76 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ADXL345_driver.c"
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
