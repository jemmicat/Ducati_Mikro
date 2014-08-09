#line 1 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
#line 1 "c:/users/jemmi/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 8 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
char WHO_AM_I = 0x00;
char SMPLRT_DIV= 0x15;
char DLPF_FS = 0x16;
char GYRO_XOUT_H = 0x1D;
char GYRO_XOUT_L = 0x1E;
char GYRO_YOUT_H = 0x1F;
char GYRO_YOUT_L = 0x20;
char GYRO_ZOUT_H = 0x21;
char GYRO_ZOUT_L = 0x22;

char DLPF_CFG_0 = (1<<0);
char DLPF_CFG_1 = (1<<1);
char DLPF_CFG_2 = (1<<2);
char DLPF_FS_SEL_0 = (1<<3);
char DLPF_FS_SEL_1 = (1<<4);


char gyrodata_[10];
#line 33 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
static void ITG3200_Write(unsigned short address, unsigned short data1) {
 I2C2_Start();
 gyrodata_[0] = address;
 gyrodata_[1] = data1;
 I2C2_Write( 0x68 , gyrodata_, 2, END_MODE_STOP);
}
#line 47 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
void ITG3200_Read(int *data_X, int *data_Y, int *data_Z){
 gyrodata_[0] = GYRO_XOUT_H;
 I2C2_Start();
 I2C2_Write( 0x68 , gyrodata_, 1, END_MODE_RESTART);
 I2C2_Read( 0x68 , gyrodata_, 6, END_MODE_STOP);

 *data_X = gyrodata_[0] + (gyrodata_[1] << 8);
 *data_Y = gyrodata_[2] + (gyrodata_[3] << 8);
 *data_Z = gyrodata_[4] + (gyrodata_[5] << 8);
}
#line 65 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
static unsigned short ITG3200_Read_Register(unsigned short address) {
 I2C2_Start();
 gyrodata_[0] = address;
 I2C2_Write( 0x68 , gyrodata_, 1, END_MODE_RESTART);
 I2C2_Read( 0x68 , gyrodata_, 1, END_MODE_STOP);
 return gyrodata_[0];
}
#line 80 "C:/Users/Jemmi/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/ITG3200_driver.c"
char ITG3200_Init() {
 char id = 0x00;

 id = ITG3200_Read_Register(0x00);
 if (id != 0x68) {
 return  0x02 ;
 }
 else {

 ITG3200_Write(DLPF_FS, (DLPF_FS_SEL_0|DLPF_FS_SEL_1|DLPF_CFG_0));

 ITG3200_Write(SMPLRT_DIV, 9);;
 return 0x00;
 }
}
