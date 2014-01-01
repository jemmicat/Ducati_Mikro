/**************************************************************
 * JCDesigns Data Logger  
 * V. 0.1
 * V. 1.0
 *   +added color LCD and removed graphic LCD callouts
 * V. 1.1 
 *   +Changed to Henning's DS1307 Library
 *   +Added Henning's Analog clock and ability to set RTC
 * V. 1.2
 *   +changed to fat16 library
 * V. 1.3
 *   +added screen with Cell Phone Info
 *   +switched screens 4 and 5 so analog clock is 5
 *   +switched to Mega2560
 * V. 1.4
 *   +Henning's 2.5 graphic library changes to interface look
 * V. 1.5
 *   +Henning's 4.0 library... changed number fonts
 *   +Changed Analog Reference value ro 3.276V
 *   +Changed date and month orientation in set clock function
 *   +Changed entirely to Henning's tinyFAT to write to SD card
 * V. 1.6
 *   +Changed way Sensor data is grabbed
 *   + Got Logging working
 *   + Added Error Strings
 * V. 1.7
 *   +Added Screen for saved values
 *   +Added Saved Value Comparison
 * V. 1.8
 *   + removed cell phone aspects to match housing
 *   + updated accelerometer readings to match electrical layout
 *
 *
 *
 *
 *
 ***************************************************************/


//make sure you change the calibration values on each screen


#include "TinyGPS.h"
#include <avr/pgmspace.h>
#include <string.h>             // Needed for memset
#include <EEPROM.h>
#include <TimedAction.h>
#include <ITDB02_Graph16.h>
#include <ITDB02_tinyFAT16.h>
#include <ITDB02_Touch.h>
#include <DS1307.h>
#include <tinyFAT.h>

#define firmware_version 2.0

//Define Pins
#define X_ACCEL_APIN 0
#define Y_ACCEL_APIN 1
#define Z_ACCEL_APIN 2
#define xz_RATE_APIN 3
#define yz_RATE_APIN 4
#define gyro_temperature_pin 5
#define lm335_pin 6
#define Batt_pin 7
#define RPM_pin 8
#define TPS_pin 9
#define bck_brk_pin 10
#define frt_brk_pin 11
#define o2sense_pin 12
#define fork_lvt_pin 13
#define shock_lvt_pin 14
#define open_pin 15        // will be used for photcell

#define shift_light_high 7
#define shift_light_medhigh 8
#define shift_light_med 9
#define shift_light_low 10
#define gyro_AZ 11

//Define Conversion Settings
#define INPUT_COUNT 5     //number of analog inputs for IMU
#define SENSORS 16        //total number of sensors to be written to SD card
#define aref_voltage 3290.0  // we tie 3.3V to ARef and measure it with a multimeter!
#define zeroLevelAcc 1650.0 // the theoretical zero level of accelerometer readings from spec
#define accSensitivity 300.0 // the specified sensitivity of the accelerometer at 1.5 g mv/g
#define zeroLevelGyro 1350.0 // theoretical zero of gyro per specs
#define gyroSensitivity 546.0 //gyro sensitivity mv/deg/minute was 9100?? 9.1mv/deg/sec
#define gyroTempLevel 1250.0 // gyro temp initial voltage at room temp (22C)
#define gyroTempSens 4.0 // gyro rate of temperature change 4 mv/C
#define lm335_tempsense 10 // lm335 sensitivity mv/K
#define lm335_init 2986.0 // starting voltage for 25C / 298.15K
#define PI 3.14159265358979f
#define ToRad(x) (x*0.01745329252)  // *pi/180
#define ToDeg(x) (x*57.2957795131)  // *180/pi
#define RPM_scale_factor 1220
#define LOG_FREQUENCY  4 // Hz of sampling

int LOG_INTERVAL = 1000 / LOG_FREQUENCY;

//voltage divider circuit
int resistor1 = 10000;
int resistor2 = 2700;
float voltage_divider_factor = (resistor1 / (resistor1 + resistor2));

//EEPROM save data info
int screen_save_addr = 0;
int speed_save_addr = 2;
int rpm_save_addr = 6;
int lean_save_addr = 12;
int acceleration_save_addr = 16;

//Saving of the MAx Values:
int MaxSpeed;               //maximum Speed
float MaxLeanAng;        //max lean angle
long MaxRPM;            //maximum RPM
float MaxGForce;           //maximum g force
int MaxSpeedtemp;
float MaxLeanAngtemp;
long MaxRPMtemp;
float MaxGForcetemp;

