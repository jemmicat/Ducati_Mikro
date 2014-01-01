_RTC_Init:
;RTCC_driver.c,31 :: 		void RTC_Init(){
;RTCC_driver.c,32 :: 		RCC_APB1ENR.PWREN = 1;            // Enable RTC clock
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;RTCC_driver.c,33 :: 		if (RCC_BDCR.RTCEN == 0){         // if RTC is disabled ...
MOVW	R1, #lo_addr(RCC_BDCR+0)
MOVT	R1, #hi_addr(RCC_BDCR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTC_Init0
;RTCC_driver.c,34 :: 		PWR_CR.DBP = 1;                 // Allow access to RTC
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(PWR_CR+0)
MOVT	R0, #hi_addr(PWR_CR+0)
STR	R1, [R0, #0]
;RTCC_driver.c,36 :: 		RTC_WPR = 0xCA;                 //unlock write protection
MOVS	R1, #202
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
;RTCC_driver.c,37 :: 		RTC_WPR = 0x53;                 //unlock write protection
MOVS	R1, #83
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
;RTCC_driver.c,39 :: 		RCC_BDCR = 0x00010000;          // make it possible to change clock source
MOV	R1, #65536
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
STR	R1, [R0, #0]
;RTCC_driver.c,40 :: 		RCC_BDCR = 0x00008101;          // RTCEN = 1, LSE, LSEON
MOVW	R1, #33025
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
STR	R1, [R0, #0]
;RTCC_driver.c,41 :: 		}
L_RTC_Init0:
;RTCC_driver.c,42 :: 		while(RTC_ISR.RSF != 1){}         // Wait for RTC APB registers synchronisation
L_RTC_Init1:
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTC_Init2
IT	AL
BAL	L_RTC_Init1
L_RTC_Init2:
;RTCC_driver.c,44 :: 		while(RCC_BDCR.LSERDY != 1){};    // Wait till LSE is ready
L_RTC_Init3:
MOVW	R1, #lo_addr(RCC_BDCR+0)
MOVT	R1, #hi_addr(RCC_BDCR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_RTC_Init4
IT	AL
BAL	L_RTC_Init3
L_RTC_Init4:
;RTCC_driver.c,46 :: 		RTC_WPR = 0xFF;
MOVS	R1, #255
MOVW	R0, #lo_addr(RTC_WPR+0)
MOVT	R0, #hi_addr(RTC_WPR+0)
STR	R1, [R0, #0]
;RTCC_driver.c,48 :: 		}
L_end_RTC_Init:
BX	LR
; end of _RTC_Init
_Set_RTC:
;RTCC_driver.c,57 :: 		void Set_RTC(TTime *RTCC_Time){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;RTCC_driver.c,60 :: 		PWR_CR.DBP = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(PWR_CR+0)
MOVT	R1, #hi_addr(PWR_CR+0)
STR	R2, [R1, #0]
;RTCC_driver.c,62 :: 		RTC_WPR = 0xCA;                   //unlock write protection
MOVS	R2, #202
MOVW	R1, #lo_addr(RTC_WPR+0)
MOVT	R1, #hi_addr(RTC_WPR+0)
STR	R2, [R1, #0]
;RTCC_driver.c,63 :: 		RTC_WPR = 0x53;                   //unlock write protection
MOVS	R2, #83
MOVW	R1, #lo_addr(RTC_WPR+0)
MOVT	R1, #hi_addr(RTC_WPR+0)
STR	R2, [R1, #0]
;RTCC_driver.c,64 :: 		RTC_ISR = 0x00000080;             //enter initialization mode  bit 7
MOVS	R2, #128
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
STR	R2, [R1, #0]
MOV	R4, R0
;RTCC_driver.c,65 :: 		while(RTC_ISR.INITF != 1){};      // bit 6
L_Set_RTC5:
; RTCC_Time start address is: 16 (R4)
MOVW	R2, #lo_addr(RTC_ISR+0)
MOVT	R2, #hi_addr(RTC_ISR+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_Set_RTC6
IT	AL
BAL	L_Set_RTC5
L_Set_RTC6:
;RTCC_driver.c,67 :: 		RTC_PRER = 0x7f00ff;              //  set   SynchPrediv to FF and AsynchPrediv to 7F*/
MOVW	R2, #255
MOVT	R2, #127
MOVW	R1, #lo_addr(RTC_PRER+0)
MOVT	R1, #hi_addr(RTC_PRER+0)
STR	R2, [R1, #0]
;RTCC_driver.c,69 :: 		temp = (unsigned long)Dec2Bcd(RTCC_Time->hours) << 16;
ADDS	R1, R4, #3
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R5, R0
LSLS	R5, R5, #16
; temp start address is: 20 (R5)
;RTCC_driver.c,70 :: 		temp += (unsigned long)Dec2BCD(RTCC_Time->minutes) << 8;
ADDS	R1, R4, #2
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R1, R0
LSLS	R1, R1, #8
ADDS	R5, R5, R1
;RTCC_driver.c,71 :: 		temp += (unsigned long)Dec2BCD(RTCC_Time->seconds);
ADDS	R1, R4, #1
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R1, R0
ADDS	R2, R5, R1
; temp end address is: 20 (R5)
;RTCC_driver.c,72 :: 		temp += (unsigned long)(RTCC_Time->ampm) << 22;
LDRSB	R1, [R4, #0]
LSLS	R1, R1, #22
ADDS	R2, R2, R1
;RTCC_driver.c,74 :: 		RTC_TR = temp;
MOVW	R1, #lo_addr(RTC_TR+0)
MOVT	R1, #hi_addr(RTC_TR+0)
STR	R2, [R1, #0]
;RTCC_driver.c,76 :: 		temp = (unsigned long)Dec2Bcd(RTCC_Time->day) << 16;
ADDS	R1, R4, #4
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R5, R0
LSLS	R5, R5, #16
; temp start address is: 20 (R5)
;RTCC_driver.c,77 :: 		temp += (unsigned long)Dec2BCD(RTCC_Time->month) << 8;
ADDS	R1, R4, #5
LDRSB	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R1, R0
LSLS	R1, R1, #8
ADDS	R5, R5, R1
;RTCC_driver.c,78 :: 		temp += (unsigned long)Dec2BCD(RTCC_Time->year);
ADDS	R1, R4, #6
; RTCC_Time end address is: 16 (R4)
LDRSH	R1, [R1, #0]
UXTB	R1, R1
UXTB	R0, R1
BL	_Dec2Bcd+0
UXTB	R1, R0
ADDS	R2, R5, R1
; temp end address is: 20 (R5)
;RTCC_driver.c,80 :: 		RTC_DR = temp;           // set date
MOVW	R1, #lo_addr(RTC_DR+0)
MOVT	R1, #hi_addr(RTC_DR+0)
STR	R2, [R1, #0]
;RTCC_driver.c,81 :: 		RTC_CRbits.FMT = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(RTC_CRbits+0)
MOVT	R1, #hi_addr(RTC_CRbits+0)
STR	R2, [R1, #0]
;RTCC_driver.c,82 :: 		RTC_CRbits.WCKSEL = 0;   // set FMT 12H format
MOVS	R3, #0
MOVW	R2, #lo_addr(RTC_CRbits+0)
MOVT	R2, #hi_addr(RTC_CRbits+0)
LDRB	R1, [R2, #0]
BFI	R1, R3, #0, #3
STRB	R1, [R2, #0]
;RTCC_driver.c,84 :: 		RTC_ISR = 0x00000000;    //exit initialization mode
MOVS	R2, #0
MOVW	R1, #lo_addr(RTC_ISR+0)
MOVT	R1, #hi_addr(RTC_ISR+0)
STR	R2, [R1, #0]
;RTCC_driver.c,86 :: 		RTC_WPR = 0xFF;          // Enable the write protection for RTC registers
MOVS	R2, #255
MOVW	R1, #lo_addr(RTC_WPR+0)
MOVT	R1, #hi_addr(RTC_WPR+0)
STR	R2, [R1, #0]
;RTCC_driver.c,87 :: 		}
L_end_Set_RTC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_RTC
_RTCC_Read:
;RTCC_driver.c,96 :: 		char RTCC_Read(TTime *RTCC_Time){
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R4, R0
; RTCC_Time start address is: 16 (R4)
;RTCC_driver.c,97 :: 		char temp = 0;
MOVS	R0, #0
;RTCC_driver.c,99 :: 		RTC_Time = RTC_TR;
MOVW	R1, #lo_addr(RTC_TR+0)
MOVT	R1, #hi_addr(RTC_TR+0)
LDR	R1, [R1, #0]
MOVW	R3, #lo_addr(_RTC_Time+0)
MOVT	R3, #hi_addr(_RTC_Time+0)
STR	R1, [R3, #0]
;RTCC_driver.c,100 :: 		RTC_Date = RTC_DR;
MOVW	R1, #lo_addr(RTC_DR+0)
MOVT	R1, #hi_addr(RTC_DR+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_RTC_Date+0)
MOVT	R1, #hi_addr(_RTC_Date+0)
STR	R2, [R1, #0]
;RTCC_driver.c,102 :: 		if(RTC_Time != old_RTC_Time){
MOVW	R1, #lo_addr(_old_RTC_Time+0)
MOVT	R1, #hi_addr(_old_RTC_Time+0)
LDR	R2, [R1, #0]
MOV	R1, R3
LDR	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L__RTCC_Read9
;RTCC_driver.c,103 :: 		old_RTC_Time = RTC_Time;
MOVW	R3, #lo_addr(_RTC_Time+0)
MOVT	R3, #hi_addr(_RTC_Time+0)
STR	R3, [SP, #8]
LDR	R2, [R3, #0]
MOVW	R1, #lo_addr(_old_RTC_Time+0)
MOVT	R1, #hi_addr(_old_RTC_Time+0)
STR	R2, [R1, #0]
;RTCC_driver.c,105 :: 		RTCC_Time->ampm = (short)((RTC_Time & 0x400000) >> 22);
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #4194304
LSRS	R1, R1, #22
SXTB	R1, R1
STRB	R1, [R4, #0]
;RTCC_driver.c,106 :: 		RTCC_Time->hours = Bcd2Dec((short)((RTC_Time & 0x3f0000) >> 16));
ADDS	R1, R4, #3
STR	R1, [SP, #4]
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #4128768
LSRS	R1, R1, #16
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;RTCC_driver.c,107 :: 		RTCC_Time->minutes = Bcd2Dec((short)((RTC_Time & 0x007f00) >> 8));
ADDS	R2, R4, #2
LDR	R1, [SP, #8]
STR	R2, [SP, #4]
LDR	R1, [R1, #0]
AND	R1, R1, #32512
LSRS	R1, R1, #8
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;RTCC_driver.c,108 :: 		RTCC_Time->seconds = Bcd2Dec((short)(RTC_Time & 0x0000ff));
ADDS	R2, R4, #1
LDR	R1, [SP, #8]
STR	R2, [SP, #4]
LDR	R1, [R1, #0]
AND	R1, R1, #255
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;RTCC_driver.c,110 :: 		temp = 1;
MOVS	R0, #1
;RTCC_driver.c,111 :: 		}
IT	AL
BAL	L_RTCC_Read7
L__RTCC_Read9:
;RTCC_driver.c,102 :: 		if(RTC_Time != old_RTC_Time){
;RTCC_driver.c,111 :: 		}
L_RTCC_Read7:
;RTCC_driver.c,113 :: 		if(RTC_Date != old_RTC_Date){
MOVW	R1, #lo_addr(_old_RTC_Date+0)
MOVT	R1, #hi_addr(_old_RTC_Date+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_RTC_Date+0)
MOVT	R1, #hi_addr(_RTC_Date+0)
LDR	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L__RTCC_Read10
;RTCC_driver.c,114 :: 		old_RTC_Date = RTC_Date;
MOVW	R3, #lo_addr(_RTC_Date+0)
MOVT	R3, #hi_addr(_RTC_Date+0)
STR	R3, [SP, #8]
LDR	R2, [R3, #0]
MOVW	R1, #lo_addr(_old_RTC_Date+0)
MOVT	R1, #hi_addr(_old_RTC_Date+0)
STR	R2, [R1, #0]
;RTCC_driver.c,116 :: 		RTCC_Time->year = Bcd2Dec((short)((RTC_Date & 0x3f0000) >> 16));
ADDS	R1, R4, #6
STR	R1, [SP, #4]
MOV	R1, R3
LDR	R1, [R1, #0]
AND	R1, R1, #4128768
LSRS	R1, R1, #16
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;RTCC_driver.c,117 :: 		RTCC_Time->month = Bcd2Dec((short)((RTC_Date & 0x001f00) >> 8));
ADDS	R2, R4, #5
LDR	R1, [SP, #8]
STR	R2, [SP, #4]
LDR	R1, [R1, #0]
AND	R1, R1, #7936
LSRS	R1, R1, #8
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;RTCC_driver.c,118 :: 		RTCC_Time->day = Bcd2Dec((short)(RTC_Date & 0x0000ff));
ADDS	R2, R4, #4
; RTCC_Time end address is: 16 (R4)
LDR	R1, [SP, #8]
STR	R2, [SP, #4]
LDR	R1, [R1, #0]
AND	R1, R1, #255
UXTB	R0, R1
BL	_Bcd2Dec+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;RTCC_driver.c,120 :: 		temp = 1;
MOVS	R0, #1
;RTCC_driver.c,121 :: 		}
IT	AL
BAL	L_RTCC_Read8
L__RTCC_Read10:
;RTCC_driver.c,113 :: 		if(RTC_Date != old_RTC_Date){
;RTCC_driver.c,121 :: 		}
L_RTCC_Read8:
;RTCC_driver.c,122 :: 		return temp;
;RTCC_driver.c,123 :: 		}
L_end_RTCC_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _RTCC_Read
