#include "built_in.h"

// ADXL345 Register Definition
#define _POWER_CTL      0x2D
#define _DATA_FORMAT    0x31
#define _BW_RATE        0x2C
#define _DATAX0         0x32
#define _DATAX1         0x33
#define _DATAY0         0x34
#define _DATAY1         0x35
#define _DATAZ0         0x36
#define _DATAZ1         0x37
#define _FIFO_CTL       0x38
#define _SPEED          0x0F          // Buffer Speed - 3200Hz

#define _ACCEL_ERROR    0x02
                                      // check hardware
//#define _ACCEL_ADDRESS  0x1D          // if ALT ADDRESS = 1
#define _ACCEL_ADDRESS  0x53          // if ALT ADDRESS = 0

char acceldata_[10];
/*******************************************************************************
* Function ADXL345_Write()
* ------------------------------------------------------------------------------
* Overview: Function write byte of data to ADXL345
* Input: register address, data
* Output: Nothing
*******************************************************************************/
static void ADXL345_Write(unsigned short address, unsigned short data1) {
  I2C2_Start();              // issue I2C start signal
  acceldata_[0] = address;
  acceldata_[1] = data1;
  I2C2_Write(_ACCEL_ADDRESS, acceldata_, 2, END_MODE_STOP);
}

/*******************************************************************************
* Function ADXL345_Read()
* ------------------------------------------------------------------------------
* Overview: Function read byte of data from ADXL345
* Input: register address
* Output: data from addressed register in ADXL345
*******************************************************************************/
void ADXL345_Read(int *data_X, int *data_Y, int *data_Z){
  acceldata_[0] = _DATAX0;
  I2C2_Start();              // issue I2C start signal
  I2C2_Write(_ACCEL_ADDRESS, acceldata_, 1, END_MODE_RESTART);
  I2C2_Read(_ACCEL_ADDRESS, acceldata_, 6, END_MODE_STOP);

  *data_X = acceldata_[0] + (acceldata_[1] << 8);
  *data_Y = acceldata_[2] + (acceldata_[3] << 8);
  *data_Z = acceldata_[4] + (acceldata_[5] << 8);
}

/*******************************************************************************
* Function ADXL345_Read_Register()
* ------------------------------------------------------------------------------
* Overview: Function read byte of data from ADXL345
* Input: register address
* Output: data from addressed register in ADXL345
*******************************************************************************/
static unsigned short ADXL345_Read_Register(unsigned short address) {
  I2C2_Start();              // issue I2C start signal
  acceldata_[0] = address;
  I2C2_Write(_ACCEL_ADDRESS, acceldata_, 1, END_MODE_RESTART);
  I2C2_Read(_ACCEL_ADDRESS, acceldata_, 1, END_MODE_STOP);
  return acceldata_[0];
}

/*******************************************************************************
* Function ADXL345_Init()
* ------------------------------------------------------------------------------
* Overview: Function that initializes ADXL345
* Input: Nothing
* Output: return 0 for OK; return _ACCEL_ERROR for ERROR
*******************************************************************************/
char ADXL345_Init() {
  char id = 0x00;
  // Go into standby mode to configure the device.
  ADXL345_Write(0x2D, 0x00);
  id = ADXL345_Read_Register(0x00);
  if (id != 0xE5) {
    return _ACCEL_ERROR;
  }
  else {
    ADXL345_Write(_DATA_FORMAT, 0x08);       // Full resolution, +/-2g, 4mg/LSB, right justified
    ADXL345_Write(_BW_RATE, 0x0A);           // Set 100 Hz data rate
    ADXL345_Write(_FIFO_CTL, 0x80);          // stream mode
    ADXL345_Write(_POWER_CTL, 0x08);         // POWER_CTL reg: measurement mode
    return 0x00;
  }
}

/*******************************************************************************
* End of File
*******************************************************************************/