//LCD Info
int Screen;      //initial Screen
ITDB02tf myGLCD(38,39,40,41,ASPECT_16x9);
ITDB02_Touch  myTouch(6,5,4,3,2);

//screen requirements
char speed_gps[3]; // individual digits
int n;             // exponent
int k;             // 10 to power n
int speedgps2;
int speedgps1;
int speedgps0;
int RPM;
char RPM_calc[5];
int RPMcalc4;
int RPMcalc3;
int RPMcalc2;
int RPMcalc1;
int RPMcalc0;
char lean[2];
int lean1;
int lean0;

// Declare which fonts we will be using
extern uint8_t SmallFont[];
extern uint8_t BigFont[];
extern uint8_t SevenSegNumFont[];
extern uint8_t OCR_A_Extended_M[];

//Declare Graphics we will be using
extern unsigned int brake_on[0x848];
extern unsigned int brake_off[0x870];
extern unsigned int reset_button[0x1000];
extern unsigned int speedometer_button[0x1000];
extern unsigned int tachometer_button[0x1000];
extern unsigned int settings_button[0x1000];
extern unsigned int home_button[0x900];

//Screen Variables Used In Clock
int x, y;
int screentemp;

// Init a Time-data structure
Time  t;

//clock
int clockCenterX=184;
int clockCenterY=119;
int oldsec=0;

//initiallize real time clock instance
DS1307  rtc(20, 21);

//IMU Calculation
int an[SENSORS];      //analog inputs used for sensors
char firstSample;	  //marks first sample
unsigned long interval; //interval since previous analog samples
unsigned long lastMicros; 
float RwAcc[3];         //projection of normalized gravitation force vector on x/y/z axis, as measured by accelerometer
float RwGyro[3];        //Rw obtained from last estimated value and gyro movement
float Awz[2];           //angles between projection of R on XZ/YZ plane and Z axis (deg)
float RwEst[3];     //Rw estimated from combining RwAcc and RwGyro
float wGyro;

//Analog Pin conversion factors
int gyro_temperature;
int RPM_temp;
int Batt_temp;
int TPS_temp;
int frt_brk_temp;
int bck_brk_temp;
int o2sense_temp;
int fork_lvt_temp;
int shock_lvt_temp;
int frt_brk;
int bck_brk;
int TPS_low = 0;
int TPS_high = 1023;
float TPS_percentage;
float LVT_senstitivity;
float battery_voltage;
float gyro_tempC;
float gyro_tempF;
float Ract;
float Rest;
int lean_angle;
float lean_angle_act;
float lean_angle_est;
float battery_ratio;
float afratio;
float frk_travel;
float shock_travel;
int lm335_tempF;
int lm335_temp;
int lm335_tempK;


struct {					
  char inpInvert[INPUT_COUNT];    // bits 0..5 invert input
  int zeroLevel[INPUT_COUNT];     // 0..2 accelerometer zero level (mV) @ 0 G
  // 3..5 gyro zero level (mV) @ 0 deg/s
  int inpSens[INPUT_COUNT];       // 0..2 acceleromter input sensitivity (mv/g)
  // 3..5 gyro input sensitivity (mV/deg/ms) 
  float wGyro;		          // gyro weight/smooting factor
} 
config;




//GPS setup
TinyGPS gps;
int gpsspeed;
float gpsspeed_radians;
long lat, lon;
float flat, flon;
unsigned long age, date, time, chars;
int year;
int lat_big, lat_small, long_big, long_small;
byte day, hour, minute, second, hundredths;
int x1_old;
int x2_old;
int y1_old;
int y2_old;
int x10_old;
int x20_old;
int y10_old;
int y20_old;
int x11_old;
int x21_old;
int y11_old;
int y21_old;
int gpsspeed_old;
int needle_radius = 150;
int center_radius = 30;
int speedometer_needlex1;
int speedometer_needlex2;
int speedometer_needley1;
int speedometer_needley2;
int speedometer_needlex10;
int speedometer_needlex20;
int speedometer_needley10;
int speedometer_needley20;
int speedometer_needlex11;
int speedometer_needlex21;
int speedometer_needley11;
int speedometer_needley21;

//logger
int logger = 0; //the logger is initially off
int logtemp;
const byte size = 16;
char strbuf[320];
char filename[10];




