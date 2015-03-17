
#include "typedefs.h"

// MPU9150A I2C address

#define    MPU9150A_I2C_ADDR               0x69                                 //Device address jumper pos 1 (0xD2 >> 1)
//#define    MPU9150A_I2C_ADDR             0x68                                 //Device address jumper pos 0
#define    MAG_I2C_ADDR                0x0C                                     // Address of the magnetometer in bypass mode
//#define    MAG_I2C_ADDR                0x0D

// MPU 9150A registers

#define MPUREG_WHOAMI                      0x75
#define MPUREG_SMPLRT_DIV                  0x19
#define MPUREG_CONFIG                      0x1A
#define MPUREG_GYRO_CONFIG                 0x1B
#define MPUREG_ACCEL_CONFIG                0x1C
#define MPUREG_FIFO_EN                     0x23
#define MPUREG_INT_PIN_CFG                 0x37
#define MPUREG_INT_ENABLE                  0x38
#define MPUREG_INT_STATUS                  0x3A
#define MPUREG_ACCEL_XOUT_H                0x3B
#define MPUREG_ACCEL_XOUT_L                0x3C
#define MPUREG_ACCEL_YOUT_H                0x3D
#define MPUREG_ACCEL_YOUT_L                0x3E
#define MPUREG_ACCEL_ZOUT_H                0x3F
#define MPUREG_ACCEL_ZOUT_L                0x40
#define MPUREG_TEMP_OUT_H                  0x41
#define MPUREG_TEMP_OUT_L                  0x42
#define MPUREG_GYRO_XOUT_H                 0x43
#define MPUREG_GYRO_XOUT_L                 0x44
#define MPUREG_GYRO_YOUT_H                 0x45
#define MPUREG_GYRO_YOUT_L                 0x46
#define MPUREG_GYRO_ZOUT_H                 0x47
#define MPUREG_GYRO_ZOUT_L                 0x48
#define MPUREG_USER_CTRL                   0x6A
#define MPUREG_PWR_MGMT_1                  0x6B
#define MPUREG_PWR_MGMT_2                  0x6C
#define MPUREG_FIFO_COUNTH                 0x72
#define MPUREG_FIFO_COUNTL                 0x73
#define MPUREG_FIFO_R_W                    0x74

//Magnetometer registers
#define MAGREG_WIA                         0x00    // Mag Who I Am
#define MAGREG_AKM_ID                      0x48    // Mag device ID
#define MAGREG_ST1                         0x02    // Magnetometer status 1
#define MAGREG_HXL                         0x03    // Mag X axis Low
#define MAGREG_HXH                         0x04    // Mag X axis High
#define MAGREG_HYL                         0x05    // Mag Y axis Low
#define MAGREG_HYH                         0x06    // Mag Y axis High
#define MAGREG_HZL                         0x07    // Mag Z axis Low
#define MAGREG_HZH                         0x08    // Mag Z axis High
#define MAGREG_ST2                         0x09    // Magnetometer status 2
#define MAGREG_CNTL                        0x0A    // Magnetometer control

// Configuration bits
#define BIT_SLEEP                          0x40
#define BIT_H_RESET                        0x80
#define BITS_CLKSEL                        0x07
#define MPU_CLK_SEL_PLLGYROX               0x01
#define MPU_CLK_SEL_PLLGYROZ               0x03
#define MPU_EXT_SYNC_GYROX                 0x02
#define BITS_AFSL_SEL_2G                   0x00
#define BITS_AFSL_SEL_4G                   0x08
#define BITS_AFSL_SEL_8G                   0x10
#define BITS_AFSL_SEL_16G                  0x18
#define BITS_FS_250DPS                     0x00
#define BITS_FS_500DPS                     0x08
#define BITS_FS_1000DPS                    0x10
#define BITS_FS_2000DPS                    0x18
#define BITS_FS_MASK                       0x18
#define BITS_DLPF_CFG_256HZ_NOLPF2         0x00
#define BITS_DLPF_CFG_188HZ                0x01
#define BITS_DLPF_CFG_98HZ                 0x02
#define BITS_DLPF_CFG_42HZ                 0x03
#define BITS_DLPF_CFG_20HZ                 0x04
#define BITS_DLPF_CFG_10HZ                 0x05
#define BITS_DLPF_CFG_5HZ                  0x06
#define BITS_DLPF_CFG_2100HZ_NOLPF         0x07
#define BITS_DLPF_CFG_MASK                 0x07
#define BIT_INT_ANYRD_2CLEAR               0x10
#define BIT_RAW_RDY_EN                     0x01
#define BIT_I2C_IF_DIS                     0x10
#define BIT_INT_STATUS_DATA                0x01
#define BIT_FIFO_EN                        0x78
#define BIT_FIFO_DIS                       0x00

