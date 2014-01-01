extern struct RTC_time_t t;
void MMC_Create_NewJK(char *date);
void Write_On_Screen(char *date, char* time, char *temp, char *humi);
void MMC_WriteJK(char *datetime, char *temperature, char *humidity );
void Date_and_Time();
char txt [30] = "YYYY-MM-DD HH:MM:SS   ";

unsigned int  not_leap(unsigned int year){                                      //check for leap year
  if (!(year%100))
    return (unsigned int )(year % 400);
  else
    return (unsigned int )(year % 4);
}

struct RTC_time_t{
        unsigned int  year;                                                     //
        char          month;                                                    // 1..12
        char          mday;                                                     // 1..31
        char          hour;                                                     // 0..23
        char          min;                                                      // 0..59
        char          sec;                                                      // 0..59
} ;

// this is how to initialize the time and date
void Set_Initial_Date() {
  t.year  = 2011;
  t.month =    6;
  t.mday  =   25;
  t.hour  =   11;
  t.min   =   15;
  t.sec   =    0;
}

void Date_Time()
{
   if (++t.sec == 60) {
    t.sec = 0;
    if (++t.min == 60) {
      t.min=0;
      if (++t.hour == 24) {
        t.hour=0;
        if (++t.mday == 32) {
          t.month++;
          t.mday = 1;
        } else if (t.mday == 31) {
            if ((t.month == 4) || (t.month == 6) || (t.month == 9) || (t.month == 11)) {
              t.month++;
              t.mday = 1;
            }
        } else if (t.mday == 30) {
            if(t.month == 2) {
              t.month++;
              t.mday = 1;
            }
        } else if (t.mday == 29) {
            if((t.month == 2) && (not_leap(t.year))) {
                t.month++;
                t.mday = 1;
            }
        }
        if (t.month ==13) {
            t.month = 1;
            t.year++;
        }
      }
    }
  }
}

// Creates new file on SD card with date as name
void New_Day() {
      char txt1[15];
      char tmptxt[6];
      
      wordtostr(t.year, tmptxt);
      txt1[3] = tmptxt[4];
      txt1[2] = tmptxt[3];
      txt1[1] = tmptxt[2];
      txt1[0] = tmptxt[1];

      bytetostr(t.month, tmptxt);
      txt1[5] = tmptxt[2];
      txt1[4] = tmptxt[1];

      bytetostr(t.mday, tmptxt);
      txt1[7] = tmptxt[2];
      txt1[6] = tmptxt[1];

      txt1[8] = '.';
      txt1[9] = 't';
      txt1[10] = 'x';
      txt1[11] = 't';
      txt1[12] = 0;

      MMC_Create_NewJK(txt1);
 }
 
// Creates strings from measured values and writes them on the screen and on SD card
 void New_measurement(long int temp, long int humi){
      char tmptxt2[15];
      char tmptxt3[15];
      char txt2[11];
      char tmptxt[6];
      char txt3[6];
      
      WordToStr(temp, tmptxt2);
      tmptxt2[5] = tmptxt2[4];
      tmptxt2[4] = tmptxt2[3];
      tmptxt2[3] = '.';
      tmptxt2[6] = 0;
      strcat(tmptxt2," C");
      
      WordToStr(humi, tmptxt3);
      tmptxt3[5] = tmptxt3[4];
      tmptxt3[4] = tmptxt3[3];
      tmptxt3[3] = '.';
      tmptxt3[6] = 0;
      strcat(tmptxt3,"%");
      
      wordtostr(t.year, tmptxt);
      txt2[3] = tmptxt[4];
      txt2[2] = tmptxt[3];
      txt2[1] = tmptxt[2];
      txt2[0] = tmptxt[1];
      txt2[4] = '-';

      bytetostr(t.month, tmptxt);
      txt2[6] = tmptxt[2];
      txt2[5] = tmptxt[1];
      txt2[7] = '-';

      bytetostr(t.mday, tmptxt);
      txt2[9] = tmptxt[2];
      txt2[8] = tmptxt[1];
      txt2[10] = 0;

      bytetostr(t.hour, tmptxt);
      txt3[1] = tmptxt[2];
      txt3[0] = tmptxt[1];
      txt3[2] = ':';

      bytetostr(t.min, tmptxt);
      txt3[4] = tmptxt[2];
      txt3[3] = tmptxt[1];
      txt3[5] = 0;

      Date_and_Time();

      Write_On_Screen(txt2,txt3, tmptxt2, tmptxt3);
      MMC_WriteJK(txt, tmptxt2, tmptxt3 );
 }
 
 void Date_and_Time(){
      char tmptxt[6];
      
      wordtostr(t.year, tmptxt);
      txt[3] = tmptxt[4];
      txt[2] = tmptxt[3];
      txt[1] = tmptxt[2];
      txt[0] = tmptxt[1];

      bytetostr(t.month, tmptxt);
      txt[6] = tmptxt[2];
      txt[5] = tmptxt[1];

      bytetostr(t.mday, tmptxt);
      txt[9] = tmptxt[2];
      txt[8] = tmptxt[1];

      bytetostr(t.hour, tmptxt);
      txt[12] = tmptxt[2];
      txt[11] = tmptxt[1];

      bytetostr(t.min, tmptxt);
      txt[15] = tmptxt[2];
      txt[14] = tmptxt[1];

      bytetostr(t.sec, tmptxt);
      txt[18] = tmptxt[2];
      txt[17] = tmptxt[1];
      txt[25] = 0;
 }