//timed action
TimedAction clockTask = TimedAction( 5000, clock );
TimedAction lm335tempTask = TimedAction (30000, lm335temp);

//tinyFAT SD Card error strings
byte res;
char *verboseError(byte err)
{
  switch (err)
  {
  case ERROR_MBR_READ_ERROR:
    return "Error reading MBR";
    break;
  case ERROR_MBR_SIGNATURE:
    return "MBR Signature error";
    break;
  case ERROR_MBR_INVALID_FS:
    return "Unsupported filesystem";
    break;
  case ERROR_BOOTSEC_READ_ERROR:
    return "Error reading Boot Sector";
    break;
  case ERROR_BOOTSEC_SIGNATURE:
    return "Boot Sector Signature error";
    break;
  default:
    return "Unknown error";
    break;
  }
}



void setup()
{
  Serial.begin(115200); // serial
  Serial1.begin(4800); // for GPS
  analogReference(EXTERNAL);
  myGLCD.InitLCD(LANDSCAPE);
  myGLCD.clrScr();
  myTouch.InitTouch(LANDSCAPE);
  myTouch.setPrecision(PREC_EXTREME);  
  rtc.halt(false);


  //Set pin states for shift lights And Gyro Auto Zero
  pinMode(gyro_AZ, OUTPUT);
  pinMode(shift_light_high, OUTPUT);
  pinMode(shift_light_medhigh, OUTPUT);
  pinMode(shift_light_med, OUTPUT);
  pinMode(shift_light_low, OUTPUT);

  // Initialize tinyFAT 
  res=file.initFAT(); 
  if (res!=NO_ERROR)
  {
    myGLCD.setFont(OCR_A_Extended_M);
    myGLCD.setColor(255, 255, 0);
    myGLCD.setBackColor(0, 0, 0);
    myGLCD.print("SD CARD ERROR!", 70, 210);
    Serial.print("***** ERROR: ");
    Serial.println(verboseError(res));
    while (true) {
    };
  }

  lcdShowIntro();
  Screen = EEPROM.read(screen_save_addr);
  //Screen = 1; // comment this line out after initial programming
  wGyro = 10;
  clockTask.enable();
  lm335tempTask.enable();

  // pulse Gyro Auto Zero
  digitalWrite(gyro_AZ, HIGH);   // set the LED on
  delay(7);
  digitalWrite(gyro_AZ, LOW);

  IMUsetup();

  //This will switch the Screen
  switch(Screen){
  case 1: 
    Screen = 1;
    HomeInit();
    HomeWork();
    EEPROM.write(screen_save_addr, Screen);
    break;
  case 2:
    Screen = 2;
    SpeedometerInit();
    SpeedometerWork();
    EEPROM.write(screen_save_addr, Screen);
    break; 
  case 3:
    Screen = 3;
    TachometerInit();
    TachometerWork();
    EEPROM.write(screen_save_addr, Screen);
    break;
  case 4:
    Screen = 4;
    Screen4Init();
    Screen4Work();
    EEPROM.write(screen_save_addr, Screen);
    break; 
  case 5:
    Screen = 5;
    Screen5Init();
    Screen5Work();
    EEPROM.write(screen_save_addr, Screen);
    break;
  case 6:
    Screen = 6;
    Screen1Init();
    Screen1Work();
    EEPROM.write(screen_save_addr, Screen);
    break;
  default:
    break;
  }
}


