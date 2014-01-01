/*******************************************************************************
* RTC Driver - Function Set used for RTC module
* ------------------------------------------------------------------------------
*
*******************************************************************************/

// Time struct with am/pm
typedef struct Time {
  short ampm;
  short seconds;
  short minutes;
  short hours;
  short day;
  short month;
  int year;
} TTime;

TTime MyTime;

// variables
unsigned long RTC_Time, old_RTC_Time;
unsigned long RTC_Date, old_RTC_Date;

/*******************************************************************************
* Function RTC_Init()
* ------------------------------------------------------------------------------
* Overview: Function initializes RTC module
* Input: Nothing
* Output: Nothing
*******************************************************************************/
void RTC_Init(){
  RCC_APB1ENR.PWREN = 1;            // Enable RTC clock
  if (RCC_BDCR.RTCEN == 0){         // if RTC is disabled ...
    PWR_CR.DBP = 1;                 // Allow access to RTC

    RTC_WPR = 0xCA;                 //unlock write protection
    RTC_WPR = 0x53;                 //unlock write protection

    RCC_BDCR = 0x00010000;          // make it possible to change clock source
    RCC_BDCR = 0x00008101;          // RTCEN = 1, LSE, LSEON
  }
  while(RTC_ISR.RSF != 1){}         // Wait for RTC APB registers synchronisation

  while(RCC_BDCR.LSERDY != 1){};    // Wait till LSE is ready

  RTC_WPR = 0xFF;

}

/*******************************************************************************
* Function Set_RTC(TTime *RTCC_Time)
* ------------------------------------------------------------------------------
* Overview: Function Sets RTC Time and calendar
* Input: Time struct
* Output: Nothing
*******************************************************************************/
void Set_RTC(TTime *RTCC_Time){
unsigned long temp;

  PWR_CR.DBP = 1;

  RTC_WPR = 0xCA;                   //unlock write protection
  RTC_WPR = 0x53;                   //unlock write protection
  RTC_ISR = 0x00000080;             //enter initialization mode  bit 7
  while(RTC_ISR.INITF != 1){};      // bit 6

  RTC_PRER = 0x7f00ff;              //  set   SynchPrediv to FF and AsynchPrediv to 7F*/

  temp = (unsigned long)Dec2Bcd(RTCC_Time->hours) << 16;
  temp += (unsigned long)Dec2BCD(RTCC_Time->minutes) << 8;
  temp += (unsigned long)Dec2BCD(RTCC_Time->seconds);
  temp += (unsigned long)(RTCC_Time->ampm) << 22;

  RTC_TR = temp;

  temp = (unsigned long)Dec2Bcd(RTCC_Time->day) << 16;
  temp += (unsigned long)Dec2BCD(RTCC_Time->month) << 8;
  temp += (unsigned long)Dec2BCD(RTCC_Time->year);
  
  RTC_DR = temp;           // set date
  RTC_CRbits.FMT = 1;
  RTC_CRbits.WCKSEL = 0;   // set FMT 12H format

  RTC_ISR = 0x00000000;    //exit initialization mode

  RTC_WPR = 0xFF;          // Enable the write protection for RTC registers
}

/*******************************************************************************
* Function RTCC_Read(TTime *RTCC_Time)
* ------------------------------------------------------------------------------
* Overview: Function reads RTC Time and calendar
* Input: Time struct
* Output: Nothing
*******************************************************************************/
char RTCC_Read(TTime *RTCC_Time){
  char temp = 0;

  RTC_Time = RTC_TR;
  RTC_Date = RTC_DR;

  if(RTC_Time != old_RTC_Time){
    old_RTC_Time = RTC_Time;

    RTCC_Time->ampm = (short)((RTC_Time & 0x400000) >> 22);
    RTCC_Time->hours = Bcd2Dec((short)((RTC_Time & 0x3f0000) >> 16));
    RTCC_Time->minutes = Bcd2Dec((short)((RTC_Time & 0x007f00) >> 8));
    RTCC_Time->seconds = Bcd2Dec((short)(RTC_Time & 0x0000ff));

    temp = 1;
  }

  if(RTC_Date != old_RTC_Date){
    old_RTC_Date = RTC_Date;

    RTCC_Time->year = Bcd2Dec((short)((RTC_Date & 0x3f0000) >> 16));
    RTCC_Time->month = Bcd2Dec((short)((RTC_Date & 0x001f00) >> 8));
    RTCC_Time->day = Bcd2Dec((short)(RTC_Date & 0x0000ff));

    temp = 1;
  }
  return temp;
}