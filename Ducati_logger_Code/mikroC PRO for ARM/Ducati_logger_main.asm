_InitTimer2:
;Ducati_logger_main.c,48 :: 		void InitTimer2(){
;Ducati_logger_main.c,49 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,50 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,51 :: 		TIM2_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,52 :: 		TIM2_ARR = 6000;
MOVW	R1, #6000
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,53 :: 		}
L_end_InitTimer2:
BX	LR
; end of _InitTimer2
_Timer2_interrupt:
;Ducati_logger_main.c,55 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
;Ducati_logger_main.c,56 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,57 :: 		tmrTicks++;
MOVW	R1, #lo_addr(_tmrTicks+0)
MOVT	R1, #hi_addr(_tmrTicks+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Ducati_logger_main.c,58 :: 		}
L_end_Timer2_interrupt:
BX	LR
; end of _Timer2_interrupt
_Timer2_On:
;Ducati_logger_main.c,60 :: 		void Timer2_On(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_main.c,61 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Ducati_logger_main.c,62 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,63 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,64 :: 		}
L_end_Timer2_On:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_On
_Timer2_Off:
;Ducati_logger_main.c,66 :: 		void Timer2_Off() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_main.c,67 :: 		NVIC_IntDisable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntDisable+0
;Ducati_logger_main.c,68 :: 		TIM2_DIER.UIE = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,69 :: 		TIM2_CR1.CEN = 0;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,70 :: 		}
L_end_Timer2_Off:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_Off
_updateLabel:
;Ducati_logger_main.c,72 :: 		void updateLabel(tlabel *lbl, char *str){
; lbl start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R1, [SP, #8]
; lbl end address is: 0 (R0)
; lbl start address is: 0 (R0)
;Ducati_logger_main.c,73 :: 		TFT_Set_Font(lbl->Fontname, Box1.Color, FO_HORIZONTAL);
MOVW	R2, #lo_addr(_Box1+0)
MOVT	R2, #hi_addr(_Box1+0)
ADDS	R2, #28
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADDW	R2, R0, #20
LDR	R2, [R2, #0]
STR	R0, [SP, #4]
UXTH	R1, R3
MOV	R0, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
;Ducati_logger_main.c,74 :: 		TFT_Write_Text(lbl->Caption, lbl->Left, lbl->Top);
ADDW	R2, R0, #8
LDRH	R2, [R2, #0]
UXTH	R4, R2
ADDS	R2, R0, #6
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADDW	R2, R0, #16
LDR	R2, [R2, #0]
STR	R0, [SP, #4]
UXTH	R1, R3
MOV	R0, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
LDR	R0, [SP, #4]
;Ducati_logger_main.c,75 :: 		strcpy(lbl->Caption, str);
ADDW	R2, R0, #16
LDR	R2, [R2, #0]
STR	R0, [SP, #4]
LDR	R1, [SP, #8]
MOV	R0, R2
BL	_strcpy+0
LDR	R0, [SP, #4]
;Ducati_logger_main.c,76 :: 		TFT_Set_Font(lbl->Fontname, lbl->Font_Color, FO_HORIZONTAL);
ADDW	R2, R0, #24
LDRH	R2, [R2, #0]
UXTH	R3, R2
ADDW	R2, R0, #20
LDR	R2, [R2, #0]
STR	R0, [SP, #4]
UXTH	R1, R3
MOV	R0, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
;Ducati_logger_main.c,77 :: 		DrawLabel(lbl);
; lbl end address is: 0 (R0)
BL	_DrawLabel+0
;Ducati_logger_main.c,78 :: 		}
L_end_updateLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _updateLabel
_doIMU:
;Ducati_logger_main.c,80 :: 		void doIMU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ducati_logger_main.c,82 :: 		IntToStr((int)(MPU9150A.out_accel.x * 90.0f),txt);
MOVW	R0, #lo_addr(_MPU9150A+56)
MOVT	R0, #hi_addr(_MPU9150A+56)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17076
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
BL	_IntToStr+0
;Ducati_logger_main.c,83 :: 		updateLabel(&accelX, ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
MOV	R1, R0
MOVW	R0, #lo_addr(_accelX+0)
MOVT	R0, #hi_addr(_accelX+0)
BL	_updateLabel+0
;Ducati_logger_main.c,84 :: 		IntToStr((int)(MPU9150A.out_accel.y * 90.0f),txt);
MOVW	R0, #lo_addr(_MPU9150A+60)
MOVT	R0, #hi_addr(_MPU9150A+60)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17076
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
BL	_IntToStr+0
;Ducati_logger_main.c,85 :: 		updateLabel(&accelY, ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
MOV	R1, R0
MOVW	R0, #lo_addr(_accelY+0)
MOVT	R0, #hi_addr(_accelY+0)
BL	_updateLabel+0
;Ducati_logger_main.c,86 :: 		IntToStr((int)(MPU9150A.out_accel.z * 90.0f),txt);
MOVW	R0, #lo_addr(_MPU9150A+64)
MOVT	R0, #hi_addr(_MPU9150A+64)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17076
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
BL	_IntToStr+0
;Ducati_logger_main.c,87 :: 		updateLabel(&accelZ, ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
MOV	R1, R0
MOVW	R0, #lo_addr(_accelZ+0)
MOVT	R0, #hi_addr(_accelZ+0)
BL	_updateLabel+0
;Ducati_logger_main.c,89 :: 		IntToStr((int)(MPU9150A.out_gyro.x * 1000.0f / MPU9150A.gdt),txt);
MOVW	R0, #lo_addr(_MPU9150A+68)
MOVT	R0, #hi_addr(_MPU9150A+68)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17530
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(_MPU9150A+116)
MOVT	R0, #hi_addr(_MPU9150A+116)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
BL	_IntToStr+0
;Ducati_logger_main.c,90 :: 		updateLabel(&gyroX, ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
MOV	R1, R0
MOVW	R0, #lo_addr(_gyroX+0)
MOVT	R0, #hi_addr(_gyroX+0)
BL	_updateLabel+0
;Ducati_logger_main.c,91 :: 		IntToStr((int)(MPU9150A.out_gyro.y * 1000.0f / MPU9150A.gdt),txt);
MOVW	R0, #lo_addr(_MPU9150A+72)
MOVT	R0, #hi_addr(_MPU9150A+72)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17530
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(_MPU9150A+116)
MOVT	R0, #hi_addr(_MPU9150A+116)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
BL	_IntToStr+0
;Ducati_logger_main.c,92 :: 		updateLabel(&gyroY, ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
MOV	R1, R0
MOVW	R0, #lo_addr(_gyroY+0)
MOVT	R0, #hi_addr(_gyroY+0)
BL	_updateLabel+0
;Ducati_logger_main.c,93 :: 		IntToStr((int)(MPU9150A.out_gyro.z * 1000.0f / MPU9150A.gdt),txt);
MOVW	R0, #lo_addr(_MPU9150A+76)
MOVT	R0, #hi_addr(_MPU9150A+76)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17530
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(_MPU9150A+116)
MOVT	R0, #hi_addr(_MPU9150A+116)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
BL	_IntToStr+0
;Ducati_logger_main.c,94 :: 		updateLabel(&gyroZ, ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
MOV	R1, R0
MOVW	R0, #lo_addr(_gyroZ+0)
MOVT	R0, #hi_addr(_gyroZ+0)
BL	_updateLabel+0
;Ducati_logger_main.c,96 :: 		WordToStr((int)(MPU9150A.mag.x),txt);
MOVW	R0, #lo_addr(_MPU9150A+12)
MOVT	R0, #hi_addr(_MPU9150A+12)
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
LDRSH	R0, [R0, #0]
BL	_WordToStr+0
;Ducati_logger_main.c,97 :: 		updateLabel(&magX, ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
MOV	R1, R0
MOVW	R0, #lo_addr(_magX+0)
MOVT	R0, #hi_addr(_magX+0)
BL	_updateLabel+0
;Ducati_logger_main.c,98 :: 		IntToStr((int)(MPU9150A.mag.y),txt);
MOVW	R0, #lo_addr(_MPU9150A+14)
MOVT	R0, #hi_addr(_MPU9150A+14)
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Ducati_logger_main.c,99 :: 		updateLabel(&magY, ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
MOV	R1, R0
MOVW	R0, #lo_addr(_magY+0)
MOVT	R0, #hi_addr(_magY+0)
BL	_updateLabel+0
;Ducati_logger_main.c,100 :: 		IntToStr((int)(MPU9150A.mag.z),txt);
MOVW	R0, #lo_addr(_MPU9150A+16)
MOVT	R0, #hi_addr(_MPU9150A+16)
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
LDRSH	R0, [R0, #0]
BL	_IntToStr+0
;Ducati_logger_main.c,101 :: 		updateLabel(&magZ, ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
MOV	R1, R0
MOVW	R0, #lo_addr(_magZ+0)
MOVT	R0, #hi_addr(_magZ+0)
BL	_updateLabel+0
;Ducati_logger_main.c,103 :: 		sprintf(txt, "%.2f", MPU9150A.temp);
MOVW	R0, #lo_addr(_MPU9150A+112)
MOVT	R0, #hi_addr(_MPU9150A+112)
VLDR	#1, S0, [R0, #0]
MOVW	R1, #lo_addr(?lstr_1_Ducati_logger_main+0)
MOVT	R1, #hi_addr(?lstr_1_Ducati_logger_main+0)
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
VPUSH	#0, (S0)
PUSH	(R1)
PUSH	(R0)
BL	_sprintf+0
ADD	SP, SP, #12
;Ducati_logger_main.c,104 :: 		strcat (txt, " °C");
MOVW	R0, #lo_addr(?lstr2_Ducati_logger_main+0)
MOVT	R0, #hi_addr(?lstr2_Ducati_logger_main+0)
MOV	R1, R0
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_strcat+0
;Ducati_logger_main.c,105 :: 		updateLabel(&lblTemp, ltrim(txt));
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Ltrim+0
MOV	R1, R0
MOVW	R0, #lo_addr(_lblTemp+0)
MOVT	R0, #hi_addr(_lblTemp+0)
BL	_updateLabel+0
;Ducati_logger_main.c,106 :: 		}
L_end_doIMU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _doIMU
_main:
;Ducati_logger_main.c,115 :: 		void main() {
;Ducati_logger_main.c,117 :: 		Start_TP();
BL	_Start_TP+0
;Ducati_logger_main.c,119 :: 		Init_GPIO();
BL	_Init_GPIO+0
;Ducati_logger_main.c,120 :: 		Init_SDIO();
BL	_Init_SDIO+0
;Ducati_logger_main.c,121 :: 		Init_Ext_Mem();
BL	_Init_Ext_Mem+0
;Ducati_logger_main.c,122 :: 		Init_FAT();
BL	_Init_FAT+0
;Ducati_logger_main.c,123 :: 		RTC_Init();
BL	_RTC_Init+0
;Ducati_logger_main.c,125 :: 		I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C2_PF01);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C2_Init_Advanced+0
;Ducati_logger_main.c,126 :: 		MPU9150A_FSY = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;Ducati_logger_main.c,127 :: 		MPU9150A_Init();
BL	_MPU9150A_Init+0
;Ducati_logger_main.c,128 :: 		MPU9150A_Detect();
BL	_MPU9150A_Detect+0
;Ducati_logger_main.c,129 :: 		MAG_Detect();
BL	_MAG_Detect+0
;Ducati_logger_main.c,130 :: 		tmrTicks = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_tmrTicks+0)
MOVT	R0, #hi_addr(_tmrTicks+0)
STRH	R1, [R0, #0]
;Ducati_logger_main.c,131 :: 		initTimer2();
BL	_InitTimer2+0
;Ducati_logger_main.c,132 :: 		Timer2_On();
BL	_Timer2_On+0
;Ducati_logger_main.c,133 :: 		MPU9150A_Read(); //initial read
BL	_MPU9150A_Read+0
;Ducati_logger_main.c,134 :: 		delay_ms(10);
MOVW	R7, #41246
MOVT	R7, #7
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;Ducati_logger_main.c,136 :: 		while (1) {
L_main2:
;Ducati_logger_main.c,137 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;Ducati_logger_main.c,138 :: 		Check_TP();
BL	_Check_TP+0
;Ducati_logger_main.c,139 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ducati_logger_main.c,142 :: 		Run_logger();
BL	_Run_logger+0
;Ducati_logger_main.c,144 :: 		}
IT	AL
BAL	L_main2
;Ducati_logger_main.c,145 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
