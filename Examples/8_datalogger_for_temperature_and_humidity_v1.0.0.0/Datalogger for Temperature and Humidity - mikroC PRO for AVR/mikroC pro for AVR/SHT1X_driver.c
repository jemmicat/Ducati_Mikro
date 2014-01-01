/* Two-wire communication with temperature and humidity sensor SHT11.
   Measurement resolution of temperature is 14bit while for humidity it is 12bit.
   More information about the sensor can be found here:
   http://www.sensirion.com/en/pdf/product_information/Datasheet-humidity-sensor-SHT1x.pdf
   In order to have valid readings, pull-up the SDA pin.
*/

// SHT11 connections
extern sfr sbit SDA_Out_;                                                       // serial data pin
extern sfr sbit SDA_In_;                                                        // serial data pin
extern sfr sbit SCL_;                                                           // serial clock pin

extern sfr sbit SDA_Direction;                                                  // serial data direction pin
extern sfr sbit SCL_Direction;                                                  // serial clock direction pin

extern char Temperature[];                                                      // strings for storing measured data
extern char Humidity[];
extern long int Ta_res,  Rh_res;
//

// constants for calculating temperature and humidity
static const unsigned int C1 = 400;                                             // -4
static const unsigned int C2 = 405;                                             // 0.0405  (405 * 10^-4)
static const unsigned short C3 = 28;                                            // -2.8 * 10^-6  (28 * 10^-7)
static const unsigned int D1 = 4000;                                            // -40
static const unsigned short D2 = 1;                                             // 0.01

static unsigned short i, j;
static long int k, SOt, SOrh, temp ;

static void SHT_Reset() {
  SCL_ = 0;                                                                     // SCL low
  SDA_Direction = 0;                                                            // define SDA as input
  for (i = 1; i <= 18; i++)                                                     // repeat 18 times
    SCL_ = ~SCL_;                                                               // invert SCL
}

static void Transmission_Start() {
  SDA_Direction = 0;                                                            // define SDA as input
  SCL_ = 1;                                                                     // SCL high
  Delay_1us();                                                                  // 1us delay
  SDA_Direction = 1;                                                            // define SDA as output
  SDA_Out_ = 0;                                                                 // SDA low
  Delay_1us();                                                                  // 1us delay
  SCL_ = 0;                                                                     // SCL low
  Delay_1us();                                                                  // 1us delay
  SCL_ = 1;                                                                     // SCL high
  Delay_1us();                                                                  // 1us delay
  SDA_Direction = 0;                                                            // define SDA as input
  Delay_1us();                                                                  // 1us delay
  SCL_ = 0;                                                                     // SCL low
}

// MCU ACK
static void MCU_ACK() {
  SDA_Direction = 1;                                                            // define SDA as output
  SDA_Out_ = 0;                                                                 // SDA low
  SCL_ = 1;                                                                     // SCL high
  Delay_1us();                                                                  // 1us delay
  SCL_ = 0;                                                                     // SCL low
  Delay_1us();                                                                  // 1us delay
  SDA_Direction = 0;                                                            // define SDA as input
}

// this function returns temperature or humidity, depends on command
static long int Measure(short num) {

  j = num;                                                                      // j = command (0x03 or 0x05)
  SHT_Reset();                                                                  // procedure for reseting SHT11
  Transmission_Start();                                                         // procedure for starting transmission
  k = 0;                                                                        // k = 0
  SDA_Direction = 1;                                                            // define SDA as output
  SCL_ = 0;                                                                     // SCL low
  for(i = 1; i <= 8; i++) {                                                     // repeat 8 times
    if (j.B7 == 1)                                                              // if bit 7 = 1
     SDA_Direction = 0;                                                         // define SDA as input
    else {                                                                      // else (if bit 7 = 0)
     SDA_Direction = 1;                                                         // define SDA as output
     SDA_Out_ = 0;                                                              // SDA low
   }
    Delay_1us();                                                                // 1us delay
    SCL_ = 1;                                                                   // SCL high
    Delay_1us();                                                                // 1us delay
    SCL_ = 0;                                                                   // SCL low
    j <<= 1;                                                                    // move contents of j one place left
  }

  SDA_Direction = 0;                                                            // define SDA as input
  SCL_ = 1;                                                                     // SCL high
  Delay_1us();                                                                  // 1us delay
  SCL_ = 0;                                                                     // SCL low
  Delay_1us();                                                                  // 1us delay
  while (SDA_In_ == 1)                                                          // while SDA is high, do nothing
    Delay_1us();                                                                // 1us delay

  for (i = 1; i <=16; i++) {                                                    // repeat 16 times
    k <<= 1;                                                                    // move contents of k one place left
    SCL_ = 1;                                                                   // SCL high
    if (SDA_In_ == 1)                                                           // if SDA is high
    k = k | 0x0001;
    SCL_ = 0;
    if (i == 8)                                                                 // if counter i = 8 then
      MCU_ACK();                                                                // MCU acknowledge
  }
  return k;                                                                     // returns contents of k
}

