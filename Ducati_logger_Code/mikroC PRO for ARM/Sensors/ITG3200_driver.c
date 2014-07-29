#include "built_in.h"

// ITG3200 Register Definition
//#define WHO_AM_I                     0x00
#define SMPLRT_DIV                    0x15
#define DLPF_FS                         0x16
#define _GYRODATAX0         0x1D
#define _GYRODATAX1         0x1E
#define _GYRODATAY0         0x1F
#define _GYRODATAY1         0x20
#define _GURODATAZ0         0x21
#define _GYRODATAZ1         0x22
#define _GYRO_ERROR                    0x02
#define _GYRO_ADDRESS                  0x69          // if ALT ADDRESS = 0

char data_[10];
/*******************************************************************************
* Function ITG3200_Write()
* ------------------------------------------------------------------------------
* Overview: Function write byte of data to ITG3200
* Input: register address, data
* Output: Nothing
*******************************************************************************/
static void ITG3200_Write(unsigned short address, unsigned short data1) {
  I2C2_Start();              // issue I2C start signal
  data_[0] = address;
  data_[1] = data1;
  I2C2_Write(_GYRO_ADDRESS, data_, 2, END_MODE_STOP);
}

/*******************************************************************************
* Function ITG3200_Read()
* ------------------------------------------------------------------------------
* Overview: Function read byte of data from ITG3200
* Input: register address
* Output: data from addressed register in ITG3200
*******************************************************************************/
void ITG3200_Read(int *data_X, int *data_Y, int *data_Z){
  data_[0] = _GYRODATAX0;
  I2C2_Start();              // issue I2C start signal
  I2C2_Write(_GYRO_ADDRESS, data_, 1, END_MODE_RESTART);
  I2C2_Read(_GYRO_ADDRESS, data_, 6, END_MODE_STOP);

  *data_X = data_[0] + (data_[1] << 8);
  *data_Y = data_[2] + (data_[3] << 8);
  *data_Z = data_[4] + (data_[5] << 8);
}

/*******************************************************************************
* Function ITG3200_Read_Register()
* ------------------------------------------------------------------------------
* Overview: Function read byte of data from ADXL345
* Input: register address
* Output: data from addressed register in ADXL345
*******************************************************************************/
static unsigned short ITG3200_Read_Register(unsigned short address) {
  I2C2_Start();              // issue I2C start signal
  data_[0] = address;
  I2C2_Write(_GYRO_ADDRESS, data_, 1, END_MODE_RESTART);
  I2C2_Read(_GYRO_ADDRESS, data_, 1, END_MODE_STOP);
  return data_[0];
}

/*******************************************************************************
* Function ITG3200_Init()
* ------------------------------------------------------------------------------
* Overview: Function that initializes ADXL345
* Input: Nothing
* Output: return 0 for OK; return _ACCEL_ERROR for ERROR
*******************************************************************************/
char ITG3200_Init() {
  char id = 0x00;
  // Go into standby mode to configure the device.
  ITG3200_Write(0x2D, 0x00);
  id = ITG3200_Read_Register(0x00);
  if (id != 0xE5) {
    return _GYRO_ERROR;
  }
  else {
     //Configure the gyroscope
         
         //Set the gyroscope scale for the outputs to +/-2000 degrees per second
        ITG3200_Write(SMPLRT_DIV, 0x09);       
    
        //Set the sample rate to 100 hz
        //ITG3200_Write(DLPF_FS, (DLPF_FS_SEL_0|DLPF_FS_SEL_1|DLPF_CFG_0));
    return 0x00;
  }
}



//This is a list of registers in the ITG-3200. Registers are parameters that determine how the sensor will behave, or they can hold data that represent the
//sensors current status.
//To learn more about the registers on the ITG-3200, download and read the datasheet.
// char WHO_AM_I = 0x00;
// char SMPLRT_DIV= 0x15;
// char DLPF_FS = 0x16;
// char GYRO_XOUT_H = 0x1D;
// char GYRO_XOUT_L = 0x1E;
// char GYRO_YOUT_H = 0x1F;
// char GYRO_YOUT_L = 0x20;
// char GYRO_ZOUT_H = 0x21;
// char GYRO_ZOUT_L = 0x22;

//This is a list of settings that can be loaded into the registers.
//DLPF, Full Scale Register Bits
//FS_SEL must be set to 3 for proper operation
//Set DLPF_CFG to 3 for 1kHz Fint and 42 Hz Low Pass Filter
// char DLPF_CFG_0 = (1<<0);
// char DLPF_CFG_1 = (1<<1);
// char DLPF_CFG_2 = (1<<2);
// char DLPF_FS_SEL_0 = (1<<3);
// char DLPF_FS_SEL_1 = (1<<4);

