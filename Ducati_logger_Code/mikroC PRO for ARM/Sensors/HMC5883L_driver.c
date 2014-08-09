#include "built_in.h"

//  HMC5883L Register Definition
#define _Conf_RegA      0x00
#define _Conf_RegB      0x01
#define _Mode_Reg       0x02
#define _MAGNETDATAX0   0x03
#define _MAGNETDATAX1   0x04
#define _MAGNETDATAY0   0x05
#define _MAGNETDATAY1   0x06
#define _MAGNETDATAZ0   0x07
#define _MAGNETDATAZ1   0x08
#define _MAGNET_STATUS  0x0A

//#define _HMC5883L_ERROR    0x02

#define _MAGNET_ADDRESS  0x53

char Magnetdata_[10];
/*******************************************************************************
* Function HMC5883L_Write()
* ------------------------------------------------------------------------------
* Overview: Function write byte of data to HMC5883L
* Input: register address, data
* Output: Nothing
*******************************************************************************/
static void MAGNET_Write(unsigned short address, unsigned short data1) {
  I2C2_Start();              // issue I2C start signal
  Magnetdata_[0] = address;
  Magnetdata_[1] = data1;
  I2C2_Write(_MAGNET_ADDRESS, Magnetdata_, 2, END_MODE_STOP);
}

/*******************************************************************************
* Function HMC5883L_Read()
* ------------------------------------------------------------------------------
* Overview: Function read byte of data from HMC5883L
* Input: register address
* Output: data from addressed register in HMC5883L
*******************************************************************************/
void MAGNET_Read(int *data_X, int *data_Y, int *data_Z){
  Magnetdata_[0] = _MAGNETDATAX0;
  I2C2_Start();              // issue I2C start signal
  I2C2_Write(_MAGNET_ADDRESS, Magnetdata_, 1, END_MODE_RESTART);
  I2C2_Read(_MAGNET_ADDRESS, Magnetdata_, 6, END_MODE_STOP);

  *data_X = Magnetdata_[0] + (Magnetdata_[1] << 8);
  *data_Y = Magnetdata_[2] + (Magnetdata_[3] << 8);
  *data_Z = Magnetdata_[4] + (Magnetdata_[5] << 8);
}

/*******************************************************************************
* Function HMC5883L_Read_Register()
* ------------------------------------------------------------------------------
* Overview: Function read byte of data from HMC5883L
* Input: register address
* Output: data from addressed register in HMC5883L
*******************************************************************************/
static unsigned short MAGNET_Read_Register(unsigned short address) {
  I2C2_Start();              // issue I2C start signal
  Magnetdata_[0] = address;
  I2C2_Write(_MAGNET_ADDRESS, Magnetdata_, 1, END_MODE_RESTART);
  I2C2_Read(_MAGNET_ADDRESS, Magnetdata_, 1, END_MODE_STOP);
  return Magnetdata_[0];
}

/*******************************************************************************
* Function HMC5883L_Init()
* ------------------------------------------------------------------------------
* Overview: Function that initializes HMC5883L
* Input: Nothing
* Output: return 0 for OK; return _HMC5883L_ERROR for ERROR
*******************************************************************************/
char MAGNET_Init() {
  char id = 0x00;
  // Go into standby mode to configure the device.
  MAGNET_Write(0x2D, 0x00);
  id = MAGNET_Read_Register(0x00);
  if (id != 0xE5) {
    //return _HMC5883L_ERROR;
  }
  else {
    //HMC5883L_Write(_DATA_FORMAT, 0x08);       // Full resolution, +/-2g, 4mg/LSB, right justified
    //HMC5883L_Write(_BW_RATE, 0x0A);           // Set 100 Hz data rate
    //HMC5883L_Write(_FIFO_CTL, 0x80);          // stream mode
    //HMC5883L_Write(_POWER_CTL, 0x08);         // POWER_CTL reg: measurement mode
    return 0x00;
  }
}

/*
An Arduino code example for interfacing with the HMC5883

by: Jordan McConnell
 SparkFun Electronics
 created on: 6/30/11
 license: OSHW 1.0, http://freedomdefined.org/OSHW

Analog input 4 I2C SDA
Analog input 5 I2C SCL
*/

/*#include <Wire.h> //I2C Arduino Library

#define address 0x1E //0011110b, I2C 7bit address of HMC5883

void setup(){
  //Initialize Serial and I2C communications
  Serial.begin(9600);
  Wire.begin();

  //Put the HMC5883 IC into the correct operating mode
  Wire.beginTransmission(address); //open communication with HMC5883
  Wire.send(0x02); //select mode register
  Wire.send(0x00); //continuous measurement mode
  Wire.endTransmission();
}*/

/*void loop(){

  int x,y,z; //triple axis data

  //Tell the HMC5883 where to begin reading data
  Wire.beginTransmission(address);
  Wire.send(0x03); //select register 3, X MSB register
  Wire.endTransmission();*/

 //Read data from each axis, 2 registers per axis
/*Wire.requestFrom(address, 6);
  if(6<=Wire.available()){
    x = Wire.receive()<<8; //X msb
    x |= Wire.receive(); //X lsb
    z = Wire.receive()<<8; //Z msb
    z |= Wire.receive(); //Z lsb
    y = Wire.receive()<<8; //Y msb
    y |= Wire.receive(); //Y lsb
  }

  //Print out values of each axis
  Serial.print("x: ");
  Serial.print(x);
  Serial.print("  y: ");
  Serial.print(y);
  Serial.print("  z: ");
  Serial.println(z);

  delay(250);
}*/


/*******************************************************************************
* End of File
*******************************************************************************/