// before calling this function make sure that all interrupts are disabled
void Read_SHT1X(){
  SDA_Direction = 1;
  SCL_Direction = 1;                                                            // SCL is output

  Temperature[11] = ' ';
  Temperature[12] = 'd';
  Temperature[13] = 'e';
  Temperature[14] = 'g';
  Temperature[15] = ' ';
  Temperature[16] = 'C';

  Humidity[11] = ' ';
  Humidity[12] = 'p';
  Humidity[13] = 'c';
  Humidity[14] = 't';
      
  SOt = Measure(0x03);                                                          // function for measuring (command 0x03 is for temperature)
// measuring humidity
  SOrh = Measure(0x05);                                                         // function for measuring (command 0x05 is for humidity)

// calculating temperature
// Ta_res = D1 + D2 * SOt
    if(SOt > D1)                                                                // if temperature is positive
      Ta_res = SOt * D2 - D1;                                                   // calculate temperature
    else                                                                        // else (if temperature is negative)
      Ta_res = D1 - SOt * D2;                                                   // calculate temperature

// calculating humidity
// Rh_res = C1 + C2 * SOrh + C3 * SOrh^2
    temp = SOrh * SOrh * C3 / 100000;                                           // calculate humidity
    Rh_res = SOrh * C2 / 100 - temp - C1;                                       // calculate humidity

// preparing temperature for LCD
    Temperature[5] = Ta_res / 10000 + 48;                                       // example: Temperature[5] = 12345 / 10000 = 1, 1 + 48 = '1' - ASCII
    Temperature[6] = Ta_res % 10000 / 1000 + 48;                                // example: Temperature[6] = 12345 % 10000 = 2345, Temperature[6] = 2345 / 1000 = 2, 2 + 48 = '2' - ASCII
    Temperature[7] = Ta_res % 1000 / 100 + 48;                                  // example: Temperature[7] = 12345 % 1000 = 345, Temperature[7] = 345 / 100 = 3, 3 + 48 = '3' - ASCII
    Temperature[9] = Ta_res % 100 / 10 + 48;                                    // example: Temperature[9] = 12345 % 100 = 45, Temperature[9] = 45 / 10 = 4, 4 + 48 = '4' - ASCII
    Temperature[10] = Ta_res % 10 + 48;                                         // example: Temperature[10] = 12345 % 10 = 5, 5 + 48 = '5' - ASCII

// preparing humidity for LCD
    Humidity[5] = Rh_res / 10000 + 48;                                          // example: Humidity[5] = 12345 / 10000 = 1, 1 + 48 = '1' - ASCII
    Humidity[6] = Rh_res % 10000 / 1000 + 48;                                   // example: Humidity[6] = 12345 % 10000 = 2345, Humidity[6] = 2345 / 1000 = 2, 2 + 48 = '2' - ASCII
    Humidity[7] = Rh_res % 1000 / 100 + 48;                                     // example: Humidity[7] = 12345 % 1000 = 345, Humidity[7] = 345 / 100 = 3, 3 + 48 = '3' - ASCII
    Humidity[9] = Rh_res % 100 / 10 + 48;                                       // example: Humidity[9] = 12345 % 100 = 45, Humidity[9] = 45 / 10 = 4, 4 + 48 = '4' - ASCII
    Humidity[10] = Rh_res % 10 + 48;                                            // example: Humidity[10] = 12345 % 10 = 5, 5 + 48 = '5' - ASCII

// delete unnecessary digits (zeros)
    if (Temperature[5] == '0')                                                  // if Temperature[5] = '0' then
      Temperature[5] = ' ';                                                     // insert blank character to Temperature[5]
    if (Temperature[5] == ' ' && Temperature[6] == '0')                         // if Temperature[5] is blank and Temperature[6] = '0' then
      Temperature[6] = ' ';                                                     // insert blank character to Temperature[6]

    if (Humidity[5] == '0')                                                     // if Temperature[5] = '0' then
      Humidity[5] = ' ';                                                        // insert blank character to Temperature[5]
    if (Humidity[5] == ' ' && Humidity[6] == '0')                               // if Temperature[5] is blank and Temperature[6] = '0' then
      Humidity[6] = ' ';                                                        // insert blank character to Temperature[6]
}