void loop()
{  
  //get sensor data from accelerometer and gyro 
  sensor_readings();

  //tiny gps stuff
  gpsdump(gps);

  //gpsspeed = (gps.f_speed_mph());

  //check for maximum values and write to eeprom
  max_values_check();

  //Check For Touchscreen Press

  if (myTouch.dataAvailable())
  {
    myTouch.read();
    x=myTouch.getX();
    y=myTouch.getY();

    if ((y>=60) && (y<=188) && Screen == 1)  // Home Screen BUttons
    {
      if ((x>=32) && (x<=100))  // Speddometer Press
      {
        Screen = 2;
        SpeedometerInit();
        SpeedometerWork();
        EEPROM.write(screen_save_addr, Screen);
      }
      if ((x>=154) && (x<=222))  // Tachometer Press
      {
        Screen = 3;
        TachometerInit();
        TachometerWork();
        EEPROM.write(screen_save_addr, Screen);
      }
      if ((x>=295) && (x<=363))  // Setting Press
      {
        Screen = 4;
        EEPROM.write(screen_save_addr, Screen);
      }

    }

    if ((y>=0) && (y<=64) && Screen == 2 || Screen == 3)  // Home button on screens 2 & 3
    {
      if ((x>=335) && (x<=399))  // Home Press
      {
        Screen = 1;
        HomeInit();
        HomeWork();
        EEPROM.write(screen_save_addr, Screen);
      }
    }

    if ((x>=180) && (x<=280) && Screen != 4 && Screen != 5)  // Upper row
    {
      if ((y>=1) && (y<=120) && Screen != 4 && Screen != 5)  // Button: Log
      {
        loggerbutton();
      }
    }
    if (((y>=200) && (y<=239)) && ((x>=320) && (x<=379)) && Screen == 4)
    {
      myGLCD.setColor (255, 0, 0);
      myGLCD.drawRoundRect(320, 190, 379, 229);
      setClock();
    }

    //Reset Saved High Values
    if (((y>=87) && (y<=151)) && ((x>=198) && (x<=252)) && Screen == 5)
    {
      EEPROM.write(acceleration_save_addr, 00);
      EEPROM.write(rpm_save_addr, 00000);
      EEPROM.write(lean_save_addr, 00);
      EEPROM.write(speed_save_addr, 000);
      myGLCD.setFont(OCR_A_Extended_M);
      myGLCD.setColor(255, 0, 0);
      myGLCD.setBackColor(0, 0, 0);
      myGLCD.print("Lean", 105, 10);
      myGLCD.print("Angle", 90, 40);
      myGLCD.printNumI(MaxLeanAng, 125, 80);

      myGLCD.setFont(OCR_A_Extended_M);
      myGLCD.setColor(255, 0, 0);
      myGLCD.setBackColor(0, 0, 0);
      myGLCD.print("Max", 280, 10);
      myGLCD.print("Accel", 260, 40);
      myGLCD.printNumI(MaxGForce, 300, 80);


      myGLCD.setFont(OCR_A_Extended_M);
      myGLCD.setColor(255, 0, 0);
      myGLCD.setBackColor(0, 0, 0);
      myGLCD.print("Max", 105, 130);
      myGLCD.print("Speed", 85, 160);
      myGLCD.printNumI(MaxSpeed, 125, 200);

      myGLCD.setFont(OCR_A_Extended_M);
      myGLCD.setColor(255, 0, 0);
      myGLCD.setBackColor(0, 0, 0);
      myGLCD.print("Max", 280, 130);
      myGLCD.print("RPM", 280, 160);
      myGLCD.printNumI(MaxRPM, 300, 80);
    }

  }

  if (Screen==4)
  {
    Screen4Work();
  }
  else
  {

    t = rtc.getTime();

    Ract = sqrt (RwAcc[0] * RwAcc[0] + RwAcc[1] * RwAcc[1] + RwAcc[2] * RwAcc[2]);
    Rest = sqrt (RwEst[0] * RwEst[0] + RwEst[1] * RwEst[1] + RwEst[2] * RwEst[2]);
    lean_angle = 90 - ToDeg(acos(RwAcc[1] / Ract));
    lean_angle_est = 90 - ToDeg(acos(RwEst[1] / Rest));

    if (Screen != 1)
    {
      clockTask.check();
      lm335tempTask.check();
      lean_ang();
    }
    if (age == TinyGPS::GPS_INVALID_AGE  && logger == 1){
      logger = 0;
      myGLCD.setColor(255, 0, 0);
      myGLCD.fillRoundRect(183, 0, 284, 119); //top log box
      myGLCD.setBackColor(255, 0, 0);
      myGLCD.setColor(0, 0, 0);
      myGLCD.setFont(OCR_A_Extended_M);
      myGLCD.setColor(255, 255, 0);
      myGLCD.setBackColor(0, 0, 0);
      myGLCD.print("NO GPS LOCK", 90, 210);

    }
    else if (age > 5000 && logger ==1){
      logger = 0;
      myGLCD.setColor(255, 0, 0);
      myGLCD.fillRoundRect(183, 0, 284, 119); //top log box
      myGLCD.setBackColor(255, 0, 0);
      myGLCD.setColor(0, 0, 0);
      myGLCD.setFont(OCR_A_Extended_M);
      myGLCD.setColor(255, 255, 0);
      myGLCD.setBackColor(0, 0, 0);
      myGLCD.print("NO GPS LOCK", 90, 210);
    }
    else if (logger == 1){
      loggerInit();
    }

  }

}















