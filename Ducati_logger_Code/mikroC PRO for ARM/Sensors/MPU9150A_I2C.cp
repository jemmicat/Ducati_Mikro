#line 1 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/MPU9150A_I2C.c"
#line 1 "c:/users/jjmcdo1/documents/github/ducati_mikro/ducati_logger_code/mikroc pro for arm/sensors/typedefs.h"

typedef struct {
 int x;
 int y;
 int z;
} tAxisB;

typedef struct {
 int x;
 int y;
 int z;
} tAxis;

typedef struct {
 float x;
 float y;
 float z;
} tAxisF;



typedef struct {
 tAxis accel;
 tAxis gyro;
 tAxis mag;
 tAxisF calib_accel;
 tAxisF calib_gyro;
 tAxisF calib_mag;
 tAxisF out_accel;
 tAxisF out_gyro;
 tAxisF out_mag;
 tAxisF mag_scale;
 tAxis mag_off;
 float temp;
 float gdt;
} tSensor;
#line 88 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/MPU9150A_I2C.c"
extern sfr sbit MPU9150A_INT;
static char reg_data[8];
static char raw_data[32];
unsigned int tmrTicks;
tSensor MPU9150A;

static void MPU9150A_I2C_WriteReg(char wAddr, char wData){
 reg_data[0] = wAddr;
 reg_data[1] = wData;
 I2C_Start();
 I2C_Write( 0x69 ,reg_data, 2, END_MODE_STOP);
}

static char MPU9150A_I2C_ReadReg(char rAddr){
 reg_data[0] = rAddr;
 I2C_Start();
 I2C_Write( 0x69 , reg_data, 1 , END_MODE_RESTART);
 I2C_Read( 0x69 , reg_data, 1 , END_MODE_STOP);
 return reg_data[0];
}

static void MAG_I2C_WriteReg(char wAddr, char wData){
 reg_data[0] = wAddr;
 reg_data[1] = wData;
 I2C_Start();
 I2C_Write( 0x0C ,reg_data,2,END_MODE_STOP);
}

static char MAG_I2C_ReadReg(char rAddr){
 reg_data[0] = rAddr;
 I2C_Start();
 I2C_Write( 0x0C , reg_data, 1 , END_MODE_RESTART);
 I2C_Read( 0x0C , reg_data, 1 , END_MODE_STOP);
 return reg_data[0];
}

char MPU9150A_Detect() {
 char detect;
 detect = MPU9150A_I2C_ReadReg( 0x75 );
 if((detect & 0x7E) == 0x68) {
 return 1;
 }else{
 return 0;
 }
}

char MAG_Detect() {
 char detect;
 detect = MAG_I2C_ReadReg( 0x00 );
 return detect;
}

static void MPU9150A_Config() {
 while(!I2C1_IS_IDLE);
 MPU9150A_I2C_WriteReg( 0x6B ,  0x80 );
 delay_ms(10);

 MPU9150A_I2C_WriteReg( 0x19 ,0x00);

 MPU9150A_I2C_WriteReg( 0x1A ,  0x03 );
 MPU9150A_I2C_WriteReg( 0x1B , 0x10 );
 MPU9150A_I2C_WriteReg( 0x1C ,0x10);

 MPU9150A_I2C_WriteReg( 0x23  ,  0x00 );
 MPU9150A_I2C_WriteReg( 0x37 , 0x02);
 MPU9150A_I2C_WriteReg( 0x38  , 0x00);
 MPU9150A_I2C_WriteReg( 0x6A  , 0x00);
 MPU9150A_I2C_WriteReg( 0x6B  , 0x00);
 MPU9150A_I2C_WriteReg( 0x6C  , 0x00);

 MAG_I2C_WriteReg( 0x0A , 0x01);
 delay_ms(10);
}

