#line 1 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
#line 1 "c:/users/jjmcdo1/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 19 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
char Magnetdata_[10];
#line 27 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
static void HMC5883L_Write(unsigned short address, unsigned short data1) {
 I2C1_Start();
 Magnetdata_[0] = address;
 Magnetdata_[1] = data1;
 I2C1_Write( 0x53 , Magnetdata_, 2, END_MODE_STOP);
}
#line 41 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
void HMC5883L_Read(int *data_X, int *data_Y, int *data_Z){
 Magnetdata_[0] =  0x03 ;
 I2C1_Start();
 I2C1_Write( 0x53 , Magnetdata_, 1, END_MODE_RESTART);
 I2C1_Read( 0x53 , Magnetdata_, 6, END_MODE_STOP);

 *data_X = Magnetdata_[0] + (Magnetdata_[1] << 8);
 *data_Y = Magnetdata_[2] + (Magnetdata_[3] << 8);
 *data_Z = Magnetdata_[4] + (Magnetdata_[5] << 8);
}
#line 59 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
static unsigned short HMC5883L_Read_Register(unsigned short address) {
 I2C1_Start();
 Magnetdata_[0] = address;
 I2C1_Write( 0x53 , Magnetdata_, 1, END_MODE_RESTART);
 I2C1_Read( 0x53 , Magnetdata_, 1, END_MODE_STOP);
 return Magnetdata_[0];
}
#line 74 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/HMC5883L_driver.c"
char HMC5883L_Init() {
 char id = 0x00;

 HMC5883L_Write(0x2D, 0x00);
 id = HMC5883L_Read_Register(0x00);
 if (id != 0xE5) {

 }
 else {




 return 0x00;
 }
}
