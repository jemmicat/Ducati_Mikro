/*
 * Library
     Internal RTCC module driver for atXmega128A1
 * Copyright
     (c) mikroElektronika, 2011.
 * Revision History
     201100628 (JK):
       - initial release
*/

/**************************************************************************/
void RTC16_Set_Internal_Clock (unsigned int mseconds);
void RTC16_Set_External_Clock (unsigned int mseconds);

void RTC16_Init(unsigned int period, char IntExt, int UseInterupt){
     if ( UseInterupt == 1 )
          RTC_INTCTRL |= 2;                                                     // Enables Overflow interupt and sets Interupt level
     
     if ( IntExt == 1 )
          RTC16_Set_External_Clock(period);                                     // Init External RTC clock source
         
     if ( IntExt == 0 )
         {
          RTC16_Set_Internal_Clock(period);                                     // Init Internal RTC clock source
         }
}

void RTC16_Set_Internal_Clock (unsigned int mseconds) {

     while (RTC_STATUS & SYNCBUSY_bit);                                         // Set PERIOD, COUNT and COMPARE registers
     RTC_PER = ((float)1024)/1000 * mseconds - 1;
     RTC_CNT = 0;
     RTC_COMP = 0;
     
     Delay_ms(100);

// Set  RTCSRC[2..0]  to select RTC clock source
//         000   ...   1KHz from internal ULP
//         001   ...   1KHz from external Cristal osc
//         010   ...   1KHz from internal RC ocs
//         101   ...   32KHz from external Cristal osc

     RTCSRC0_bit = 0;                                                           // Set RTC source
     RTCSRC1_bit = 1;
     RTCSRC2_bit = 0;

     RC32KEN_bit = 1;                                                           // Enables internal RC osc
     Delay_ms(100);

     RTC_CTRL = 1;                                                              // Set prescaler
}

void RTC16_Set_External_Clock (unsigned int mseconds) {

     while (RTC_STATUS & SYNCBUSY_bit);
     
     RTC_PER = (float)mseconds/125*2048 - 1;
     RTC_CNT = 0;
     RTC_COMP = 0;

     Delay_ms(100);

     RTCSRC0_bit = 1;
     RTCSRC1_bit = 0;
     RTCSRC2_bit = 1;

     RTC_CTRL = 2;                                                              // Set prescaler
}

void RTC16_Start() {                                                            // Start RTC
     while ( RTC_STATUS & SYNCBUSY_bit );
     RTCEN_bit = 1;                                                             // Enable RTC
}

void RTC16_Stop() {                                                             // Stop RTC
     while ( RTC_STATUS & SYNCBUSY_bit );
     RTCEN_bit = 0;
}

unsigned int RTC16_Get_Time() {
     while (RTC_STATUS & SYNCBUSY_bit);
     return RTC_CNT;
}