char MPU9150A_Init() {
 MPU9150A.accel.x = 0;
 MPU9150A.accel.y = 0;
 MPU9150A.accel.z = 0;
 MPU9150A.gyro.x = 0;
 MPU9150A.gyro.y = 0;
 MPU9150A.gyro.z = 0;
 MPU9150A.mag.x = 0;
 MPU9150A.mag.y = 0;
 MPU9150A.mag.z = 0;
 MPU9150A.temp = 0;
 MPU9150A.gdt = 0;
 MPU9150A.calib_accel.x = 0;
 MPU9150A.calib_accel.y = 0;
 MPU9150A.calib_accel.z = 0;
 MPU9150A.calib_gyro.x = 0;
 MPU9150A.calib_gyro.y = 0;
 MPU9150A.calib_gyro.z = 0;

 MPU9150A.mag_off.x = 0;
 MPU9150A.mag_off.y = 0;
 MPU9150A.mag_off.z = 0;

 MPU9150A.mag_scale.x = 1.0;
 MPU9150A.mag_scale.y = 1.0;
 MPU9150A.mag_scale.z = 1.0;
 MPU9150A_Config();
 return 1;
}

static void MPU9150A_ReadAccel() {
 char valueH, valueL;

 valueH = MPU9150A_I2C_ReadReg( 0x3B );
 valueL = MPU9150A_I2C_ReadReg( 0x3C );
 MPU9150A.accel.x = (int)((valueH << 8) | valueL );

 valueH = MPU9150A_I2C_ReadReg( 0x3D );
 valueL = MPU9150A_I2C_ReadReg( 0x3E );
 MPU9150A.accel.y = (int)((valueH << 8) | valueL );

 valueH = MPU9150A_I2C_ReadReg( 0x3F );
 valueL = MPU9150A_I2C_ReadReg( 0x40 );
 MPU9150A.accel.z = (int)((valueH << 8) | valueL );
}

static void MPU9150A_ReadGyro() {
 char valueH, valueL;

 valueH = MPU9150A_I2C_ReadReg( 0x43 );
 valueL = MPU9150A_I2C_ReadReg( 0x44 );
 MPU9150A.gyro.x = (int)((valueH << 8) | valueL );

 valueH = MPU9150A_I2C_ReadReg( 0x45 );
 valueL = MPU9150A_I2C_ReadReg( 0x46 );
 MPU9150A.gyro.y = (int)((valueH << 8) | valueL );

 valueH = MPU9150A_I2C_ReadReg( 0x47 );
 valueL = MPU9150A_I2C_ReadReg( 0x48 );
 MPU9150A.gyro.z = (int)((valueH << 8) | valueL );

 MPU9150A.gdt = (float)tmrTicks/10000;
 tmrTicks = 0;
}
#line 231 "C:/Users/jjmcdo1/Documents/GitHub/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Sensors/MPU9150A_I2C.c"
static void MPU9150A_ReadTemp() {
 char valueH, valueL;
 int temp;

 valueH = MPU9150A_I2C_ReadReg( 0x41 );
 valueL = MPU9150A_I2C_ReadReg( 0x42 );
 temp = (int)((valueH << 8) | valueL );

 MPU9150A.temp = (float)(temp/340) + 36.5;
}

static void MPU9150A_ReadMagnetometer() {
 char valueH, valueL , dataReady;

 dataReady = MAG_I2C_ReadReg( 0x02 );

 if (dataReady) {
 valueH = MAG_I2C_ReadReg( 0x04 );
 valueL = MAG_I2C_ReadReg( 0x03 );
 MPU9150A.mag.x = (int)((valueH << 8) | valueL );

 valueH = MAG_I2C_ReadReg( 0x06 );
 valueL = MAG_I2C_ReadReg( 0x05 );
 MPU9150A.mag.y = (int)((valueH << 8) | valueL );

 valueH = MAG_I2C_ReadReg( 0x08 );
 valueL = MAG_I2C_ReadReg( 0x07 );
 MPU9150A.mag.z = (int)((valueH << 8) | valueL );
 } else {
 MPU9150A.mag.x = 0;
 MPU9150A.mag.y = 0;
 MPU9150A.mag.z = 0;
 }

 MAG_I2C_writeReg( 0x0A , 0x01);
}

void MPU9150A_Read() {
 MPU9150A_ReadAccel();
 MPU9150A_ReadGyro();
 MPU9150A_ReadTemp();
 MPU9150A_ReadMagnetometer();
}