extern sfr sbit MPU9150A_INT;
static char reg_data[8];
static char raw_data[32];
unsigned int tmrTicks;
tSensor MPU9150A;

static void MPU9150A_I2C_WriteReg(char wAddr, char wData){
  reg_data[0] = wAddr;
  reg_data[1] = wData;
  I2C_Start();
  I2C_Write(MPU9150A_I2C_ADDR,reg_data, 2, END_MODE_STOP);
}

static char MPU9150A_I2C_ReadReg(char rAddr){
  reg_data[0] = rAddr;
  I2C_Start();
  I2C_Write(MPU9150A_I2C_ADDR, reg_data, 1 , END_MODE_RESTART);
  I2C_Read(MPU9150A_I2C_ADDR, reg_data,  1 , END_MODE_STOP);
  return reg_data[0];
}

static void MAG_I2C_WriteReg(char wAddr, char wData){
  reg_data[0] = wAddr;
  reg_data[1] = wData;
  I2C_Start();
  I2C_Write(MAG_I2C_ADDR,reg_data,2,END_MODE_STOP);
}

static char MAG_I2C_ReadReg(char rAddr){
  reg_data[0] = rAddr;
  I2C_Start();
  I2C_Write(MAG_I2C_ADDR, reg_data, 1 , END_MODE_RESTART);
  I2C_Read(MAG_I2C_ADDR, reg_data,  1 , END_MODE_STOP);
  return reg_data[0];
}

char MPU9150A_Detect() {
  char detect;
  detect = MPU9150A_I2C_ReadReg(MPUREG_WHOAMI);
  if((detect & 0x7E) == 0x68) {
    return 1;
  }else{
    return 0;
  }
}

char MAG_Detect() {
  char detect;
  detect = MAG_I2C_ReadReg(MAGREG_WIA);
  return detect;
}

static void MPU9150A_Config() {
  while(!I2C1_IS_IDLE);
  MPU9150A_I2C_WriteReg(MPUREG_PWR_MGMT_1, BIT_H_RESET);                        // Chip reset
  delay_ms(10);                                                                 // Startup time delay
  // SAMPLE RATE
  MPU9150A_I2C_WriteReg(MPUREG_SMPLRT_DIV,0x00);                                // Sample rate = 1kHz
  // FS & DLPF   FS=1000º/s, DLPF = 42Hz (low pass filter)
  MPU9150A_I2C_WriteReg(MPUREG_CONFIG, BITS_DLPF_CFG_42HZ);
  MPU9150A_I2C_WriteReg(MPUREG_GYRO_CONFIG,BITS_FS_1000DPS);                    // Gyro scale 1000º/s
  MPU9150A_I2C_WriteReg(MPUREG_ACCEL_CONFIG,0x10);                              // Accel scale 8g (+-4096LSB/g)
  // Disable FIFOs
  MPU9150A_I2C_WriteReg(MPUREG_FIFO_EN , BIT_FIFO_DIS);
  MPU9150A_I2C_WriteReg(MPUREG_INT_PIN_CFG, 0x02);                              // Bypass mode enabled: 0b00000010 MPUREG_INT_PIN_CFG
  MPU9150A_I2C_WriteReg(MPUREG_INT_ENABLE , 0x00);                              // Disable all interrupts: 0b00000000
  MPU9150A_I2C_WriteReg(MPUREG_USER_CTRL  , 0x00);                              // No FIFO and no I2C slaves: 0b00000000
  MPU9150A_I2C_WriteReg(MPUREG_PWR_MGMT_1 , 0x00);                              // No power management, internal clock source: 0b00000000
  MPU9150A_I2C_WriteReg(MPUREG_PWR_MGMT_2 , 0x00);
  /* Initialize magnetometer */
  MAG_I2C_WriteReg(MAGREG_CNTL, 0x01);                                          // Single measurement mode: 0b00000001
  delay_ms(10);
}

