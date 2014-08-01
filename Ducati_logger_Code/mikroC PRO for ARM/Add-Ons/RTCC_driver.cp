#line 1 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_driver.c"
#line 8 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_driver.c"
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


unsigned long RTC_Time, old_RTC_Time;
unsigned long RTC_Date, old_RTC_Date;
#line 31 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_driver.c"
void RTC_Init(){
 RCC_APB1ENR.PWREN = 1;
 if (RCC_BDCR.RTCEN == 0){
 PWR_CR.DBP = 1;

 RTC_WPR = 0xCA;
 RTC_WPR = 0x53;

 RCC_BDCR = 0x00010000;
 RCC_BDCR = 0x00008101;
 }
 while(RTC_ISR.RSF != 1){}

 while(RCC_BDCR.LSERDY != 1){};

 RTC_WPR = 0xFF;

}
#line 57 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_driver.c"
void Set_RTC(TTime *RTCC_Time){
unsigned long temp;

 PWR_CR.DBP = 1;

 RTC_WPR = 0xCA;
 RTC_WPR = 0x53;
 RTC_ISR = 0x00000080;
 while(RTC_ISR.INITF != 1){};

 RTC_PRER = 0x7f00ff;

 temp = (unsigned long)Dec2Bcd(RTCC_Time->hours) << 16;
 temp += (unsigned long)Dec2BCD(RTCC_Time->minutes) << 8;
 temp += (unsigned long)Dec2BCD(RTCC_Time->seconds);
 temp += (unsigned long)(RTCC_Time->ampm) << 22;

 RTC_TR = temp;

 temp = (unsigned long)Dec2Bcd(RTCC_Time->day) << 16;
 temp += (unsigned long)Dec2BCD(RTCC_Time->month) << 8;
 temp += (unsigned long)Dec2BCD(RTCC_Time->year);

 RTC_DR = temp;
 RTC_CRbits.FMT = 1;
 RTC_CRbits.WCKSEL = 0;

 RTC_ISR = 0x00000000;

 RTC_WPR = 0xFF;
}
#line 96 "C:/Users/Jemmi/Desktop/Ducati_Mikro/Ducati_logger_Code/mikroC PRO for ARM/Add-Ons/RTCC_driver.c"
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