//I2C devices each have an address. The address is defined in the datasheet for the device. The ITG-3200 breakout board can have different address depending on how
//the jumper on top of the board is configured. By default, the jumper is connected to the VDD pin. When the jumper is connected to the VDD pin the I2C address
//is 0x69.
// char itgAddress = 0x69;

//In the setup section of the sketch the serial port will be configured, the i2c communication will be initialized, and the itg-3200 will be configured.
// void setup()
// {

  
  //Configure the gyroscope
  //Set the gyroscope scale for the outputs to +/-2000 degrees per second
  // itgWrite(itgAddress, DLPF_FS, (DLPF_FS_SEL_0|DLPF_FS_SEL_1|DLPF_CFG_0));
  //Set the sample rate to 100 hz
  // itgWrite(itgAddress, SMPLRT_DIV, 9);
// }

//The loop section of the sketch will read the X,Y and Z output rates from the gyroscope and output them in the Serial Terminal
// void loop()
// {
  //Create variables to hold the output rates.
  // int xRate, yRate, zRate;

  //Read the x,y and z output rates from the gyroscope.
  // xRate = readX();
  // yRate = readY();
  // zRate = readZ();

  //Print the output rates to the terminal, seperated by a TAB character.
  // Serial.print(xDegrees);
  // Serial.print('\t');
  // Serial.print(yDegrees);
  // Serial.print('\t');
  // Serial.println(zDegrees);  

  //Wait 10ms before reading the values again. (Remember, the output rate was set to 100hz and 1reading per 10ms = 100hz.)
  // delay(10);
// }

//This function will write a value to a register on the itg-3200.
//Parameters:
// char address: The I2C address of the sensor. For the ITG-3200 breakout the address is 0x69.
 //char registerAddress: The address of the register on the sensor that should be written to.
 //char data: The value to be written to the specified register.
// void itgWrite(char address, char registerAddress, char data)
// {
  //Initiate a communication sequence with the desired i2c device
  // Wire.beginTransmission(address);
  //Tell the I2C address which register we are writing to
  // Wire.send(registerAddress);
  //Send the value to write to the specified register
  // Wire.send(data);
  //End the communication sequence
  // Wire.endTransmission();
// }

//This function will read the data from a specified register on the ITG-3200 and return the value.
//Parameters:
 //char address: The I2C address of the sensor. For the ITG-3200 breakout the address is 0x69.
 //char registerAddress: The address of the register on the sensor that should be read
//Return:
 //unsigned char: The value currently residing in the specified register
// unsigned char itgRead(char address, char registerAddress)
// {
  //This variable will hold the contents read from the i2c device.
  // unsigned char data=0;
  
  //Send the register address to be read.
  // Wire.beginTransmission(address);
  //Send the Register Address
  // Wire.send(registerAddress);
  //End the communication sequence.
  // Wire.endTransmission();
  
  //Ask the I2C device for data
  // Wire.beginTransmission(address);
  // Wire.requestFrom(address, 1);
  
  //Wait for a response from the I2C device
  // if(Wire.available()){
    //Save the data sent from the I2C device
    // data = Wire.receive();
  // }
  
  //End the communication sequence.
  // Wire.endTransmission();
  
  //Return the data read during the operation
  // return data;
// }

//This function is used to read the X-Axis rate of the gyroscope. The function returns the ADC value from the Gyroscope
//NOTE: This value is NOT in degrees per second. 
//Usage: int xRate = readX();
// int readX(void)
// {
  // int data=0;
  // data = itgRead(itgAddress, GYRO_XOUT_H)<<8;
  // data |= itgRead(itgAddress, GYRO_XOUT_L);  
  
  // return data;
// }

//This function is used to read the Y-Axis rate of the gyroscope. The function returns the ADC value from the Gyroscope
//NOTE: This value is NOT in degrees per second. 
//Usage: int yRate = readY();
// int readY(void)
// {
  // int data=0;
  // data = itgRead(itgAddress, GYRO_YOUT_H)<<8;
  // data |= itgRead(itgAddress, GYRO_YOUT_L);  
  
  // return data;
// }

//This function is used to read the Z-Axis rate of the gyroscope. The function returns the ADC value from the Gyroscope
//NOTE: This value is NOT in degrees per second. 
//Usage: int zRate = readZ();
// int readZ(void)
// {
  // int data=0;
  // data = itgRead(itgAddress, GYRO_ZOUT_H)<<8;
  // data |= itgRead(itgAddress, GYRO_ZOUT_L);  
  
  // return data;
// }

/*******************************************************************************
* End of File
*******************************************************************************/