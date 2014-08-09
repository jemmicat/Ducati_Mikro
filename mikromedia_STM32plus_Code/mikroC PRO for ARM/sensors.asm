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
sensors_Display_Temp:
;sensors.c,54 :: 		static void Display_Temp(unsigned long temperature, char CF){
; CF start address is: 4 (R1)
; temperature start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
UXTB	R6, R1
; CF end address is: 4 (R1)
; temperature end address is: 0 (R0)
; temperature start address is: 0 (R0)
; CF start address is: 24 (R6)
;sensors.c,58 :: 		LongWordToStr(temperature, text1);
ADD	R2, SP, #4
MOV	R1, R2
; temperature end address is: 0 (R0)
BL	_LongWordToStr+0
;sensors.c,59 :: 		ptr1 = text1;
ADD	R2, SP, #4
; ptr1 start address is: 0 (R0)
MOV	R0, R2
;sensors.c,60 :: 		if (CF == 0)
CMP	R6, #0
IT	NE
BNE	L_sensors_Display_Temp0
;sensors.c,61 :: 		ptr2 = Diagram5_Label2.Caption;
MOVW	R2, #lo_addr(_Diagram5_Label2+16)
MOVT	R2, #hi_addr(_Diagram5_Label2+16)
; ptr2 start address is: 4 (R1)
LDR	R1, [R2, #0]
MOV	R4, R1
; ptr2 end address is: 4 (R1)
IT	AL
BAL	L_sensors_Display_Temp1
L_sensors_Display_Temp0:
;sensors.c,63 :: 		ptr2 = Diagram5_Label5.Caption;
MOVW	R2, #lo_addr(_Diagram5_Label5+16)
MOVT	R2, #hi_addr(_Diagram5_Label5+16)
; ptr2 start address is: 4 (R1)
LDR	R1, [R2, #0]
; ptr2 end address is: 4 (R1)
MOV	R4, R1
L_sensors_Display_Temp1:
;sensors.c,65 :: 		while (*ptr1){
; ptr2 start address is: 16 (R4)
MOV	R1, R0
; CF end address is: 24 (R6)
; ptr1 end address is: 0 (R0)
; ptr2 end address is: 16 (R4)
UXTB	R0, R6
L_sensors_Display_Temp2:
; ptr2 start address is: 16 (R4)
; ptr1 start address is: 4 (R1)
; CF start address is: 0 (R0)
LDRB	R2, [R1, #0]
CMP	R2, #0
IT	EQ
BEQ	L_sensors_Display_Temp3
;sensors.c,66 :: 		if (*ptr1 != ' ')
LDRB	R2, [R1, #0]
CMP	R2, #32
IT	EQ
BEQ	L_sensors_Display_Temp37
;sensors.c,67 :: 		*ptr2++ = *ptr1;
LDRB	R2, [R1, #0]
STRB	R2, [R4, #0]
ADDS	R4, R4, #1
; ptr2 end address is: 16 (R4)
IT	AL
BAL	L_sensors_Display_Temp4
L_sensors_Display_Temp37:
;sensors.c,66 :: 		if (*ptr1 != ' ')
;sensors.c,67 :: 		*ptr2++ = *ptr1;
L_sensors_Display_Temp4:
;sensors.c,68 :: 		ptr1++;
; ptr2 start address is: 16 (R4)
ADDS	R1, R1, #1
;sensors.c,69 :: 		}
; ptr1 end address is: 4 (R1)
IT	AL
BAL	L_sensors_Display_Temp2
L_sensors_Display_Temp3:
;sensors.c,70 :: 		ptr2--;
SUBS	R3, R4, #1
MOV	R4, R3
;sensors.c,71 :: 		temp = *ptr2;
LDRB	R2, [R3, #0]
; temp start address is: 4 (R1)
UXTB	R1, R2
;sensors.c,72 :: 		*ptr2++ = '.';
MOVS	R2, #46
STRB	R2, [R3, #0]
ADDS	R2, R4, #1
MOV	R4, R2
;sensors.c,73 :: 		*ptr2++ = temp;
STRB	R1, [R2, #0]
; temp end address is: 4 (R1)
ADDS	R3, R4, #1
; ptr2 end address is: 16 (R4)
; ptr2 start address is: 4 (R1)
MOV	R1, R3
;sensors.c,74 :: 		*ptr2++ = ' ';
MOVS	R2, #32
STRB	R2, [R3, #0]
ADDS	R3, R1, #1
MOV	R1, R3
;sensors.c,75 :: 		*ptr2++ = 'º';
MOVS	R2, #186
STRB	R2, [R3, #0]
ADDS	R1, R1, #1
;sensors.c,76 :: 		if (CF == 0)
CMP	R0, #0
IT	NE
BNE	L_sensors_Display_Temp5
;sensors.c,77 :: 		*ptr2++ = 'C';
MOVS	R2, #67
STRB	R2, [R1, #0]
ADDS	R1, R1, #1
IT	AL
BAL	L_sensors_Display_Temp6
L_sensors_Display_Temp5:
;sensors.c,79 :: 		*ptr2++ = 'F';
MOVS	R2, #70
STRB	R2, [R1, #0]
ADDS	R1, R1, #1
; ptr2 end address is: 4 (R1)
L_sensors_Display_Temp6:
;sensors.c,80 :: 		*ptr2 = 0;
; ptr2 start address is: 4 (R1)
MOVS	R2, #0
STRB	R2, [R1, #0]
; ptr2 end address is: 4 (R1)
;sensors.c,82 :: 		if (CF == 0)
CMP	R0, #0
IT	NE
BNE	L_sensors_Display_Temp7
; CF end address is: 0 (R0)
;sensors.c,83 :: 		RedrawLabel(Sensors.Color, &Diagram5_Label2, 135, 50);
MOVW	R2, #lo_addr(_Sensors+0)
MOVT	R2, #hi_addr(_Sensors+0)
LDRH	R2, [R2, #0]
MOVS	R3, #50
MOVW	R1, #lo_addr(_Diagram5_Label2+0)
MOVT	R1, #hi_addr(_Diagram5_Label2+0)
UXTH	R0, R2
MOVS	R2, #135
BL	_RedrawLabel+0
IT	AL
BAL	L_sensors_Display_Temp8
L_sensors_Display_Temp7:
;sensors.c,85 :: 		RedrawLabel(Sensors.Color, &Diagram5_Label5, 75, 30);
MOVW	R2, #lo_addr(_Sensors+0)
MOVT	R2, #hi_addr(_Sensors+0)
LDRH	R2, [R2, #0]
MOVS	R3, #30
MOVW	R1, #lo_addr(_Diagram5_Label5+0)
MOVT	R1, #hi_addr(_Diagram5_Label5+0)
UXTH	R0, R2
MOVS	R2, #75
BL	_RedrawLabel+0
L_sensors_Display_Temp8:
;sensors.c,86 :: 		}
L_end_Display_Temp:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of sensors_Display_Temp
sensors_Get_Temperature:
;sensors.c,95 :: 		static void Get_Temperature(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;sensors.c,100 :: 		temp = ADC3_Get_Sample(6);
MOVS	R0, #6
BL	_ADC3_Get_Sample+0
; temp start address is: 0 (R0)
;sensors.c,101 :: 		temp = (unsigned long)(VREF * temp) / 4100;
LSLS	R1, R0, #11
; temp end address is: 0 (R0)
MOVW	R0, #4100
UDIV	R0, R1, R0
;sensors.c,102 :: 		temp = temp - 500;
SUB	R0, R0, #500
; temp start address is: 4 (R1)
MOV	R1, R0
;sensors.c,103 :: 		Display_Temp(temp, 0);
STR	R1, [SP, #4]
MOVS	R1, #0
BL	sensors_Display_Temp+0
LDR	R1, [SP, #4]
;sensors.c,106 :: 		temp2 = (float)(temp) / 10 * 1.8 + 32;
VMOV	S1, R1
VCVT.F32	#0, S1, S1
; temp end address is: 4 (R1)
VMOV.F32	S0, #10
VDIV.F32	S1, S1, S0
MOVW	R0, #26214
MOVT	R0, #16358
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOV	R0, #1107296256
VMOV	S0, R0
VADD.F32	S1, S1, S0
;sensors.c,107 :: 		temp2 = temp2 * 10;
VMOV.F32	S0, #10
VMUL.F32	S0, S1, S0
;sensors.c,108 :: 		Display_Temp((unsigned long)temp2, 1);
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
MOVS	R1, #1
BL	sensors_Display_Temp+0
;sensors.c,109 :: 		}
L_end_Get_Temperature:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
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
BCS	L_sensors_Dim_BackLight9
;sensors.c,121 :: 		for (intensity_cnt = current_intensity; intensity_cnt > intensity; intensity_cnt --){
MOVW	R1, #lo_addr(sensors_current_intensity+0)
MOVT	R1, #hi_addr(sensors_current_intensity+0)
; intensity_cnt start address is: 8 (R2)
LDRB	R2, [R1, #0]
; intensity_cnt end address is: 8 (R2)
; intensity end address is: 0 (R0)
L_sensors_Dim_BackLight10:
; intensity_cnt start address is: 8 (R2)
; intensity start address is: 0 (R0)
CMP	R2, R0
IT	LS
BLS	L_sensors_Dim_BackLight11
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
L_sensors_Dim_BackLight13:
SUBS	R7, R7, #1
BNE	L_sensors_Dim_BackLight13
NOP
NOP
NOP
;sensors.c,121 :: 		for (intensity_cnt = current_intensity; intensity_cnt > intensity; intensity_cnt --){
SUBS	R2, R2, #1
UXTB	R2, R2
;sensors.c,124 :: 		}
; intensity_cnt end address is: 8 (R2)
IT	AL
BAL	L_sensors_Dim_BackLight10
L_sensors_Dim_BackLight11:
IT	AL
BAL	L_sensors_Dim_BackLight15
L_sensors_Dim_BackLight9:
;sensors.c,126 :: 		for (intensity_cnt = current_intensity; intensity_cnt < intensity; intensity_cnt ++){
MOVW	R1, #lo_addr(sensors_current_intensity+0)
MOVT	R1, #hi_addr(sensors_current_intensity+0)
; intensity_cnt start address is: 8 (R2)
LDRB	R2, [R1, #0]
; intensity_cnt end address is: 8 (R2)
; intensity end address is: 0 (R0)
L_sensors_Dim_BackLight16:
; intensity_cnt start address is: 8 (R2)
; intensity start address is: 0 (R0)
CMP	R2, R0
IT	CS
BCS	L_sensors_Dim_BackLight17
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
L_sensors_Dim_BackLight19:
SUBS	R7, R7, #1
BNE	L_sensors_Dim_BackLight19
NOP
NOP
NOP
;sensors.c,126 :: 		for (intensity_cnt = current_intensity; intensity_cnt < intensity; intensity_cnt ++){
ADDS	R2, R2, #1
UXTB	R2, R2
;sensors.c,129 :: 		}
; intensity_cnt end address is: 8 (R2)
IT	AL
BAL	L_sensors_Dim_BackLight16
L_sensors_Dim_BackLight17:
L_sensors_Dim_BackLight15:
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
sensors_Get_Light_Intensity:
;sensors.c,140 :: 		static unsigned int Get_Light_Intensity(){
SUB	SP, SP, #16
STR	LR, [SP, #0]
;sensors.c,145 :: 		Light_Intensity = ADC3_Get_Sample(7);
MOVS	R0, #7
BL	_ADC3_Get_Sample+0
;sensors.c,146 :: 		Light_Intensity = Light_Intensity / 4;
LSRS	R0, R0, #2
UXTH	R0, R0
; Light_Intensity start address is: 24 (R6)
UXTH	R6, R0
;sensors.c,148 :: 		if (Light_Intensity >= 1000)
CMP	R0, #1000
IT	CC
BCC	L_sensors_Get_Light_Intensity38
;sensors.c,149 :: 		Light_Intensity = 1000;
MOVW	R6, #1000
; Light_Intensity end address is: 24 (R6)
IT	AL
BAL	L_sensors_Get_Light_Intensity21
L_sensors_Get_Light_Intensity38:
;sensors.c,148 :: 		if (Light_Intensity >= 1000)
;sensors.c,149 :: 		Light_Intensity = 1000;
L_sensors_Get_Light_Intensity21:
;sensors.c,150 :: 		WordToStr(Light_Intensity, text);
; Light_Intensity start address is: 24 (R6)
ADD	R0, SP, #8
MOV	R1, R0
UXTH	R0, R6
BL	_WordToStr+0
;sensors.c,151 :: 		ptr1 = text;
ADD	R1, SP, #8
; ptr1 start address is: 4 (R1)
;sensors.c,152 :: 		ptr2 = Diagram5_Label4_Caption;
; ptr2 start address is: 12 (R3)
MOVW	R3, #lo_addr(_Diagram5_Label4_Caption+0)
MOVT	R3, #hi_addr(_Diagram5_Label4_Caption+0)
; Light_Intensity end address is: 24 (R6)
; ptr1 end address is: 4 (R1)
; ptr2 end address is: 12 (R3)
UXTH	R2, R6
;sensors.c,153 :: 		while (*ptr1){
L_sensors_Get_Light_Intensity22:
; ptr2 start address is: 12 (R3)
; ptr1 start address is: 4 (R1)
; Light_Intensity start address is: 8 (R2)
LDRB	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_sensors_Get_Light_Intensity23
;sensors.c,154 :: 		if (*ptr1 != ' ')
LDRB	R0, [R1, #0]
CMP	R0, #32
IT	EQ
BEQ	L_sensors_Get_Light_Intensity39
;sensors.c,155 :: 		*ptr2++ = *ptr1;
LDRB	R0, [R1, #0]
STRB	R0, [R3, #0]
ADDS	R3, R3, #1
; ptr2 end address is: 12 (R3)
IT	AL
BAL	L_sensors_Get_Light_Intensity24
L_sensors_Get_Light_Intensity39:
;sensors.c,154 :: 		if (*ptr1 != ' ')
;sensors.c,155 :: 		*ptr2++ = *ptr1;
L_sensors_Get_Light_Intensity24:
;sensors.c,156 :: 		ptr1++;
; ptr2 start address is: 12 (R3)
ADDS	R1, R1, #1
;sensors.c,157 :: 		}
; ptr1 end address is: 4 (R1)
IT	AL
BAL	L_sensors_Get_Light_Intensity22
L_sensors_Get_Light_Intensity23:
;sensors.c,158 :: 		ptr2--;
SUBS	R1, R3, #1
; ptr2 end address is: 12 (R3)
; ptr2 start address is: 16 (R4)
MOV	R4, R1
;sensors.c,159 :: 		temp = *ptr2;
LDRB	R0, [R1, #0]
; temp start address is: 12 (R3)
UXTB	R3, R0
;sensors.c,160 :: 		*ptr2++ = '.';
MOVS	R0, #46
STRB	R0, [R1, #0]
ADDS	R0, R4, #1
MOV	R4, R0
;sensors.c,161 :: 		*ptr2++ = temp;
STRB	R3, [R0, #0]
; temp end address is: 12 (R3)
ADDS	R1, R4, #1
; ptr2 end address is: 16 (R4)
; ptr2 start address is: 12 (R3)
MOV	R3, R1
;sensors.c,162 :: 		*ptr2++ = ' ';
MOVS	R0, #32
STRB	R0, [R1, #0]
ADDS	R1, R3, #1
MOV	R3, R1
;sensors.c,163 :: 		*ptr2++ = '%';
MOVS	R0, #37
STRB	R0, [R1, #0]
ADDS	R1, R3, #1
; ptr2 end address is: 12 (R3)
;sensors.c,164 :: 		*ptr2 = 0;
MOVS	R0, #0
STRB	R0, [R1, #0]
;sensors.c,165 :: 		RedrawLabel(Diagram5_Box1.Color, &Diagram5_Label4, 140, 50);
MOVW	R0, #lo_addr(_Diagram5_Box1+28)
MOVT	R0, #hi_addr(_Diagram5_Box1+28)
LDRH	R0, [R0, #0]
STRH	R2, [SP, #4]
MOVS	R3, #50
MOVS	R2, #140
MOVW	R1, #lo_addr(_Diagram5_Label4+0)
MOVT	R1, #hi_addr(_Diagram5_Label4+0)
BL	_RedrawLabel+0
LDRH	R2, [SP, #4]
;sensors.c,167 :: 		return Light_Intensity;
UXTH	R0, R2
; Light_Intensity end address is: 8 (R2)
;sensors.c,168 :: 		}
L_end_Get_Light_Intensity:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of sensors_Get_Light_Intensity
_Sensors_Read:
;sensors.c,177 :: 		void Sensors_Read(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;sensors.c,179 :: 		Sensors_counter++;
MOVW	R1, #lo_addr(sensors_Sensors_counter+0)
MOVT	R1, #hi_addr(sensors_Sensors_counter+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;sensors.c,180 :: 		if (Sensors_counter > 2000){
CMP	R0, #2000
IT	LE
BLE	L_Sensors_Read25
;sensors.c,181 :: 		Get_Temperature();
BL	sensors_Get_Temperature+0
;sensors.c,182 :: 		Light_temp = Get_Light_Intensity();
BL	sensors_Get_Light_Intensity+0
;sensors.c,184 :: 		if (Light_temp < 200){
CMP	R0, #200
IT	CS
BCS	L_Sensors_Read26
;sensors.c,185 :: 		if (Light_intensity_cnt < 5)
MOVW	R0, #lo_addr(sensors_Light_intensity_cnt+0)
MOVT	R0, #hi_addr(sensors_Light_intensity_cnt+0)
LDRSB	R0, [R0, #0]
CMP	R0, #5
IT	GE
BGE	L_Sensors_Read27
;sensors.c,186 :: 		Light_intensity_cnt ++;
MOVW	R1, #lo_addr(sensors_Light_intensity_cnt+0)
MOVT	R1, #hi_addr(sensors_Light_intensity_cnt+0)
LDRSB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
L_Sensors_Read27:
;sensors.c,187 :: 		}
IT	AL
BAL	L_Sensors_Read28
L_Sensors_Read26:
;sensors.c,189 :: 		if (Light_intensity_cnt > -5)
MOVW	R0, #lo_addr(sensors_Light_intensity_cnt+0)
MOVT	R0, #hi_addr(sensors_Light_intensity_cnt+0)
LDRSB	R1, [R0, #0]
MVN	R0, #4
CMP	R1, R0
IT	LE
BLE	L_Sensors_Read29
;sensors.c,190 :: 		Light_intensity_cnt --;
MOVW	R1, #lo_addr(sensors_Light_intensity_cnt+0)
MOVT	R1, #hi_addr(sensors_Light_intensity_cnt+0)
LDRSB	R0, [R1, #0]
SUBS	R0, R0, #1
STRB	R0, [R1, #0]
L_Sensors_Read29:
L_Sensors_Read28:
;sensors.c,192 :: 		if ((Light_intensity_cnt > 4) && (FULL_BackLight == 1)){
MOVW	R0, #lo_addr(sensors_Light_intensity_cnt+0)
MOVT	R0, #hi_addr(sensors_Light_intensity_cnt+0)
LDRSB	R0, [R0, #0]
CMP	R0, #4
IT	LE
BLE	L__Sensors_Read43
MOVW	R0, #lo_addr(sensors_FULL_BackLight+0)
MOVT	R0, #hi_addr(sensors_FULL_BackLight+0)
LDRSB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__Sensors_Read42
L__Sensors_Read41:
;sensors.c,193 :: 		Dim_BackLight(70);
MOVS	R0, #70
BL	sensors_Dim_BackLight+0
;sensors.c,194 :: 		FULL_BackLight = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(sensors_FULL_BackLight+0)
MOVT	R0, #hi_addr(sensors_FULL_BackLight+0)
STRB	R1, [R0, #0]
;sensors.c,195 :: 		Light_intensity_cnt = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(sensors_Light_intensity_cnt+0)
MOVT	R0, #hi_addr(sensors_Light_intensity_cnt+0)
STRB	R1, [R0, #0]
;sensors.c,196 :: 		}
IT	AL
BAL	L_Sensors_Read33
;sensors.c,192 :: 		if ((Light_intensity_cnt > 4) && (FULL_BackLight == 1)){
L__Sensors_Read43:
L__Sensors_Read42:
;sensors.c,197 :: 		else if ((Light_intensity_cnt < -4) && (FULL_BackLight == 0)){
MOVW	R0, #lo_addr(sensors_Light_intensity_cnt+0)
MOVT	R0, #hi_addr(sensors_Light_intensity_cnt+0)
LDRSB	R1, [R0, #0]
MVN	R0, #3
CMP	R1, R0
IT	GE
BGE	L__Sensors_Read45
MOVW	R0, #lo_addr(sensors_FULL_BackLight+0)
MOVT	R0, #hi_addr(sensors_FULL_BackLight+0)
LDRSB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__Sensors_Read44
L__Sensors_Read40:
;sensors.c,198 :: 		Dim_BackLight(255);
MOVS	R0, #255
BL	sensors_Dim_BackLight+0
;sensors.c,199 :: 		FULL_BackLight = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(sensors_FULL_BackLight+0)
MOVT	R0, #hi_addr(sensors_FULL_BackLight+0)
STRB	R1, [R0, #0]
;sensors.c,200 :: 		Light_intensity_cnt = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(sensors_Light_intensity_cnt+0)
MOVT	R0, #hi_addr(sensors_Light_intensity_cnt+0)
STRB	R1, [R0, #0]
;sensors.c,197 :: 		else if ((Light_intensity_cnt < -4) && (FULL_BackLight == 0)){
L__Sensors_Read45:
L__Sensors_Read44:
;sensors.c,201 :: 		}
L_Sensors_Read33:
;sensors.c,203 :: 		Sensors_counter = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(sensors_Sensors_counter+0)
MOVT	R0, #hi_addr(sensors_Sensors_counter+0)
STRH	R1, [R0, #0]
;sensors.c,204 :: 		}
L_Sensors_Read25:
;sensors.c,205 :: 		}
L_end_Sensors_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Sensors_Read
_Stop_sensors:
;sensors.c,214 :: 		void Stop_sensors(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;sensors.c,215 :: 		Dim_BackLight(0);
MOVS	R0, #0
BL	sensors_Dim_BackLight+0
;sensors.c,216 :: 		}
L_end_Stop_sensors:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Stop_sensors
