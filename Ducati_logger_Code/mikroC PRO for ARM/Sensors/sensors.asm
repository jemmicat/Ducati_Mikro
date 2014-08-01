_Sensors_Init:
;sensors.c,21 :: 		void Sensors_Init(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;sensors.c,22 :: 		Sensors_counter = 3100;
MOVW	R1, #3100
SXTH	R1, R1
MOVW	R0, #lo_addr(sensors_Sensors_counter+0)
MOVT	R0, #hi_addr(sensors_Sensors_counter+0)
STRH	R1, [R0, #0]
;sensors.c,24 :: 		GPIO_Analog_Input(&GPIOF_BASE, _GPIO_PINMASK_8);
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Analog_Input+0
;sensors.c,25 :: 		GPIO_Analog_Input(&GPIOF_BASE, _GPIO_PINMASK_9);
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Analog_Input+0
;sensors.c,27 :: 		ADC3_Init();                        // Initialize ADC
BL	_ADC3_Init+0
;sensors.c,29 :: 		FULL_BackLight = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(sensors_FULL_BackLight+0)
MOVT	R0, #hi_addr(sensors_FULL_BackLight+0)
STRB	R1, [R0, #0]
;sensors.c,30 :: 		current_intensity = 255;
MOVS	R1, #255
MOVW	R0, #lo_addr(sensors_current_intensity+0)
MOVT	R0, #hi_addr(sensors_current_intensity+0)
STRB	R1, [R0, #0]
;sensors.c,31 :: 		}
L_end_Sensors_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Sensors_Init
_RedrawLabel:
;sensors.c,40 :: 		void RedrawLabel(unsigned int BackGround_Color, Tlabel *Label, unsigned int Xoffset, unsigned int Yoffset){
; Yoffset start address is: 12 (R3)
; Xoffset start address is: 8 (R2)
; BackGround_Color start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTH	R7, R0
STR	R1, [SP, #4]
UXTH	R8, R2
UXTH	R9, R3
; Yoffset end address is: 12 (R3)
; Xoffset end address is: 8 (R2)
; BackGround_Color end address is: 0 (R0)
; BackGround_Color start address is: 28 (R7)
; Xoffset start address is: 32 (R8)
; Yoffset start address is: 36 (R9)
;sensors.c,41 :: 		TFT_Set_Brush(1, BackGround_Color, 0, 0, 0, 0);
MOVS	R5, #0
MOVS	R4, #0
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R7
MOVS	R0, #1
PUSH	(R5)
PUSH	(R4)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;sensors.c,42 :: 		TFT_Set_Pen(BackGround_Color, 0);
MOVS	R1, #0
UXTH	R0, R7
; BackGround_Color end address is: 28 (R7)
BL	_TFT_Set_Pen+0
;sensors.c,43 :: 		TFT_Rectangle(label->Left, Label->Top, label->Left + Xoffset, Label->Top + Yoffset);
LDR	R4, [SP, #4]
ADDS	R4, #8
LDRH	R5, [R4, #0]
ADD	R7, R5, R9, LSL #0
; Yoffset end address is: 36 (R9)
LDR	R4, [SP, #4]
ADDS	R4, R4, #6
LDRH	R4, [R4, #0]
ADD	R6, R4, R8, LSL #0
; Xoffset end address is: 32 (R8)
SXTH	R5, R5
SXTH	R4, R4
SXTH	R3, R7
SXTH	R2, R6
SXTH	R1, R5
SXTH	R0, R4
BL	_TFT_Rectangle+0
;sensors.c,44 :: 		DrawLabel(Label);
LDR	R0, [SP, #4]
BL	_DrawLabel+0
;sensors.c,45 :: 		}
L_end_RedrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _RedrawLabel
sensors_Get_Temperature:
;sensors.c,95 :: 		static void Get_Temperature(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;sensors.c,100 :: 		temp = ADC3_Get_Sample(6);
MOVS	R0, #6
BL	_ADC3_Get_Sample+0
;sensors.c,109 :: 		}
L_end_Get_Temperature:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of sensors_Get_Temperature
sensors_Dim_BackLight:
;sensors.c,118 :: 		static void Dim_BackLight(char intensity){
; intensity start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; intensity end address is: 0 (R0)
; intensity start address is: 0 (R0)
;sensors.c,120 :: 		if (intensity < current_intensity)
MOVW	R1, #lo_addr(sensors_current_intensity+0)
MOVT	R1, #hi_addr(sensors_current_intensity+0)
LDRB	R1, [R1, #0]
CMP	R0, R1
IT	CS
BCS	L_sensors_Dim_BackLight0
;sensors.c,121 :: 		for (intensity_cnt = current_intensity; intensity_cnt > intensity; intensity_cnt --){
MOVW	R1, #lo_addr(sensors_current_intensity+0)
MOVT	R1, #hi_addr(sensors_current_intensity+0)
; intensity_cnt start address is: 8 (R2)
LDRB	R2, [R1, #0]
; intensity_cnt end address is: 8 (R2)
; intensity end address is: 0 (R0)
L_sensors_Dim_BackLight1:
; intensity_cnt start address is: 8 (R2)
; intensity start address is: 0 (R0)
CMP	R2, R0
IT	LS
BLS	L_sensors_Dim_BackLight2
;sensors.c,122 :: 		TFT_Set_DBC_SSD1963(intensity_cnt);
STRB	R0, [SP, #4]
STRB	R2, [SP, #5]
UXTB	R0, R2
BL	_TFT_Set_DBC_SSD1963+0
LDRB	R2, [SP, #5]
LDRB	R0, [SP, #4]
;sensors.c,123 :: 		Delay_ms(2);
MOVW	R7, #34462
MOVT	R7, #1
NOP
NOP
L_sensors_Dim_BackLight4:
SUBS	R7, R7, #1
BNE	L_sensors_Dim_BackLight4
NOP
NOP
NOP
;sensors.c,121 :: 		for (intensity_cnt = current_intensity; intensity_cnt > intensity; intensity_cnt --){
SUBS	R2, R2, #1
UXTB	R2, R2
;sensors.c,124 :: 		}
; intensity_cnt end address is: 8 (R2)
IT	AL
BAL	L_sensors_Dim_BackLight1
L_sensors_Dim_BackLight2:
IT	AL
BAL	L_sensors_Dim_BackLight6
L_sensors_Dim_BackLight0:
;sensors.c,126 :: 		for (intensity_cnt = current_intensity; intensity_cnt < intensity; intensity_cnt ++){
MOVW	R1, #lo_addr(sensors_current_intensity+0)
MOVT	R1, #hi_addr(sensors_current_intensity+0)
; intensity_cnt start address is: 8 (R2)
LDRB	R2, [R1, #0]
; intensity_cnt end address is: 8 (R2)
; intensity end address is: 0 (R0)
L_sensors_Dim_BackLight7:
; intensity_cnt start address is: 8 (R2)
; intensity start address is: 0 (R0)
CMP	R2, R0
IT	CS
BCS	L_sensors_Dim_BackLight8
;sensors.c,127 :: 		TFT_Set_DBC_SSD1963(intensity_cnt);
STRB	R0, [SP, #4]
STRB	R2, [SP, #5]
UXTB	R0, R2
BL	_TFT_Set_DBC_SSD1963+0
LDRB	R2, [SP, #5]
LDRB	R0, [SP, #4]
;sensors.c,128 :: 		Delay_ms(2);
MOVW	R7, #34462
MOVT	R7, #1
NOP
NOP
L_sensors_Dim_BackLight10:
SUBS	R7, R7, #1
BNE	L_sensors_Dim_BackLight10
NOP
NOP
NOP
;sensors.c,126 :: 		for (intensity_cnt = current_intensity; intensity_cnt < intensity; intensity_cnt ++){
ADDS	R2, R2, #1
UXTB	R2, R2
;sensors.c,129 :: 		}
; intensity_cnt end address is: 8 (R2)
IT	AL
BAL	L_sensors_Dim_BackLight7
L_sensors_Dim_BackLight8:
L_sensors_Dim_BackLight6:
; intensity end address is: 0 (R0)
;sensors.c,130 :: 		current_intensity = intensity;
; intensity start address is: 0 (R0)
MOVW	R1, #lo_addr(sensors_current_intensity+0)
MOVT	R1, #hi_addr(sensors_current_intensity+0)
STRB	R0, [R1, #0]
; intensity end address is: 0 (R0)
;sensors.c,131 :: 		}
L_end_Dim_BackLight:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of sensors_Dim_BackLight
_Sensors_Read:
;sensors.c,176 :: 		void Sensors_Read(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;sensors.c,178 :: 		Sensors_counter++;
MOVW	R1, #lo_addr(sensors_Sensors_counter+0)
MOVT	R1, #hi_addr(sensors_Sensors_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;sensors.c,179 :: 		if (Sensors_counter > 2000){
CMP	R0, #2000
IT	LE
BLE	L_Sensors_Read12
;sensors.c,180 :: 		Get_Temperature();
BL	sensors_Get_Temperature+0
;sensors.c,202 :: 		Sensors_counter = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(sensors_Sensors_counter+0)
MOVT	R0, #hi_addr(sensors_Sensors_counter+0)
STRH	R1, [R0, #0]
;sensors.c,203 :: 		}
L_Sensors_Read12:
;sensors.c,204 :: 		}
L_end_Sensors_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Sensors_Read
_Stop_sensors:
;sensors.c,213 :: 		void Stop_sensors(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;sensors.c,214 :: 		Dim_BackLight(0);
MOVS	R0, #0
BL	sensors_Dim_BackLight+0
;sensors.c,215 :: 		}
L_end_Stop_sensors:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Stop_sensors