char MPU9150A_Init() {                                                          // Reset MPU9150A structure
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
  //Offset
  MPU9150A.mag_off.x = 0;
  MPU9150A.mag_off.y = 0;
  MPU9150A.mag_off.z = 0;
  //Scale
  MPU9150A.mag_scale.x = 1.0;
  MPU9150A.mag_scale.y = 1.0;
  MPU9150A.mag_scale.z = 1.0;
  MPU9150A_Config();
  return 1;
}

static void MPU9150A_ReadAccel() {
   char valueH, valueL;
   
   valueH = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_XOUT_H);
   valueL = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_XOUT_L);
   MPU9150A.accel.x = (int)((valueH << 8) | valueL );

   valueH = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_YOUT_H);
   valueL = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_YOUT_L);
   MPU9150A.accel.y = (int)((valueH << 8) | valueL );
   
   valueH = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_ZOUT_H);
   valueL = MPU9150A_I2C_ReadReg(MPUREG_ACCEL_ZOUT_L);
   MPU9150A.accel.z = (int)((valueH << 8) | valueL );
}

static void MPU9150A_ReadGyro() {
  char valueH, valueL;

   valueH = MPU9150A_I2C_ReadReg(MPUREG_GYRO_XOUT_H);
   valueL = MPU9150A_I2C_ReadReg(MPUREG_GYRO_XOUT_L);
   MPU9150A.gyro.x = (int)((valueH << 8) | valueL );

   valueH = MPU9150A_I2C_ReadReg(MPUREG_GYRO_YOUT_H);
   valueL = MPU9150A_I2C_ReadReg(MPUREG_GYRO_YOUT_L);
   MPU9150A.gyro.y = (int)((valueH << 8) | valueL );

   valueH = MPU9150A_I2C_ReadReg(MPUREG_GYRO_ZOUT_H);
   valueL = MPU9150A_I2C_ReadReg(MPUREG_GYRO_ZOUT_L);
   MPU9150A.gyro.z = (int)((valueH << 8) | valueL );

   MPU9150A.gdt = (float)tmrTicks/10000;
   tmrTicks = 0;
}

/***************************************************************************************
Temperature in degrees C = (TEMP_OUT Register Value as a signed quantity)/340 + 36.53
****************************************************************************************/

static void MPU9150A_ReadTemp() {
  char valueH, valueL;
  int temp;

   valueH = MPU9150A_I2C_ReadReg(MPUREG_TEMP_OUT_H);
   valueL = MPU9150A_I2C_ReadReg(MPUREG_TEMP_OUT_L);
   temp = (int)((valueH << 8) | valueL );

   MPU9150A.temp = (float)(temp/340) + 36.5;
}

static void MPU9150A_ReadMagnetometer() {
   char valueH, valueL , dataReady;
   
   dataReady = MAG_I2C_ReadReg(MAGREG_ST1);

   if (dataReady) {
   valueH = MAG_I2C_ReadReg(MAGREG_HXH);
   valueL = MAG_I2C_ReadReg(MAGREG_HXL);
   MPU9150A.mag.x = (int)((valueH << 8) | valueL );

   valueH = MAG_I2C_ReadReg(MAGREG_HYH);
   valueL = MAG_I2C_ReadReg(MAGREG_HYL);
   MPU9150A.mag.y = (int)((valueH << 8) | valueL );

   valueH = MAG_I2C_ReadReg(MAGREG_HZH);
   valueL = MAG_I2C_ReadReg(MAGREG_HZL);
   MPU9150A.mag.z = (int)((valueH << 8) | valueL );
   } else {
     MPU9150A.mag.x = 0;
     MPU9150A.mag.y = 0;
     MPU9150A.mag.z = 0;
   }
   // Re-arm single measurement mode
   MAG_I2C_writeReg(MAGREG_CNTL, 0x01);
}

void MPU9150A_Read() {
   MPU9150A_ReadAccel();
   MPU9150A_ReadGyro();
   MPU9150A_ReadTemp();
   MPU9150A_ReadMagnetometer();
}