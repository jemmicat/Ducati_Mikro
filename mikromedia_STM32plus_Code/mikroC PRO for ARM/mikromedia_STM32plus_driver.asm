_Write_to_Data_Lines:
;mikromedia_STM32plus_driver.c,47 :: 		void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
; _lo start address is: 4 (R1)
; _hi start address is: 0 (R0)
; _lo end address is: 4 (R1)
; _hi end address is: 0 (R0)
; _hi start address is: 0 (R0)
; _lo start address is: 4 (R1)
;mikromedia_STM32plus_driver.c,49 :: 		temp = GPIOE_ODR;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
; temp start address is: 8 (R2)
LDR	R2, [R2, #0]
;mikromedia_STM32plus_driver.c,50 :: 		temp &= 0x00FF;
AND	R3, R2, #255
UXTH	R3, R3
; temp end address is: 8 (R2)
;mikromedia_STM32plus_driver.c,51 :: 		GPIOE_ODR = temp | (_hi << 8);
LSLS	R2, R0, #8
UXTH	R2, R2
; _hi end address is: 0 (R0)
ORRS	R3, R2
UXTH	R3, R3
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,52 :: 		temp = GPIOG_ODR;
MOVW	R2, #lo_addr(GPIOG_ODR+0)
MOVT	R2, #hi_addr(GPIOG_ODR+0)
; temp start address is: 0 (R0)
LDR	R0, [R2, #0]
;mikromedia_STM32plus_driver.c,53 :: 		temp &= 0xFF00;
AND	R2, R0, #65280
UXTH	R2, R2
; temp end address is: 0 (R0)
;mikromedia_STM32plus_driver.c,54 :: 		GPIOG_ODR = temp | _lo;
ORR	R3, R2, R1, LSL #0
UXTH	R3, R3
; _lo end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOG_ODR+0)
MOVT	R2, #hi_addr(GPIOG_ODR+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,55 :: 		}
L_end_Write_to_Data_Lines:
BX	LR
; end of _Write_to_Data_Lines
_Set_Index:
;mikromedia_STM32plus_driver.c,57 :: 		void Set_Index(unsigned short index) {
; index start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; index end address is: 0 (R0)
; index start address is: 0 (R0)
;mikromedia_STM32plus_driver.c,58 :: 		TFT_RS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,59 :: 		Write_to_Data_Lines(0, index);
UXTB	R1, R0
; index end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;mikromedia_STM32plus_driver.c,60 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,61 :: 		asm nop;
NOP
;mikromedia_STM32plus_driver.c,62 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,63 :: 		}
L_end_Set_Index:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Index
_Write_Command:
;mikromedia_STM32plus_driver.c,65 :: 		void Write_Command(unsigned short cmd) {
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cmd end address is: 0 (R0)
; cmd start address is: 0 (R0)
;mikromedia_STM32plus_driver.c,66 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,67 :: 		Write_to_Data_Lines(0, cmd);
UXTB	R1, R0
; cmd end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;mikromedia_STM32plus_driver.c,68 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,69 :: 		asm nop;
NOP
;mikromedia_STM32plus_driver.c,70 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,71 :: 		}
L_end_Write_Command:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Write_Command
_Write_Data:
;mikromedia_STM32plus_driver.c,73 :: 		void Write_Data(unsigned int _data) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,74 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,75 :: 		Write_to_Data_Lines(Hi(_data), Lo(_data));
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
UXTB	R2, R1
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
UXTB	R1, R2
BL	_Write_to_Data_Lines+0
;mikromedia_STM32plus_driver.c,76 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,77 :: 		asm nop;
NOP
;mikromedia_STM32plus_driver.c,78 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,79 :: 		}
L_end_Write_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Write_Data
mikromedia_STM32plus_driver_InitializeTouchPanel:
;mikromedia_STM32plus_driver.c,81 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,82 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R2, #lo_addr(_Write_Data+0)
MOVT	R2, #hi_addr(_Write_Data+0)
MOVW	R1, #lo_addr(_Write_Command+0)
MOVT	R1, #hi_addr(_Write_Command+0)
MOVW	R0, #lo_addr(_Set_Index+0)
MOVT	R0, #hi_addr(_Set_Index+0)
BL	_TFT_Set_Active+0
;mikromedia_STM32plus_driver.c,83 :: 		TFT_Init_SSD1963(480, 272);
MOVW	R1, #272
MOVW	R0, #480
BL	_TFT_Init_SSD1963+0
;mikromedia_STM32plus_driver.c,85 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;mikromedia_STM32plus_driver.c,87 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,88 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,89 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,90 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of mikromedia_STM32plus_driver_InitializeTouchPanel
mikromedia_STM32plus_driver_InitializeObjects:
;mikromedia_STM32plus_driver.c,723 :: 		static void InitializeObjects() {
;mikromedia_STM32plus_driver.c,724 :: 		Home.Color                     = 0x2D33;
MOVW	R1, #11571
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,725 :: 		Home.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Home+2)
MOVT	R0, #hi_addr(_Home+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,726 :: 		Home.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Home+4)
MOVT	R0, #hi_addr(_Home+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,727 :: 		Home.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Home+8)
MOVT	R0, #hi_addr(_Home+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,728 :: 		Home.LabelsCount               = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Home+16)
MOVT	R0, #hi_addr(_Home+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,729 :: 		Home.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Home+20)
MOVT	R0, #hi_addr(_Home+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,730 :: 		Home.ImagesCount               = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Home+24)
MOVT	R0, #hi_addr(_Home+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,731 :: 		Home.Images                    = Screen1_Images;
MOVW	R1, #lo_addr(_Screen1_Images+0)
MOVT	R1, #hi_addr(_Screen1_Images+0)
MOVW	R0, #lo_addr(_Home+28)
MOVT	R0, #hi_addr(_Home+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,732 :: 		Home.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Home+32)
MOVT	R0, #hi_addr(_Home+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,733 :: 		Home.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Home+40)
MOVT	R0, #hi_addr(_Home+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,734 :: 		Home.CheckBoxesCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Home+48)
MOVT	R0, #hi_addr(_Home+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,735 :: 		Home.ObjectsCount              = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Home+6)
MOVT	R0, #hi_addr(_Home+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,737 :: 		Accelerometer.Color                     = 0x4229;
MOVW	R1, #16937
MOVW	R0, #lo_addr(_Accelerometer+0)
MOVT	R0, #hi_addr(_Accelerometer+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,738 :: 		Accelerometer.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Accelerometer+2)
MOVT	R0, #hi_addr(_Accelerometer+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,739 :: 		Accelerometer.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Accelerometer+4)
MOVT	R0, #hi_addr(_Accelerometer+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,740 :: 		Accelerometer.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Accelerometer+8)
MOVT	R0, #hi_addr(_Accelerometer+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,741 :: 		Accelerometer.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Accelerometer+16)
MOVT	R0, #hi_addr(_Accelerometer+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,742 :: 		Accelerometer.Labels                    = Screen2_Labels;
MOVW	R1, #lo_addr(_Screen2_Labels+0)
MOVT	R1, #hi_addr(_Screen2_Labels+0)
MOVW	R0, #lo_addr(_Accelerometer+20)
MOVT	R0, #hi_addr(_Accelerometer+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,743 :: 		Accelerometer.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Accelerometer+24)
MOVT	R0, #hi_addr(_Accelerometer+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,744 :: 		Accelerometer.Images                    = Screen2_Images;
MOVW	R1, #lo_addr(_Screen2_Images+0)
MOVT	R1, #hi_addr(_Screen2_Images+0)
MOVW	R0, #lo_addr(_Accelerometer+28)
MOVT	R0, #hi_addr(_Accelerometer+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,745 :: 		Accelerometer.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Accelerometer+32)
MOVT	R0, #hi_addr(_Accelerometer+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,746 :: 		Accelerometer.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Accelerometer+40)
MOVT	R0, #hi_addr(_Accelerometer+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,747 :: 		Accelerometer.Boxes                     = Screen2_Boxes;
MOVW	R1, #lo_addr(_Screen2_Boxes+0)
MOVT	R1, #hi_addr(_Screen2_Boxes+0)
MOVW	R0, #lo_addr(_Accelerometer+44)
MOVT	R0, #hi_addr(_Accelerometer+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,748 :: 		Accelerometer.CheckBoxesCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Accelerometer+48)
MOVT	R0, #hi_addr(_Accelerometer+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,749 :: 		Accelerometer.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Accelerometer+6)
MOVT	R0, #hi_addr(_Accelerometer+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,751 :: 		RGBLight.Color                     = 0x4229;
MOVW	R1, #16937
MOVW	R0, #lo_addr(_RGBLight+0)
MOVT	R0, #hi_addr(_RGBLight+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,752 :: 		RGBLight.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_RGBLight+2)
MOVT	R0, #hi_addr(_RGBLight+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,753 :: 		RGBLight.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_RGBLight+4)
MOVT	R0, #hi_addr(_RGBLight+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,754 :: 		RGBLight.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGBLight+8)
MOVT	R0, #hi_addr(_RGBLight+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,755 :: 		RGBLight.LabelsCount               = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_RGBLight+16)
MOVT	R0, #hi_addr(_RGBLight+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,756 :: 		RGBLight.Labels                    = Screen3_Labels;
MOVW	R1, #lo_addr(_Screen3_Labels+0)
MOVT	R1, #hi_addr(_Screen3_Labels+0)
MOVW	R0, #lo_addr(_RGBLight+20)
MOVT	R0, #hi_addr(_RGBLight+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,757 :: 		RGBLight.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RGBLight+24)
MOVT	R0, #hi_addr(_RGBLight+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,758 :: 		RGBLight.Images                    = Screen3_Images;
MOVW	R1, #lo_addr(_Screen3_Images+0)
MOVT	R1, #hi_addr(_Screen3_Images+0)
MOVW	R0, #lo_addr(_RGBLight+28)
MOVT	R0, #hi_addr(_RGBLight+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,759 :: 		RGBLight.CirclesCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RGBLight+32)
MOVT	R0, #hi_addr(_RGBLight+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,760 :: 		RGBLight.Circles                   = Screen3_Circles;
MOVW	R1, #lo_addr(_Screen3_Circles+0)
MOVT	R1, #hi_addr(_Screen3_Circles+0)
MOVW	R0, #lo_addr(_RGBLight+36)
MOVT	R0, #hi_addr(_RGBLight+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,761 :: 		RGBLight.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_RGBLight+40)
MOVT	R0, #hi_addr(_RGBLight+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,762 :: 		RGBLight.Boxes                     = Screen3_Boxes;
MOVW	R1, #lo_addr(_Screen3_Boxes+0)
MOVT	R1, #hi_addr(_Screen3_Boxes+0)
MOVW	R0, #lo_addr(_RGBLight+44)
MOVT	R0, #hi_addr(_RGBLight+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,763 :: 		RGBLight.CheckBoxesCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGBLight+48)
MOVT	R0, #hi_addr(_RGBLight+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,764 :: 		RGBLight.ObjectsCount              = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_RGBLight+6)
MOVT	R0, #hi_addr(_RGBLight+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,766 :: 		Clock.Color                     = 0x54C3;
MOVW	R1, #21699
MOVW	R0, #lo_addr(_Clock+0)
MOVT	R0, #hi_addr(_Clock+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,767 :: 		Clock.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Clock+2)
MOVT	R0, #hi_addr(_Clock+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,768 :: 		Clock.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Clock+4)
MOVT	R0, #hi_addr(_Clock+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,769 :: 		Clock.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Clock+8)
MOVT	R0, #hi_addr(_Clock+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,770 :: 		Clock.LabelsCount               = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Clock+16)
MOVT	R0, #hi_addr(_Clock+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,771 :: 		Clock.Labels                    = Screen4_Labels;
MOVW	R1, #lo_addr(_Screen4_Labels+0)
MOVT	R1, #hi_addr(_Screen4_Labels+0)
MOVW	R0, #lo_addr(_Clock+20)
MOVT	R0, #hi_addr(_Clock+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,772 :: 		Clock.ImagesCount               = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Clock+24)
MOVT	R0, #hi_addr(_Clock+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,773 :: 		Clock.Images                    = Screen4_Images;
MOVW	R1, #lo_addr(_Screen4_Images+0)
MOVT	R1, #hi_addr(_Screen4_Images+0)
MOVW	R0, #lo_addr(_Clock+28)
MOVT	R0, #hi_addr(_Clock+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,774 :: 		Clock.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Clock+32)
MOVT	R0, #hi_addr(_Clock+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,775 :: 		Clock.BoxesCount                = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Clock+40)
MOVT	R0, #hi_addr(_Clock+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,776 :: 		Clock.Boxes                     = Screen4_Boxes;
MOVW	R1, #lo_addr(_Screen4_Boxes+0)
MOVT	R1, #hi_addr(_Screen4_Boxes+0)
MOVW	R0, #lo_addr(_Clock+44)
MOVT	R0, #hi_addr(_Clock+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,777 :: 		Clock.CheckBoxesCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Clock+48)
MOVT	R0, #hi_addr(_Clock+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,778 :: 		Clock.ObjectsCount              = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Clock+6)
MOVT	R0, #hi_addr(_Clock+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,780 :: 		Sensors.Color                     = 0xA948;
MOVW	R1, #43336
MOVW	R0, #lo_addr(_Sensors+0)
MOVT	R0, #hi_addr(_Sensors+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,781 :: 		Sensors.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Sensors+2)
MOVT	R0, #hi_addr(_Sensors+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,782 :: 		Sensors.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Sensors+4)
MOVT	R0, #hi_addr(_Sensors+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,783 :: 		Sensors.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Sensors+8)
MOVT	R0, #hi_addr(_Sensors+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,784 :: 		Sensors.LabelsCount               = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Sensors+16)
MOVT	R0, #hi_addr(_Sensors+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,785 :: 		Sensors.Labels                    = Screen5_Labels;
MOVW	R1, #lo_addr(_Screen5_Labels+0)
MOVT	R1, #hi_addr(_Screen5_Labels+0)
MOVW	R0, #lo_addr(_Sensors+20)
MOVT	R0, #hi_addr(_Sensors+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,786 :: 		Sensors.ImagesCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Sensors+24)
MOVT	R0, #hi_addr(_Sensors+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,787 :: 		Sensors.Images                    = Screen5_Images;
MOVW	R1, #lo_addr(_Screen5_Images+0)
MOVT	R1, #hi_addr(_Screen5_Images+0)
MOVW	R0, #lo_addr(_Sensors+28)
MOVT	R0, #hi_addr(_Sensors+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,788 :: 		Sensors.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Sensors+32)
MOVT	R0, #hi_addr(_Sensors+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,789 :: 		Sensors.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Sensors+40)
MOVT	R0, #hi_addr(_Sensors+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,790 :: 		Sensors.Boxes                     = Screen5_Boxes;
MOVW	R1, #lo_addr(_Screen5_Boxes+0)
MOVT	R1, #hi_addr(_Screen5_Boxes+0)
MOVW	R0, #lo_addr(_Sensors+44)
MOVT	R0, #hi_addr(_Sensors+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,791 :: 		Sensors.CheckBoxesCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Sensors+48)
MOVT	R0, #hi_addr(_Sensors+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,792 :: 		Sensors.ObjectsCount              = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Sensors+6)
MOVT	R0, #hi_addr(_Sensors+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,794 :: 		MP3_SD.Color                     = 0x4457;
MOVW	R1, #17495
MOVW	R0, #lo_addr(_MP3_SD+0)
MOVT	R0, #hi_addr(_MP3_SD+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,795 :: 		MP3_SD.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_MP3_SD+2)
MOVT	R0, #hi_addr(_MP3_SD+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,796 :: 		MP3_SD.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_MP3_SD+4)
MOVT	R0, #hi_addr(_MP3_SD+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,797 :: 		MP3_SD.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_SD+8)
MOVT	R0, #hi_addr(_MP3_SD+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,798 :: 		MP3_SD.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_MP3_SD+16)
MOVT	R0, #hi_addr(_MP3_SD+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,799 :: 		MP3_SD.Labels                    = Screen6_Labels;
MOVW	R1, #lo_addr(_Screen6_Labels+0)
MOVT	R1, #hi_addr(_Screen6_Labels+0)
MOVW	R0, #lo_addr(_MP3_SD+20)
MOVT	R0, #hi_addr(_MP3_SD+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,800 :: 		MP3_SD.ImagesCount               = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_MP3_SD+24)
MOVT	R0, #hi_addr(_MP3_SD+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,801 :: 		MP3_SD.Images                    = Screen6_Images;
MOVW	R1, #lo_addr(_Screen6_Images+0)
MOVT	R1, #hi_addr(_Screen6_Images+0)
MOVW	R0, #lo_addr(_MP3_SD+28)
MOVT	R0, #hi_addr(_MP3_SD+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,802 :: 		MP3_SD.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_SD+32)
MOVT	R0, #hi_addr(_MP3_SD+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,803 :: 		MP3_SD.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_MP3_SD+40)
MOVT	R0, #hi_addr(_MP3_SD+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,804 :: 		MP3_SD.Boxes                     = Screen6_Boxes;
MOVW	R1, #lo_addr(_Screen6_Boxes+0)
MOVT	R1, #hi_addr(_Screen6_Boxes+0)
MOVW	R0, #lo_addr(_MP3_SD+44)
MOVT	R0, #hi_addr(_MP3_SD+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,805 :: 		MP3_SD.CheckBoxesCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_SD+48)
MOVT	R0, #hi_addr(_MP3_SD+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,806 :: 		MP3_SD.ObjectsCount              = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_MP3_SD+6)
MOVT	R0, #hi_addr(_MP3_SD+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,808 :: 		MP3_SongList.Color                     = 0x4457;
MOVW	R1, #17495
MOVW	R0, #lo_addr(_MP3_SongList+0)
MOVT	R0, #hi_addr(_MP3_SongList+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,809 :: 		MP3_SongList.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_MP3_SongList+2)
MOVT	R0, #hi_addr(_MP3_SongList+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,810 :: 		MP3_SongList.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_MP3_SongList+4)
MOVT	R0, #hi_addr(_MP3_SongList+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,811 :: 		MP3_SongList.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_SongList+8)
MOVT	R0, #hi_addr(_MP3_SongList+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,812 :: 		MP3_SongList.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_MP3_SongList+16)
MOVT	R0, #hi_addr(_MP3_SongList+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,813 :: 		MP3_SongList.Labels                    = Screen7_Labels;
MOVW	R1, #lo_addr(_Screen7_Labels+0)
MOVT	R1, #hi_addr(_Screen7_Labels+0)
MOVW	R0, #lo_addr(_MP3_SongList+20)
MOVT	R0, #hi_addr(_MP3_SongList+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,814 :: 		MP3_SongList.ImagesCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MP3_SongList+24)
MOVT	R0, #hi_addr(_MP3_SongList+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,815 :: 		MP3_SongList.Images                    = Screen7_Images;
MOVW	R1, #lo_addr(_Screen7_Images+0)
MOVT	R1, #hi_addr(_Screen7_Images+0)
MOVW	R0, #lo_addr(_MP3_SongList+28)
MOVT	R0, #hi_addr(_MP3_SongList+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,816 :: 		MP3_SongList.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_SongList+32)
MOVT	R0, #hi_addr(_MP3_SongList+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,817 :: 		MP3_SongList.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_MP3_SongList+40)
MOVT	R0, #hi_addr(_MP3_SongList+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,818 :: 		MP3_SongList.Boxes                     = Screen7_Boxes;
MOVW	R1, #lo_addr(_Screen7_Boxes+0)
MOVT	R1, #hi_addr(_Screen7_Boxes+0)
MOVW	R0, #lo_addr(_MP3_SongList+44)
MOVT	R0, #hi_addr(_MP3_SongList+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,819 :: 		MP3_SongList.CheckBoxesCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_SongList+48)
MOVT	R0, #hi_addr(_MP3_SongList+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,820 :: 		MP3_SongList.ObjectsCount              = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_MP3_SongList+6)
MOVT	R0, #hi_addr(_MP3_SongList+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,822 :: 		MP3_Player.Color                     = 0x4457;
MOVW	R1, #17495
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,823 :: 		MP3_Player.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_MP3_Player+2)
MOVT	R0, #hi_addr(_MP3_Player+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,824 :: 		MP3_Player.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_MP3_Player+4)
MOVT	R0, #hi_addr(_MP3_Player+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,825 :: 		MP3_Player.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_Player+8)
MOVT	R0, #hi_addr(_MP3_Player+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,826 :: 		MP3_Player.LabelsCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MP3_Player+16)
MOVT	R0, #hi_addr(_MP3_Player+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,827 :: 		MP3_Player.Labels                    = Screen8_Labels;
MOVW	R1, #lo_addr(_Screen8_Labels+0)
MOVT	R1, #hi_addr(_Screen8_Labels+0)
MOVW	R0, #lo_addr(_MP3_Player+20)
MOVT	R0, #hi_addr(_MP3_Player+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,828 :: 		MP3_Player.ImagesCount               = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_MP3_Player+24)
MOVT	R0, #hi_addr(_MP3_Player+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,829 :: 		MP3_Player.Images                    = Screen8_Images;
MOVW	R1, #lo_addr(_Screen8_Images+0)
MOVT	R1, #hi_addr(_Screen8_Images+0)
MOVW	R0, #lo_addr(_MP3_Player+28)
MOVT	R0, #hi_addr(_MP3_Player+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,830 :: 		MP3_Player.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_Player+32)
MOVT	R0, #hi_addr(_MP3_Player+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,831 :: 		MP3_Player.BoxesCount                = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MP3_Player+40)
MOVT	R0, #hi_addr(_MP3_Player+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,832 :: 		MP3_Player.Boxes                     = Screen8_Boxes;
MOVW	R1, #lo_addr(_Screen8_Boxes+0)
MOVT	R1, #hi_addr(_Screen8_Boxes+0)
MOVW	R0, #lo_addr(_MP3_Player+44)
MOVT	R0, #hi_addr(_MP3_Player+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,833 :: 		MP3_Player.CheckBoxesCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_Player+48)
MOVT	R0, #hi_addr(_MP3_Player+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,834 :: 		MP3_Player.ObjectsCount              = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_MP3_Player+6)
MOVT	R0, #hi_addr(_MP3_Player+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,836 :: 		Paint.Color                     = 0x4229;
MOVW	R1, #16937
MOVW	R0, #lo_addr(_Paint+0)
MOVT	R0, #hi_addr(_Paint+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,837 :: 		Paint.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Paint+2)
MOVT	R0, #hi_addr(_Paint+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,838 :: 		Paint.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Paint+4)
MOVT	R0, #hi_addr(_Paint+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,839 :: 		Paint.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Paint+8)
MOVT	R0, #hi_addr(_Paint+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,840 :: 		Paint.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Paint+16)
MOVT	R0, #hi_addr(_Paint+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,841 :: 		Paint.Labels                    = Screen9_Labels;
MOVW	R1, #lo_addr(_Screen9_Labels+0)
MOVT	R1, #hi_addr(_Screen9_Labels+0)
MOVW	R0, #lo_addr(_Paint+20)
MOVT	R0, #hi_addr(_Paint+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,842 :: 		Paint.ImagesCount               = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Paint+24)
MOVT	R0, #hi_addr(_Paint+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,843 :: 		Paint.Images                    = Screen9_Images;
MOVW	R1, #lo_addr(_Screen9_Images+0)
MOVT	R1, #hi_addr(_Screen9_Images+0)
MOVW	R0, #lo_addr(_Paint+28)
MOVT	R0, #hi_addr(_Paint+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,844 :: 		Paint.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Paint+32)
MOVT	R0, #hi_addr(_Paint+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,845 :: 		Paint.BoxesCount                = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Paint+40)
MOVT	R0, #hi_addr(_Paint+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,846 :: 		Paint.Boxes                     = Screen9_Boxes;
MOVW	R1, #lo_addr(_Screen9_Boxes+0)
MOVT	R1, #hi_addr(_Screen9_Boxes+0)
MOVW	R0, #lo_addr(_Paint+44)
MOVT	R0, #hi_addr(_Paint+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,847 :: 		Paint.CheckBoxesCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Paint+48)
MOVT	R0, #hi_addr(_Paint+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,848 :: 		Paint.ObjectsCount              = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Paint+6)
MOVT	R0, #hi_addr(_Paint+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,850 :: 		SlideShow.Color                     = 0x4229;
MOVW	R1, #16937
MOVW	R0, #lo_addr(_SlideShow+0)
MOVT	R0, #hi_addr(_SlideShow+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,851 :: 		SlideShow.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_SlideShow+2)
MOVT	R0, #hi_addr(_SlideShow+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,852 :: 		SlideShow.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_SlideShow+4)
MOVT	R0, #hi_addr(_SlideShow+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,853 :: 		SlideShow.ButtonsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SlideShow+8)
MOVT	R0, #hi_addr(_SlideShow+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,854 :: 		SlideShow.LabelsCount               = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_SlideShow+16)
MOVT	R0, #hi_addr(_SlideShow+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,855 :: 		SlideShow.Labels                    = Screen10_Labels;
MOVW	R1, #lo_addr(_Screen10_Labels+0)
MOVT	R1, #hi_addr(_Screen10_Labels+0)
MOVW	R0, #lo_addr(_SlideShow+20)
MOVT	R0, #hi_addr(_SlideShow+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,856 :: 		SlideShow.ImagesCount               = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_SlideShow+24)
MOVT	R0, #hi_addr(_SlideShow+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,857 :: 		SlideShow.Images                    = Screen10_Images;
MOVW	R1, #lo_addr(_Screen10_Images+0)
MOVT	R1, #hi_addr(_Screen10_Images+0)
MOVW	R0, #lo_addr(_SlideShow+28)
MOVT	R0, #hi_addr(_SlideShow+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,858 :: 		SlideShow.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SlideShow+32)
MOVT	R0, #hi_addr(_SlideShow+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,859 :: 		SlideShow.BoxesCount                = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_SlideShow+40)
MOVT	R0, #hi_addr(_SlideShow+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,860 :: 		SlideShow.Boxes                     = Screen10_Boxes;
MOVW	R1, #lo_addr(_Screen10_Boxes+0)
MOVT	R1, #hi_addr(_Screen10_Boxes+0)
MOVW	R0, #lo_addr(_SlideShow+44)
MOVT	R0, #hi_addr(_SlideShow+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,861 :: 		SlideShow.CheckBoxesCount           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SlideShow+48)
MOVT	R0, #hi_addr(_SlideShow+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,862 :: 		SlideShow.ObjectsCount              = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_SlideShow+6)
MOVT	R0, #hi_addr(_SlideShow+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,864 :: 		Tic_Tac_Toe.Color                     = 0xA1AE;
MOVW	R1, #41390
MOVW	R0, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,865 :: 		Tic_Tac_Toe.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Tic_Tac_Toe+2)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+2)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,866 :: 		Tic_Tac_Toe.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Tic_Tac_Toe+4)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+4)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,867 :: 		Tic_Tac_Toe.ButtonsCount              = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Tic_Tac_Toe+8)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,868 :: 		Tic_Tac_Toe.Buttons                   = Screen11_Buttons;
MOVW	R1, #lo_addr(_Screen11_Buttons+0)
MOVT	R1, #hi_addr(_Screen11_Buttons+0)
MOVW	R0, #lo_addr(_Tic_Tac_Toe+12)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+12)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,869 :: 		Tic_Tac_Toe.LabelsCount               = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Tic_Tac_Toe+16)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,870 :: 		Tic_Tac_Toe.Labels                    = Screen11_Labels;
MOVW	R1, #lo_addr(_Screen11_Labels+0)
MOVT	R1, #hi_addr(_Screen11_Labels+0)
MOVW	R0, #lo_addr(_Tic_Tac_Toe+20)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,871 :: 		Tic_Tac_Toe.ImagesCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Tic_Tac_Toe+24)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,872 :: 		Tic_Tac_Toe.Images                    = Screen11_Images;
MOVW	R1, #lo_addr(_Screen11_Images+0)
MOVT	R1, #hi_addr(_Screen11_Images+0)
MOVW	R0, #lo_addr(_Tic_Tac_Toe+28)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,873 :: 		Tic_Tac_Toe.CirclesCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Tic_Tac_Toe+32)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,874 :: 		Tic_Tac_Toe.BoxesCount                = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Tic_Tac_Toe+40)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,875 :: 		Tic_Tac_Toe.Boxes                     = Screen11_Boxes;
MOVW	R1, #lo_addr(_Screen11_Boxes+0)
MOVT	R1, #hi_addr(_Screen11_Boxes+0)
MOVW	R0, #lo_addr(_Tic_Tac_Toe+44)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,876 :: 		Tic_Tac_Toe.CheckBoxesCount           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Tic_Tac_Toe+48)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,877 :: 		Tic_Tac_Toe.CheckBoxes                = Screen11_CheckBoxes;
MOVW	R1, #lo_addr(_Screen11_CheckBoxes+0)
MOVT	R1, #hi_addr(_Screen11_CheckBoxes+0)
MOVW	R0, #lo_addr(_Tic_Tac_Toe+52)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+52)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,878 :: 		Tic_Tac_Toe.ObjectsCount              = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Tic_Tac_Toe+6)
MOVT	R0, #hi_addr(_Tic_Tac_Toe+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,881 :: 		Image1.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,882 :: 		Image1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,883 :: 		Image1.Left            = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,884 :: 		Image1.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,885 :: 		Image1.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,886 :: 		Image1.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,887 :: 		Image1.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,888 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,889 :: 		Image1.Picture_Name    = icon_accel_bmp;
MOVW	R1, #lo_addr(_icon_accel_bmp+0)
MOVT	R1, #hi_addr(_icon_accel_bmp+0)
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,890 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,891 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,892 :: 		Image1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+24)
MOVT	R0, #hi_addr(_Image1+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,893 :: 		Image1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+28)
MOVT	R0, #hi_addr(_Image1+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,894 :: 		Image1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+32)
MOVT	R0, #hi_addr(_Image1+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,895 :: 		Image1.OnPressPtr      = Image1OnPress;
MOVW	R1, #lo_addr(_Image1OnPress+0)
MOVT	R1, #hi_addr(_Image1OnPress+0)
MOVW	R0, #lo_addr(_Image1+36)
MOVT	R0, #hi_addr(_Image1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,897 :: 		Image3.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image3+0)
MOVT	R0, #hi_addr(_Image3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,898 :: 		Image3.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+4)
MOVT	R0, #hi_addr(_Image3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,899 :: 		Image3.Left            = 360;
MOVW	R1, #360
MOVW	R0, #lo_addr(_Image3+6)
MOVT	R0, #hi_addr(_Image3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,900 :: 		Image3.Top             = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image3+8)
MOVT	R0, #hi_addr(_Image3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,901 :: 		Image3.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image3+10)
MOVT	R0, #hi_addr(_Image3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,902 :: 		Image3.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image3+12)
MOVT	R0, #hi_addr(_Image3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,903 :: 		Image3.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+22)
MOVT	R0, #hi_addr(_Image3+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,904 :: 		Image3.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+23)
MOVT	R0, #hi_addr(_Image3+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,905 :: 		Image3.Picture_Name    = icon_rgb_light_bmp;
MOVW	R1, #lo_addr(_icon_rgb_light_bmp+0)
MOVT	R1, #hi_addr(_icon_rgb_light_bmp+0)
MOVW	R0, #lo_addr(_Image3+16)
MOVT	R0, #hi_addr(_Image3+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,906 :: 		Image3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+20)
MOVT	R0, #hi_addr(_Image3+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,907 :: 		Image3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+21)
MOVT	R0, #hi_addr(_Image3+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,908 :: 		Image3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+24)
MOVT	R0, #hi_addr(_Image3+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,909 :: 		Image3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+28)
MOVT	R0, #hi_addr(_Image3+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,910 :: 		Image3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image3+32)
MOVT	R0, #hi_addr(_Image3+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,911 :: 		Image3.OnPressPtr      = Image3OnPress;
MOVW	R1, #lo_addr(_Image3OnPress+0)
MOVT	R1, #hi_addr(_Image3OnPress+0)
MOVW	R0, #lo_addr(_Image3+36)
MOVT	R0, #hi_addr(_Image3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,913 :: 		Label5.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,914 :: 		Label5.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,915 :: 		Label5.Left            = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,916 :: 		Label5.Top             = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,917 :: 		Label5.Width           = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,918 :: 		Label5.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,919 :: 		Label5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,920 :: 		Label5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,921 :: 		Label5.Caption         = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,922 :: 		Label5.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R5, #lo_addr(_Open_Sans_Light19x28_Regular+0)
MOVT	R5, #hi_addr(_Open_Sans_Light19x28_Regular+0)
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,923 :: 		Label5.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,924 :: 		Label5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,925 :: 		Label5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+32)
MOVT	R0, #hi_addr(_Label5+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,926 :: 		Label5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+36)
MOVT	R0, #hi_addr(_Label5+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,927 :: 		Label5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+40)
MOVT	R0, #hi_addr(_Label5+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,929 :: 		Label7.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label7+0)
MOVT	R0, #hi_addr(_Label7+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,930 :: 		Label7.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label7+4)
MOVT	R0, #hi_addr(_Label7+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,931 :: 		Label7.Left            = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label7+6)
MOVT	R0, #hi_addr(_Label7+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,932 :: 		Label7.Top             = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Label7+8)
MOVT	R0, #hi_addr(_Label7+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,933 :: 		Label7.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Label7+10)
MOVT	R0, #hi_addr(_Label7+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,934 :: 		Label7.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label7+12)
MOVT	R0, #hi_addr(_Label7+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,935 :: 		Label7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+26)
MOVT	R0, #hi_addr(_Label7+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,936 :: 		Label7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+27)
MOVT	R0, #hi_addr(_Label7+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,937 :: 		Label7.Caption         = Label7_Caption;
MOVW	R1, #lo_addr(_Label7_Caption+0)
MOVT	R1, #hi_addr(_Label7_Caption+0)
MOVW	R0, #lo_addr(_Label7+16)
MOVT	R0, #hi_addr(_Label7+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,938 :: 		Label7.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R4, #lo_addr(_Open_Sans_Light14x22_Regular+0)
MOVT	R4, #hi_addr(_Open_Sans_Light14x22_Regular+0)
MOVW	R0, #lo_addr(_Label7+20)
MOVT	R0, #hi_addr(_Label7+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,939 :: 		Label7.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label7+24)
MOVT	R0, #hi_addr(_Label7+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,940 :: 		Label7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+28)
MOVT	R0, #hi_addr(_Label7+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,941 :: 		Label7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+32)
MOVT	R0, #hi_addr(_Label7+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,942 :: 		Label7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+36)
MOVT	R0, #hi_addr(_Label7+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,943 :: 		Label7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+40)
MOVT	R0, #hi_addr(_Label7+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,945 :: 		Label8.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label8+0)
MOVT	R0, #hi_addr(_Label8+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,946 :: 		Label8.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label8+4)
MOVT	R0, #hi_addr(_Label8+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,947 :: 		Label8.Left            = 368;
MOVW	R1, #368
MOVW	R0, #lo_addr(_Label8+6)
MOVT	R0, #hi_addr(_Label8+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,948 :: 		Label8.Top             = 230;
MOVS	R1, #230
MOVW	R0, #lo_addr(_Label8+8)
MOVT	R0, #hi_addr(_Label8+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,949 :: 		Label8.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Label8+10)
MOVT	R0, #hi_addr(_Label8+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,950 :: 		Label8.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label8+12)
MOVT	R0, #hi_addr(_Label8+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,951 :: 		Label8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+26)
MOVT	R0, #hi_addr(_Label8+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,952 :: 		Label8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+27)
MOVT	R0, #hi_addr(_Label8+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,953 :: 		Label8.Caption         = Label8_Caption;
MOVW	R1, #lo_addr(_Label8_Caption+0)
MOVT	R1, #hi_addr(_Label8_Caption+0)
MOVW	R0, #lo_addr(_Label8+16)
MOVT	R0, #hi_addr(_Label8+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,954 :: 		Label8.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label8+20)
MOVT	R0, #hi_addr(_Label8+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,955 :: 		Label8.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label8+24)
MOVT	R0, #hi_addr(_Label8+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,956 :: 		Label8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+28)
MOVT	R0, #hi_addr(_Label8+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,957 :: 		Label8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+32)
MOVT	R0, #hi_addr(_Label8+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,958 :: 		Label8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+36)
MOVT	R0, #hi_addr(_Label8+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,959 :: 		Label8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+40)
MOVT	R0, #hi_addr(_Label8+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,961 :: 		Image6.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image6+0)
MOVT	R0, #hi_addr(_Image6+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,962 :: 		Image6.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image6+4)
MOVT	R0, #hi_addr(_Image6+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,963 :: 		Image6.Left            = 150;
MOVS	R1, #150
MOVW	R0, #lo_addr(_Image6+6)
MOVT	R0, #hi_addr(_Image6+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,964 :: 		Image6.Top             = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image6+8)
MOVT	R0, #hi_addr(_Image6+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,965 :: 		Image6.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image6+10)
MOVT	R0, #hi_addr(_Image6+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,966 :: 		Image6.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image6+12)
MOVT	R0, #hi_addr(_Image6+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,967 :: 		Image6.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+22)
MOVT	R0, #hi_addr(_Image6+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,968 :: 		Image6.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+23)
MOVT	R0, #hi_addr(_Image6+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,969 :: 		Image6.Picture_Name    = icon_clock_bmp;
MOVW	R1, #lo_addr(_icon_clock_bmp+0)
MOVT	R1, #hi_addr(_icon_clock_bmp+0)
MOVW	R0, #lo_addr(_Image6+16)
MOVT	R0, #hi_addr(_Image6+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,970 :: 		Image6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+20)
MOVT	R0, #hi_addr(_Image6+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,971 :: 		Image6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+21)
MOVT	R0, #hi_addr(_Image6+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,972 :: 		Image6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+24)
MOVT	R0, #hi_addr(_Image6+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,973 :: 		Image6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+28)
MOVT	R0, #hi_addr(_Image6+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,974 :: 		Image6.OnClickPtr      = Image6OnClick;
MOVW	R1, #lo_addr(_Image6OnClick+0)
MOVT	R1, #hi_addr(_Image6OnClick+0)
MOVW	R0, #lo_addr(_Image6+32)
MOVT	R0, #hi_addr(_Image6+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,975 :: 		Image6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image6+36)
MOVT	R0, #hi_addr(_Image6+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,977 :: 		Label14.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label14+0)
MOVT	R0, #hi_addr(_Label14+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,978 :: 		Label14.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label14+4)
MOVT	R0, #hi_addr(_Label14+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,979 :: 		Label14.Left            = 168;
MOVS	R1, #168
MOVW	R0, #lo_addr(_Label14+6)
MOVT	R0, #hi_addr(_Label14+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,980 :: 		Label14.Top             = 230;
MOVS	R1, #230
MOVW	R0, #lo_addr(_Label14+8)
MOVT	R0, #hi_addr(_Label14+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,981 :: 		Label14.Width           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_Label14+10)
MOVT	R0, #hi_addr(_Label14+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,982 :: 		Label14.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label14+12)
MOVT	R0, #hi_addr(_Label14+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,983 :: 		Label14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+26)
MOVT	R0, #hi_addr(_Label14+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,984 :: 		Label14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+27)
MOVT	R0, #hi_addr(_Label14+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,985 :: 		Label14.Caption         = Label14_Caption;
MOVW	R1, #lo_addr(_Label14_Caption+0)
MOVT	R1, #hi_addr(_Label14_Caption+0)
MOVW	R0, #lo_addr(_Label14+16)
MOVT	R0, #hi_addr(_Label14+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,986 :: 		Label14.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label14+20)
MOVT	R0, #hi_addr(_Label14+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,987 :: 		Label14.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label14+24)
MOVT	R0, #hi_addr(_Label14+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,988 :: 		Label14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+28)
MOVT	R0, #hi_addr(_Label14+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,989 :: 		Label14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+32)
MOVT	R0, #hi_addr(_Label14+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,990 :: 		Label14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+36)
MOVT	R0, #hi_addr(_Label14+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,991 :: 		Label14.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+40)
MOVT	R0, #hi_addr(_Label14+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,993 :: 		Image10.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image10+0)
MOVT	R0, #hi_addr(_Image10+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,994 :: 		Image10.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Image10+4)
MOVT	R0, #hi_addr(_Image10+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,995 :: 		Image10.Left            = 392;
MOVW	R1, #392
MOVW	R0, #lo_addr(_Image10+6)
MOVT	R0, #hi_addr(_Image10+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,996 :: 		Image10.Top             = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Image10+8)
MOVT	R0, #hi_addr(_Image10+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,997 :: 		Image10.Width           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Image10+10)
MOVT	R0, #hi_addr(_Image10+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,998 :: 		Image10.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Image10+12)
MOVT	R0, #hi_addr(_Image10+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,999 :: 		Image10.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+22)
MOVT	R0, #hi_addr(_Image10+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1000 :: 		Image10.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+23)
MOVT	R0, #hi_addr(_Image10+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1001 :: 		Image10.Picture_Name    = icon_time_bmp;
MOVW	R1, #lo_addr(_icon_time_bmp+0)
MOVT	R1, #hi_addr(_icon_time_bmp+0)
MOVW	R0, #lo_addr(_Image10+16)
MOVT	R0, #hi_addr(_Image10+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1002 :: 		Image10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+20)
MOVT	R0, #hi_addr(_Image10+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1003 :: 		Image10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image10+21)
MOVT	R0, #hi_addr(_Image10+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1004 :: 		Image10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+24)
MOVT	R0, #hi_addr(_Image10+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1005 :: 		Image10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+28)
MOVT	R0, #hi_addr(_Image10+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1006 :: 		Image10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+32)
MOVT	R0, #hi_addr(_Image10+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1007 :: 		Image10.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image10+36)
MOVT	R0, #hi_addr(_Image10+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1009 :: 		Label19.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label19+0)
MOVT	R0, #hi_addr(_Label19+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1010 :: 		Label19.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Label19+4)
MOVT	R0, #hi_addr(_Label19+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1011 :: 		Label19.Left            = 416;
MOVW	R1, #416
MOVW	R0, #lo_addr(_Label19+6)
MOVT	R0, #hi_addr(_Label19+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1012 :: 		Label19.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label19+8)
MOVT	R0, #hi_addr(_Label19+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1013 :: 		Label19.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_Label19+10)
MOVT	R0, #hi_addr(_Label19+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1014 :: 		Label19.Height          = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label19+12)
MOVT	R0, #hi_addr(_Label19+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1015 :: 		Label19.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+26)
MOVT	R0, #hi_addr(_Label19+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1016 :: 		Label19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+27)
MOVT	R0, #hi_addr(_Label19+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1017 :: 		Label19.Caption         = Label19_Caption;
MOVW	R1, #lo_addr(_Label19_Caption+0)
MOVT	R1, #hi_addr(_Label19_Caption+0)
MOVW	R0, #lo_addr(_Label19+16)
MOVT	R0, #hi_addr(_Label19+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1018 :: 		Label19.FontName        = Open_Sans_Light12x18_Regular;
MOVW	R3, #lo_addr(_Open_Sans_Light12x18_Regular+0)
MOVT	R3, #hi_addr(_Open_Sans_Light12x18_Regular+0)
MOVW	R0, #lo_addr(_Label19+20)
MOVT	R0, #hi_addr(_Label19+20)
STR	R3, [R0, #0]
;mikromedia_STM32plus_driver.c,1019 :: 		Label19.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label19+24)
MOVT	R0, #hi_addr(_Label19+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1020 :: 		Label19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+28)
MOVT	R0, #hi_addr(_Label19+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1021 :: 		Label19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+32)
MOVT	R0, #hi_addr(_Label19+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1022 :: 		Label19.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+36)
MOVT	R0, #hi_addr(_Label19+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1023 :: 		Label19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+40)
MOVT	R0, #hi_addr(_Label19+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1025 :: 		Image9.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image9+0)
MOVT	R0, #hi_addr(_Image9+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1026 :: 		Image9.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Image9+4)
MOVT	R0, #hi_addr(_Image9+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1027 :: 		Image9.Left            = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Image9+6)
MOVT	R0, #hi_addr(_Image9+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1028 :: 		Image9.Top             = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image9+8)
MOVT	R0, #hi_addr(_Image9+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1029 :: 		Image9.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image9+10)
MOVT	R0, #hi_addr(_Image9+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1030 :: 		Image9.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image9+12)
MOVT	R0, #hi_addr(_Image9+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1031 :: 		Image9.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+22)
MOVT	R0, #hi_addr(_Image9+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1032 :: 		Image9.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+23)
MOVT	R0, #hi_addr(_Image9+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1033 :: 		Image9.Picture_Name    = icon_temp_bmp;
MOVW	R1, #lo_addr(_icon_temp_bmp+0)
MOVT	R1, #hi_addr(_icon_temp_bmp+0)
MOVW	R0, #lo_addr(_Image9+16)
MOVT	R0, #hi_addr(_Image9+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1034 :: 		Image9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+20)
MOVT	R0, #hi_addr(_Image9+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1035 :: 		Image9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image9+21)
MOVT	R0, #hi_addr(_Image9+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1036 :: 		Image9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+24)
MOVT	R0, #hi_addr(_Image9+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1037 :: 		Image9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+28)
MOVT	R0, #hi_addr(_Image9+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1038 :: 		Image9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image9+32)
MOVT	R0, #hi_addr(_Image9+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1039 :: 		Image9.OnPressPtr      = Image9OnPress;
MOVW	R1, #lo_addr(_Image9OnPress+0)
MOVT	R1, #hi_addr(_Image9OnPress+0)
MOVW	R0, #lo_addr(_Image9+36)
MOVT	R0, #hi_addr(_Image9+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1041 :: 		Label20.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label20+0)
MOVT	R0, #hi_addr(_Label20+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1042 :: 		Label20.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label20+4)
MOVT	R0, #hi_addr(_Label20+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1043 :: 		Label20.Left            = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_Label20+6)
MOVT	R0, #hi_addr(_Label20+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1044 :: 		Label20.Top             = 230;
MOVS	R1, #230
MOVW	R0, #lo_addr(_Label20+8)
MOVT	R0, #hi_addr(_Label20+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1045 :: 		Label20.Width           = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Label20+10)
MOVT	R0, #hi_addr(_Label20+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1046 :: 		Label20.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label20+12)
MOVT	R0, #hi_addr(_Label20+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1047 :: 		Label20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+26)
MOVT	R0, #hi_addr(_Label20+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1048 :: 		Label20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+27)
MOVT	R0, #hi_addr(_Label20+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1049 :: 		Label20.Caption         = Label20_Caption;
MOVW	R1, #lo_addr(_Label20_Caption+0)
MOVT	R1, #hi_addr(_Label20_Caption+0)
MOVW	R0, #lo_addr(_Label20+16)
MOVT	R0, #hi_addr(_Label20+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1050 :: 		Label20.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label20+20)
MOVT	R0, #hi_addr(_Label20+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1051 :: 		Label20.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label20+24)
MOVT	R0, #hi_addr(_Label20+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1052 :: 		Label20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+28)
MOVT	R0, #hi_addr(_Label20+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1053 :: 		Label20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+32)
MOVT	R0, #hi_addr(_Label20+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1054 :: 		Label20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+36)
MOVT	R0, #hi_addr(_Label20+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1055 :: 		Label20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+40)
MOVT	R0, #hi_addr(_Label20+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1057 :: 		Image16.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image16+0)
MOVT	R0, #hi_addr(_Image16+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1058 :: 		Image16.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Image16+4)
MOVT	R0, #hi_addr(_Image16+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1059 :: 		Image16.Left            = 360;
MOVW	R1, #360
MOVW	R0, #lo_addr(_Image16+6)
MOVT	R0, #hi_addr(_Image16+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1060 :: 		Image16.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Image16+8)
MOVT	R0, #hi_addr(_Image16+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1061 :: 		Image16.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image16+10)
MOVT	R0, #hi_addr(_Image16+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1062 :: 		Image16.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image16+12)
MOVT	R0, #hi_addr(_Image16+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1063 :: 		Image16.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+22)
MOVT	R0, #hi_addr(_Image16+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1064 :: 		Image16.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+23)
MOVT	R0, #hi_addr(_Image16+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1065 :: 		Image16.Picture_Name    = icon_mp3_player_bmp;
MOVW	R1, #lo_addr(_icon_mp3_player_bmp+0)
MOVT	R1, #hi_addr(_icon_mp3_player_bmp+0)
MOVW	R0, #lo_addr(_Image16+16)
MOVT	R0, #hi_addr(_Image16+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1066 :: 		Image16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+20)
MOVT	R0, #hi_addr(_Image16+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1067 :: 		Image16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image16+21)
MOVT	R0, #hi_addr(_Image16+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1068 :: 		Image16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+24)
MOVT	R0, #hi_addr(_Image16+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1069 :: 		Image16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+28)
MOVT	R0, #hi_addr(_Image16+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1070 :: 		Image16.OnClickPtr      = Image16OnClick;
MOVW	R1, #lo_addr(_Image16OnClick+0)
MOVT	R1, #hi_addr(_Image16OnClick+0)
MOVW	R0, #lo_addr(_Image16+32)
MOVT	R0, #hi_addr(_Image16+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1071 :: 		Image16.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image16+36)
MOVT	R0, #hi_addr(_Image16+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1073 :: 		Label25.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label25+0)
MOVT	R0, #hi_addr(_Label25+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1074 :: 		Label25.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label25+4)
MOVT	R0, #hi_addr(_Label25+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1075 :: 		Label25.Left            = 360;
MOVW	R1, #360
MOVW	R0, #lo_addr(_Label25+6)
MOVT	R0, #hi_addr(_Label25+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1076 :: 		Label25.Top             = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Label25+8)
MOVT	R0, #hi_addr(_Label25+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1077 :: 		Label25.Width           = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label25+10)
MOVT	R0, #hi_addr(_Label25+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1078 :: 		Label25.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label25+12)
MOVT	R0, #hi_addr(_Label25+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1079 :: 		Label25.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+26)
MOVT	R0, #hi_addr(_Label25+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1080 :: 		Label25.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+27)
MOVT	R0, #hi_addr(_Label25+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1081 :: 		Label25.Caption         = Label25_Caption;
MOVW	R1, #lo_addr(_Label25_Caption+0)
MOVT	R1, #hi_addr(_Label25_Caption+0)
MOVW	R0, #lo_addr(_Label25+16)
MOVT	R0, #hi_addr(_Label25+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1082 :: 		Label25.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label25+20)
MOVT	R0, #hi_addr(_Label25+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1083 :: 		Label25.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label25+24)
MOVT	R0, #hi_addr(_Label25+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1084 :: 		Label25.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+28)
MOVT	R0, #hi_addr(_Label25+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1085 :: 		Label25.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+32)
MOVT	R0, #hi_addr(_Label25+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1086 :: 		Label25.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+36)
MOVT	R0, #hi_addr(_Label25+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1087 :: 		Label25.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+40)
MOVT	R0, #hi_addr(_Label25+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1089 :: 		Image24.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image24+0)
MOVT	R0, #hi_addr(_Image24+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1090 :: 		Image24.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Image24+4)
MOVT	R0, #hi_addr(_Image24+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1091 :: 		Image24.Left            = 150;
MOVS	R1, #150
MOVW	R0, #lo_addr(_Image24+6)
MOVT	R0, #hi_addr(_Image24+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1092 :: 		Image24.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Image24+8)
MOVT	R0, #hi_addr(_Image24+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1093 :: 		Image24.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image24+10)
MOVT	R0, #hi_addr(_Image24+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1094 :: 		Image24.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image24+12)
MOVT	R0, #hi_addr(_Image24+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1095 :: 		Image24.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+22)
MOVT	R0, #hi_addr(_Image24+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1096 :: 		Image24.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+23)
MOVT	R0, #hi_addr(_Image24+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1097 :: 		Image24.Picture_Name    = icon_paint_bmp;
MOVW	R1, #lo_addr(_icon_paint_bmp+0)
MOVT	R1, #hi_addr(_icon_paint_bmp+0)
MOVW	R0, #lo_addr(_Image24+16)
MOVT	R0, #hi_addr(_Image24+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1098 :: 		Image24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+20)
MOVT	R0, #hi_addr(_Image24+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1099 :: 		Image24.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image24+21)
MOVT	R0, #hi_addr(_Image24+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1100 :: 		Image24.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+24)
MOVT	R0, #hi_addr(_Image24+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1101 :: 		Image24.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+28)
MOVT	R0, #hi_addr(_Image24+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1102 :: 		Image24.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image24+32)
MOVT	R0, #hi_addr(_Image24+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1103 :: 		Image24.OnPressPtr      = Image24OnPress;
MOVW	R1, #lo_addr(_Image24OnPress+0)
MOVT	R1, #hi_addr(_Image24OnPress+0)
MOVW	R0, #lo_addr(_Image24+36)
MOVT	R0, #hi_addr(_Image24+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1105 :: 		Label30.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label30+0)
MOVT	R0, #hi_addr(_Label30+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1106 :: 		Label30.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label30+4)
MOVT	R0, #hi_addr(_Label30+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1107 :: 		Label30.Left            = 168;
MOVS	R1, #168
MOVW	R0, #lo_addr(_Label30+6)
MOVT	R0, #hi_addr(_Label30+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1108 :: 		Label30.Top             = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Label30+8)
MOVT	R0, #hi_addr(_Label30+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1109 :: 		Label30.Width           = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Label30+10)
MOVT	R0, #hi_addr(_Label30+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1110 :: 		Label30.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label30+12)
MOVT	R0, #hi_addr(_Label30+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1111 :: 		Label30.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label30+26)
MOVT	R0, #hi_addr(_Label30+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1112 :: 		Label30.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label30+27)
MOVT	R0, #hi_addr(_Label30+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1113 :: 		Label30.Caption         = Label30_Caption;
MOVW	R1, #lo_addr(_Label30_Caption+0)
MOVT	R1, #hi_addr(_Label30_Caption+0)
MOVW	R0, #lo_addr(_Label30+16)
MOVT	R0, #hi_addr(_Label30+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1114 :: 		Label30.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label30+20)
MOVT	R0, #hi_addr(_Label30+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1115 :: 		Label30.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label30+24)
MOVT	R0, #hi_addr(_Label30+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1116 :: 		Label30.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+28)
MOVT	R0, #hi_addr(_Label30+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1117 :: 		Label30.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+32)
MOVT	R0, #hi_addr(_Label30+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1118 :: 		Label30.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+36)
MOVT	R0, #hi_addr(_Label30+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1119 :: 		Label30.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label30+40)
MOVT	R0, #hi_addr(_Label30+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1121 :: 		Image18.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Image18+0)
MOVT	R0, #hi_addr(_Image18+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1122 :: 		Image18.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Image18+4)
MOVT	R0, #hi_addr(_Image18+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1123 :: 		Image18.Left            = 255;
MOVS	R1, #255
MOVW	R0, #lo_addr(_Image18+6)
MOVT	R0, #hi_addr(_Image18+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1124 :: 		Image18.Top             = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Image18+8)
MOVT	R0, #hi_addr(_Image18+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1125 :: 		Image18.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image18+10)
MOVT	R0, #hi_addr(_Image18+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1126 :: 		Image18.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image18+12)
MOVT	R0, #hi_addr(_Image18+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1127 :: 		Image18.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+22)
MOVT	R0, #hi_addr(_Image18+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1128 :: 		Image18.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+23)
MOVT	R0, #hi_addr(_Image18+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1129 :: 		Image18.Picture_Name    = icon_slide_show_bmp;
MOVW	R1, #lo_addr(_icon_slide_show_bmp+0)
MOVT	R1, #hi_addr(_icon_slide_show_bmp+0)
MOVW	R0, #lo_addr(_Image18+16)
MOVT	R0, #hi_addr(_Image18+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1130 :: 		Image18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+20)
MOVT	R0, #hi_addr(_Image18+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1131 :: 		Image18.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image18+21)
MOVT	R0, #hi_addr(_Image18+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1132 :: 		Image18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+24)
MOVT	R0, #hi_addr(_Image18+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1133 :: 		Image18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+28)
MOVT	R0, #hi_addr(_Image18+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1134 :: 		Image18.OnClickPtr      = Image18OnClick;
MOVW	R1, #lo_addr(_Image18OnClick+0)
MOVT	R1, #hi_addr(_Image18OnClick+0)
MOVW	R0, #lo_addr(_Image18+32)
MOVT	R0, #hi_addr(_Image18+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1135 :: 		Image18.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image18+36)
MOVT	R0, #hi_addr(_Image18+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1137 :: 		Label34.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label34+0)
MOVT	R0, #hi_addr(_Label34+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1138 :: 		Label34.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label34+4)
MOVT	R0, #hi_addr(_Label34+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1139 :: 		Label34.Left            = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_Label34+6)
MOVT	R0, #hi_addr(_Label34+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1140 :: 		Label34.Top             = 230;
MOVS	R1, #230
MOVW	R0, #lo_addr(_Label34+8)
MOVT	R0, #hi_addr(_Label34+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1141 :: 		Label34.Width           = 82;
MOVS	R1, #82
MOVW	R0, #lo_addr(_Label34+10)
MOVT	R0, #hi_addr(_Label34+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1142 :: 		Label34.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label34+12)
MOVT	R0, #hi_addr(_Label34+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1143 :: 		Label34.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label34+26)
MOVT	R0, #hi_addr(_Label34+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1144 :: 		Label34.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label34+27)
MOVT	R0, #hi_addr(_Label34+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1145 :: 		Label34.Caption         = Label34_Caption;
MOVW	R1, #lo_addr(_Label34_Caption+0)
MOVT	R1, #hi_addr(_Label34_Caption+0)
MOVW	R0, #lo_addr(_Label34+16)
MOVT	R0, #hi_addr(_Label34+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1146 :: 		Label34.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label34+20)
MOVT	R0, #hi_addr(_Label34+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1147 :: 		Label34.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label34+24)
MOVT	R0, #hi_addr(_Label34+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1148 :: 		Label34.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+28)
MOVT	R0, #hi_addr(_Label34+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1149 :: 		Label34.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+32)
MOVT	R0, #hi_addr(_Label34+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1150 :: 		Label34.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+36)
MOVT	R0, #hi_addr(_Label34+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1151 :: 		Label34.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label34+40)
MOVT	R0, #hi_addr(_Label34+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1153 :: 		TicTacToe.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_TicTacToe+0)
MOVT	R0, #hi_addr(_TicTacToe+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1154 :: 		TicTacToe.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_TicTacToe+4)
MOVT	R0, #hi_addr(_TicTacToe+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1155 :: 		TicTacToe.Left            = 255;
MOVS	R1, #255
MOVW	R0, #lo_addr(_TicTacToe+6)
MOVT	R0, #hi_addr(_TicTacToe+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1156 :: 		TicTacToe.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_TicTacToe+8)
MOVT	R0, #hi_addr(_TicTacToe+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1157 :: 		TicTacToe.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_TicTacToe+10)
MOVT	R0, #hi_addr(_TicTacToe+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1158 :: 		TicTacToe.Height          = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_TicTacToe+12)
MOVT	R0, #hi_addr(_TicTacToe+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1159 :: 		TicTacToe.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TicTacToe+22)
MOVT	R0, #hi_addr(_TicTacToe+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1160 :: 		TicTacToe.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TicTacToe+23)
MOVT	R0, #hi_addr(_TicTacToe+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1161 :: 		TicTacToe.Picture_Name    = icon_tic_tac_toe_bmp;
MOVW	R1, #lo_addr(_icon_tic_tac_toe_bmp+0)
MOVT	R1, #hi_addr(_icon_tic_tac_toe_bmp+0)
MOVW	R0, #lo_addr(_TicTacToe+16)
MOVT	R0, #hi_addr(_TicTacToe+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1162 :: 		TicTacToe.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TicTacToe+20)
MOVT	R0, #hi_addr(_TicTacToe+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1163 :: 		TicTacToe.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TicTacToe+21)
MOVT	R0, #hi_addr(_TicTacToe+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1164 :: 		TicTacToe.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TicTacToe+24)
MOVT	R0, #hi_addr(_TicTacToe+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1165 :: 		TicTacToe.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TicTacToe+28)
MOVT	R0, #hi_addr(_TicTacToe+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1166 :: 		TicTacToe.OnClickPtr      = Image22OnClick;
MOVW	R1, #lo_addr(_Image22OnClick+0)
MOVT	R1, #hi_addr(_Image22OnClick+0)
MOVW	R0, #lo_addr(_TicTacToe+32)
MOVT	R0, #hi_addr(_TicTacToe+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1167 :: 		TicTacToe.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TicTacToe+36)
MOVT	R0, #hi_addr(_TicTacToe+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1169 :: 		Label40.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_Label40+0)
MOVT	R0, #hi_addr(_Label40+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1170 :: 		Label40.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Label40+4)
MOVT	R0, #hi_addr(_Label40+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1171 :: 		Label40.Left            = 253;
MOVS	R1, #253
MOVW	R0, #lo_addr(_Label40+6)
MOVT	R0, #hi_addr(_Label40+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1172 :: 		Label40.Top             = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Label40+8)
MOVT	R0, #hi_addr(_Label40+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1173 :: 		Label40.Width           = 87;
MOVS	R1, #87
MOVW	R0, #lo_addr(_Label40+10)
MOVT	R0, #hi_addr(_Label40+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1174 :: 		Label40.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label40+12)
MOVT	R0, #hi_addr(_Label40+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1175 :: 		Label40.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label40+26)
MOVT	R0, #hi_addr(_Label40+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1176 :: 		Label40.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label40+27)
MOVT	R0, #hi_addr(_Label40+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1177 :: 		Label40.Caption         = Label40_Caption;
MOVW	R1, #lo_addr(_Label40_Caption+0)
MOVT	R1, #hi_addr(_Label40_Caption+0)
MOVW	R0, #lo_addr(_Label40+16)
MOVT	R0, #hi_addr(_Label40+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1178 :: 		Label40.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label40+20)
MOVT	R0, #hi_addr(_Label40+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1179 :: 		Label40.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label40+24)
MOVT	R0, #hi_addr(_Label40+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1180 :: 		Label40.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+28)
MOVT	R0, #hi_addr(_Label40+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1181 :: 		Label40.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+32)
MOVT	R0, #hi_addr(_Label40+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1182 :: 		Label40.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+36)
MOVT	R0, #hi_addr(_Label40+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1183 :: 		Label40.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label40+40)
MOVT	R0, #hi_addr(_Label40+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1185 :: 		BatteryStatus.OwnerScreen     = &Home;
MOVW	R1, #lo_addr(_Home+0)
MOVT	R1, #hi_addr(_Home+0)
MOVW	R0, #lo_addr(_BatteryStatus+0)
MOVT	R0, #hi_addr(_BatteryStatus+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1186 :: 		BatteryStatus.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_BatteryStatus+4)
MOVT	R0, #hi_addr(_BatteryStatus+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1187 :: 		BatteryStatus.Left            = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_BatteryStatus+6)
MOVT	R0, #hi_addr(_BatteryStatus+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1188 :: 		BatteryStatus.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_BatteryStatus+8)
MOVT	R0, #hi_addr(_BatteryStatus+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1189 :: 		BatteryStatus.Width           = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_BatteryStatus+10)
MOVT	R0, #hi_addr(_BatteryStatus+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1190 :: 		BatteryStatus.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_BatteryStatus+12)
MOVT	R0, #hi_addr(_BatteryStatus+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1191 :: 		BatteryStatus.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+22)
MOVT	R0, #hi_addr(_BatteryStatus+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1192 :: 		BatteryStatus.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BatteryStatus+23)
MOVT	R0, #hi_addr(_BatteryStatus+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1193 :: 		BatteryStatus.Picture_Name    = icon_battery_bmp;
MOVW	R1, #lo_addr(_icon_battery_bmp+0)
MOVT	R1, #hi_addr(_icon_battery_bmp+0)
MOVW	R0, #lo_addr(_BatteryStatus+16)
MOVT	R0, #hi_addr(_BatteryStatus+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1194 :: 		BatteryStatus.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BatteryStatus+20)
MOVT	R0, #hi_addr(_BatteryStatus+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1195 :: 		BatteryStatus.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+21)
MOVT	R0, #hi_addr(_BatteryStatus+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1196 :: 		BatteryStatus.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+24)
MOVT	R0, #hi_addr(_BatteryStatus+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1197 :: 		BatteryStatus.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+28)
MOVT	R0, #hi_addr(_BatteryStatus+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1198 :: 		BatteryStatus.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+32)
MOVT	R0, #hi_addr(_BatteryStatus+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1199 :: 		BatteryStatus.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BatteryStatus+36)
MOVT	R0, #hi_addr(_BatteryStatus+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1201 :: 		Box23.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Box23+0)
MOVT	R0, #hi_addr(_Box23+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1202 :: 		Box23.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+4)
MOVT	R0, #hi_addr(_Box23+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1203 :: 		Box23.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box23+6)
MOVT	R0, #hi_addr(_Box23+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1204 :: 		Box23.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box23+8)
MOVT	R0, #hi_addr(_Box23+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1205 :: 		Box23.Width           = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Box23+10)
MOVT	R0, #hi_addr(_Box23+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1206 :: 		Box23.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box23+12)
MOVT	R0, #hi_addr(_Box23+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1207 :: 		Box23.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+14)
MOVT	R0, #hi_addr(_Box23+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1208 :: 		Box23.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+16)
MOVT	R0, #hi_addr(_Box23+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1209 :: 		Box23.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+18)
MOVT	R0, #hi_addr(_Box23+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1210 :: 		Box23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+19)
MOVT	R0, #hi_addr(_Box23+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1211 :: 		Box23.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box23+20)
MOVT	R0, #hi_addr(_Box23+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1212 :: 		Box23.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+21)
MOVT	R0, #hi_addr(_Box23+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1213 :: 		Box23.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+22)
MOVT	R0, #hi_addr(_Box23+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1214 :: 		Box23.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box23+24)
MOVT	R0, #hi_addr(_Box23+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1215 :: 		Box23.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box23+26)
MOVT	R0, #hi_addr(_Box23+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1216 :: 		Box23.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box23+28)
MOVT	R0, #hi_addr(_Box23+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1217 :: 		Box23.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+30)
MOVT	R0, #hi_addr(_Box23+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1218 :: 		Box23.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box23+32)
MOVT	R0, #hi_addr(_Box23+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1219 :: 		Box23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+36)
MOVT	R0, #hi_addr(_Box23+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1220 :: 		Box23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+40)
MOVT	R0, #hi_addr(_Box23+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1221 :: 		Box23.OnClickPtr      = Image2OnPress;
MOVW	R1, #lo_addr(_Image2OnPress+0)
MOVT	R1, #hi_addr(_Image2OnPress+0)
MOVW	R0, #lo_addr(_Box23+44)
MOVT	R0, #hi_addr(_Box23+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1222 :: 		Box23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box23+48)
MOVT	R0, #hi_addr(_Box23+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1224 :: 		Box1.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1225 :: 		Box1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+4)
MOVT	R0, #hi_addr(_Box1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1226 :: 		Box1.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+6)
MOVT	R0, #hi_addr(_Box1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1227 :: 		Box1.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Box1+8)
MOVT	R0, #hi_addr(_Box1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1228 :: 		Box1.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box1+10)
MOVT	R0, #hi_addr(_Box1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1229 :: 		Box1.Height          = 207;
MOVS	R1, #207
MOVW	R0, #lo_addr(_Box1+12)
MOVT	R0, #hi_addr(_Box1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1230 :: 		Box1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+14)
MOVT	R0, #hi_addr(_Box1+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1231 :: 		Box1.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+16)
MOVT	R0, #hi_addr(_Box1+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1232 :: 		Box1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+18)
MOVT	R0, #hi_addr(_Box1+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1233 :: 		Box1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+19)
MOVT	R0, #hi_addr(_Box1+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1234 :: 		Box1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+20)
MOVT	R0, #hi_addr(_Box1+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1235 :: 		Box1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+21)
MOVT	R0, #hi_addr(_Box1+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1236 :: 		Box1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+22)
MOVT	R0, #hi_addr(_Box1+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1237 :: 		Box1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+24)
MOVT	R0, #hi_addr(_Box1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1238 :: 		Box1.Gradient_End_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+26)
MOVT	R0, #hi_addr(_Box1+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1239 :: 		Box1.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+28)
MOVT	R0, #hi_addr(_Box1+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1240 :: 		Box1.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+30)
MOVT	R0, #hi_addr(_Box1+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1241 :: 		Box1.Press_Color     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+32)
MOVT	R0, #hi_addr(_Box1+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1242 :: 		Box1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+36)
MOVT	R0, #hi_addr(_Box1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1243 :: 		Box1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+40)
MOVT	R0, #hi_addr(_Box1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1244 :: 		Box1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+44)
MOVT	R0, #hi_addr(_Box1+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1245 :: 		Box1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+48)
MOVT	R0, #hi_addr(_Box1+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1247 :: 		Image2.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Image2+0)
MOVT	R0, #hi_addr(_Image2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1248 :: 		Image2.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image2+4)
MOVT	R0, #hi_addr(_Image2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1249 :: 		Image2.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image2+6)
MOVT	R0, #hi_addr(_Image2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1250 :: 		Image2.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image2+8)
MOVT	R0, #hi_addr(_Image2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1251 :: 		Image2.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image2+10)
MOVT	R0, #hi_addr(_Image2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1252 :: 		Image2.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image2+12)
MOVT	R0, #hi_addr(_Image2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1253 :: 		Image2.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+22)
MOVT	R0, #hi_addr(_Image2+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1254 :: 		Image2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+23)
MOVT	R0, #hi_addr(_Image2+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1255 :: 		Image2.Picture_Name    = icon_back_accel_bmp;
MOVW	R1, #lo_addr(_icon_back_accel_bmp+0)
MOVT	R1, #hi_addr(_icon_back_accel_bmp+0)
MOVW	R0, #lo_addr(_Image2+16)
MOVT	R0, #hi_addr(_Image2+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1256 :: 		Image2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+20)
MOVT	R0, #hi_addr(_Image2+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1257 :: 		Image2.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+21)
MOVT	R0, #hi_addr(_Image2+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1258 :: 		Image2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+24)
MOVT	R0, #hi_addr(_Image2+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1259 :: 		Image2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+28)
MOVT	R0, #hi_addr(_Image2+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1260 :: 		Image2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+32)
MOVT	R0, #hi_addr(_Image2+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1261 :: 		Image2.OnPressPtr      = Image2OnPress;
MOVW	R1, #lo_addr(_Image2OnPress+0)
MOVT	R1, #hi_addr(_Image2OnPress+0)
MOVW	R0, #lo_addr(_Image2+36)
MOVT	R0, #hi_addr(_Image2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1263 :: 		Label1.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1264 :: 		Label1.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1265 :: 		Label1.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1266 :: 		Label1.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1267 :: 		Label1.Width           = 209;
MOVS	R1, #209
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1268 :: 		Label1.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1269 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1270 :: 		Label1.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1271 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1272 :: 		Label1.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,1273 :: 		Label1.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1274 :: 		Label1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1275 :: 		Label1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+32)
MOVT	R0, #hi_addr(_Label1+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1276 :: 		Label1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+36)
MOVT	R0, #hi_addr(_Label1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1277 :: 		Label1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+40)
MOVT	R0, #hi_addr(_Label1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1279 :: 		Label2.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1280 :: 		Label2.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1281 :: 		Label2.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1282 :: 		Label2.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1283 :: 		Label2.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1284 :: 		Label2.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1285 :: 		Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1286 :: 		Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1287 :: 		Label2.Caption         = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1288 :: 		Label2.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1289 :: 		Label2.Font_Color      = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1290 :: 		Label2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1291 :: 		Label2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+32)
MOVT	R0, #hi_addr(_Label2+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1292 :: 		Label2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+36)
MOVT	R0, #hi_addr(_Label2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1293 :: 		Label2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+40)
MOVT	R0, #hi_addr(_Label2+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1295 :: 		Label3.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1296 :: 		Label3.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1297 :: 		Label3.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1298 :: 		Label3.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1299 :: 		Label3.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1300 :: 		Label3.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1301 :: 		Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1302 :: 		Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1303 :: 		Label3.Caption         = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1304 :: 		Label3.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1305 :: 		Label3.Font_Color      = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1306 :: 		Label3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1307 :: 		Label3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+32)
MOVT	R0, #hi_addr(_Label3+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1308 :: 		Label3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+36)
MOVT	R0, #hi_addr(_Label3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1309 :: 		Label3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+40)
MOVT	R0, #hi_addr(_Label3+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1311 :: 		Label4.OwnerScreen     = &Accelerometer;
MOVW	R1, #lo_addr(_Accelerometer+0)
MOVT	R1, #hi_addr(_Accelerometer+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1312 :: 		Label4.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1313 :: 		Label4.Left            = 375;
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1314 :: 		Label4.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1315 :: 		Label4.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1316 :: 		Label4.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1317 :: 		Label4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1318 :: 		Label4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1319 :: 		Label4.Caption         = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1320 :: 		Label4.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1321 :: 		Label4.Font_Color      = 0x0400;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1322 :: 		Label4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1323 :: 		Label4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+32)
MOVT	R0, #hi_addr(_Label4+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1324 :: 		Label4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+36)
MOVT	R0, #hi_addr(_Label4+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1325 :: 		Label4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+40)
MOVT	R0, #hi_addr(_Label4+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1327 :: 		Box22.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Box22+0)
MOVT	R0, #hi_addr(_Box22+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1328 :: 		Box22.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+4)
MOVT	R0, #hi_addr(_Box22+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1329 :: 		Box22.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box22+6)
MOVT	R0, #hi_addr(_Box22+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1330 :: 		Box22.Top             = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box22+8)
MOVT	R0, #hi_addr(_Box22+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1331 :: 		Box22.Width           = 126;
MOVS	R1, #126
MOVW	R0, #lo_addr(_Box22+10)
MOVT	R0, #hi_addr(_Box22+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1332 :: 		Box22.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box22+12)
MOVT	R0, #hi_addr(_Box22+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1333 :: 		Box22.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+14)
MOVT	R0, #hi_addr(_Box22+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1334 :: 		Box22.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+16)
MOVT	R0, #hi_addr(_Box22+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1335 :: 		Box22.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+18)
MOVT	R0, #hi_addr(_Box22+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1336 :: 		Box22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+19)
MOVT	R0, #hi_addr(_Box22+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1337 :: 		Box22.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box22+20)
MOVT	R0, #hi_addr(_Box22+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1338 :: 		Box22.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+21)
MOVT	R0, #hi_addr(_Box22+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1339 :: 		Box22.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+22)
MOVT	R0, #hi_addr(_Box22+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1340 :: 		Box22.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box22+24)
MOVT	R0, #hi_addr(_Box22+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1341 :: 		Box22.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box22+26)
MOVT	R0, #hi_addr(_Box22+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1342 :: 		Box22.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box22+28)
MOVT	R0, #hi_addr(_Box22+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1343 :: 		Box22.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+30)
MOVT	R0, #hi_addr(_Box22+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1344 :: 		Box22.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box22+32)
MOVT	R0, #hi_addr(_Box22+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1345 :: 		Box22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+36)
MOVT	R0, #hi_addr(_Box22+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1346 :: 		Box22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+40)
MOVT	R0, #hi_addr(_Box22+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1347 :: 		Box22.OnClickPtr      = Image5OnPress;
MOVW	R1, #lo_addr(_Image5OnPress+0)
MOVT	R1, #hi_addr(_Image5OnPress+0)
MOVW	R0, #lo_addr(_Box22+44)
MOVT	R0, #hi_addr(_Box22+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1348 :: 		Box22.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box22+48)
MOVT	R0, #hi_addr(_Box22+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1350 :: 		Label9.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Label9+0)
MOVT	R0, #hi_addr(_Label9+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1351 :: 		Label9.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+4)
MOVT	R0, #hi_addr(_Label9+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1352 :: 		Label9.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label9+6)
MOVT	R0, #hi_addr(_Label9+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1353 :: 		Label9.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label9+8)
MOVT	R0, #hi_addr(_Label9+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1354 :: 		Label9.Width           = 95;
MOVS	R1, #95
MOVW	R0, #lo_addr(_Label9+10)
MOVT	R0, #hi_addr(_Label9+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1355 :: 		Label9.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label9+12)
MOVT	R0, #hi_addr(_Label9+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1356 :: 		Label9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+26)
MOVT	R0, #hi_addr(_Label9+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1357 :: 		Label9.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+27)
MOVT	R0, #hi_addr(_Label9+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1358 :: 		Label9.Caption         = Label9_Caption;
MOVW	R1, #lo_addr(_Label9_Caption+0)
MOVT	R1, #hi_addr(_Label9_Caption+0)
MOVW	R0, #lo_addr(_Label9+16)
MOVT	R0, #hi_addr(_Label9+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1359 :: 		Label9.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Label9+20)
MOVT	R0, #hi_addr(_Label9+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,1360 :: 		Label9.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label9+24)
MOVT	R0, #hi_addr(_Label9+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1361 :: 		Label9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+28)
MOVT	R0, #hi_addr(_Label9+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1362 :: 		Label9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+32)
MOVT	R0, #hi_addr(_Label9+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1363 :: 		Label9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+36)
MOVT	R0, #hi_addr(_Label9+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1364 :: 		Label9.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+40)
MOVT	R0, #hi_addr(_Label9+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1366 :: 		Image5.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Image5+0)
MOVT	R0, #hi_addr(_Image5+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1367 :: 		Image5.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image5+4)
MOVT	R0, #hi_addr(_Image5+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1368 :: 		Image5.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image5+6)
MOVT	R0, #hi_addr(_Image5+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1369 :: 		Image5.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image5+8)
MOVT	R0, #hi_addr(_Image5+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1370 :: 		Image5.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image5+10)
MOVT	R0, #hi_addr(_Image5+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1371 :: 		Image5.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image5+12)
MOVT	R0, #hi_addr(_Image5+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1372 :: 		Image5.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+22)
MOVT	R0, #hi_addr(_Image5+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1373 :: 		Image5.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+23)
MOVT	R0, #hi_addr(_Image5+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1374 :: 		Image5.Picture_Name    = icon_back_rgb_bmp;
MOVW	R1, #lo_addr(_icon_back_rgb_bmp+0)
MOVT	R1, #hi_addr(_icon_back_rgb_bmp+0)
MOVW	R0, #lo_addr(_Image5+16)
MOVT	R0, #hi_addr(_Image5+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1375 :: 		Image5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+20)
MOVT	R0, #hi_addr(_Image5+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1376 :: 		Image5.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+21)
MOVT	R0, #hi_addr(_Image5+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1377 :: 		Image5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+24)
MOVT	R0, #hi_addr(_Image5+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1378 :: 		Image5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+28)
MOVT	R0, #hi_addr(_Image5+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1379 :: 		Image5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image5+32)
MOVT	R0, #hi_addr(_Image5+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1380 :: 		Image5.OnPressPtr      = Image5OnPress;
MOVW	R1, #lo_addr(_Image5OnPress+0)
MOVT	R1, #hi_addr(_Image5OnPress+0)
MOVW	R0, #lo_addr(_Image5+36)
MOVT	R0, #hi_addr(_Image5+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1382 :: 		Label10.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Label10+0)
MOVT	R0, #hi_addr(_Label10+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1383 :: 		Label10.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label10+4)
MOVT	R0, #hi_addr(_Label10+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1384 :: 		Label10.Left            = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label10+6)
MOVT	R0, #hi_addr(_Label10+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1385 :: 		Label10.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label10+8)
MOVT	R0, #hi_addr(_Label10+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1386 :: 		Label10.Width           = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Label10+10)
MOVT	R0, #hi_addr(_Label10+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1387 :: 		Label10.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label10+12)
MOVT	R0, #hi_addr(_Label10+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1388 :: 		Label10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+26)
MOVT	R0, #hi_addr(_Label10+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1389 :: 		Label10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+27)
MOVT	R0, #hi_addr(_Label10+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1390 :: 		Label10.Caption         = Label10_Caption;
MOVW	R1, #lo_addr(_Label10_Caption+0)
MOVT	R1, #hi_addr(_Label10_Caption+0)
MOVW	R0, #lo_addr(_Label10+16)
MOVT	R0, #hi_addr(_Label10+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1391 :: 		Label10.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label10+20)
MOVT	R0, #hi_addr(_Label10+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1392 :: 		Label10.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label10+24)
MOVT	R0, #hi_addr(_Label10+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1393 :: 		Label10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+28)
MOVT	R0, #hi_addr(_Label10+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1394 :: 		Label10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+32)
MOVT	R0, #hi_addr(_Label10+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1395 :: 		Label10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+36)
MOVT	R0, #hi_addr(_Label10+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1396 :: 		Label10.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+40)
MOVT	R0, #hi_addr(_Label10+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1398 :: 		Circle1.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Circle1+0)
MOVT	R0, #hi_addr(_Circle1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1399 :: 		Circle1.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Circle1+4)
MOVT	R0, #hi_addr(_Circle1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1400 :: 		Circle1.Left            = 294;
MOVW	R1, #294
MOVW	R0, #lo_addr(_Circle1+6)
MOVT	R0, #hi_addr(_Circle1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1401 :: 		Circle1.Top             = 252;
MOVS	R1, #252
MOVW	R0, #lo_addr(_Circle1+8)
MOVT	R0, #hi_addr(_Circle1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1402 :: 		Circle1.Radius          = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Circle1+10)
MOVT	R0, #hi_addr(_Circle1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1403 :: 		Circle1.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+12)
MOVT	R0, #hi_addr(_Circle1+12)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1404 :: 		Circle1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+14)
MOVT	R0, #hi_addr(_Circle1+14)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1405 :: 		Circle1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+16)
MOVT	R0, #hi_addr(_Circle1+16)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1406 :: 		Circle1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+17)
MOVT	R0, #hi_addr(_Circle1+17)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1407 :: 		Circle1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+18)
MOVT	R0, #hi_addr(_Circle1+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1408 :: 		Circle1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+19)
MOVT	R0, #hi_addr(_Circle1+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1409 :: 		Circle1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+20)
MOVT	R0, #hi_addr(_Circle1+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1410 :: 		Circle1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Circle1+22)
MOVT	R0, #hi_addr(_Circle1+22)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1411 :: 		Circle1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Circle1+24)
MOVT	R0, #hi_addr(_Circle1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1412 :: 		Circle1.Color           = 0x0023;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Circle1+26)
MOVT	R0, #hi_addr(_Circle1+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1413 :: 		Circle1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Circle1+28)
MOVT	R0, #hi_addr(_Circle1+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1414 :: 		Circle1.Press_Color     = 0x19E0;
MOVW	R1, #6624
MOVW	R0, #lo_addr(_Circle1+30)
MOVT	R0, #hi_addr(_Circle1+30)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1415 :: 		Circle1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+32)
MOVT	R0, #hi_addr(_Circle1+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1416 :: 		Circle1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+36)
MOVT	R0, #hi_addr(_Circle1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1417 :: 		Circle1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+40)
MOVT	R0, #hi_addr(_Circle1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1418 :: 		Circle1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Circle1+44)
MOVT	R0, #hi_addr(_Circle1+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1420 :: 		Label11.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Label11+0)
MOVT	R0, #hi_addr(_Label11+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1421 :: 		Label11.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label11+4)
MOVT	R0, #hi_addr(_Label11+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1422 :: 		Label11.Left            = 325;
MOVW	R1, #325
MOVW	R0, #lo_addr(_Label11+6)
MOVT	R0, #hi_addr(_Label11+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1423 :: 		Label11.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label11+8)
MOVT	R0, #hi_addr(_Label11+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1424 :: 		Label11.Width           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label11+10)
MOVT	R0, #hi_addr(_Label11+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1425 :: 		Label11.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label11+12)
MOVT	R0, #hi_addr(_Label11+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1426 :: 		Label11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+26)
MOVT	R0, #hi_addr(_Label11+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1427 :: 		Label11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+27)
MOVT	R0, #hi_addr(_Label11+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1428 :: 		Label11.Caption         = Label11_Caption;
MOVW	R1, #lo_addr(_Label11_Caption+0)
MOVT	R1, #hi_addr(_Label11_Caption+0)
MOVW	R0, #lo_addr(_Label11+16)
MOVT	R0, #hi_addr(_Label11+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1429 :: 		Label11.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label11+20)
MOVT	R0, #hi_addr(_Label11+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1430 :: 		Label11.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label11+24)
MOVT	R0, #hi_addr(_Label11+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1431 :: 		Label11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+28)
MOVT	R0, #hi_addr(_Label11+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1432 :: 		Label11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+32)
MOVT	R0, #hi_addr(_Label11+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1433 :: 		Label11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+36)
MOVT	R0, #hi_addr(_Label11+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1434 :: 		Label11.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+40)
MOVT	R0, #hi_addr(_Label11+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1436 :: 		Label12.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Label12+0)
MOVT	R0, #hi_addr(_Label12+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1437 :: 		Label12.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label12+4)
MOVT	R0, #hi_addr(_Label12+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1438 :: 		Label12.Left            = 375;
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label12+6)
MOVT	R0, #hi_addr(_Label12+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1439 :: 		Label12.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label12+8)
MOVT	R0, #hi_addr(_Label12+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1440 :: 		Label12.Width           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label12+10)
MOVT	R0, #hi_addr(_Label12+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1441 :: 		Label12.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label12+12)
MOVT	R0, #hi_addr(_Label12+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1442 :: 		Label12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+26)
MOVT	R0, #hi_addr(_Label12+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1443 :: 		Label12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+27)
MOVT	R0, #hi_addr(_Label12+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1444 :: 		Label12.Caption         = Label12_Caption;
MOVW	R1, #lo_addr(_Label12_Caption+0)
MOVT	R1, #hi_addr(_Label12_Caption+0)
MOVW	R0, #lo_addr(_Label12+16)
MOVT	R0, #hi_addr(_Label12+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1445 :: 		Label12.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label12+20)
MOVT	R0, #hi_addr(_Label12+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1446 :: 		Label12.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label12+24)
MOVT	R0, #hi_addr(_Label12+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1447 :: 		Label12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+28)
MOVT	R0, #hi_addr(_Label12+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1448 :: 		Label12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+32)
MOVT	R0, #hi_addr(_Label12+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1449 :: 		Label12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+36)
MOVT	R0, #hi_addr(_Label12+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1450 :: 		Label12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+40)
MOVT	R0, #hi_addr(_Label12+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1452 :: 		Label13.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_Label13+0)
MOVT	R0, #hi_addr(_Label13+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1453 :: 		Label13.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label13+4)
MOVT	R0, #hi_addr(_Label13+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1454 :: 		Label13.Left            = 425;
MOVW	R1, #425
MOVW	R0, #lo_addr(_Label13+6)
MOVT	R0, #hi_addr(_Label13+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1455 :: 		Label13.Top             = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Label13+8)
MOVT	R0, #hi_addr(_Label13+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1456 :: 		Label13.Width           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label13+10)
MOVT	R0, #hi_addr(_Label13+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1457 :: 		Label13.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label13+12)
MOVT	R0, #hi_addr(_Label13+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1458 :: 		Label13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+26)
MOVT	R0, #hi_addr(_Label13+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1459 :: 		Label13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+27)
MOVT	R0, #hi_addr(_Label13+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1460 :: 		Label13.Caption         = Label13_Caption;
MOVW	R1, #lo_addr(_Label13_Caption+0)
MOVT	R1, #hi_addr(_Label13_Caption+0)
MOVW	R0, #lo_addr(_Label13+16)
MOVT	R0, #hi_addr(_Label13+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1461 :: 		Label13.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label13+20)
MOVT	R0, #hi_addr(_Label13+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1462 :: 		Label13.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label13+24)
MOVT	R0, #hi_addr(_Label13+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1463 :: 		Label13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+28)
MOVT	R0, #hi_addr(_Label13+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1464 :: 		Label13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+32)
MOVT	R0, #hi_addr(_Label13+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1465 :: 		Label13.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+36)
MOVT	R0, #hi_addr(_Label13+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1466 :: 		Label13.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+40)
MOVT	R0, #hi_addr(_Label13+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1468 :: 		RGB_Active_area.OwnerScreen     = &RGBLight;
MOVW	R1, #lo_addr(_RGBLight+0)
MOVT	R1, #hi_addr(_RGBLight+0)
MOVW	R0, #lo_addr(_RGB_Active_area+0)
MOVT	R0, #hi_addr(_RGB_Active_area+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1469 :: 		RGB_Active_area.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_RGB_Active_area+4)
MOVT	R0, #hi_addr(_RGB_Active_area+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1470 :: 		RGB_Active_area.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+6)
MOVT	R0, #hi_addr(_RGB_Active_area+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1471 :: 		RGB_Active_area.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_RGB_Active_area+8)
MOVT	R0, #hi_addr(_RGB_Active_area+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1472 :: 		RGB_Active_area.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_RGB_Active_area+10)
MOVT	R0, #hi_addr(_RGB_Active_area+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1473 :: 		RGB_Active_area.Height          = 209;
MOVS	R1, #209
MOVW	R0, #lo_addr(_RGB_Active_area+12)
MOVT	R0, #hi_addr(_RGB_Active_area+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1474 :: 		RGB_Active_area.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RGB_Active_area+14)
MOVT	R0, #hi_addr(_RGB_Active_area+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1475 :: 		RGB_Active_area.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+16)
MOVT	R0, #hi_addr(_RGB_Active_area+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1476 :: 		RGB_Active_area.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+18)
MOVT	R0, #hi_addr(_RGB_Active_area+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1477 :: 		RGB_Active_area.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RGB_Active_area+19)
MOVT	R0, #hi_addr(_RGB_Active_area+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1478 :: 		RGB_Active_area.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RGB_Active_area+20)
MOVT	R0, #hi_addr(_RGB_Active_area+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1479 :: 		RGB_Active_area.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+21)
MOVT	R0, #hi_addr(_RGB_Active_area+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1480 :: 		RGB_Active_area.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+22)
MOVT	R0, #hi_addr(_RGB_Active_area+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1481 :: 		RGB_Active_area.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RGB_Active_area+24)
MOVT	R0, #hi_addr(_RGB_Active_area+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1482 :: 		RGB_Active_area.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RGB_Active_area+26)
MOVT	R0, #hi_addr(_RGB_Active_area+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1483 :: 		RGB_Active_area.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RGB_Active_area+28)
MOVT	R0, #hi_addr(_RGB_Active_area+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1484 :: 		RGB_Active_area.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+30)
MOVT	R0, #hi_addr(_RGB_Active_area+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1485 :: 		RGB_Active_area.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RGB_Active_area+32)
MOVT	R0, #hi_addr(_RGB_Active_area+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1486 :: 		RGB_Active_area.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+36)
MOVT	R0, #hi_addr(_RGB_Active_area+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1487 :: 		RGB_Active_area.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+40)
MOVT	R0, #hi_addr(_RGB_Active_area+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1488 :: 		RGB_Active_area.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RGB_Active_area+44)
MOVT	R0, #hi_addr(_RGB_Active_area+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1489 :: 		RGB_Active_area.OnPressPtr      = RGB_Active_areaOnPress;
MOVW	R1, #lo_addr(_RGB_Active_areaOnPress+0)
MOVT	R1, #hi_addr(_RGB_Active_areaOnPress+0)
MOVW	R0, #lo_addr(_RGB_Active_area+48)
MOVT	R0, #hi_addr(_RGB_Active_area+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1491 :: 		Box16.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box16+0)
MOVT	R0, #hi_addr(_Box16+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1492 :: 		Box16.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+4)
MOVT	R0, #hi_addr(_Box16+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1493 :: 		Box16.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box16+6)
MOVT	R0, #hi_addr(_Box16+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1494 :: 		Box16.Top             = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box16+8)
MOVT	R0, #hi_addr(_Box16+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1495 :: 		Box16.Width           = 84;
MOVS	R1, #84
MOVW	R0, #lo_addr(_Box16+10)
MOVT	R0, #hi_addr(_Box16+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1496 :: 		Box16.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box16+12)
MOVT	R0, #hi_addr(_Box16+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1497 :: 		Box16.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+14)
MOVT	R0, #hi_addr(_Box16+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1498 :: 		Box16.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+16)
MOVT	R0, #hi_addr(_Box16+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1499 :: 		Box16.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+18)
MOVT	R0, #hi_addr(_Box16+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1500 :: 		Box16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+19)
MOVT	R0, #hi_addr(_Box16+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1501 :: 		Box16.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box16+20)
MOVT	R0, #hi_addr(_Box16+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1502 :: 		Box16.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+21)
MOVT	R0, #hi_addr(_Box16+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1503 :: 		Box16.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+22)
MOVT	R0, #hi_addr(_Box16+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1504 :: 		Box16.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box16+24)
MOVT	R0, #hi_addr(_Box16+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1505 :: 		Box16.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box16+26)
MOVT	R0, #hi_addr(_Box16+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1506 :: 		Box16.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box16+28)
MOVT	R0, #hi_addr(_Box16+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1507 :: 		Box16.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+30)
MOVT	R0, #hi_addr(_Box16+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1508 :: 		Box16.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box16+32)
MOVT	R0, #hi_addr(_Box16+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1509 :: 		Box16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+36)
MOVT	R0, #hi_addr(_Box16+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1510 :: 		Box16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+40)
MOVT	R0, #hi_addr(_Box16+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1511 :: 		Box16.OnClickPtr      = ClockBackOnPress;
MOVW	R1, #lo_addr(_ClockBackOnPress+0)
MOVT	R1, #hi_addr(_ClockBackOnPress+0)
MOVW	R0, #lo_addr(_Box16+44)
MOVT	R0, #hi_addr(_Box16+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1512 :: 		Box16.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box16+48)
MOVT	R0, #hi_addr(_Box16+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1514 :: 		Box15.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box15+0)
MOVT	R0, #hi_addr(_Box15+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1515 :: 		Box15.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box15+4)
MOVT	R0, #hi_addr(_Box15+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1516 :: 		Box15.Left            = 376;
MOVW	R1, #376
MOVW	R0, #lo_addr(_Box15+6)
MOVT	R0, #hi_addr(_Box15+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1517 :: 		Box15.Top             = 234;
MOVS	R1, #234
MOVW	R0, #lo_addr(_Box15+8)
MOVT	R0, #hi_addr(_Box15+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1518 :: 		Box15.Width           = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Box15+10)
MOVT	R0, #hi_addr(_Box15+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1519 :: 		Box15.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box15+12)
MOVT	R0, #hi_addr(_Box15+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1520 :: 		Box15.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box15+14)
MOVT	R0, #hi_addr(_Box15+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1521 :: 		Box15.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+16)
MOVT	R0, #hi_addr(_Box15+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1522 :: 		Box15.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+18)
MOVT	R0, #hi_addr(_Box15+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1523 :: 		Box15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box15+19)
MOVT	R0, #hi_addr(_Box15+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1524 :: 		Box15.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box15+20)
MOVT	R0, #hi_addr(_Box15+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1525 :: 		Box15.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+21)
MOVT	R0, #hi_addr(_Box15+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1526 :: 		Box15.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+22)
MOVT	R0, #hi_addr(_Box15+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1527 :: 		Box15.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box15+24)
MOVT	R0, #hi_addr(_Box15+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1528 :: 		Box15.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box15+26)
MOVT	R0, #hi_addr(_Box15+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1529 :: 		Box15.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box15+28)
MOVT	R0, #hi_addr(_Box15+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1530 :: 		Box15.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+30)
MOVT	R0, #hi_addr(_Box15+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1531 :: 		Box15.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box15+32)
MOVT	R0, #hi_addr(_Box15+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1532 :: 		Box15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+36)
MOVT	R0, #hi_addr(_Box15+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1533 :: 		Box15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+40)
MOVT	R0, #hi_addr(_Box15+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1534 :: 		Box15.OnClickPtr      = Image8OnPress;
MOVW	R1, #lo_addr(_Image8OnPress+0)
MOVT	R1, #hi_addr(_Image8OnPress+0)
MOVW	R0, #lo_addr(_Box15+44)
MOVT	R0, #hi_addr(_Box15+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1535 :: 		Box15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box15+48)
MOVT	R0, #hi_addr(_Box15+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1537 :: 		Box13.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box13+0)
MOVT	R0, #hi_addr(_Box13+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1538 :: 		Box13.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Box13+4)
MOVT	R0, #hi_addr(_Box13+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1539 :: 		Box13.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+6)
MOVT	R0, #hi_addr(_Box13+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1540 :: 		Box13.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Box13+8)
MOVT	R0, #hi_addr(_Box13+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1541 :: 		Box13.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box13+10)
MOVT	R0, #hi_addr(_Box13+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1542 :: 		Box13.Height          = 193;
MOVS	R1, #193
MOVW	R0, #lo_addr(_Box13+12)
MOVT	R0, #hi_addr(_Box13+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1543 :: 		Box13.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+14)
MOVT	R0, #hi_addr(_Box13+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1544 :: 		Box13.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+16)
MOVT	R0, #hi_addr(_Box13+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1545 :: 		Box13.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+18)
MOVT	R0, #hi_addr(_Box13+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1546 :: 		Box13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box13+19)
MOVT	R0, #hi_addr(_Box13+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1547 :: 		Box13.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box13+20)
MOVT	R0, #hi_addr(_Box13+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1548 :: 		Box13.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+21)
MOVT	R0, #hi_addr(_Box13+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1549 :: 		Box13.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+22)
MOVT	R0, #hi_addr(_Box13+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1550 :: 		Box13.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box13+24)
MOVT	R0, #hi_addr(_Box13+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1551 :: 		Box13.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box13+26)
MOVT	R0, #hi_addr(_Box13+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1552 :: 		Box13.Color           = 0x54C3;
MOVW	R1, #21699
MOVW	R0, #lo_addr(_Box13+28)
MOVT	R0, #hi_addr(_Box13+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1553 :: 		Box13.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+30)
MOVT	R0, #hi_addr(_Box13+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1554 :: 		Box13.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box13+32)
MOVT	R0, #hi_addr(_Box13+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1555 :: 		Box13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+36)
MOVT	R0, #hi_addr(_Box13+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1556 :: 		Box13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+40)
MOVT	R0, #hi_addr(_Box13+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1557 :: 		Box13.OnClickPtr      = Box13OnClick;
MOVW	R1, #lo_addr(_Box13OnClick+0)
MOVT	R1, #hi_addr(_Box13OnClick+0)
MOVW	R0, #lo_addr(_Box13+44)
MOVT	R0, #hi_addr(_Box13+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1558 :: 		Box13.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box13+48)
MOVT	R0, #hi_addr(_Box13+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1560 :: 		Box12.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box12+0)
MOVT	R0, #hi_addr(_Box12+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1561 :: 		Box12.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box12+4)
MOVT	R0, #hi_addr(_Box12+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1562 :: 		Box12.Left            = 280;
MOVW	R1, #280
MOVW	R0, #lo_addr(_Box12+6)
MOVT	R0, #hi_addr(_Box12+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1563 :: 		Box12.Top             = 235;
MOVS	R1, #235
MOVW	R0, #lo_addr(_Box12+8)
MOVT	R0, #hi_addr(_Box12+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1564 :: 		Box12.Width           = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_Box12+10)
MOVT	R0, #hi_addr(_Box12+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1565 :: 		Box12.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box12+12)
MOVT	R0, #hi_addr(_Box12+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1566 :: 		Box12.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+14)
MOVT	R0, #hi_addr(_Box12+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1567 :: 		Box12.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+16)
MOVT	R0, #hi_addr(_Box12+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1568 :: 		Box12.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+18)
MOVT	R0, #hi_addr(_Box12+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1569 :: 		Box12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+19)
MOVT	R0, #hi_addr(_Box12+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1570 :: 		Box12.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box12+20)
MOVT	R0, #hi_addr(_Box12+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1571 :: 		Box12.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+21)
MOVT	R0, #hi_addr(_Box12+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1572 :: 		Box12.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+22)
MOVT	R0, #hi_addr(_Box12+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1573 :: 		Box12.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box12+24)
MOVT	R0, #hi_addr(_Box12+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1574 :: 		Box12.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box12+26)
MOVT	R0, #hi_addr(_Box12+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1575 :: 		Box12.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box12+28)
MOVT	R0, #hi_addr(_Box12+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1576 :: 		Box12.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+30)
MOVT	R0, #hi_addr(_Box12+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1577 :: 		Box12.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box12+32)
MOVT	R0, #hi_addr(_Box12+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1578 :: 		Box12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+36)
MOVT	R0, #hi_addr(_Box12+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1579 :: 		Box12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+40)
MOVT	R0, #hi_addr(_Box12+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1580 :: 		Box12.OnClickPtr      = Box12OnClick;
MOVW	R1, #lo_addr(_Box12OnClick+0)
MOVT	R1, #hi_addr(_Box12OnClick+0)
MOVW	R0, #lo_addr(_Box12+44)
MOVT	R0, #hi_addr(_Box12+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1581 :: 		Box12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box12+48)
MOVT	R0, #hi_addr(_Box12+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1583 :: 		Label15.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Label15+0)
MOVT	R0, #hi_addr(_Label15+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1584 :: 		Label15.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label15+4)
MOVT	R0, #hi_addr(_Label15+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1585 :: 		Label15.Left            = 191;
MOVS	R1, #191
MOVW	R0, #lo_addr(_Label15+6)
MOVT	R0, #hi_addr(_Label15+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1586 :: 		Label15.Top             = 94;
MOVS	R1, #94
MOVW	R0, #lo_addr(_Label15+8)
MOVT	R0, #hi_addr(_Label15+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1587 :: 		Label15.Width           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label15+10)
MOVT	R0, #hi_addr(_Label15+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1588 :: 		Label15.Height          = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Label15+12)
MOVT	R0, #hi_addr(_Label15+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1589 :: 		Label15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+26)
MOVT	R0, #hi_addr(_Label15+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1590 :: 		Label15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+27)
MOVT	R0, #hi_addr(_Label15+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1591 :: 		Label15.Caption         = Label15_Caption;
MOVW	R1, #lo_addr(_Label15_Caption+0)
MOVT	R1, #hi_addr(_Label15_Caption+0)
MOVW	R0, #lo_addr(_Label15+16)
MOVT	R0, #hi_addr(_Label15+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1592 :: 		Label15.FontName        = Open_Sans_Light51x78_Regular;
MOVW	R1, #lo_addr(_Open_Sans_Light51x78_Regular+0)
MOVT	R1, #hi_addr(_Open_Sans_Light51x78_Regular+0)
MOVW	R0, #lo_addr(_Label15+20)
MOVT	R0, #hi_addr(_Label15+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1593 :: 		Label15.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label15+24)
MOVT	R0, #hi_addr(_Label15+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1594 :: 		Label15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+28)
MOVT	R0, #hi_addr(_Label15+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1595 :: 		Label15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+32)
MOVT	R0, #hi_addr(_Label15+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1596 :: 		Label15.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+36)
MOVT	R0, #hi_addr(_Label15+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1597 :: 		Label15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+40)
MOVT	R0, #hi_addr(_Label15+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1599 :: 		Box2.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box2+0)
MOVT	R0, #hi_addr(_Box2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1600 :: 		Box2.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box2+4)
MOVT	R0, #hi_addr(_Box2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1601 :: 		Box2.Left            = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Box2+6)
MOVT	R0, #hi_addr(_Box2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1602 :: 		Box2.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box2+8)
MOVT	R0, #hi_addr(_Box2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1603 :: 		Box2.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box2+10)
MOVT	R0, #hi_addr(_Box2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1604 :: 		Box2.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box2+12)
MOVT	R0, #hi_addr(_Box2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1605 :: 		Box2.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+14)
MOVT	R0, #hi_addr(_Box2+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1606 :: 		Box2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+16)
MOVT	R0, #hi_addr(_Box2+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1607 :: 		Box2.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+18)
MOVT	R0, #hi_addr(_Box2+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1608 :: 		Box2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+19)
MOVT	R0, #hi_addr(_Box2+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1609 :: 		Box2.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+20)
MOVT	R0, #hi_addr(_Box2+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1610 :: 		Box2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+21)
MOVT	R0, #hi_addr(_Box2+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1611 :: 		Box2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+22)
MOVT	R0, #hi_addr(_Box2+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1612 :: 		Box2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box2+24)
MOVT	R0, #hi_addr(_Box2+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1613 :: 		Box2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+26)
MOVT	R0, #hi_addr(_Box2+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1614 :: 		Box2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+28)
MOVT	R0, #hi_addr(_Box2+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1615 :: 		Box2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+30)
MOVT	R0, #hi_addr(_Box2+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1616 :: 		Box2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box2+32)
MOVT	R0, #hi_addr(_Box2+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1617 :: 		Box2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+36)
MOVT	R0, #hi_addr(_Box2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1618 :: 		Box2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+40)
MOVT	R0, #hi_addr(_Box2+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1619 :: 		Box2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+44)
MOVT	R0, #hi_addr(_Box2+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1620 :: 		Box2.OnPressPtr      = Box2OnPress;
MOVW	R1, #lo_addr(_Box2OnPress+0)
MOVT	R1, #hi_addr(_Box2OnPress+0)
MOVW	R0, #lo_addr(_Box2+48)
MOVT	R0, #hi_addr(_Box2+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1622 :: 		Box3.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box3+0)
MOVT	R0, #hi_addr(_Box3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1623 :: 		Box3.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Box3+4)
MOVT	R0, #hi_addr(_Box3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1624 :: 		Box3.Left            = 146;
MOVS	R1, #146
MOVW	R0, #lo_addr(_Box3+6)
MOVT	R0, #hi_addr(_Box3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1625 :: 		Box3.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box3+8)
MOVT	R0, #hi_addr(_Box3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1626 :: 		Box3.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box3+10)
MOVT	R0, #hi_addr(_Box3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1627 :: 		Box3.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box3+12)
MOVT	R0, #hi_addr(_Box3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1628 :: 		Box3.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+14)
MOVT	R0, #hi_addr(_Box3+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1629 :: 		Box3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+16)
MOVT	R0, #hi_addr(_Box3+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1630 :: 		Box3.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+18)
MOVT	R0, #hi_addr(_Box3+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1631 :: 		Box3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+19)
MOVT	R0, #hi_addr(_Box3+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1632 :: 		Box3.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+20)
MOVT	R0, #hi_addr(_Box3+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1633 :: 		Box3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+21)
MOVT	R0, #hi_addr(_Box3+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1634 :: 		Box3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+22)
MOVT	R0, #hi_addr(_Box3+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1635 :: 		Box3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box3+24)
MOVT	R0, #hi_addr(_Box3+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1636 :: 		Box3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+26)
MOVT	R0, #hi_addr(_Box3+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1637 :: 		Box3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+28)
MOVT	R0, #hi_addr(_Box3+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1638 :: 		Box3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+30)
MOVT	R0, #hi_addr(_Box3+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1639 :: 		Box3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box3+32)
MOVT	R0, #hi_addr(_Box3+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1640 :: 		Box3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+36)
MOVT	R0, #hi_addr(_Box3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1641 :: 		Box3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+40)
MOVT	R0, #hi_addr(_Box3+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1642 :: 		Box3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+44)
MOVT	R0, #hi_addr(_Box3+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1643 :: 		Box3.OnPressPtr      = Box3OnPress;
MOVW	R1, #lo_addr(_Box3OnPress+0)
MOVT	R1, #hi_addr(_Box3OnPress+0)
MOVW	R0, #lo_addr(_Box3+48)
MOVT	R0, #hi_addr(_Box3+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1645 :: 		Label16.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Label16+0)
MOVT	R0, #hi_addr(_Label16+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1646 :: 		Label16.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label16+4)
MOVT	R0, #hi_addr(_Label16+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1647 :: 		Label16.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label16+6)
MOVT	R0, #hi_addr(_Label16+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1648 :: 		Label16.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label16+8)
MOVT	R0, #hi_addr(_Label16+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1649 :: 		Label16.Width           = 52;
MOVS	R1, #52
MOVW	R0, #lo_addr(_Label16+10)
MOVT	R0, #hi_addr(_Label16+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1650 :: 		Label16.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label16+12)
MOVT	R0, #hi_addr(_Label16+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1651 :: 		Label16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label16+26)
MOVT	R0, #hi_addr(_Label16+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1652 :: 		Label16.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+27)
MOVT	R0, #hi_addr(_Label16+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1653 :: 		Label16.Caption         = Label16_Caption;
MOVW	R1, #lo_addr(_Label16_Caption+0)
MOVT	R1, #hi_addr(_Label16_Caption+0)
MOVW	R0, #lo_addr(_Label16+16)
MOVT	R0, #hi_addr(_Label16+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1654 :: 		Label16.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Label16+20)
MOVT	R0, #hi_addr(_Label16+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,1655 :: 		Label16.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label16+24)
MOVT	R0, #hi_addr(_Label16+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1656 :: 		Label16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+28)
MOVT	R0, #hi_addr(_Label16+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1657 :: 		Label16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+32)
MOVT	R0, #hi_addr(_Label16+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1658 :: 		Label16.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+36)
MOVT	R0, #hi_addr(_Label16+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1659 :: 		Label16.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+40)
MOVT	R0, #hi_addr(_Label16+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1661 :: 		ClockBack.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_ClockBack+0)
MOVT	R0, #hi_addr(_ClockBack+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1662 :: 		ClockBack.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_ClockBack+4)
MOVT	R0, #hi_addr(_ClockBack+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1663 :: 		ClockBack.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_ClockBack+6)
MOVT	R0, #hi_addr(_ClockBack+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1664 :: 		ClockBack.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_ClockBack+8)
MOVT	R0, #hi_addr(_ClockBack+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1665 :: 		ClockBack.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_ClockBack+10)
MOVT	R0, #hi_addr(_ClockBack+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1666 :: 		ClockBack.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_ClockBack+12)
MOVT	R0, #hi_addr(_ClockBack+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1667 :: 		ClockBack.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ClockBack+22)
MOVT	R0, #hi_addr(_ClockBack+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1668 :: 		ClockBack.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ClockBack+23)
MOVT	R0, #hi_addr(_ClockBack+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1669 :: 		ClockBack.Picture_Name    = icon_back_bmp;
MOVW	R1, #lo_addr(_icon_back_bmp+0)
MOVT	R1, #hi_addr(_icon_back_bmp+0)
MOVW	R0, #lo_addr(_ClockBack+16)
MOVT	R0, #hi_addr(_ClockBack+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1670 :: 		ClockBack.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ClockBack+20)
MOVT	R0, #hi_addr(_ClockBack+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1671 :: 		ClockBack.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ClockBack+21)
MOVT	R0, #hi_addr(_ClockBack+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1672 :: 		ClockBack.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ClockBack+24)
MOVT	R0, #hi_addr(_ClockBack+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1673 :: 		ClockBack.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ClockBack+28)
MOVT	R0, #hi_addr(_ClockBack+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1674 :: 		ClockBack.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ClockBack+32)
MOVT	R0, #hi_addr(_ClockBack+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1675 :: 		ClockBack.OnPressPtr      = ClockBackOnPress;
MOVW	R1, #lo_addr(_ClockBackOnPress+0)
MOVT	R1, #hi_addr(_ClockBackOnPress+0)
MOVW	R0, #lo_addr(_ClockBack+36)
MOVT	R0, #hi_addr(_ClockBack+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1677 :: 		Label17.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Label17+0)
MOVT	R0, #hi_addr(_Label17+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1678 :: 		Label17.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label17+4)
MOVT	R0, #hi_addr(_Label17+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1679 :: 		Label17.Left            = 310;
MOVW	R1, #310
MOVW	R0, #lo_addr(_Label17+6)
MOVT	R0, #hi_addr(_Label17+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1680 :: 		Label17.Top             = 235;
MOVS	R1, #235
MOVW	R0, #lo_addr(_Label17+8)
MOVT	R0, #hi_addr(_Label17+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1681 :: 		Label17.Width           = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Label17+10)
MOVT	R0, #hi_addr(_Label17+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1682 :: 		Label17.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label17+12)
MOVT	R0, #hi_addr(_Label17+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1683 :: 		Label17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label17+26)
MOVT	R0, #hi_addr(_Label17+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1684 :: 		Label17.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+27)
MOVT	R0, #hi_addr(_Label17+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1685 :: 		Label17.Caption         = Label17_Caption;
MOVW	R1, #lo_addr(_Label17_Caption+0)
MOVT	R1, #hi_addr(_Label17_Caption+0)
MOVW	R0, #lo_addr(_Label17+16)
MOVT	R0, #hi_addr(_Label17+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1686 :: 		Label17.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label17+20)
MOVT	R0, #hi_addr(_Label17+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1687 :: 		Label17.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label17+24)
MOVT	R0, #hi_addr(_Label17+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1688 :: 		Label17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+28)
MOVT	R0, #hi_addr(_Label17+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1689 :: 		Label17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+32)
MOVT	R0, #hi_addr(_Label17+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1690 :: 		Label17.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+36)
MOVT	R0, #hi_addr(_Label17+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1691 :: 		Label17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+40)
MOVT	R0, #hi_addr(_Label17+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1693 :: 		Label18.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Label18+0)
MOVT	R0, #hi_addr(_Label18+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1694 :: 		Label18.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label18+4)
MOVT	R0, #hi_addr(_Label18+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1695 :: 		Label18.Left            = 408;
MOVW	R1, #408
MOVW	R0, #lo_addr(_Label18+6)
MOVT	R0, #hi_addr(_Label18+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1696 :: 		Label18.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Label18+8)
MOVT	R0, #hi_addr(_Label18+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1697 :: 		Label18.Width           = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Label18+10)
MOVT	R0, #hi_addr(_Label18+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1698 :: 		Label18.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label18+12)
MOVT	R0, #hi_addr(_Label18+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1699 :: 		Label18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label18+26)
MOVT	R0, #hi_addr(_Label18+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1700 :: 		Label18.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+27)
MOVT	R0, #hi_addr(_Label18+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1701 :: 		Label18.Caption         = Label18_Caption;
MOVW	R1, #lo_addr(_Label18_Caption+0)
MOVT	R1, #hi_addr(_Label18_Caption+0)
MOVW	R0, #lo_addr(_Label18+16)
MOVT	R0, #hi_addr(_Label18+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1702 :: 		Label18.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label18+20)
MOVT	R0, #hi_addr(_Label18+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1703 :: 		Label18.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label18+24)
MOVT	R0, #hi_addr(_Label18+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1704 :: 		Label18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+28)
MOVT	R0, #hi_addr(_Label18+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1705 :: 		Label18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+32)
MOVT	R0, #hi_addr(_Label18+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1706 :: 		Label18.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+36)
MOVT	R0, #hi_addr(_Label18+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1707 :: 		Label18.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+40)
MOVT	R0, #hi_addr(_Label18+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1709 :: 		SyncIcon.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_SyncIcon+0)
MOVT	R0, #hi_addr(_SyncIcon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1710 :: 		SyncIcon.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_SyncIcon+4)
MOVT	R0, #hi_addr(_SyncIcon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1711 :: 		SyncIcon.Left            = 285;
MOVW	R1, #285
MOVW	R0, #lo_addr(_SyncIcon+6)
MOVT	R0, #hi_addr(_SyncIcon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1712 :: 		SyncIcon.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_SyncIcon+8)
MOVT	R0, #hi_addr(_SyncIcon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1713 :: 		SyncIcon.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_SyncIcon+10)
MOVT	R0, #hi_addr(_SyncIcon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1714 :: 		SyncIcon.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_SyncIcon+12)
MOVT	R0, #hi_addr(_SyncIcon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1715 :: 		SyncIcon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+22)
MOVT	R0, #hi_addr(_SyncIcon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1716 :: 		SyncIcon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_SyncIcon+23)
MOVT	R0, #hi_addr(_SyncIcon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1717 :: 		SyncIcon.Picture_Name    = icon_sync_bmp;
MOVW	R1, #lo_addr(_icon_sync_bmp+0)
MOVT	R1, #hi_addr(_icon_sync_bmp+0)
MOVW	R0, #lo_addr(_SyncIcon+16)
MOVT	R0, #hi_addr(_SyncIcon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1718 :: 		SyncIcon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_SyncIcon+20)
MOVT	R0, #hi_addr(_SyncIcon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1719 :: 		SyncIcon.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+21)
MOVT	R0, #hi_addr(_SyncIcon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1720 :: 		SyncIcon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+24)
MOVT	R0, #hi_addr(_SyncIcon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1721 :: 		SyncIcon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+28)
MOVT	R0, #hi_addr(_SyncIcon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1722 :: 		SyncIcon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+32)
MOVT	R0, #hi_addr(_SyncIcon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1723 :: 		SyncIcon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SyncIcon+36)
MOVT	R0, #hi_addr(_SyncIcon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1725 :: 		Image8.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Image8+0)
MOVT	R0, #hi_addr(_Image8+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1726 :: 		Image8.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image8+4)
MOVT	R0, #hi_addr(_Image8+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1727 :: 		Image8.Left            = 380;
MOVW	R1, #380
MOVW	R0, #lo_addr(_Image8+6)
MOVT	R0, #hi_addr(_Image8+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1728 :: 		Image8.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Image8+8)
MOVT	R0, #hi_addr(_Image8+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1729 :: 		Image8.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image8+10)
MOVT	R0, #hi_addr(_Image8+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1730 :: 		Image8.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image8+12)
MOVT	R0, #hi_addr(_Image8+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1731 :: 		Image8.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+22)
MOVT	R0, #hi_addr(_Image8+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1732 :: 		Image8.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+23)
MOVT	R0, #hi_addr(_Image8+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1733 :: 		Image8.Picture_Name    = icon_ok_bmp;
MOVW	R1, #lo_addr(_icon_ok_bmp+0)
MOVT	R1, #hi_addr(_icon_ok_bmp+0)
MOVW	R0, #lo_addr(_Image8+16)
MOVT	R0, #hi_addr(_Image8+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1734 :: 		Image8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+20)
MOVT	R0, #hi_addr(_Image8+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1735 :: 		Image8.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+21)
MOVT	R0, #hi_addr(_Image8+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1736 :: 		Image8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+24)
MOVT	R0, #hi_addr(_Image8+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1737 :: 		Image8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+28)
MOVT	R0, #hi_addr(_Image8+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1738 :: 		Image8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image8+32)
MOVT	R0, #hi_addr(_Image8+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1739 :: 		Image8.OnPressPtr      = Image8OnPress;
MOVW	R1, #lo_addr(_Image8OnPress+0)
MOVT	R1, #hi_addr(_Image8OnPress+0)
MOVW	R0, #lo_addr(_Image8+36)
MOVT	R0, #hi_addr(_Image8+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1741 :: 		Box4.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box4+0)
MOVT	R0, #hi_addr(_Box4+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1742 :: 		Box4.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Box4+4)
MOVT	R0, #hi_addr(_Box4+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1743 :: 		Box4.Left            = 212;
MOVS	R1, #212
MOVW	R0, #lo_addr(_Box4+6)
MOVT	R0, #hi_addr(_Box4+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1744 :: 		Box4.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box4+8)
MOVT	R0, #hi_addr(_Box4+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1745 :: 		Box4.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box4+10)
MOVT	R0, #hi_addr(_Box4+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1746 :: 		Box4.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box4+12)
MOVT	R0, #hi_addr(_Box4+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1747 :: 		Box4.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+14)
MOVT	R0, #hi_addr(_Box4+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1748 :: 		Box4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+16)
MOVT	R0, #hi_addr(_Box4+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1749 :: 		Box4.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+18)
MOVT	R0, #hi_addr(_Box4+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1750 :: 		Box4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+19)
MOVT	R0, #hi_addr(_Box4+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1751 :: 		Box4.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+20)
MOVT	R0, #hi_addr(_Box4+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1752 :: 		Box4.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+21)
MOVT	R0, #hi_addr(_Box4+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1753 :: 		Box4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+22)
MOVT	R0, #hi_addr(_Box4+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1754 :: 		Box4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box4+24)
MOVT	R0, #hi_addr(_Box4+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1755 :: 		Box4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box4+26)
MOVT	R0, #hi_addr(_Box4+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1756 :: 		Box4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box4+28)
MOVT	R0, #hi_addr(_Box4+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1757 :: 		Box4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+30)
MOVT	R0, #hi_addr(_Box4+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1758 :: 		Box4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box4+32)
MOVT	R0, #hi_addr(_Box4+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1759 :: 		Box4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+36)
MOVT	R0, #hi_addr(_Box4+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1760 :: 		Box4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+40)
MOVT	R0, #hi_addr(_Box4+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1761 :: 		Box4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+44)
MOVT	R0, #hi_addr(_Box4+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1762 :: 		Box4.OnPressPtr      = Box4OnPress;
MOVW	R1, #lo_addr(_Box4OnPress+0)
MOVT	R1, #hi_addr(_Box4OnPress+0)
MOVW	R0, #lo_addr(_Box4+48)
MOVT	R0, #hi_addr(_Box4+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1764 :: 		Box5.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box5+0)
MOVT	R0, #hi_addr(_Box5+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1765 :: 		Box5.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Box5+4)
MOVT	R0, #hi_addr(_Box5+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1766 :: 		Box5.Left            = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_Box5+6)
MOVT	R0, #hi_addr(_Box5+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1767 :: 		Box5.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box5+8)
MOVT	R0, #hi_addr(_Box5+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1768 :: 		Box5.Width           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Box5+10)
MOVT	R0, #hi_addr(_Box5+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1769 :: 		Box5.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box5+12)
MOVT	R0, #hi_addr(_Box5+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1770 :: 		Box5.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+14)
MOVT	R0, #hi_addr(_Box5+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1771 :: 		Box5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+16)
MOVT	R0, #hi_addr(_Box5+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1772 :: 		Box5.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+18)
MOVT	R0, #hi_addr(_Box5+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1773 :: 		Box5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+19)
MOVT	R0, #hi_addr(_Box5+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1774 :: 		Box5.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+20)
MOVT	R0, #hi_addr(_Box5+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1775 :: 		Box5.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+21)
MOVT	R0, #hi_addr(_Box5+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1776 :: 		Box5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+22)
MOVT	R0, #hi_addr(_Box5+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1777 :: 		Box5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box5+24)
MOVT	R0, #hi_addr(_Box5+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1778 :: 		Box5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box5+26)
MOVT	R0, #hi_addr(_Box5+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1779 :: 		Box5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box5+28)
MOVT	R0, #hi_addr(_Box5+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1780 :: 		Box5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+30)
MOVT	R0, #hi_addr(_Box5+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1781 :: 		Box5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box5+32)
MOVT	R0, #hi_addr(_Box5+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1782 :: 		Box5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+36)
MOVT	R0, #hi_addr(_Box5+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1783 :: 		Box5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+40)
MOVT	R0, #hi_addr(_Box5+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1784 :: 		Box5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+44)
MOVT	R0, #hi_addr(_Box5+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1785 :: 		Box5.OnPressPtr      = Box5OnPress;
MOVW	R1, #lo_addr(_Box5OnPress+0)
MOVT	R1, #hi_addr(_Box5OnPress+0)
MOVW	R0, #lo_addr(_Box5+48)
MOVT	R0, #hi_addr(_Box5+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1787 :: 		Image7.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Image7+0)
MOVT	R0, #hi_addr(_Image7+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1788 :: 		Image7.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Image7+4)
MOVT	R0, #hi_addr(_Image7+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1789 :: 		Image7.Left            = 475;
MOVW	R1, #475
MOVW	R0, #lo_addr(_Image7+6)
MOVT	R0, #hi_addr(_Image7+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1790 :: 		Image7.Top             = 248;
MOVS	R1, #248
MOVW	R0, #lo_addr(_Image7+8)
MOVT	R0, #hi_addr(_Image7+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1791 :: 		Image7.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Image7+10)
MOVT	R0, #hi_addr(_Image7+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1792 :: 		Image7.Height          = 740;
MOVW	R1, #740
MOVW	R0, #lo_addr(_Image7+12)
MOVT	R0, #hi_addr(_Image7+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1793 :: 		Image7.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+22)
MOVT	R0, #hi_addr(_Image7+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1794 :: 		Image7.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+23)
MOVT	R0, #hi_addr(_Image7+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1795 :: 		Image7.Picture_Name    = stripe_green_bmp;
MOVW	R1, #lo_addr(_stripe_green_bmp+0)
MOVT	R1, #hi_addr(_stripe_green_bmp+0)
MOVW	R0, #lo_addr(_Image7+16)
MOVT	R0, #hi_addr(_Image7+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1796 :: 		Image7.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+20)
MOVT	R0, #hi_addr(_Image7+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1797 :: 		Image7.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+21)
MOVT	R0, #hi_addr(_Image7+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1798 :: 		Image7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+24)
MOVT	R0, #hi_addr(_Image7+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1799 :: 		Image7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+28)
MOVT	R0, #hi_addr(_Image7+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1800 :: 		Image7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+32)
MOVT	R0, #hi_addr(_Image7+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1801 :: 		Image7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image7+36)
MOVT	R0, #hi_addr(_Image7+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1803 :: 		Label42.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Label42+0)
MOVT	R0, #hi_addr(_Label42+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1804 :: 		Label42.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label42+4)
MOVT	R0, #hi_addr(_Label42+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1805 :: 		Label42.Left            = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label42+6)
MOVT	R0, #hi_addr(_Label42+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1806 :: 		Label42.Top             = 235;
MOVS	R1, #235
MOVW	R0, #lo_addr(_Label42+8)
MOVT	R0, #hi_addr(_Label42+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1807 :: 		Label42.Width           = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Label42+10)
MOVT	R0, #hi_addr(_Label42+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1808 :: 		Label42.Height          = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label42+12)
MOVT	R0, #hi_addr(_Label42+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1809 :: 		Label42.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label42+26)
MOVT	R0, #hi_addr(_Label42+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1810 :: 		Label42.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+27)
MOVT	R0, #hi_addr(_Label42+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1811 :: 		Label42.Caption         = Label42_Caption;
MOVW	R1, #lo_addr(_Label42_Caption+0)
MOVT	R1, #hi_addr(_Label42_Caption+0)
MOVW	R0, #lo_addr(_Label42+16)
MOVT	R0, #hi_addr(_Label42+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1812 :: 		Label42.FontName        = Open_Sans_Light12x18_Regular;
MOVW	R0, #lo_addr(_Label42+20)
MOVT	R0, #hi_addr(_Label42+20)
STR	R3, [R0, #0]
;mikromedia_STM32plus_driver.c,1813 :: 		Label42.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label42+24)
MOVT	R0, #hi_addr(_Label42+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1814 :: 		Label42.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+28)
MOVT	R0, #hi_addr(_Label42+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1815 :: 		Label42.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+32)
MOVT	R0, #hi_addr(_Label42+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1816 :: 		Label42.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+36)
MOVT	R0, #hi_addr(_Label42+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1817 :: 		Label42.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label42+40)
MOVT	R0, #hi_addr(_Label42+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1819 :: 		Image17.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Image17+0)
MOVT	R0, #hi_addr(_Image17+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1820 :: 		Image17.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image17+4)
MOVT	R0, #hi_addr(_Image17+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1821 :: 		Image17.Left            = 474;
MOVW	R1, #474
MOVW	R0, #lo_addr(_Image17+6)
MOVT	R0, #hi_addr(_Image17+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1822 :: 		Image17.Top             = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image17+8)
MOVT	R0, #hi_addr(_Image17+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1823 :: 		Image17.Width           = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_Image17+10)
MOVT	R0, #hi_addr(_Image17+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1824 :: 		Image17.Height          = 151;
MOVS	R1, #151
MOVW	R0, #lo_addr(_Image17+12)
MOVT	R0, #hi_addr(_Image17+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1825 :: 		Image17.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+22)
MOVT	R0, #hi_addr(_Image17+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1826 :: 		Image17.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image17+23)
MOVT	R0, #hi_addr(_Image17+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1827 :: 		Image17.Picture_Name    = am_pm_bmp;
MOVW	R1, #lo_addr(_am_pm_bmp+0)
MOVT	R1, #hi_addr(_am_pm_bmp+0)
MOVW	R0, #lo_addr(_Image17+16)
MOVT	R0, #hi_addr(_Image17+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1828 :: 		Image17.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+20)
MOVT	R0, #hi_addr(_Image17+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1829 :: 		Image17.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+21)
MOVT	R0, #hi_addr(_Image17+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1830 :: 		Image17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+24)
MOVT	R0, #hi_addr(_Image17+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1831 :: 		Image17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+28)
MOVT	R0, #hi_addr(_Image17+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1832 :: 		Image17.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+32)
MOVT	R0, #hi_addr(_Image17+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1833 :: 		Image17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image17+36)
MOVT	R0, #hi_addr(_Image17+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1835 :: 		Box14.OwnerScreen     = &Clock;
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
MOVW	R0, #lo_addr(_Box14+0)
MOVT	R0, #hi_addr(_Box14+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1836 :: 		Box14.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Box14+4)
MOVT	R0, #hi_addr(_Box14+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1837 :: 		Box14.Left            = 305;
MOVW	R1, #305
MOVW	R0, #lo_addr(_Box14+6)
MOVT	R0, #hi_addr(_Box14+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1838 :: 		Box14.Top             = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Box14+8)
MOVT	R0, #hi_addr(_Box14+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1839 :: 		Box14.Width           = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_Box14+10)
MOVT	R0, #hi_addr(_Box14+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1840 :: 		Box14.Height          = 194;
MOVS	R1, #194
MOVW	R0, #lo_addr(_Box14+12)
MOVT	R0, #hi_addr(_Box14+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1841 :: 		Box14.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+14)
MOVT	R0, #hi_addr(_Box14+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1842 :: 		Box14.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+16)
MOVT	R0, #hi_addr(_Box14+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1843 :: 		Box14.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+18)
MOVT	R0, #hi_addr(_Box14+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1844 :: 		Box14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box14+19)
MOVT	R0, #hi_addr(_Box14+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1845 :: 		Box14.Transparent     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+20)
MOVT	R0, #hi_addr(_Box14+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1846 :: 		Box14.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+21)
MOVT	R0, #hi_addr(_Box14+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1847 :: 		Box14.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+22)
MOVT	R0, #hi_addr(_Box14+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1848 :: 		Box14.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box14+24)
MOVT	R0, #hi_addr(_Box14+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1849 :: 		Box14.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box14+26)
MOVT	R0, #hi_addr(_Box14+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1850 :: 		Box14.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box14+28)
MOVT	R0, #hi_addr(_Box14+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1851 :: 		Box14.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box14+30)
MOVT	R0, #hi_addr(_Box14+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1852 :: 		Box14.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box14+32)
MOVT	R0, #hi_addr(_Box14+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1853 :: 		Box14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+36)
MOVT	R0, #hi_addr(_Box14+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1854 :: 		Box14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+40)
MOVT	R0, #hi_addr(_Box14+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1855 :: 		Box14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box14+44)
MOVT	R0, #hi_addr(_Box14+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1856 :: 		Box14.OnPressPtr      = Box14OnPress;
MOVW	R1, #lo_addr(_Box14OnPress+0)
MOVT	R1, #hi_addr(_Box14OnPress+0)
MOVW	R0, #lo_addr(_Box14+48)
MOVT	R0, #hi_addr(_Box14+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1858 :: 		Box21.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Box21+0)
MOVT	R0, #hi_addr(_Box21+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1859 :: 		Box21.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+4)
MOVT	R0, #hi_addr(_Box21+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1860 :: 		Box21.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box21+6)
MOVT	R0, #hi_addr(_Box21+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1861 :: 		Box21.Top             = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box21+8)
MOVT	R0, #hi_addr(_Box21+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1862 :: 		Box21.Width           = 108;
MOVS	R1, #108
MOVW	R0, #lo_addr(_Box21+10)
MOVT	R0, #hi_addr(_Box21+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1863 :: 		Box21.Height          = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Box21+12)
MOVT	R0, #hi_addr(_Box21+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1864 :: 		Box21.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+14)
MOVT	R0, #hi_addr(_Box21+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1865 :: 		Box21.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+16)
MOVT	R0, #hi_addr(_Box21+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1866 :: 		Box21.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+18)
MOVT	R0, #hi_addr(_Box21+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1867 :: 		Box21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+19)
MOVT	R0, #hi_addr(_Box21+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1868 :: 		Box21.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box21+20)
MOVT	R0, #hi_addr(_Box21+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1869 :: 		Box21.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+21)
MOVT	R0, #hi_addr(_Box21+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1870 :: 		Box21.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+22)
MOVT	R0, #hi_addr(_Box21+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1871 :: 		Box21.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box21+24)
MOVT	R0, #hi_addr(_Box21+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1872 :: 		Box21.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box21+26)
MOVT	R0, #hi_addr(_Box21+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1873 :: 		Box21.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box21+28)
MOVT	R0, #hi_addr(_Box21+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1874 :: 		Box21.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+30)
MOVT	R0, #hi_addr(_Box21+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1875 :: 		Box21.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box21+32)
MOVT	R0, #hi_addr(_Box21+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1876 :: 		Box21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+36)
MOVT	R0, #hi_addr(_Box21+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1877 :: 		Box21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+40)
MOVT	R0, #hi_addr(_Box21+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1878 :: 		Box21.OnClickPtr      = BackIconSensorsOnPress;
MOVW	R1, #lo_addr(_BackIconSensorsOnPress+0)
MOVT	R1, #hi_addr(_BackIconSensorsOnPress+0)
MOVW	R0, #lo_addr(_Box21+44)
MOVT	R0, #hi_addr(_Box21+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1879 :: 		Box21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box21+48)
MOVT	R0, #hi_addr(_Box21+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1881 :: 		Diagram5_Box1.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Box1+0)
MOVT	R0, #hi_addr(_Diagram5_Box1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1882 :: 		Diagram5_Box1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Box1+4)
MOVT	R0, #hi_addr(_Diagram5_Box1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1883 :: 		Diagram5_Box1.Left            = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Diagram5_Box1+6)
MOVT	R0, #hi_addr(_Diagram5_Box1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1884 :: 		Diagram5_Box1.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+8)
MOVT	R0, #hi_addr(_Diagram5_Box1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1885 :: 		Diagram5_Box1.Width           = 161;
MOVS	R1, #161
MOVW	R0, #lo_addr(_Diagram5_Box1+10)
MOVT	R0, #hi_addr(_Diagram5_Box1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1886 :: 		Diagram5_Box1.Height          = 273;
MOVW	R1, #273
MOVW	R0, #lo_addr(_Diagram5_Box1+12)
MOVT	R0, #hi_addr(_Diagram5_Box1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1887 :: 		Diagram5_Box1.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+14)
MOVT	R0, #hi_addr(_Diagram5_Box1+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1888 :: 		Diagram5_Box1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+16)
MOVT	R0, #hi_addr(_Diagram5_Box1+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1889 :: 		Diagram5_Box1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Box1+18)
MOVT	R0, #hi_addr(_Diagram5_Box1+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1890 :: 		Diagram5_Box1.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+19)
MOVT	R0, #hi_addr(_Diagram5_Box1+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1891 :: 		Diagram5_Box1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Box1+20)
MOVT	R0, #hi_addr(_Diagram5_Box1+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1892 :: 		Diagram5_Box1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+21)
MOVT	R0, #hi_addr(_Diagram5_Box1+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1893 :: 		Diagram5_Box1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+22)
MOVT	R0, #hi_addr(_Diagram5_Box1+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1894 :: 		Diagram5_Box1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Box1+24)
MOVT	R0, #hi_addr(_Diagram5_Box1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1895 :: 		Diagram5_Box1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Diagram5_Box1+26)
MOVT	R0, #hi_addr(_Diagram5_Box1+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1896 :: 		Diagram5_Box1.Color           = 0x7907;
MOVW	R1, #30983
MOVW	R0, #lo_addr(_Diagram5_Box1+28)
MOVT	R0, #hi_addr(_Diagram5_Box1+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1897 :: 		Diagram5_Box1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Box1+30)
MOVT	R0, #hi_addr(_Diagram5_Box1+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1898 :: 		Diagram5_Box1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Diagram5_Box1+32)
MOVT	R0, #hi_addr(_Diagram5_Box1+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1899 :: 		Diagram5_Box1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+36)
MOVT	R0, #hi_addr(_Diagram5_Box1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1900 :: 		Diagram5_Box1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+40)
MOVT	R0, #hi_addr(_Diagram5_Box1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1901 :: 		Diagram5_Box1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+44)
MOVT	R0, #hi_addr(_Diagram5_Box1+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1902 :: 		Diagram5_Box1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Box1+48)
MOVT	R0, #hi_addr(_Diagram5_Box1+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1904 :: 		TempIcon.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_TempIcon+0)
MOVT	R0, #hi_addr(_TempIcon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1905 :: 		TempIcon.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_TempIcon+4)
MOVT	R0, #hi_addr(_TempIcon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1906 :: 		TempIcon.Left            = 138;
MOVS	R1, #138
MOVW	R0, #lo_addr(_TempIcon+6)
MOVT	R0, #hi_addr(_TempIcon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1907 :: 		TempIcon.Top             = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_TempIcon+8)
MOVT	R0, #hi_addr(_TempIcon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1908 :: 		TempIcon.Width           = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_TempIcon+10)
MOVT	R0, #hi_addr(_TempIcon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1909 :: 		TempIcon.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_TempIcon+12)
MOVT	R0, #hi_addr(_TempIcon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1910 :: 		TempIcon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TempIcon+22)
MOVT	R0, #hi_addr(_TempIcon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1911 :: 		TempIcon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TempIcon+23)
MOVT	R0, #hi_addr(_TempIcon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1912 :: 		TempIcon.Picture_Name    = icon_temp_sensor_bmp;
MOVW	R1, #lo_addr(_icon_temp_sensor_bmp+0)
MOVT	R1, #hi_addr(_icon_temp_sensor_bmp+0)
MOVW	R0, #lo_addr(_TempIcon+16)
MOVT	R0, #hi_addr(_TempIcon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1913 :: 		TempIcon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TempIcon+20)
MOVT	R0, #hi_addr(_TempIcon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1914 :: 		TempIcon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_TempIcon+21)
MOVT	R0, #hi_addr(_TempIcon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1915 :: 		TempIcon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TempIcon+24)
MOVT	R0, #hi_addr(_TempIcon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1916 :: 		TempIcon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TempIcon+28)
MOVT	R0, #hi_addr(_TempIcon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1917 :: 		TempIcon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TempIcon+32)
MOVT	R0, #hi_addr(_TempIcon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1918 :: 		TempIcon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_TempIcon+36)
MOVT	R0, #hi_addr(_TempIcon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1920 :: 		LightIcon.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_LightIcon+0)
MOVT	R0, #hi_addr(_LightIcon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1921 :: 		LightIcon.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_LightIcon+4)
MOVT	R0, #hi_addr(_LightIcon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1922 :: 		LightIcon.Left            = 377;
MOVW	R1, #377
MOVW	R0, #lo_addr(_LightIcon+6)
MOVT	R0, #hi_addr(_LightIcon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1923 :: 		LightIcon.Top             = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_LightIcon+8)
MOVT	R0, #hi_addr(_LightIcon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1924 :: 		LightIcon.Width           = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_LightIcon+10)
MOVT	R0, #hi_addr(_LightIcon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1925 :: 		LightIcon.Height          = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_LightIcon+12)
MOVT	R0, #hi_addr(_LightIcon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1926 :: 		LightIcon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_LightIcon+22)
MOVT	R0, #hi_addr(_LightIcon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1927 :: 		LightIcon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_LightIcon+23)
MOVT	R0, #hi_addr(_LightIcon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1928 :: 		LightIcon.Picture_Name    = icon_light_sensor_BMP;
MOVW	R1, #lo_addr(_icon_light_sensor_BMP+0)
MOVT	R1, #hi_addr(_icon_light_sensor_BMP+0)
MOVW	R0, #lo_addr(_LightIcon+16)
MOVT	R0, #hi_addr(_LightIcon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1929 :: 		LightIcon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_LightIcon+20)
MOVT	R0, #hi_addr(_LightIcon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1930 :: 		LightIcon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_LightIcon+21)
MOVT	R0, #hi_addr(_LightIcon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1931 :: 		LightIcon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_LightIcon+24)
MOVT	R0, #hi_addr(_LightIcon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1932 :: 		LightIcon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_LightIcon+28)
MOVT	R0, #hi_addr(_LightIcon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1933 :: 		LightIcon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_LightIcon+32)
MOVT	R0, #hi_addr(_LightIcon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1934 :: 		LightIcon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_LightIcon+36)
MOVT	R0, #hi_addr(_LightIcon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1936 :: 		Diagram5_Label1.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label1+0)
MOVT	R0, #hi_addr(_Diagram5_Label1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1937 :: 		Diagram5_Label1.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Diagram5_Label1+4)
MOVT	R0, #hi_addr(_Diagram5_Label1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1938 :: 		Diagram5_Label1.Left            = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_Diagram5_Label1+6)
MOVT	R0, #hi_addr(_Diagram5_Label1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1939 :: 		Diagram5_Label1.Top             = 111;
MOVS	R1, #111
MOVW	R0, #lo_addr(_Diagram5_Label1+8)
MOVT	R0, #hi_addr(_Diagram5_Label1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1940 :: 		Diagram5_Label1.Width           = 97;
MOVS	R1, #97
MOVW	R0, #lo_addr(_Diagram5_Label1+10)
MOVT	R0, #hi_addr(_Diagram5_Label1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1941 :: 		Diagram5_Label1.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Diagram5_Label1+12)
MOVT	R0, #hi_addr(_Diagram5_Label1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1942 :: 		Diagram5_Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label1+26)
MOVT	R0, #hi_addr(_Diagram5_Label1+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1943 :: 		Diagram5_Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label1+27)
MOVT	R0, #hi_addr(_Diagram5_Label1+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1944 :: 		Diagram5_Label1.Caption         = Diagram5_Label1_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label1_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label1_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label1+16)
MOVT	R0, #hi_addr(_Diagram5_Label1+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1945 :: 		Diagram5_Label1.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Diagram5_Label1+20)
MOVT	R0, #hi_addr(_Diagram5_Label1+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1946 :: 		Diagram5_Label1.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label1+24)
MOVT	R0, #hi_addr(_Diagram5_Label1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1947 :: 		Diagram5_Label1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label1+28)
MOVT	R0, #hi_addr(_Diagram5_Label1+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1948 :: 		Diagram5_Label1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label1+32)
MOVT	R0, #hi_addr(_Diagram5_Label1+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1949 :: 		Diagram5_Label1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label1+36)
MOVT	R0, #hi_addr(_Diagram5_Label1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1950 :: 		Diagram5_Label1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label1+40)
MOVT	R0, #hi_addr(_Diagram5_Label1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1952 :: 		Diagram5_Label2.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label2+0)
MOVT	R0, #hi_addr(_Diagram5_Label2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1953 :: 		Diagram5_Label2.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Diagram5_Label2+4)
MOVT	R0, #hi_addr(_Diagram5_Label2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1954 :: 		Diagram5_Label2.Left            = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Diagram5_Label2+6)
MOVT	R0, #hi_addr(_Diagram5_Label2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1955 :: 		Diagram5_Label2.Top             = 158;
MOVS	R1, #158
MOVW	R0, #lo_addr(_Diagram5_Label2+8)
MOVT	R0, #hi_addr(_Diagram5_Label2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1956 :: 		Diagram5_Label2.Width           = 141;
MOVS	R1, #141
MOVW	R0, #lo_addr(_Diagram5_Label2+10)
MOVT	R0, #hi_addr(_Diagram5_Label2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1957 :: 		Diagram5_Label2.Height          = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_Diagram5_Label2+12)
MOVT	R0, #hi_addr(_Diagram5_Label2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1958 :: 		Diagram5_Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label2+26)
MOVT	R0, #hi_addr(_Diagram5_Label2+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1959 :: 		Diagram5_Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label2+27)
MOVT	R0, #hi_addr(_Diagram5_Label2+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1960 :: 		Diagram5_Label2.Caption         = Diagram5_Label2_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label2_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label2_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label2+16)
MOVT	R0, #hi_addr(_Diagram5_Label2+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1961 :: 		Diagram5_Label2.FontName        = Open_Sans42x61_Regular;
MOVW	R2, #lo_addr(_Open_Sans42x61_Regular+0)
MOVT	R2, #hi_addr(_Open_Sans42x61_Regular+0)
MOVW	R0, #lo_addr(_Diagram5_Label2+20)
MOVT	R0, #hi_addr(_Diagram5_Label2+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,1962 :: 		Diagram5_Label2.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label2+24)
MOVT	R0, #hi_addr(_Diagram5_Label2+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1963 :: 		Diagram5_Label2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label2+28)
MOVT	R0, #hi_addr(_Diagram5_Label2+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1964 :: 		Diagram5_Label2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label2+32)
MOVT	R0, #hi_addr(_Diagram5_Label2+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1965 :: 		Diagram5_Label2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label2+36)
MOVT	R0, #hi_addr(_Diagram5_Label2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1966 :: 		Diagram5_Label2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label2+40)
MOVT	R0, #hi_addr(_Diagram5_Label2+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1968 :: 		Diagram5_Label3.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label3+0)
MOVT	R0, #hi_addr(_Diagram5_Label3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1969 :: 		Diagram5_Label3.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Diagram5_Label3+4)
MOVT	R0, #hi_addr(_Diagram5_Label3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1970 :: 		Diagram5_Label3.Left            = 358;
MOVW	R1, #358
MOVW	R0, #lo_addr(_Diagram5_Label3+6)
MOVT	R0, #hi_addr(_Diagram5_Label3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1971 :: 		Diagram5_Label3.Top             = 114;
MOVS	R1, #114
MOVW	R0, #lo_addr(_Diagram5_Label3+8)
MOVT	R0, #hi_addr(_Diagram5_Label3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1972 :: 		Diagram5_Label3.Width           = 93;
MOVS	R1, #93
MOVW	R0, #lo_addr(_Diagram5_Label3+10)
MOVT	R0, #hi_addr(_Diagram5_Label3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1973 :: 		Diagram5_Label3.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Diagram5_Label3+12)
MOVT	R0, #hi_addr(_Diagram5_Label3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1974 :: 		Diagram5_Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label3+26)
MOVT	R0, #hi_addr(_Diagram5_Label3+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1975 :: 		Diagram5_Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label3+27)
MOVT	R0, #hi_addr(_Diagram5_Label3+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1976 :: 		Diagram5_Label3.Caption         = Diagram5_Label3_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label3_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label3_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label3+16)
MOVT	R0, #hi_addr(_Diagram5_Label3+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1977 :: 		Diagram5_Label3.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Diagram5_Label3+20)
MOVT	R0, #hi_addr(_Diagram5_Label3+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,1978 :: 		Diagram5_Label3.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label3+24)
MOVT	R0, #hi_addr(_Diagram5_Label3+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1979 :: 		Diagram5_Label3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label3+28)
MOVT	R0, #hi_addr(_Diagram5_Label3+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1980 :: 		Diagram5_Label3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label3+32)
MOVT	R0, #hi_addr(_Diagram5_Label3+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1981 :: 		Diagram5_Label3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label3+36)
MOVT	R0, #hi_addr(_Diagram5_Label3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1982 :: 		Diagram5_Label3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label3+40)
MOVT	R0, #hi_addr(_Diagram5_Label3+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1984 :: 		Diagram5_Label4.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label4+0)
MOVT	R0, #hi_addr(_Diagram5_Label4+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1985 :: 		Diagram5_Label4.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Diagram5_Label4+4)
MOVT	R0, #hi_addr(_Diagram5_Label4+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1986 :: 		Diagram5_Label4.Left            = 339;
MOVW	R1, #339
MOVW	R0, #lo_addr(_Diagram5_Label4+6)
MOVT	R0, #hi_addr(_Diagram5_Label4+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1987 :: 		Diagram5_Label4.Top             = 158;
MOVS	R1, #158
MOVW	R0, #lo_addr(_Diagram5_Label4+8)
MOVT	R0, #hi_addr(_Diagram5_Label4+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1988 :: 		Diagram5_Label4.Width           = 130;
MOVS	R1, #130
MOVW	R0, #lo_addr(_Diagram5_Label4+10)
MOVT	R0, #hi_addr(_Diagram5_Label4+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1989 :: 		Diagram5_Label4.Height          = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_Diagram5_Label4+12)
MOVT	R0, #hi_addr(_Diagram5_Label4+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1990 :: 		Diagram5_Label4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label4+26)
MOVT	R0, #hi_addr(_Diagram5_Label4+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1991 :: 		Diagram5_Label4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label4+27)
MOVT	R0, #hi_addr(_Diagram5_Label4+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1992 :: 		Diagram5_Label4.Caption         = Diagram5_Label4_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label4_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label4_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label4+16)
MOVT	R0, #hi_addr(_Diagram5_Label4+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1993 :: 		Diagram5_Label4.FontName        = Open_Sans42x61_Regular;
MOVW	R0, #lo_addr(_Diagram5_Label4+20)
MOVT	R0, #hi_addr(_Diagram5_Label4+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,1994 :: 		Diagram5_Label4.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label4+24)
MOVT	R0, #hi_addr(_Diagram5_Label4+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1995 :: 		Diagram5_Label4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label4+28)
MOVT	R0, #hi_addr(_Diagram5_Label4+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1996 :: 		Diagram5_Label4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label4+32)
MOVT	R0, #hi_addr(_Diagram5_Label4+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1997 :: 		Diagram5_Label4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label4+36)
MOVT	R0, #hi_addr(_Diagram5_Label4+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,1998 :: 		Diagram5_Label4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label4+40)
MOVT	R0, #hi_addr(_Diagram5_Label4+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2000 :: 		Diagram5_Label5.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label5+0)
MOVT	R0, #hi_addr(_Diagram5_Label5+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2001 :: 		Diagram5_Label5.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Diagram5_Label5+4)
MOVT	R0, #hi_addr(_Diagram5_Label5+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2002 :: 		Diagram5_Label5.Left            = 204;
MOVS	R1, #204
MOVW	R0, #lo_addr(_Diagram5_Label5+6)
MOVT	R0, #hi_addr(_Diagram5_Label5+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2003 :: 		Diagram5_Label5.Top             = 162;
MOVS	R1, #162
MOVW	R0, #lo_addr(_Diagram5_Label5+8)
MOVT	R0, #hi_addr(_Diagram5_Label5+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2004 :: 		Diagram5_Label5.Width           = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_Diagram5_Label5+10)
MOVT	R0, #hi_addr(_Diagram5_Label5+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2005 :: 		Diagram5_Label5.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Diagram5_Label5+12)
MOVT	R0, #hi_addr(_Diagram5_Label5+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2006 :: 		Diagram5_Label5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label5+26)
MOVT	R0, #hi_addr(_Diagram5_Label5+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2007 :: 		Diagram5_Label5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label5+27)
MOVT	R0, #hi_addr(_Diagram5_Label5+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2008 :: 		Diagram5_Label5.Caption         = Diagram5_Label5_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label5_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label5_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label5+16)
MOVT	R0, #hi_addr(_Diagram5_Label5+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2009 :: 		Diagram5_Label5.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Diagram5_Label5+20)
MOVT	R0, #hi_addr(_Diagram5_Label5+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,2010 :: 		Diagram5_Label5.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label5+24)
MOVT	R0, #hi_addr(_Diagram5_Label5+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2011 :: 		Diagram5_Label5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label5+28)
MOVT	R0, #hi_addr(_Diagram5_Label5+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2012 :: 		Diagram5_Label5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label5+32)
MOVT	R0, #hi_addr(_Diagram5_Label5+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2013 :: 		Diagram5_Label5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label5+36)
MOVT	R0, #hi_addr(_Diagram5_Label5+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2014 :: 		Diagram5_Label5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label5+40)
MOVT	R0, #hi_addr(_Diagram5_Label5+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2016 :: 		BackIconSensors.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_BackIconSensors+0)
MOVT	R0, #hi_addr(_BackIconSensors+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2017 :: 		BackIconSensors.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_BackIconSensors+4)
MOVT	R0, #hi_addr(_BackIconSensors+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2018 :: 		BackIconSensors.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_BackIconSensors+6)
MOVT	R0, #hi_addr(_BackIconSensors+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2019 :: 		BackIconSensors.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_BackIconSensors+8)
MOVT	R0, #hi_addr(_BackIconSensors+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2020 :: 		BackIconSensors.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_BackIconSensors+10)
MOVT	R0, #hi_addr(_BackIconSensors+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2021 :: 		BackIconSensors.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_BackIconSensors+12)
MOVT	R0, #hi_addr(_BackIconSensors+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2022 :: 		BackIconSensors.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackIconSensors+22)
MOVT	R0, #hi_addr(_BackIconSensors+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2023 :: 		BackIconSensors.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BackIconSensors+23)
MOVT	R0, #hi_addr(_BackIconSensors+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2024 :: 		BackIconSensors.Picture_Name    = icon_back_sensors_bmp;
MOVW	R1, #lo_addr(_icon_back_sensors_bmp+0)
MOVT	R1, #hi_addr(_icon_back_sensors_bmp+0)
MOVW	R0, #lo_addr(_BackIconSensors+16)
MOVT	R0, #hi_addr(_BackIconSensors+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2025 :: 		BackIconSensors.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BackIconSensors+20)
MOVT	R0, #hi_addr(_BackIconSensors+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2026 :: 		BackIconSensors.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackIconSensors+21)
MOVT	R0, #hi_addr(_BackIconSensors+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2027 :: 		BackIconSensors.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackIconSensors+24)
MOVT	R0, #hi_addr(_BackIconSensors+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2028 :: 		BackIconSensors.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackIconSensors+28)
MOVT	R0, #hi_addr(_BackIconSensors+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2029 :: 		BackIconSensors.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackIconSensors+32)
MOVT	R0, #hi_addr(_BackIconSensors+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2030 :: 		BackIconSensors.OnPressPtr      = BackIconSensorsOnPress;
MOVW	R1, #lo_addr(_BackIconSensorsOnPress+0)
MOVT	R1, #hi_addr(_BackIconSensorsOnPress+0)
MOVW	R0, #lo_addr(_BackIconSensors+36)
MOVT	R0, #hi_addr(_BackIconSensors+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2032 :: 		Diagram5_Label6.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Diagram5_Label6+0)
MOVT	R0, #hi_addr(_Diagram5_Label6+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2033 :: 		Diagram5_Label6.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Diagram5_Label6+4)
MOVT	R0, #hi_addr(_Diagram5_Label6+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2034 :: 		Diagram5_Label6.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Diagram5_Label6+6)
MOVT	R0, #hi_addr(_Diagram5_Label6+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2035 :: 		Diagram5_Label6.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Diagram5_Label6+8)
MOVT	R0, #hi_addr(_Diagram5_Label6+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2036 :: 		Diagram5_Label6.Width           = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Diagram5_Label6+10)
MOVT	R0, #hi_addr(_Diagram5_Label6+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2037 :: 		Diagram5_Label6.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Diagram5_Label6+12)
MOVT	R0, #hi_addr(_Diagram5_Label6+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2038 :: 		Diagram5_Label6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Diagram5_Label6+26)
MOVT	R0, #hi_addr(_Diagram5_Label6+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2039 :: 		Diagram5_Label6.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label6+27)
MOVT	R0, #hi_addr(_Diagram5_Label6+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2040 :: 		Diagram5_Label6.Caption         = Diagram5_Label6_Caption;
MOVW	R1, #lo_addr(_Diagram5_Label6_Caption+0)
MOVT	R1, #hi_addr(_Diagram5_Label6_Caption+0)
MOVW	R0, #lo_addr(_Diagram5_Label6+16)
MOVT	R0, #hi_addr(_Diagram5_Label6+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2041 :: 		Diagram5_Label6.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Diagram5_Label6+20)
MOVT	R0, #hi_addr(_Diagram5_Label6+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,2042 :: 		Diagram5_Label6.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Diagram5_Label6+24)
MOVT	R0, #hi_addr(_Diagram5_Label6+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2043 :: 		Diagram5_Label6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label6+28)
MOVT	R0, #hi_addr(_Diagram5_Label6+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2044 :: 		Diagram5_Label6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label6+32)
MOVT	R0, #hi_addr(_Diagram5_Label6+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2045 :: 		Diagram5_Label6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Diagram5_Label6+36)
MOVT	R0, #hi_addr(_Diagram5_Label6+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2046 :: 		Diagram5_Label6.OnPressPtr      = BackIconSensorsOnPress;
MOVW	R1, #lo_addr(_BackIconSensorsOnPress+0)
MOVT	R1, #hi_addr(_BackIconSensorsOnPress+0)
MOVW	R0, #lo_addr(_Diagram5_Label6+40)
MOVT	R0, #hi_addr(_Diagram5_Label6+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2048 :: 		Label21.OwnerScreen     = &Sensors;
MOVW	R1, #lo_addr(_Sensors+0)
MOVT	R1, #hi_addr(_Sensors+0)
MOVW	R0, #lo_addr(_Label21+0)
MOVT	R0, #hi_addr(_Label21+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2049 :: 		Label21.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label21+4)
MOVT	R0, #hi_addr(_Label21+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2050 :: 		Label21.Left            = 192;
MOVS	R1, #192
MOVW	R0, #lo_addr(_Label21+6)
MOVT	R0, #hi_addr(_Label21+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2051 :: 		Label21.Top             = 161;
MOVS	R1, #161
MOVW	R0, #lo_addr(_Label21+8)
MOVT	R0, #hi_addr(_Label21+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2052 :: 		Label21.Width           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label21+10)
MOVT	R0, #hi_addr(_Label21+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2053 :: 		Label21.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label21+12)
MOVT	R0, #hi_addr(_Label21+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2054 :: 		Label21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+26)
MOVT	R0, #hi_addr(_Label21+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2055 :: 		Label21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+27)
MOVT	R0, #hi_addr(_Label21+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2056 :: 		Label21.Caption         = Label21_Caption;
MOVW	R1, #lo_addr(_Label21_Caption+0)
MOVT	R1, #hi_addr(_Label21_Caption+0)
MOVW	R0, #lo_addr(_Label21+16)
MOVT	R0, #hi_addr(_Label21+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2057 :: 		Label21.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Label21+20)
MOVT	R0, #hi_addr(_Label21+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,2058 :: 		Label21.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label21+24)
MOVT	R0, #hi_addr(_Label21+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2059 :: 		Label21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+28)
MOVT	R0, #hi_addr(_Label21+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2060 :: 		Label21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+32)
MOVT	R0, #hi_addr(_Label21+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2061 :: 		Label21.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+36)
MOVT	R0, #hi_addr(_Label21+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2062 :: 		Label21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+40)
MOVT	R0, #hi_addr(_Label21+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2064 :: 		Box20.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Box20+0)
MOVT	R0, #hi_addr(_Box20+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2065 :: 		Box20.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+4)
MOVT	R0, #hi_addr(_Box20+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2066 :: 		Box20.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Box20+6)
MOVT	R0, #hi_addr(_Box20+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2067 :: 		Box20.Top             = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box20+8)
MOVT	R0, #hi_addr(_Box20+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2068 :: 		Box20.Width           = 138;
MOVS	R1, #138
MOVW	R0, #lo_addr(_Box20+10)
MOVT	R0, #hi_addr(_Box20+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2069 :: 		Box20.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Box20+12)
MOVT	R0, #hi_addr(_Box20+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2070 :: 		Box20.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+14)
MOVT	R0, #hi_addr(_Box20+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2071 :: 		Box20.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+16)
MOVT	R0, #hi_addr(_Box20+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2072 :: 		Box20.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+18)
MOVT	R0, #hi_addr(_Box20+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2073 :: 		Box20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+19)
MOVT	R0, #hi_addr(_Box20+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2074 :: 		Box20.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box20+20)
MOVT	R0, #hi_addr(_Box20+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2075 :: 		Box20.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+21)
MOVT	R0, #hi_addr(_Box20+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2076 :: 		Box20.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+22)
MOVT	R0, #hi_addr(_Box20+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2077 :: 		Box20.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box20+24)
MOVT	R0, #hi_addr(_Box20+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2078 :: 		Box20.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box20+26)
MOVT	R0, #hi_addr(_Box20+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2079 :: 		Box20.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box20+28)
MOVT	R0, #hi_addr(_Box20+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2080 :: 		Box20.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+30)
MOVT	R0, #hi_addr(_Box20+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2081 :: 		Box20.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box20+32)
MOVT	R0, #hi_addr(_Box20+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2082 :: 		Box20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+36)
MOVT	R0, #hi_addr(_Box20+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2083 :: 		Box20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+40)
MOVT	R0, #hi_addr(_Box20+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2084 :: 		Box20.OnClickPtr      = mp3_back_iconOnPress;
MOVW	R1, #lo_addr(_mp3_back_iconOnPress+0)
MOVT	R1, #hi_addr(_mp3_back_iconOnPress+0)
MOVW	R0, #lo_addr(_Box20+44)
MOVT	R0, #hi_addr(_Box20+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2085 :: 		Box20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box20+48)
MOVT	R0, #hi_addr(_Box20+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2087 :: 		Label22.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Label22+0)
MOVT	R0, #hi_addr(_Label22+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2088 :: 		Label22.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+4)
MOVT	R0, #hi_addr(_Label22+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2089 :: 		Label22.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label22+6)
MOVT	R0, #hi_addr(_Label22+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2090 :: 		Label22.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label22+8)
MOVT	R0, #hi_addr(_Label22+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2091 :: 		Label22.Width           = 112;
MOVS	R1, #112
MOVW	R0, #lo_addr(_Label22+10)
MOVT	R0, #hi_addr(_Label22+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2092 :: 		Label22.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label22+12)
MOVT	R0, #hi_addr(_Label22+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2093 :: 		Label22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+26)
MOVT	R0, #hi_addr(_Label22+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2094 :: 		Label22.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+27)
MOVT	R0, #hi_addr(_Label22+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2095 :: 		Label22.Caption         = Label22_Caption;
MOVW	R1, #lo_addr(_Label22_Caption+0)
MOVT	R1, #hi_addr(_Label22_Caption+0)
MOVW	R0, #lo_addr(_Label22+16)
MOVT	R0, #hi_addr(_Label22+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2096 :: 		Label22.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Label22+20)
MOVT	R0, #hi_addr(_Label22+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,2097 :: 		Label22.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label22+24)
MOVT	R0, #hi_addr(_Label22+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2098 :: 		Label22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+28)
MOVT	R0, #hi_addr(_Label22+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2099 :: 		Label22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+32)
MOVT	R0, #hi_addr(_Label22+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2100 :: 		Label22.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+36)
MOVT	R0, #hi_addr(_Label22+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2101 :: 		Label22.OnPressPtr      = Label22OnPress;
MOVW	R1, #lo_addr(_Label22OnPress+0)
MOVT	R1, #hi_addr(_Label22OnPress+0)
MOVW	R0, #lo_addr(_Label22+40)
MOVT	R0, #hi_addr(_Label22+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2103 :: 		Label23.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Label23+0)
MOVT	R0, #hi_addr(_Label23+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2104 :: 		Label23.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label23+4)
MOVT	R0, #hi_addr(_Label23+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2105 :: 		Label23.Left            = 160;
MOVS	R1, #160
MOVW	R0, #lo_addr(_Label23+6)
MOVT	R0, #hi_addr(_Label23+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2106 :: 		Label23.Top             = 128;
MOVS	R1, #128
MOVW	R0, #lo_addr(_Label23+8)
MOVT	R0, #hi_addr(_Label23+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2107 :: 		Label23.Width           = 145;
MOVS	R1, #145
MOVW	R0, #lo_addr(_Label23+10)
MOVT	R0, #hi_addr(_Label23+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2108 :: 		Label23.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label23+12)
MOVT	R0, #hi_addr(_Label23+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2109 :: 		Label23.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+26)
MOVT	R0, #hi_addr(_Label23+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2110 :: 		Label23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+27)
MOVT	R0, #hi_addr(_Label23+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2111 :: 		Label23.Caption         = Label23_Caption;
MOVW	R1, #lo_addr(_Label23_Caption+0)
MOVT	R1, #hi_addr(_Label23_Caption+0)
MOVW	R0, #lo_addr(_Label23+16)
MOVT	R0, #hi_addr(_Label23+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2112 :: 		Label23.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label23+20)
MOVT	R0, #hi_addr(_Label23+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,2113 :: 		Label23.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label23+24)
MOVT	R0, #hi_addr(_Label23+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2114 :: 		Label23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+28)
MOVT	R0, #hi_addr(_Label23+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2115 :: 		Label23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+32)
MOVT	R0, #hi_addr(_Label23+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2116 :: 		Label23.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+36)
MOVT	R0, #hi_addr(_Label23+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2117 :: 		Label23.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+40)
MOVT	R0, #hi_addr(_Label23+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2119 :: 		Image11.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Image11+0)
MOVT	R0, #hi_addr(_Image11+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2120 :: 		Image11.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Image11+4)
MOVT	R0, #hi_addr(_Image11+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2121 :: 		Image11.Left            = 427;
MOVW	R1, #427
MOVW	R0, #lo_addr(_Image11+6)
MOVT	R0, #hi_addr(_Image11+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2122 :: 		Image11.Top             = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Image11+8)
MOVT	R0, #hi_addr(_Image11+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2123 :: 		Image11.Width           = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Image11+10)
MOVT	R0, #hi_addr(_Image11+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2124 :: 		Image11.Height          = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Image11+12)
MOVT	R0, #hi_addr(_Image11+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2125 :: 		Image11.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+22)
MOVT	R0, #hi_addr(_Image11+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2126 :: 		Image11.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+23)
MOVT	R0, #hi_addr(_Image11+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2127 :: 		Image11.Picture_Name    = icon_microsd_bmp;
MOVW	R1, #lo_addr(_icon_microsd_bmp+0)
MOVT	R1, #hi_addr(_icon_microsd_bmp+0)
MOVW	R0, #lo_addr(_Image11+16)
MOVT	R0, #hi_addr(_Image11+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2128 :: 		Image11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+20)
MOVT	R0, #hi_addr(_Image11+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2129 :: 		Image11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image11+21)
MOVT	R0, #hi_addr(_Image11+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2130 :: 		Image11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+24)
MOVT	R0, #hi_addr(_Image11+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2131 :: 		Image11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+28)
MOVT	R0, #hi_addr(_Image11+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2132 :: 		Image11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+32)
MOVT	R0, #hi_addr(_Image11+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2133 :: 		Image11.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image11+36)
MOVT	R0, #hi_addr(_Image11+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2135 :: 		Image12.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Image12+0)
MOVT	R0, #hi_addr(_Image12+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2136 :: 		Image12.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image12+4)
MOVT	R0, #hi_addr(_Image12+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2137 :: 		Image12.Left            = 400;
MOVW	R1, #400
MOVW	R0, #lo_addr(_Image12+6)
MOVT	R0, #hi_addr(_Image12+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2138 :: 		Image12.Top             = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Image12+8)
MOVT	R0, #hi_addr(_Image12+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2139 :: 		Image12.Width           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Image12+10)
MOVT	R0, #hi_addr(_Image12+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2140 :: 		Image12.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image12+12)
MOVT	R0, #hi_addr(_Image12+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2141 :: 		Image12.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+22)
MOVT	R0, #hi_addr(_Image12+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2142 :: 		Image12.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+23)
MOVT	R0, #hi_addr(_Image12+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2143 :: 		Image12.Picture_Name    = icon_anim_01_bmp;
MOVW	R1, #lo_addr(_icon_anim_01_bmp+0)
MOVT	R1, #hi_addr(_icon_anim_01_bmp+0)
MOVW	R0, #lo_addr(_Image12+16)
MOVT	R0, #hi_addr(_Image12+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2144 :: 		Image12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+20)
MOVT	R0, #hi_addr(_Image12+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2145 :: 		Image12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image12+21)
MOVT	R0, #hi_addr(_Image12+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2146 :: 		Image12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+24)
MOVT	R0, #hi_addr(_Image12+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2147 :: 		Image12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+28)
MOVT	R0, #hi_addr(_Image12+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2148 :: 		Image12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+32)
MOVT	R0, #hi_addr(_Image12+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2149 :: 		Image12.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image12+36)
MOVT	R0, #hi_addr(_Image12+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2151 :: 		Image13.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Image13+0)
MOVT	R0, #hi_addr(_Image13+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2152 :: 		Image13.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image13+4)
MOVT	R0, #hi_addr(_Image13+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2153 :: 		Image13.Left            = 400;
MOVW	R1, #400
MOVW	R0, #lo_addr(_Image13+6)
MOVT	R0, #hi_addr(_Image13+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2154 :: 		Image13.Top             = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Image13+8)
MOVT	R0, #hi_addr(_Image13+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2155 :: 		Image13.Width           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Image13+10)
MOVT	R0, #hi_addr(_Image13+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2156 :: 		Image13.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image13+12)
MOVT	R0, #hi_addr(_Image13+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2157 :: 		Image13.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image13+22)
MOVT	R0, #hi_addr(_Image13+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2158 :: 		Image13.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image13+23)
MOVT	R0, #hi_addr(_Image13+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2159 :: 		Image13.Picture_Name    = icon_anim_02_bmp;
MOVW	R1, #lo_addr(_icon_anim_02_bmp+0)
MOVT	R1, #hi_addr(_icon_anim_02_bmp+0)
MOVW	R0, #lo_addr(_Image13+16)
MOVT	R0, #hi_addr(_Image13+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2160 :: 		Image13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image13+20)
MOVT	R0, #hi_addr(_Image13+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2161 :: 		Image13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image13+21)
MOVT	R0, #hi_addr(_Image13+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2162 :: 		Image13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image13+24)
MOVT	R0, #hi_addr(_Image13+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2163 :: 		Image13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image13+28)
MOVT	R0, #hi_addr(_Image13+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2164 :: 		Image13.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image13+32)
MOVT	R0, #hi_addr(_Image13+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2165 :: 		Image13.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image13+36)
MOVT	R0, #hi_addr(_Image13+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2167 :: 		Image14.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_Image14+0)
MOVT	R0, #hi_addr(_Image14+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2168 :: 		Image14.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image14+4)
MOVT	R0, #hi_addr(_Image14+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2169 :: 		Image14.Left            = 400;
MOVW	R1, #400
MOVW	R0, #lo_addr(_Image14+6)
MOVT	R0, #hi_addr(_Image14+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2170 :: 		Image14.Top             = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Image14+8)
MOVT	R0, #hi_addr(_Image14+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2171 :: 		Image14.Width           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Image14+10)
MOVT	R0, #hi_addr(_Image14+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2172 :: 		Image14.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Image14+12)
MOVT	R0, #hi_addr(_Image14+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2173 :: 		Image14.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+22)
MOVT	R0, #hi_addr(_Image14+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2174 :: 		Image14.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image14+23)
MOVT	R0, #hi_addr(_Image14+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2175 :: 		Image14.Picture_Name    = icon_anim_03_bmp;
MOVW	R1, #lo_addr(_icon_anim_03_bmp+0)
MOVT	R1, #hi_addr(_icon_anim_03_bmp+0)
MOVW	R0, #lo_addr(_Image14+16)
MOVT	R0, #hi_addr(_Image14+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2176 :: 		Image14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image14+20)
MOVT	R0, #hi_addr(_Image14+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2177 :: 		Image14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image14+21)
MOVT	R0, #hi_addr(_Image14+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2178 :: 		Image14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+24)
MOVT	R0, #hi_addr(_Image14+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2179 :: 		Image14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+28)
MOVT	R0, #hi_addr(_Image14+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2180 :: 		Image14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+32)
MOVT	R0, #hi_addr(_Image14+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2181 :: 		Image14.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image14+36)
MOVT	R0, #hi_addr(_Image14+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2183 :: 		mp3_back_icon.OwnerScreen     = &MP3_SD;
MOVW	R1, #lo_addr(_MP3_SD+0)
MOVT	R1, #hi_addr(_MP3_SD+0)
MOVW	R0, #lo_addr(_mp3_back_icon+0)
MOVT	R0, #hi_addr(_mp3_back_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2184 :: 		mp3_back_icon.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_mp3_back_icon+4)
MOVT	R0, #hi_addr(_mp3_back_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2185 :: 		mp3_back_icon.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_mp3_back_icon+6)
MOVT	R0, #hi_addr(_mp3_back_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2186 :: 		mp3_back_icon.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_mp3_back_icon+8)
MOVT	R0, #hi_addr(_mp3_back_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2187 :: 		mp3_back_icon.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_mp3_back_icon+10)
MOVT	R0, #hi_addr(_mp3_back_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2188 :: 		mp3_back_icon.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_mp3_back_icon+12)
MOVT	R0, #hi_addr(_mp3_back_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2189 :: 		mp3_back_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon+22)
MOVT	R0, #hi_addr(_mp3_back_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2190 :: 		mp3_back_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_mp3_back_icon+23)
MOVT	R0, #hi_addr(_mp3_back_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2191 :: 		mp3_back_icon.Picture_Name    = icon_back_mp3_bmp;
MOVW	R2, #lo_addr(_icon_back_mp3_bmp+0)
MOVT	R2, #hi_addr(_icon_back_mp3_bmp+0)
MOVW	R0, #lo_addr(_mp3_back_icon+16)
MOVT	R0, #hi_addr(_mp3_back_icon+16)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,2192 :: 		mp3_back_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_mp3_back_icon+20)
MOVT	R0, #hi_addr(_mp3_back_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2193 :: 		mp3_back_icon.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon+21)
MOVT	R0, #hi_addr(_mp3_back_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2194 :: 		mp3_back_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon+24)
MOVT	R0, #hi_addr(_mp3_back_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2195 :: 		mp3_back_icon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon+28)
MOVT	R0, #hi_addr(_mp3_back_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2196 :: 		mp3_back_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon+32)
MOVT	R0, #hi_addr(_mp3_back_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2197 :: 		mp3_back_icon.OnPressPtr      = mp3_back_iconOnPress;
MOVW	R1, #lo_addr(_mp3_back_iconOnPress+0)
MOVT	R1, #hi_addr(_mp3_back_iconOnPress+0)
MOVW	R0, #lo_addr(_mp3_back_icon+36)
MOVT	R0, #hi_addr(_mp3_back_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2199 :: 		Box19.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_Box19+0)
MOVT	R0, #hi_addr(_Box19+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2200 :: 		Box19.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+4)
MOVT	R0, #hi_addr(_Box19+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2201 :: 		Box19.Left            = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box19+6)
MOVT	R0, #hi_addr(_Box19+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2202 :: 		Box19.Top             = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box19+8)
MOVT	R0, #hi_addr(_Box19+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2203 :: 		Box19.Width           = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_Box19+10)
MOVT	R0, #hi_addr(_Box19+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2204 :: 		Box19.Height          = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Box19+12)
MOVT	R0, #hi_addr(_Box19+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2205 :: 		Box19.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+14)
MOVT	R0, #hi_addr(_Box19+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2206 :: 		Box19.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+16)
MOVT	R0, #hi_addr(_Box19+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2207 :: 		Box19.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+18)
MOVT	R0, #hi_addr(_Box19+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2208 :: 		Box19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+19)
MOVT	R0, #hi_addr(_Box19+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2209 :: 		Box19.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box19+20)
MOVT	R0, #hi_addr(_Box19+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2210 :: 		Box19.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+21)
MOVT	R0, #hi_addr(_Box19+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2211 :: 		Box19.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+22)
MOVT	R0, #hi_addr(_Box19+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2212 :: 		Box19.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box19+24)
MOVT	R0, #hi_addr(_Box19+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2213 :: 		Box19.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box19+26)
MOVT	R0, #hi_addr(_Box19+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2214 :: 		Box19.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box19+28)
MOVT	R0, #hi_addr(_Box19+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2215 :: 		Box19.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+30)
MOVT	R0, #hi_addr(_Box19+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2216 :: 		Box19.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box19+32)
MOVT	R0, #hi_addr(_Box19+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2217 :: 		Box19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+36)
MOVT	R0, #hi_addr(_Box19+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2218 :: 		Box19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+40)
MOVT	R0, #hi_addr(_Box19+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2219 :: 		Box19.OnClickPtr      = Image15OnPress;
MOVW	R1, #lo_addr(_Image15OnPress+0)
MOVT	R1, #hi_addr(_Image15OnPress+0)
MOVW	R0, #lo_addr(_Box19+44)
MOVT	R0, #hi_addr(_Box19+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2220 :: 		Box19.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box19+48)
MOVT	R0, #hi_addr(_Box19+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2222 :: 		Box6.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_Box6+0)
MOVT	R0, #hi_addr(_Box6+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2223 :: 		Box6.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+4)
MOVT	R0, #hi_addr(_Box6+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2224 :: 		Box6.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+6)
MOVT	R0, #hi_addr(_Box6+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2225 :: 		Box6.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Box6+8)
MOVT	R0, #hi_addr(_Box6+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2226 :: 		Box6.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Box6+10)
MOVT	R0, #hi_addr(_Box6+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2227 :: 		Box6.Height          = 210;
MOVS	R1, #210
MOVW	R0, #lo_addr(_Box6+12)
MOVT	R0, #hi_addr(_Box6+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2228 :: 		Box6.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+14)
MOVT	R0, #hi_addr(_Box6+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2229 :: 		Box6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+16)
MOVT	R0, #hi_addr(_Box6+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2230 :: 		Box6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+18)
MOVT	R0, #hi_addr(_Box6+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2231 :: 		Box6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+19)
MOVT	R0, #hi_addr(_Box6+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2232 :: 		Box6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+20)
MOVT	R0, #hi_addr(_Box6+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2233 :: 		Box6.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+21)
MOVT	R0, #hi_addr(_Box6+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2234 :: 		Box6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+22)
MOVT	R0, #hi_addr(_Box6+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2235 :: 		Box6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box6+24)
MOVT	R0, #hi_addr(_Box6+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2236 :: 		Box6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box6+26)
MOVT	R0, #hi_addr(_Box6+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2237 :: 		Box6.Color           = 0x2B31;
MOVW	R1, #11057
MOVW	R0, #lo_addr(_Box6+28)
MOVT	R0, #hi_addr(_Box6+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2238 :: 		Box6.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+30)
MOVT	R0, #hi_addr(_Box6+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2239 :: 		Box6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box6+32)
MOVT	R0, #hi_addr(_Box6+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2240 :: 		Box6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+36)
MOVT	R0, #hi_addr(_Box6+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2241 :: 		Box6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+40)
MOVT	R0, #hi_addr(_Box6+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2242 :: 		Box6.OnClickPtr      = Box6OnClick;
MOVW	R1, #lo_addr(_Box6OnClick+0)
MOVT	R1, #hi_addr(_Box6OnClick+0)
MOVW	R0, #lo_addr(_Box6+44)
MOVT	R0, #hi_addr(_Box6+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2243 :: 		Box6.OnPressPtr      = Box6OnPress;
MOVW	R1, #lo_addr(_Box6OnPress+0)
MOVT	R1, #hi_addr(_Box6OnPress+0)
MOVW	R0, #lo_addr(_Box6+48)
MOVT	R0, #hi_addr(_Box6+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2245 :: 		Label24.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_Label24+0)
MOVT	R0, #hi_addr(_Label24+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2246 :: 		Label24.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label24+4)
MOVT	R0, #hi_addr(_Label24+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2247 :: 		Label24.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label24+6)
MOVT	R0, #hi_addr(_Label24+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2248 :: 		Label24.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label24+8)
MOVT	R0, #hi_addr(_Label24+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2249 :: 		Label24.Width           = 112;
MOVS	R1, #112
MOVW	R0, #lo_addr(_Label24+10)
MOVT	R0, #hi_addr(_Label24+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2250 :: 		Label24.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label24+12)
MOVT	R0, #hi_addr(_Label24+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2251 :: 		Label24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label24+26)
MOVT	R0, #hi_addr(_Label24+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2252 :: 		Label24.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+27)
MOVT	R0, #hi_addr(_Label24+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2253 :: 		Label24.Caption         = Label24_Caption;
MOVW	R1, #lo_addr(_Label24_Caption+0)
MOVT	R1, #hi_addr(_Label24_Caption+0)
MOVW	R0, #lo_addr(_Label24+16)
MOVT	R0, #hi_addr(_Label24+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2254 :: 		Label24.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Label24+20)
MOVT	R0, #hi_addr(_Label24+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,2255 :: 		Label24.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label24+24)
MOVT	R0, #hi_addr(_Label24+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2256 :: 		Label24.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+28)
MOVT	R0, #hi_addr(_Label24+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2257 :: 		Label24.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+32)
MOVT	R0, #hi_addr(_Label24+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2258 :: 		Label24.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+36)
MOVT	R0, #hi_addr(_Label24+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2259 :: 		Label24.OnPressPtr      = Label24OnPress;
MOVW	R1, #lo_addr(_Label24OnPress+0)
MOVT	R1, #hi_addr(_Label24OnPress+0)
MOVW	R0, #lo_addr(_Label24+40)
MOVT	R0, #hi_addr(_Label24+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2261 :: 		mp3_back_icon2.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_mp3_back_icon2+0)
MOVT	R0, #hi_addr(_mp3_back_icon2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2262 :: 		mp3_back_icon2.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_mp3_back_icon2+4)
MOVT	R0, #hi_addr(_mp3_back_icon2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2263 :: 		mp3_back_icon2.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_mp3_back_icon2+6)
MOVT	R0, #hi_addr(_mp3_back_icon2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2264 :: 		mp3_back_icon2.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_mp3_back_icon2+8)
MOVT	R0, #hi_addr(_mp3_back_icon2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2265 :: 		mp3_back_icon2.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_mp3_back_icon2+10)
MOVT	R0, #hi_addr(_mp3_back_icon2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2266 :: 		mp3_back_icon2.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_mp3_back_icon2+12)
MOVT	R0, #hi_addr(_mp3_back_icon2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2267 :: 		mp3_back_icon2.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon2+22)
MOVT	R0, #hi_addr(_mp3_back_icon2+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2268 :: 		mp3_back_icon2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_mp3_back_icon2+23)
MOVT	R0, #hi_addr(_mp3_back_icon2+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2269 :: 		mp3_back_icon2.Picture_Name    = icon_back_mp3_bmp;
MOVW	R0, #lo_addr(_mp3_back_icon2+16)
MOVT	R0, #hi_addr(_mp3_back_icon2+16)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,2270 :: 		mp3_back_icon2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_mp3_back_icon2+20)
MOVT	R0, #hi_addr(_mp3_back_icon2+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2271 :: 		mp3_back_icon2.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon2+21)
MOVT	R0, #hi_addr(_mp3_back_icon2+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2272 :: 		mp3_back_icon2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon2+24)
MOVT	R0, #hi_addr(_mp3_back_icon2+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2273 :: 		mp3_back_icon2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon2+28)
MOVT	R0, #hi_addr(_mp3_back_icon2+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2274 :: 		mp3_back_icon2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_mp3_back_icon2+32)
MOVT	R0, #hi_addr(_mp3_back_icon2+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2275 :: 		mp3_back_icon2.OnPressPtr      = Image15OnPress;
MOVW	R1, #lo_addr(_Image15OnPress+0)
MOVT	R1, #hi_addr(_Image15OnPress+0)
MOVW	R0, #lo_addr(_mp3_back_icon2+36)
MOVT	R0, #hi_addr(_mp3_back_icon2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2277 :: 		Label26.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_Label26+0)
MOVT	R0, #hi_addr(_Label26+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2278 :: 		Label26.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label26+4)
MOVT	R0, #hi_addr(_Label26+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2279 :: 		Label26.Left            = 168;
MOVS	R1, #168
MOVW	R0, #lo_addr(_Label26+6)
MOVT	R0, #hi_addr(_Label26+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2280 :: 		Label26.Top             = 248;
MOVS	R1, #248
MOVW	R0, #lo_addr(_Label26+8)
MOVT	R0, #hi_addr(_Label26+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2281 :: 		Label26.Width           = 163;
MOVS	R1, #163
MOVW	R0, #lo_addr(_Label26+10)
MOVT	R0, #hi_addr(_Label26+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2282 :: 		Label26.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label26+12)
MOVT	R0, #hi_addr(_Label26+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2283 :: 		Label26.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+26)
MOVT	R0, #hi_addr(_Label26+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2284 :: 		Label26.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+27)
MOVT	R0, #hi_addr(_Label26+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2285 :: 		Label26.Caption         = Label26_Caption;
MOVW	R1, #lo_addr(_Label26_Caption+0)
MOVT	R1, #hi_addr(_Label26_Caption+0)
MOVW	R0, #lo_addr(_Label26+16)
MOVT	R0, #hi_addr(_Label26+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2286 :: 		Label26.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label26+20)
MOVT	R0, #hi_addr(_Label26+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,2287 :: 		Label26.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label26+24)
MOVT	R0, #hi_addr(_Label26+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2288 :: 		Label26.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+28)
MOVT	R0, #hi_addr(_Label26+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2289 :: 		Label26.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+32)
MOVT	R0, #hi_addr(_Label26+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2290 :: 		Label26.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+36)
MOVT	R0, #hi_addr(_Label26+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2291 :: 		Label26.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+40)
MOVT	R0, #hi_addr(_Label26+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2293 :: 		folder_icon.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_folder_icon+0)
MOVT	R0, #hi_addr(_folder_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2294 :: 		folder_icon.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_folder_icon+4)
MOVT	R0, #hi_addr(_folder_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2295 :: 		folder_icon.Left            = 434;
MOVW	R1, #434
MOVW	R0, #lo_addr(_folder_icon+6)
MOVT	R0, #hi_addr(_folder_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2296 :: 		folder_icon.Top             = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_folder_icon+8)
MOVT	R0, #hi_addr(_folder_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2297 :: 		folder_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_folder_icon+10)
MOVT	R0, #hi_addr(_folder_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2298 :: 		folder_icon.Height          = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_folder_icon+12)
MOVT	R0, #hi_addr(_folder_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2299 :: 		folder_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+22)
MOVT	R0, #hi_addr(_folder_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2300 :: 		folder_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_folder_icon+23)
MOVT	R0, #hi_addr(_folder_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2301 :: 		folder_icon.Picture_Name    = icon_folder_bmp;
MOVW	R1, #lo_addr(_icon_folder_bmp+0)
MOVT	R1, #hi_addr(_icon_folder_bmp+0)
MOVW	R0, #lo_addr(_folder_icon+16)
MOVT	R0, #hi_addr(_folder_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2302 :: 		folder_icon.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+20)
MOVT	R0, #hi_addr(_folder_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2303 :: 		folder_icon.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+21)
MOVT	R0, #hi_addr(_folder_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2304 :: 		folder_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+24)
MOVT	R0, #hi_addr(_folder_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2305 :: 		folder_icon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+28)
MOVT	R0, #hi_addr(_folder_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2306 :: 		folder_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+32)
MOVT	R0, #hi_addr(_folder_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2307 :: 		folder_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_folder_icon+36)
MOVT	R0, #hi_addr(_folder_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2309 :: 		file_icon.OwnerScreen     = &MP3_SongList;
MOVW	R1, #lo_addr(_MP3_SongList+0)
MOVT	R1, #hi_addr(_MP3_SongList+0)
MOVW	R0, #lo_addr(_file_icon+0)
MOVT	R0, #hi_addr(_file_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2310 :: 		file_icon.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_file_icon+4)
MOVT	R0, #hi_addr(_file_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2311 :: 		file_icon.Left            = 434;
MOVW	R1, #434
MOVW	R0, #lo_addr(_file_icon+6)
MOVT	R0, #hi_addr(_file_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2312 :: 		file_icon.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_file_icon+8)
MOVT	R0, #hi_addr(_file_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2313 :: 		file_icon.Width           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_file_icon+10)
MOVT	R0, #hi_addr(_file_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2314 :: 		file_icon.Height          = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_file_icon+12)
MOVT	R0, #hi_addr(_file_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2315 :: 		file_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+22)
MOVT	R0, #hi_addr(_file_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2316 :: 		file_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_file_icon+23)
MOVT	R0, #hi_addr(_file_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2317 :: 		file_icon.Picture_Name    = icon_mp3_file_bmp;
MOVW	R1, #lo_addr(_icon_mp3_file_bmp+0)
MOVT	R1, #hi_addr(_icon_mp3_file_bmp+0)
MOVW	R0, #lo_addr(_file_icon+16)
MOVT	R0, #hi_addr(_file_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2318 :: 		file_icon.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+20)
MOVT	R0, #hi_addr(_file_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2319 :: 		file_icon.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+21)
MOVT	R0, #hi_addr(_file_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2320 :: 		file_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+24)
MOVT	R0, #hi_addr(_file_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2321 :: 		file_icon.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+28)
MOVT	R0, #hi_addr(_file_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2322 :: 		file_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+32)
MOVT	R0, #hi_addr(_file_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2323 :: 		file_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_file_icon+36)
MOVT	R0, #hi_addr(_file_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2325 :: 		Box17.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Box17+0)
MOVT	R0, #hi_addr(_Box17+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2326 :: 		Box17.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+4)
MOVT	R0, #hi_addr(_Box17+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2327 :: 		Box17.Left            = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Box17+6)
MOVT	R0, #hi_addr(_Box17+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2328 :: 		Box17.Top             = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box17+8)
MOVT	R0, #hi_addr(_Box17+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2329 :: 		Box17.Width           = 142;
MOVS	R1, #142
MOVW	R0, #lo_addr(_Box17+10)
MOVT	R0, #hi_addr(_Box17+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2330 :: 		Box17.Height          = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Box17+12)
MOVT	R0, #hi_addr(_Box17+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2331 :: 		Box17.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+14)
MOVT	R0, #hi_addr(_Box17+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2332 :: 		Box17.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+16)
MOVT	R0, #hi_addr(_Box17+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2333 :: 		Box17.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+18)
MOVT	R0, #hi_addr(_Box17+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2334 :: 		Box17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+19)
MOVT	R0, #hi_addr(_Box17+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2335 :: 		Box17.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box17+20)
MOVT	R0, #hi_addr(_Box17+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2336 :: 		Box17.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+21)
MOVT	R0, #hi_addr(_Box17+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2337 :: 		Box17.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+22)
MOVT	R0, #hi_addr(_Box17+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2338 :: 		Box17.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box17+24)
MOVT	R0, #hi_addr(_Box17+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2339 :: 		Box17.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box17+26)
MOVT	R0, #hi_addr(_Box17+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2340 :: 		Box17.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box17+28)
MOVT	R0, #hi_addr(_Box17+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2341 :: 		Box17.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+30)
MOVT	R0, #hi_addr(_Box17+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2342 :: 		Box17.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box17+32)
MOVT	R0, #hi_addr(_Box17+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2343 :: 		Box17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+36)
MOVT	R0, #hi_addr(_Box17+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2344 :: 		Box17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+40)
MOVT	R0, #hi_addr(_Box17+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2345 :: 		Box17.OnClickPtr      = Icon_back_mp3OnClick;
MOVW	R1, #lo_addr(_Icon_back_mp3OnClick+0)
MOVT	R1, #hi_addr(_Icon_back_mp3OnClick+0)
MOVW	R0, #lo_addr(_Box17+44)
MOVT	R0, #hi_addr(_Box17+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2346 :: 		Box17.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box17+48)
MOVT	R0, #hi_addr(_Box17+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2348 :: 		Label27.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Label27+0)
MOVT	R0, #hi_addr(_Label27+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2349 :: 		Label27.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+4)
MOVT	R0, #hi_addr(_Label27+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2350 :: 		Label27.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label27+6)
MOVT	R0, #hi_addr(_Label27+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2351 :: 		Label27.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label27+8)
MOVT	R0, #hi_addr(_Label27+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2352 :: 		Label27.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Label27+10)
MOVT	R0, #hi_addr(_Label27+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2353 :: 		Label27.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label27+12)
MOVT	R0, #hi_addr(_Label27+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2354 :: 		Label27.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+26)
MOVT	R0, #hi_addr(_Label27+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2355 :: 		Label27.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+27)
MOVT	R0, #hi_addr(_Label27+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2356 :: 		Label27.Caption         = Label27_Caption;
MOVW	R1, #lo_addr(_Label27_Caption+0)
MOVT	R1, #hi_addr(_Label27_Caption+0)
MOVW	R0, #lo_addr(_Label27+16)
MOVT	R0, #hi_addr(_Label27+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2357 :: 		Label27.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Label27+20)
MOVT	R0, #hi_addr(_Label27+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,2358 :: 		Label27.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label27+24)
MOVT	R0, #hi_addr(_Label27+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2359 :: 		Label27.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+28)
MOVT	R0, #hi_addr(_Label27+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2360 :: 		Label27.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+32)
MOVT	R0, #hi_addr(_Label27+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2361 :: 		Label27.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+36)
MOVT	R0, #hi_addr(_Label27+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2362 :: 		Label27.OnPressPtr      = Icon_back_mp3OnClick;
MOVW	R1, #lo_addr(_Icon_back_mp3OnClick+0)
MOVT	R1, #hi_addr(_Icon_back_mp3OnClick+0)
MOVW	R0, #lo_addr(_Label27+40)
MOVT	R0, #hi_addr(_Label27+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2364 :: 		Icon_back_mp3.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Icon_back_mp3+0)
MOVT	R0, #hi_addr(_Icon_back_mp3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2365 :: 		Icon_back_mp3.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Icon_back_mp3+4)
MOVT	R0, #hi_addr(_Icon_back_mp3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2366 :: 		Icon_back_mp3.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Icon_back_mp3+6)
MOVT	R0, #hi_addr(_Icon_back_mp3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2367 :: 		Icon_back_mp3.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Icon_back_mp3+8)
MOVT	R0, #hi_addr(_Icon_back_mp3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2368 :: 		Icon_back_mp3.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Icon_back_mp3+10)
MOVT	R0, #hi_addr(_Icon_back_mp3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2369 :: 		Icon_back_mp3.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Icon_back_mp3+12)
MOVT	R0, #hi_addr(_Icon_back_mp3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2370 :: 		Icon_back_mp3.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_back_mp3+22)
MOVT	R0, #hi_addr(_Icon_back_mp3+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2371 :: 		Icon_back_mp3.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_back_mp3+23)
MOVT	R0, #hi_addr(_Icon_back_mp3+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2372 :: 		Icon_back_mp3.Picture_Name    = icon_back_mp3_bmp_1;
MOVW	R1, #lo_addr(_icon_back_mp3_bmp_1+0)
MOVT	R1, #hi_addr(_icon_back_mp3_bmp_1+0)
MOVW	R0, #lo_addr(_Icon_back_mp3+16)
MOVT	R0, #hi_addr(_Icon_back_mp3+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2373 :: 		Icon_back_mp3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_back_mp3+20)
MOVT	R0, #hi_addr(_Icon_back_mp3+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2374 :: 		Icon_back_mp3.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_back_mp3+21)
MOVT	R0, #hi_addr(_Icon_back_mp3+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2375 :: 		Icon_back_mp3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_back_mp3+24)
MOVT	R0, #hi_addr(_Icon_back_mp3+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2376 :: 		Icon_back_mp3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_back_mp3+28)
MOVT	R0, #hi_addr(_Icon_back_mp3+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2377 :: 		Icon_back_mp3.OnClickPtr      = Icon_back_mp3OnClick;
MOVW	R1, #lo_addr(_Icon_back_mp3OnClick+0)
MOVT	R1, #hi_addr(_Icon_back_mp3OnClick+0)
MOVW	R0, #lo_addr(_Icon_back_mp3+32)
MOVT	R0, #hi_addr(_Icon_back_mp3+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2378 :: 		Icon_back_mp3.OnPressPtr      = Icon_back_mp3OnClick;
MOVW	R1, #lo_addr(_Icon_back_mp3OnClick+0)
MOVT	R1, #hi_addr(_Icon_back_mp3OnClick+0)
MOVW	R0, #lo_addr(_Icon_back_mp3+36)
MOVT	R0, #hi_addr(_Icon_back_mp3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2380 :: 		VolmeBar.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_VolmeBar+0)
MOVT	R0, #hi_addr(_VolmeBar+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2381 :: 		VolmeBar.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_VolmeBar+4)
MOVT	R0, #hi_addr(_VolmeBar+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2382 :: 		VolmeBar.Left            = 399;
MOVW	R1, #399
MOVW	R0, #lo_addr(_VolmeBar+6)
MOVT	R0, #hi_addr(_VolmeBar+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2383 :: 		VolmeBar.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_VolmeBar+8)
MOVT	R0, #hi_addr(_VolmeBar+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2384 :: 		VolmeBar.Width           = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_VolmeBar+10)
MOVT	R0, #hi_addr(_VolmeBar+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2385 :: 		VolmeBar.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_VolmeBar+12)
MOVT	R0, #hi_addr(_VolmeBar+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2386 :: 		VolmeBar.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+14)
MOVT	R0, #hi_addr(_VolmeBar+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2387 :: 		VolmeBar.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+16)
MOVT	R0, #hi_addr(_VolmeBar+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2388 :: 		VolmeBar.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_VolmeBar+18)
MOVT	R0, #hi_addr(_VolmeBar+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2389 :: 		VolmeBar.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_VolmeBar+19)
MOVT	R0, #hi_addr(_VolmeBar+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2390 :: 		VolmeBar.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_VolmeBar+20)
MOVT	R0, #hi_addr(_VolmeBar+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2391 :: 		VolmeBar.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+21)
MOVT	R0, #hi_addr(_VolmeBar+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2392 :: 		VolmeBar.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+22)
MOVT	R0, #hi_addr(_VolmeBar+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2393 :: 		VolmeBar.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_VolmeBar+24)
MOVT	R0, #hi_addr(_VolmeBar+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2394 :: 		VolmeBar.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_VolmeBar+26)
MOVT	R0, #hi_addr(_VolmeBar+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2395 :: 		VolmeBar.Color           = 0x2B31;
MOVW	R1, #11057
MOVW	R0, #lo_addr(_VolmeBar+28)
MOVT	R0, #hi_addr(_VolmeBar+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2396 :: 		VolmeBar.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+30)
MOVT	R0, #hi_addr(_VolmeBar+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2397 :: 		VolmeBar.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_VolmeBar+32)
MOVT	R0, #hi_addr(_VolmeBar+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2398 :: 		VolmeBar.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+36)
MOVT	R0, #hi_addr(_VolmeBar+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2399 :: 		VolmeBar.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+40)
MOVT	R0, #hi_addr(_VolmeBar+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2400 :: 		VolmeBar.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_VolmeBar+44)
MOVT	R0, #hi_addr(_VolmeBar+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2401 :: 		VolmeBar.OnPressPtr      = VolmeBarOnPress;
MOVW	R1, #lo_addr(_VolmeBarOnPress+0)
MOVT	R1, #hi_addr(_VolmeBarOnPress+0)
MOVW	R0, #lo_addr(_VolmeBar+48)
MOVT	R0, #hi_addr(_VolmeBar+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2403 :: 		Image15.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Image15+0)
MOVT	R0, #hi_addr(_Image15+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2404 :: 		Image15.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image15+4)
MOVT	R0, #hi_addr(_Image15+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2405 :: 		Image15.Left            = 374;
MOVW	R1, #374
MOVW	R0, #lo_addr(_Image15+6)
MOVT	R0, #hi_addr(_Image15+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2406 :: 		Image15.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Image15+8)
MOVT	R0, #hi_addr(_Image15+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2407 :: 		Image15.Width           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Image15+10)
MOVT	R0, #hi_addr(_Image15+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2408 :: 		Image15.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Image15+12)
MOVT	R0, #hi_addr(_Image15+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2409 :: 		Image15.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+22)
MOVT	R0, #hi_addr(_Image15+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2410 :: 		Image15.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image15+23)
MOVT	R0, #hi_addr(_Image15+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2411 :: 		Image15.Picture_Name    = icon_volume_BMP;
MOVW	R1, #lo_addr(_icon_volume_BMP+0)
MOVT	R1, #hi_addr(_icon_volume_BMP+0)
MOVW	R0, #lo_addr(_Image15+16)
MOVT	R0, #hi_addr(_Image15+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2412 :: 		Image15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image15+20)
MOVT	R0, #hi_addr(_Image15+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2413 :: 		Image15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image15+21)
MOVT	R0, #hi_addr(_Image15+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2414 :: 		Image15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+24)
MOVT	R0, #hi_addr(_Image15+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2415 :: 		Image15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+28)
MOVT	R0, #hi_addr(_Image15+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2416 :: 		Image15.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+32)
MOVT	R0, #hi_addr(_Image15+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2417 :: 		Image15.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image15+36)
MOVT	R0, #hi_addr(_Image15+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2419 :: 		ProgressBar.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_ProgressBar+0)
MOVT	R0, #hi_addr(_ProgressBar+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2420 :: 		ProgressBar.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_ProgressBar+4)
MOVT	R0, #hi_addr(_ProgressBar+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2421 :: 		ProgressBar.Left            = 180;
MOVS	R1, #180
MOVW	R0, #lo_addr(_ProgressBar+6)
MOVT	R0, #hi_addr(_ProgressBar+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2422 :: 		ProgressBar.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_ProgressBar+8)
MOVT	R0, #hi_addr(_ProgressBar+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2423 :: 		ProgressBar.Width           = 250;
MOVS	R1, #250
MOVW	R0, #lo_addr(_ProgressBar+10)
MOVT	R0, #hi_addr(_ProgressBar+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2424 :: 		ProgressBar.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_ProgressBar+12)
MOVT	R0, #hi_addr(_ProgressBar+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2425 :: 		ProgressBar.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+14)
MOVT	R0, #hi_addr(_ProgressBar+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2426 :: 		ProgressBar.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+16)
MOVT	R0, #hi_addr(_ProgressBar+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2427 :: 		ProgressBar.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar+18)
MOVT	R0, #hi_addr(_ProgressBar+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2428 :: 		ProgressBar.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar+19)
MOVT	R0, #hi_addr(_ProgressBar+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2429 :: 		ProgressBar.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ProgressBar+20)
MOVT	R0, #hi_addr(_ProgressBar+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2430 :: 		ProgressBar.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+21)
MOVT	R0, #hi_addr(_ProgressBar+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2431 :: 		ProgressBar.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+22)
MOVT	R0, #hi_addr(_ProgressBar+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2432 :: 		ProgressBar.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ProgressBar+24)
MOVT	R0, #hi_addr(_ProgressBar+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2433 :: 		ProgressBar.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ProgressBar+26)
MOVT	R0, #hi_addr(_ProgressBar+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2434 :: 		ProgressBar.Color           = 0x2B31;
MOVW	R1, #11057
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2435 :: 		ProgressBar.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+30)
MOVT	R0, #hi_addr(_ProgressBar+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2436 :: 		ProgressBar.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ProgressBar+32)
MOVT	R0, #hi_addr(_ProgressBar+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2437 :: 		ProgressBar.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+36)
MOVT	R0, #hi_addr(_ProgressBar+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2438 :: 		ProgressBar.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+40)
MOVT	R0, #hi_addr(_ProgressBar+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2439 :: 		ProgressBar.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+44)
MOVT	R0, #hi_addr(_ProgressBar+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2440 :: 		ProgressBar.OnPressPtr      = ProgreesBarOnPress;
MOVW	R1, #lo_addr(_ProgreesBarOnPress+0)
MOVT	R1, #hi_addr(_ProgreesBarOnPress+0)
MOVW	R0, #lo_addr(_ProgressBar+48)
MOVT	R0, #hi_addr(_ProgressBar+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2442 :: 		Label28.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Label28+0)
MOVT	R0, #hi_addr(_Label28+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2443 :: 		Label28.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label28+4)
MOVT	R0, #hi_addr(_Label28+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2444 :: 		Label28.Left            = 209;
MOVS	R1, #209
MOVW	R0, #lo_addr(_Label28+6)
MOVT	R0, #hi_addr(_Label28+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2445 :: 		Label28.Top             = 171;
MOVS	R1, #171
MOVW	R0, #lo_addr(_Label28+8)
MOVT	R0, #hi_addr(_Label28+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2446 :: 		Label28.Width           = 73;
MOVS	R1, #73
MOVW	R0, #lo_addr(_Label28+10)
MOVT	R0, #hi_addr(_Label28+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2447 :: 		Label28.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label28+12)
MOVT	R0, #hi_addr(_Label28+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2448 :: 		Label28.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+26)
MOVT	R0, #hi_addr(_Label28+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2449 :: 		Label28.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+27)
MOVT	R0, #hi_addr(_Label28+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2450 :: 		Label28.Caption         = Label28_Caption;
MOVW	R1, #lo_addr(_Label28_Caption+0)
MOVT	R1, #hi_addr(_Label28_Caption+0)
MOVW	R0, #lo_addr(_Label28+16)
MOVT	R0, #hi_addr(_Label28+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2451 :: 		Label28.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Label28+20)
MOVT	R0, #hi_addr(_Label28+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,2452 :: 		Label28.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label28+24)
MOVT	R0, #hi_addr(_Label28+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2453 :: 		Label28.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+28)
MOVT	R0, #hi_addr(_Label28+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2454 :: 		Label28.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+32)
MOVT	R0, #hi_addr(_Label28+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2455 :: 		Label28.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+36)
MOVT	R0, #hi_addr(_Label28+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2456 :: 		Label28.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+40)
MOVT	R0, #hi_addr(_Label28+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2458 :: 		previous_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_previous_icon+0)
MOVT	R0, #hi_addr(_previous_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2459 :: 		previous_icon.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_previous_icon+4)
MOVT	R0, #hi_addr(_previous_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2460 :: 		previous_icon.Left            = 75;
MOVS	R1, #75
MOVW	R0, #lo_addr(_previous_icon+6)
MOVT	R0, #hi_addr(_previous_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2461 :: 		previous_icon.Top             = 224;
MOVS	R1, #224
MOVW	R0, #lo_addr(_previous_icon+8)
MOVT	R0, #hi_addr(_previous_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2462 :: 		previous_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_previous_icon+10)
MOVT	R0, #hi_addr(_previous_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2463 :: 		previous_icon.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_previous_icon+12)
MOVT	R0, #hi_addr(_previous_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2464 :: 		previous_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_previous_icon+22)
MOVT	R0, #hi_addr(_previous_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2465 :: 		previous_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_previous_icon+23)
MOVT	R0, #hi_addr(_previous_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2466 :: 		previous_icon.Picture_Name    = icon_prev_bmp;
MOVW	R1, #lo_addr(_icon_prev_bmp+0)
MOVT	R1, #hi_addr(_icon_prev_bmp+0)
MOVW	R0, #lo_addr(_previous_icon+16)
MOVT	R0, #hi_addr(_previous_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2467 :: 		previous_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_previous_icon+20)
MOVT	R0, #hi_addr(_previous_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2468 :: 		previous_icon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_previous_icon+21)
MOVT	R0, #hi_addr(_previous_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2469 :: 		previous_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_previous_icon+24)
MOVT	R0, #hi_addr(_previous_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2470 :: 		previous_icon.OnDownPtr       = previous_iconOnDown;
MOVW	R1, #lo_addr(_previous_iconOnDown+0)
MOVT	R1, #hi_addr(_previous_iconOnDown+0)
MOVW	R0, #lo_addr(_previous_icon+28)
MOVT	R0, #hi_addr(_previous_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2471 :: 		previous_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_previous_icon+32)
MOVT	R0, #hi_addr(_previous_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2472 :: 		previous_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_previous_icon+36)
MOVT	R0, #hi_addr(_previous_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2474 :: 		pause_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_pause_icon+0)
MOVT	R0, #hi_addr(_pause_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2475 :: 		pause_icon.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_pause_icon+4)
MOVT	R0, #hi_addr(_pause_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2476 :: 		pause_icon.Left            = 103;
MOVS	R1, #103
MOVW	R0, #lo_addr(_pause_icon+6)
MOVT	R0, #hi_addr(_pause_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2477 :: 		pause_icon.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_pause_icon+8)
MOVT	R0, #hi_addr(_pause_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2478 :: 		pause_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_pause_icon+10)
MOVT	R0, #hi_addr(_pause_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2479 :: 		pause_icon.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_pause_icon+12)
MOVT	R0, #hi_addr(_pause_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2480 :: 		pause_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pause_icon+22)
MOVT	R0, #hi_addr(_pause_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2481 :: 		pause_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+23)
MOVT	R0, #hi_addr(_pause_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2482 :: 		pause_icon.Picture_Name    = icon_pause_bmp;
MOVW	R1, #lo_addr(_icon_pause_bmp+0)
MOVT	R1, #hi_addr(_icon_pause_bmp+0)
MOVW	R0, #lo_addr(_pause_icon+16)
MOVT	R0, #hi_addr(_pause_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2483 :: 		pause_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+20)
MOVT	R0, #hi_addr(_pause_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2484 :: 		pause_icon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_pause_icon+21)
MOVT	R0, #hi_addr(_pause_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2485 :: 		pause_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pause_icon+24)
MOVT	R0, #hi_addr(_pause_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2486 :: 		pause_icon.OnDownPtr       = pause_iconOnPress;
MOVW	R1, #lo_addr(_pause_iconOnPress+0)
MOVT	R1, #hi_addr(_pause_iconOnPress+0)
MOVW	R0, #lo_addr(_pause_icon+28)
MOVT	R0, #hi_addr(_pause_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2487 :: 		pause_icon.OnClickPtr      = pause_iconOnPress;
MOVW	R1, #lo_addr(_pause_iconOnPress+0)
MOVT	R1, #hi_addr(_pause_iconOnPress+0)
MOVW	R0, #lo_addr(_pause_icon+32)
MOVT	R0, #hi_addr(_pause_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2488 :: 		pause_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_pause_icon+36)
MOVT	R0, #hi_addr(_pause_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2490 :: 		Play_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Play_icon+0)
MOVT	R0, #hi_addr(_Play_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2491 :: 		Play_icon.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Play_icon+4)
MOVT	R0, #hi_addr(_Play_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2492 :: 		Play_icon.Left            = 102;
MOVS	R1, #102
MOVW	R0, #lo_addr(_Play_icon+6)
MOVT	R0, #hi_addr(_Play_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2493 :: 		Play_icon.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Play_icon+8)
MOVT	R0, #hi_addr(_Play_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2494 :: 		Play_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Play_icon+10)
MOVT	R0, #hi_addr(_Play_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2495 :: 		Play_icon.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Play_icon+12)
MOVT	R0, #hi_addr(_Play_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2496 :: 		Play_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+22)
MOVT	R0, #hi_addr(_Play_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2497 :: 		Play_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Play_icon+23)
MOVT	R0, #hi_addr(_Play_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2498 :: 		Play_icon.Picture_Name    = icon_play_bmp;
MOVW	R1, #lo_addr(_icon_play_bmp+0)
MOVT	R1, #hi_addr(_icon_play_bmp+0)
MOVW	R0, #lo_addr(_Play_icon+16)
MOVT	R0, #hi_addr(_Play_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2499 :: 		Play_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Play_icon+20)
MOVT	R0, #hi_addr(_Play_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2500 :: 		Play_icon.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+21)
MOVT	R0, #hi_addr(_Play_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2501 :: 		Play_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+24)
MOVT	R0, #hi_addr(_Play_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2502 :: 		Play_icon.OnDownPtr       = Play_iconOnDown;
MOVW	R1, #lo_addr(_Play_iconOnDown+0)
MOVT	R1, #hi_addr(_Play_iconOnDown+0)
MOVW	R0, #lo_addr(_Play_icon+28)
MOVT	R0, #hi_addr(_Play_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2503 :: 		Play_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+32)
MOVT	R0, #hi_addr(_Play_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2504 :: 		Play_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Play_icon+36)
MOVT	R0, #hi_addr(_Play_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2506 :: 		stop_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_stop_icon+0)
MOVT	R0, #hi_addr(_stop_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2507 :: 		stop_icon.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_stop_icon+4)
MOVT	R0, #hi_addr(_stop_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2508 :: 		stop_icon.Left            = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_stop_icon+6)
MOVT	R0, #hi_addr(_stop_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2509 :: 		stop_icon.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_stop_icon+8)
MOVT	R0, #hi_addr(_stop_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2510 :: 		stop_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_stop_icon+10)
MOVT	R0, #hi_addr(_stop_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2511 :: 		stop_icon.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_stop_icon+12)
MOVT	R0, #hi_addr(_stop_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2512 :: 		stop_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stop_icon+22)
MOVT	R0, #hi_addr(_stop_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2513 :: 		stop_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_stop_icon+23)
MOVT	R0, #hi_addr(_stop_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2514 :: 		stop_icon.Picture_Name    = icon_stop_bmp;
MOVW	R1, #lo_addr(_icon_stop_bmp+0)
MOVT	R1, #hi_addr(_icon_stop_bmp+0)
MOVW	R0, #lo_addr(_stop_icon+16)
MOVT	R0, #hi_addr(_stop_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2515 :: 		stop_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_stop_icon+20)
MOVT	R0, #hi_addr(_stop_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2516 :: 		stop_icon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_stop_icon+21)
MOVT	R0, #hi_addr(_stop_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2517 :: 		stop_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stop_icon+24)
MOVT	R0, #hi_addr(_stop_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2518 :: 		stop_icon.OnDownPtr       = stop_iconOnDown;
MOVW	R1, #lo_addr(_stop_iconOnDown+0)
MOVT	R1, #hi_addr(_stop_iconOnDown+0)
MOVW	R0, #lo_addr(_stop_icon+28)
MOVT	R0, #hi_addr(_stop_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2519 :: 		stop_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stop_icon+32)
MOVT	R0, #hi_addr(_stop_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2520 :: 		stop_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_stop_icon+36)
MOVT	R0, #hi_addr(_stop_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2522 :: 		next_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_next_icon+0)
MOVT	R0, #hi_addr(_next_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2523 :: 		next_icon.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_next_icon+4)
MOVT	R0, #hi_addr(_next_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2524 :: 		next_icon.Left            = 158;
MOVS	R1, #158
MOVW	R0, #lo_addr(_next_icon+6)
MOVT	R0, #hi_addr(_next_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2525 :: 		next_icon.Top             = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_next_icon+8)
MOVT	R0, #hi_addr(_next_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2526 :: 		next_icon.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_next_icon+10)
MOVT	R0, #hi_addr(_next_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2527 :: 		next_icon.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_next_icon+12)
MOVT	R0, #hi_addr(_next_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2528 :: 		next_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_next_icon+22)
MOVT	R0, #hi_addr(_next_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2529 :: 		next_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_next_icon+23)
MOVT	R0, #hi_addr(_next_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2530 :: 		next_icon.Picture_Name    = icon_next_bmp;
MOVW	R1, #lo_addr(_icon_next_bmp+0)
MOVT	R1, #hi_addr(_icon_next_bmp+0)
MOVW	R0, #lo_addr(_next_icon+16)
MOVT	R0, #hi_addr(_next_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2531 :: 		next_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_next_icon+20)
MOVT	R0, #hi_addr(_next_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2532 :: 		next_icon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_next_icon+21)
MOVT	R0, #hi_addr(_next_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2533 :: 		next_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_next_icon+24)
MOVT	R0, #hi_addr(_next_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2534 :: 		next_icon.OnDownPtr       = next_iconOnDown;
MOVW	R1, #lo_addr(_next_iconOnDown+0)
MOVT	R1, #hi_addr(_next_iconOnDown+0)
MOVW	R0, #lo_addr(_next_icon+28)
MOVT	R0, #hi_addr(_next_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2535 :: 		next_icon.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_next_icon+32)
MOVT	R0, #hi_addr(_next_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2536 :: 		next_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_next_icon+36)
MOVT	R0, #hi_addr(_next_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2538 :: 		songlist_icon.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_songlist_icon+0)
MOVT	R0, #hi_addr(_songlist_icon+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2539 :: 		songlist_icon.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_songlist_icon+4)
MOVT	R0, #hi_addr(_songlist_icon+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2540 :: 		songlist_icon.Left            = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_songlist_icon+6)
MOVT	R0, #hi_addr(_songlist_icon+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2541 :: 		songlist_icon.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_songlist_icon+8)
MOVT	R0, #hi_addr(_songlist_icon+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2542 :: 		songlist_icon.Width           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_songlist_icon+10)
MOVT	R0, #hi_addr(_songlist_icon+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2543 :: 		songlist_icon.Height          = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_songlist_icon+12)
MOVT	R0, #hi_addr(_songlist_icon+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2544 :: 		songlist_icon.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_songlist_icon+22)
MOVT	R0, #hi_addr(_songlist_icon+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2545 :: 		songlist_icon.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_songlist_icon+23)
MOVT	R0, #hi_addr(_songlist_icon+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2546 :: 		songlist_icon.Picture_Name    = icon_playlist_bmp;
MOVW	R1, #lo_addr(_icon_playlist_bmp+0)
MOVT	R1, #hi_addr(_icon_playlist_bmp+0)
MOVW	R0, #lo_addr(_songlist_icon+16)
MOVT	R0, #hi_addr(_songlist_icon+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2547 :: 		songlist_icon.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_songlist_icon+20)
MOVT	R0, #hi_addr(_songlist_icon+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2548 :: 		songlist_icon.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_songlist_icon+21)
MOVT	R0, #hi_addr(_songlist_icon+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2549 :: 		songlist_icon.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_songlist_icon+24)
MOVT	R0, #hi_addr(_songlist_icon+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2550 :: 		songlist_icon.OnDownPtr       = songlist_iconOnPress;
MOVW	R1, #lo_addr(_songlist_iconOnPress+0)
MOVT	R1, #hi_addr(_songlist_iconOnPress+0)
MOVW	R0, #lo_addr(_songlist_icon+28)
MOVT	R0, #hi_addr(_songlist_icon+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2551 :: 		songlist_icon.OnClickPtr      = songlist_iconOnPress;
MOVW	R1, #lo_addr(_songlist_iconOnPress+0)
MOVT	R1, #hi_addr(_songlist_iconOnPress+0)
MOVW	R0, #lo_addr(_songlist_icon+32)
MOVT	R0, #hi_addr(_songlist_icon+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2552 :: 		songlist_icon.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_songlist_icon+36)
MOVT	R0, #hi_addr(_songlist_icon+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2554 :: 		Label6.OwnerScreen     = &MP3_Player;
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2555 :: 		Label6.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2556 :: 		Label6.Left            = 432;
MOVW	R1, #432
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2557 :: 		Label6.Top             = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2558 :: 		Label6.Width           = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2559 :: 		Label6.Height          = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2560 :: 		Label6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2561 :: 		Label6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2562 :: 		Label6.Caption         = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2563 :: 		Label6.FontName        = Open_Sans_Light12x18_Regular;
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R3, [R0, #0]
;mikromedia_STM32plus_driver.c,2564 :: 		Label6.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2565 :: 		Label6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2566 :: 		Label6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+32)
MOVT	R0, #hi_addr(_Label6+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2567 :: 		Label6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+36)
MOVT	R0, #hi_addr(_Label6+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2568 :: 		Label6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+40)
MOVT	R0, #hi_addr(_Label6+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2570 :: 		Box18.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Box18+0)
MOVT	R0, #hi_addr(_Box18+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2571 :: 		Box18.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+4)
MOVT	R0, #hi_addr(_Box18+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2572 :: 		Box18.Left            = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Box18+6)
MOVT	R0, #hi_addr(_Box18+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2573 :: 		Box18.Top             = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box18+8)
MOVT	R0, #hi_addr(_Box18+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2574 :: 		Box18.Width           = 82;
MOVS	R1, #82
MOVW	R0, #lo_addr(_Box18+10)
MOVT	R0, #hi_addr(_Box18+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2575 :: 		Box18.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box18+12)
MOVT	R0, #hi_addr(_Box18+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2576 :: 		Box18.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box18+14)
MOVT	R0, #hi_addr(_Box18+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2577 :: 		Box18.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+16)
MOVT	R0, #hi_addr(_Box18+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2578 :: 		Box18.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+18)
MOVT	R0, #hi_addr(_Box18+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2579 :: 		Box18.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box18+19)
MOVT	R0, #hi_addr(_Box18+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2580 :: 		Box18.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box18+20)
MOVT	R0, #hi_addr(_Box18+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2581 :: 		Box18.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+21)
MOVT	R0, #hi_addr(_Box18+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2582 :: 		Box18.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+22)
MOVT	R0, #hi_addr(_Box18+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2583 :: 		Box18.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box18+24)
MOVT	R0, #hi_addr(_Box18+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2584 :: 		Box18.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box18+26)
MOVT	R0, #hi_addr(_Box18+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2585 :: 		Box18.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box18+28)
MOVT	R0, #hi_addr(_Box18+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2586 :: 		Box18.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+30)
MOVT	R0, #hi_addr(_Box18+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2587 :: 		Box18.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box18+32)
MOVT	R0, #hi_addr(_Box18+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2588 :: 		Box18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+36)
MOVT	R0, #hi_addr(_Box18+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2589 :: 		Box18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+40)
MOVT	R0, #hi_addr(_Box18+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2590 :: 		Box18.OnClickPtr      = icon_paint_backOnPress;
MOVW	R1, #lo_addr(_icon_paint_backOnPress+0)
MOVT	R1, #hi_addr(_icon_paint_backOnPress+0)
MOVW	R0, #lo_addr(_Box18+44)
MOVT	R0, #hi_addr(_Box18+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2591 :: 		Box18.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box18+48)
MOVT	R0, #hi_addr(_Box18+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2593 :: 		Image4.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Image4+0)
MOVT	R0, #hi_addr(_Image4+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2594 :: 		Image4.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+4)
MOVT	R0, #hi_addr(_Image4+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2595 :: 		Image4.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+6)
MOVT	R0, #hi_addr(_Image4+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2596 :: 		Image4.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_Image4+8)
MOVT	R0, #hi_addr(_Image4+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2597 :: 		Image4.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Image4+10)
MOVT	R0, #hi_addr(_Image4+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2598 :: 		Image4.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Image4+12)
MOVT	R0, #hi_addr(_Image4+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2599 :: 		Image4.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+22)
MOVT	R0, #hi_addr(_Image4+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2600 :: 		Image4.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+23)
MOVT	R0, #hi_addr(_Image4+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2601 :: 		Image4.Picture_Name    = icon_new_screen_selected_bmp;
MOVW	R1, #lo_addr(_icon_new_screen_selected_bmp+0)
MOVT	R1, #hi_addr(_icon_new_screen_selected_bmp+0)
MOVW	R0, #lo_addr(_Image4+16)
MOVT	R0, #hi_addr(_Image4+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2602 :: 		Image4.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+20)
MOVT	R0, #hi_addr(_Image4+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2603 :: 		Image4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+21)
MOVT	R0, #hi_addr(_Image4+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2604 :: 		Image4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+24)
MOVT	R0, #hi_addr(_Image4+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2605 :: 		Image4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+28)
MOVT	R0, #hi_addr(_Image4+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2606 :: 		Image4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+32)
MOVT	R0, #hi_addr(_Image4+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2607 :: 		Image4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image4+36)
MOVT	R0, #hi_addr(_Image4+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2609 :: 		NewScreen.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_NewScreen+0)
MOVT	R0, #hi_addr(_NewScreen+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2610 :: 		NewScreen.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_NewScreen+4)
MOVT	R0, #hi_addr(_NewScreen+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2611 :: 		NewScreen.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_NewScreen+6)
MOVT	R0, #hi_addr(_NewScreen+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2612 :: 		NewScreen.Top             = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_NewScreen+8)
MOVT	R0, #hi_addr(_NewScreen+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2613 :: 		NewScreen.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_NewScreen+10)
MOVT	R0, #hi_addr(_NewScreen+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2614 :: 		NewScreen.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_NewScreen+12)
MOVT	R0, #hi_addr(_NewScreen+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2615 :: 		NewScreen.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_NewScreen+22)
MOVT	R0, #hi_addr(_NewScreen+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2616 :: 		NewScreen.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_NewScreen+23)
MOVT	R0, #hi_addr(_NewScreen+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2617 :: 		NewScreen.Picture_Name    = icon_new_screen_bmp;
MOVW	R1, #lo_addr(_icon_new_screen_bmp+0)
MOVT	R1, #hi_addr(_icon_new_screen_bmp+0)
MOVW	R0, #lo_addr(_NewScreen+16)
MOVT	R0, #hi_addr(_NewScreen+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2618 :: 		NewScreen.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_NewScreen+20)
MOVT	R0, #hi_addr(_NewScreen+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2619 :: 		NewScreen.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_NewScreen+21)
MOVT	R0, #hi_addr(_NewScreen+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2620 :: 		NewScreen.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_NewScreen+24)
MOVT	R0, #hi_addr(_NewScreen+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2621 :: 		NewScreen.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_NewScreen+28)
MOVT	R0, #hi_addr(_NewScreen+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2622 :: 		NewScreen.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_NewScreen+32)
MOVT	R0, #hi_addr(_NewScreen+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2623 :: 		NewScreen.OnPressPtr      = NewScreenOnPress;
MOVW	R1, #lo_addr(_NewScreenOnPress+0)
MOVT	R1, #hi_addr(_NewScreenOnPress+0)
MOVW	R0, #lo_addr(_NewScreen+36)
MOVT	R0, #hi_addr(_NewScreen+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2625 :: 		Image25.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Image25+0)
MOVT	R0, #hi_addr(_Image25+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2626 :: 		Image25.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Image25+4)
MOVT	R0, #hi_addr(_Image25+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2627 :: 		Image25.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+6)
MOVT	R0, #hi_addr(_Image25+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2628 :: 		Image25.Top             = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Image25+8)
MOVT	R0, #hi_addr(_Image25+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2629 :: 		Image25.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Image25+10)
MOVT	R0, #hi_addr(_Image25+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2630 :: 		Image25.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Image25+12)
MOVT	R0, #hi_addr(_Image25+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2631 :: 		Image25.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+22)
MOVT	R0, #hi_addr(_Image25+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2632 :: 		Image25.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+23)
MOVT	R0, #hi_addr(_Image25+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2633 :: 		Image25.Picture_Name    = icon_brush_selected_bmp;
MOVW	R1, #lo_addr(_icon_brush_selected_bmp+0)
MOVT	R1, #hi_addr(_icon_brush_selected_bmp+0)
MOVW	R0, #lo_addr(_Image25+16)
MOVT	R0, #hi_addr(_Image25+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2634 :: 		Image25.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+20)
MOVT	R0, #hi_addr(_Image25+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2635 :: 		Image25.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image25+21)
MOVT	R0, #hi_addr(_Image25+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2636 :: 		Image25.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+24)
MOVT	R0, #hi_addr(_Image25+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2637 :: 		Image25.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+28)
MOVT	R0, #hi_addr(_Image25+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2638 :: 		Image25.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+32)
MOVT	R0, #hi_addr(_Image25+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2639 :: 		Image25.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image25+36)
MOVT	R0, #hi_addr(_Image25+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2641 :: 		Pen.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Pen+0)
MOVT	R0, #hi_addr(_Pen+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2642 :: 		Pen.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Pen+4)
MOVT	R0, #hi_addr(_Pen+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2643 :: 		Pen.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen+6)
MOVT	R0, #hi_addr(_Pen+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2644 :: 		Pen.Top             = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Pen+8)
MOVT	R0, #hi_addr(_Pen+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2645 :: 		Pen.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Pen+10)
MOVT	R0, #hi_addr(_Pen+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2646 :: 		Pen.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Pen+12)
MOVT	R0, #hi_addr(_Pen+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2647 :: 		Pen.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen+22)
MOVT	R0, #hi_addr(_Pen+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2648 :: 		Pen.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen+23)
MOVT	R0, #hi_addr(_Pen+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2649 :: 		Pen.Picture_Name    = icon_brush_bmp;
MOVW	R1, #lo_addr(_icon_brush_bmp+0)
MOVT	R1, #hi_addr(_icon_brush_bmp+0)
MOVW	R0, #lo_addr(_Pen+16)
MOVT	R0, #hi_addr(_Pen+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2650 :: 		Pen.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen+20)
MOVT	R0, #hi_addr(_Pen+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2651 :: 		Pen.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen+21)
MOVT	R0, #hi_addr(_Pen+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2652 :: 		Pen.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen+24)
MOVT	R0, #hi_addr(_Pen+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2653 :: 		Pen.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen+28)
MOVT	R0, #hi_addr(_Pen+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2654 :: 		Pen.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen+32)
MOVT	R0, #hi_addr(_Pen+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2655 :: 		Pen.OnPressPtr      = PenOnPress;
MOVW	R1, #lo_addr(_PenOnPress+0)
MOVT	R1, #hi_addr(_PenOnPress+0)
MOVW	R0, #lo_addr(_Pen+36)
MOVT	R0, #hi_addr(_Pen+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2657 :: 		Image27.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Image27+0)
MOVT	R0, #hi_addr(_Image27+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2658 :: 		Image27.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image27+4)
MOVT	R0, #hi_addr(_Image27+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2659 :: 		Image27.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+6)
MOVT	R0, #hi_addr(_Image27+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2660 :: 		Image27.Top             = 124;
MOVS	R1, #124
MOVW	R0, #lo_addr(_Image27+8)
MOVT	R0, #hi_addr(_Image27+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2661 :: 		Image27.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Image27+10)
MOVT	R0, #hi_addr(_Image27+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2662 :: 		Image27.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Image27+12)
MOVT	R0, #hi_addr(_Image27+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2663 :: 		Image27.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+22)
MOVT	R0, #hi_addr(_Image27+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2664 :: 		Image27.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+23)
MOVT	R0, #hi_addr(_Image27+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2665 :: 		Image27.Picture_Name    = icon_eraser_selected_bmp;
MOVW	R1, #lo_addr(_icon_eraser_selected_bmp+0)
MOVT	R1, #hi_addr(_icon_eraser_selected_bmp+0)
MOVW	R0, #lo_addr(_Image27+16)
MOVT	R0, #hi_addr(_Image27+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2666 :: 		Image27.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+20)
MOVT	R0, #hi_addr(_Image27+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2667 :: 		Image27.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image27+21)
MOVT	R0, #hi_addr(_Image27+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2668 :: 		Image27.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+24)
MOVT	R0, #hi_addr(_Image27+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2669 :: 		Image27.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+28)
MOVT	R0, #hi_addr(_Image27+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2670 :: 		Image27.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+32)
MOVT	R0, #hi_addr(_Image27+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2671 :: 		Image27.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image27+36)
MOVT	R0, #hi_addr(_Image27+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2673 :: 		Eraser.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Eraser+0)
MOVT	R0, #hi_addr(_Eraser+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2674 :: 		Eraser.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Eraser+4)
MOVT	R0, #hi_addr(_Eraser+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2675 :: 		Eraser.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Eraser+6)
MOVT	R0, #hi_addr(_Eraser+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2676 :: 		Eraser.Top             = 124;
MOVS	R1, #124
MOVW	R0, #lo_addr(_Eraser+8)
MOVT	R0, #hi_addr(_Eraser+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2677 :: 		Eraser.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Eraser+10)
MOVT	R0, #hi_addr(_Eraser+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2678 :: 		Eraser.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Eraser+12)
MOVT	R0, #hi_addr(_Eraser+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2679 :: 		Eraser.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Eraser+22)
MOVT	R0, #hi_addr(_Eraser+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2680 :: 		Eraser.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Eraser+23)
MOVT	R0, #hi_addr(_Eraser+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2681 :: 		Eraser.Picture_Name    = icon_eraser_bmp;
MOVW	R1, #lo_addr(_icon_eraser_bmp+0)
MOVT	R1, #hi_addr(_icon_eraser_bmp+0)
MOVW	R0, #lo_addr(_Eraser+16)
MOVT	R0, #hi_addr(_Eraser+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2682 :: 		Eraser.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Eraser+20)
MOVT	R0, #hi_addr(_Eraser+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2683 :: 		Eraser.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Eraser+21)
MOVT	R0, #hi_addr(_Eraser+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2684 :: 		Eraser.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Eraser+24)
MOVT	R0, #hi_addr(_Eraser+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2685 :: 		Eraser.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Eraser+28)
MOVT	R0, #hi_addr(_Eraser+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2686 :: 		Eraser.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Eraser+32)
MOVT	R0, #hi_addr(_Eraser+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2687 :: 		Eraser.OnPressPtr      = EraserOnPress;
MOVW	R1, #lo_addr(_EraserOnPress+0)
MOVT	R1, #hi_addr(_EraserOnPress+0)
MOVW	R0, #lo_addr(_Eraser+36)
MOVT	R0, #hi_addr(_Eraser+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2689 :: 		Image29.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Image29+0)
MOVT	R0, #hi_addr(_Image29+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2690 :: 		Image29.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Image29+4)
MOVT	R0, #hi_addr(_Image29+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2691 :: 		Image29.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+6)
MOVT	R0, #hi_addr(_Image29+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2692 :: 		Image29.Top             = 166;
MOVS	R1, #166
MOVW	R0, #lo_addr(_Image29+8)
MOVT	R0, #hi_addr(_Image29+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2693 :: 		Image29.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Image29+10)
MOVT	R0, #hi_addr(_Image29+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2694 :: 		Image29.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Image29+12)
MOVT	R0, #hi_addr(_Image29+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2695 :: 		Image29.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+22)
MOVT	R0, #hi_addr(_Image29+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2696 :: 		Image29.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+23)
MOVT	R0, #hi_addr(_Image29+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2697 :: 		Image29.Picture_Name    = icon_fill_back_selected_bmp;
MOVW	R1, #lo_addr(_icon_fill_back_selected_bmp+0)
MOVT	R1, #hi_addr(_icon_fill_back_selected_bmp+0)
MOVW	R0, #lo_addr(_Image29+16)
MOVT	R0, #hi_addr(_Image29+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2698 :: 		Image29.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+20)
MOVT	R0, #hi_addr(_Image29+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2699 :: 		Image29.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image29+21)
MOVT	R0, #hi_addr(_Image29+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2700 :: 		Image29.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+24)
MOVT	R0, #hi_addr(_Image29+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2701 :: 		Image29.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+28)
MOVT	R0, #hi_addr(_Image29+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2702 :: 		Image29.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+32)
MOVT	R0, #hi_addr(_Image29+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2703 :: 		Image29.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image29+36)
MOVT	R0, #hi_addr(_Image29+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2705 :: 		DrawingArea.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_DrawingArea+0)
MOVT	R0, #hi_addr(_DrawingArea+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2706 :: 		DrawingArea.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_DrawingArea+4)
MOVT	R0, #hi_addr(_DrawingArea+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2707 :: 		DrawingArea.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_DrawingArea+6)
MOVT	R0, #hi_addr(_DrawingArea+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2708 :: 		DrawingArea.Top             = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_DrawingArea+8)
MOVT	R0, #hi_addr(_DrawingArea+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2709 :: 		DrawingArea.Width           = 449;
MOVW	R1, #449
MOVW	R0, #lo_addr(_DrawingArea+10)
MOVT	R0, #hi_addr(_DrawingArea+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2710 :: 		DrawingArea.Height          = 241;
MOVS	R1, #241
MOVW	R0, #lo_addr(_DrawingArea+12)
MOVT	R0, #hi_addr(_DrawingArea+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2711 :: 		DrawingArea.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DrawingArea+14)
MOVT	R0, #hi_addr(_DrawingArea+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2712 :: 		DrawingArea.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DrawingArea+16)
MOVT	R0, #hi_addr(_DrawingArea+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2713 :: 		DrawingArea.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DrawingArea+18)
MOVT	R0, #hi_addr(_DrawingArea+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2714 :: 		DrawingArea.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DrawingArea+19)
MOVT	R0, #hi_addr(_DrawingArea+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2715 :: 		DrawingArea.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_DrawingArea+20)
MOVT	R0, #hi_addr(_DrawingArea+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2716 :: 		DrawingArea.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DrawingArea+21)
MOVT	R0, #hi_addr(_DrawingArea+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2717 :: 		DrawingArea.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DrawingArea+22)
MOVT	R0, #hi_addr(_DrawingArea+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2718 :: 		DrawingArea.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_DrawingArea+24)
MOVT	R0, #hi_addr(_DrawingArea+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2719 :: 		DrawingArea.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_DrawingArea+26)
MOVT	R0, #hi_addr(_DrawingArea+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2720 :: 		DrawingArea.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_DrawingArea+28)
MOVT	R0, #hi_addr(_DrawingArea+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2721 :: 		DrawingArea.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DrawingArea+30)
MOVT	R0, #hi_addr(_DrawingArea+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2722 :: 		DrawingArea.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_DrawingArea+32)
MOVT	R0, #hi_addr(_DrawingArea+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2723 :: 		DrawingArea.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DrawingArea+36)
MOVT	R0, #hi_addr(_DrawingArea+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2724 :: 		DrawingArea.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DrawingArea+40)
MOVT	R0, #hi_addr(_DrawingArea+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2725 :: 		DrawingArea.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_DrawingArea+44)
MOVT	R0, #hi_addr(_DrawingArea+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2726 :: 		DrawingArea.OnPressPtr      = DrawingAreaOnPress;
MOVW	R1, #lo_addr(_DrawingAreaOnPress+0)
MOVT	R1, #hi_addr(_DrawingAreaOnPress+0)
MOVW	R0, #lo_addr(_DrawingArea+48)
MOVT	R0, #hi_addr(_DrawingArea+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2728 :: 		icon_paint_back.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_icon_paint_back+0)
MOVT	R0, #hi_addr(_icon_paint_back+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2729 :: 		icon_paint_back.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_icon_paint_back+4)
MOVT	R0, #hi_addr(_icon_paint_back+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2730 :: 		icon_paint_back.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_icon_paint_back+6)
MOVT	R0, #hi_addr(_icon_paint_back+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2731 :: 		icon_paint_back.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_icon_paint_back+8)
MOVT	R0, #hi_addr(_icon_paint_back+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2732 :: 		icon_paint_back.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_icon_paint_back+10)
MOVT	R0, #hi_addr(_icon_paint_back+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2733 :: 		icon_paint_back.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_icon_paint_back+12)
MOVT	R0, #hi_addr(_icon_paint_back+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2734 :: 		icon_paint_back.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_paint_back+22)
MOVT	R0, #hi_addr(_icon_paint_back+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2735 :: 		icon_paint_back.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_paint_back+23)
MOVT	R0, #hi_addr(_icon_paint_back+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2736 :: 		icon_paint_back.Picture_Name    = icon_back_paint_bmp;
MOVW	R1, #lo_addr(_icon_back_paint_bmp+0)
MOVT	R1, #hi_addr(_icon_back_paint_bmp+0)
MOVW	R0, #lo_addr(_icon_paint_back+16)
MOVT	R0, #hi_addr(_icon_paint_back+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2737 :: 		icon_paint_back.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_paint_back+20)
MOVT	R0, #hi_addr(_icon_paint_back+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2738 :: 		icon_paint_back.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_paint_back+21)
MOVT	R0, #hi_addr(_icon_paint_back+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2739 :: 		icon_paint_back.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_paint_back+24)
MOVT	R0, #hi_addr(_icon_paint_back+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2740 :: 		icon_paint_back.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_paint_back+28)
MOVT	R0, #hi_addr(_icon_paint_back+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2741 :: 		icon_paint_back.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_paint_back+32)
MOVT	R0, #hi_addr(_icon_paint_back+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2742 :: 		icon_paint_back.OnPressPtr      = icon_paint_backOnPress;
MOVW	R1, #lo_addr(_icon_paint_backOnPress+0)
MOVT	R1, #hi_addr(_icon_paint_backOnPress+0)
MOVW	R0, #lo_addr(_icon_paint_back+36)
MOVT	R0, #hi_addr(_icon_paint_back+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2744 :: 		Label29.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Label29+0)
MOVT	R0, #hi_addr(_Label29+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2745 :: 		Label29.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label29+4)
MOVT	R0, #hi_addr(_Label29+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2746 :: 		Label29.Left            = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label29+6)
MOVT	R0, #hi_addr(_Label29+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2747 :: 		Label29.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label29+8)
MOVT	R0, #hi_addr(_Label29+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2748 :: 		Label29.Width           = 49;
MOVS	R1, #49
MOVW	R0, #lo_addr(_Label29+10)
MOVT	R0, #hi_addr(_Label29+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2749 :: 		Label29.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label29+12)
MOVT	R0, #hi_addr(_Label29+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2750 :: 		Label29.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label29+26)
MOVT	R0, #hi_addr(_Label29+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2751 :: 		Label29.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+27)
MOVT	R0, #hi_addr(_Label29+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2752 :: 		Label29.Caption         = Label29_Caption;
MOVW	R1, #lo_addr(_Label29_Caption+0)
MOVT	R1, #hi_addr(_Label29_Caption+0)
MOVW	R0, #lo_addr(_Label29+16)
MOVT	R0, #hi_addr(_Label29+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2753 :: 		Label29.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Label29+20)
MOVT	R0, #hi_addr(_Label29+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,2754 :: 		Label29.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label29+24)
MOVT	R0, #hi_addr(_Label29+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2755 :: 		Label29.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+28)
MOVT	R0, #hi_addr(_Label29+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2756 :: 		Label29.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+32)
MOVT	R0, #hi_addr(_Label29+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2757 :: 		Label29.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label29+36)
MOVT	R0, #hi_addr(_Label29+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2758 :: 		Label29.OnPressPtr      = icon_paint_backOnPress;
MOVW	R1, #lo_addr(_icon_paint_backOnPress+0)
MOVT	R1, #hi_addr(_icon_paint_backOnPress+0)
MOVW	R0, #lo_addr(_Label29+40)
MOVT	R0, #hi_addr(_Label29+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2760 :: 		Color01.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color01+0)
MOVT	R0, #hi_addr(_Color01+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2761 :: 		Color01.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Color01+4)
MOVT	R0, #hi_addr(_Color01+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2762 :: 		Color01.Left            = 91;
MOVS	R1, #91
MOVW	R0, #lo_addr(_Color01+6)
MOVT	R0, #hi_addr(_Color01+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2763 :: 		Color01.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color01+8)
MOVT	R0, #hi_addr(_Color01+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2764 :: 		Color01.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color01+10)
MOVT	R0, #hi_addr(_Color01+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2765 :: 		Color01.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color01+12)
MOVT	R0, #hi_addr(_Color01+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2766 :: 		Color01.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color01+14)
MOVT	R0, #hi_addr(_Color01+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2767 :: 		Color01.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color01+16)
MOVT	R0, #hi_addr(_Color01+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2768 :: 		Color01.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color01+18)
MOVT	R0, #hi_addr(_Color01+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2769 :: 		Color01.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color01+19)
MOVT	R0, #hi_addr(_Color01+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2770 :: 		Color01.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color01+20)
MOVT	R0, #hi_addr(_Color01+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2771 :: 		Color01.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color01+21)
MOVT	R0, #hi_addr(_Color01+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2772 :: 		Color01.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color01+22)
MOVT	R0, #hi_addr(_Color01+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2773 :: 		Color01.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color01+24)
MOVT	R0, #hi_addr(_Color01+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2774 :: 		Color01.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color01+26)
MOVT	R0, #hi_addr(_Color01+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2775 :: 		Color01.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color01+28)
MOVT	R0, #hi_addr(_Color01+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2776 :: 		Color01.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color01+30)
MOVT	R0, #hi_addr(_Color01+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2777 :: 		Color01.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color01+32)
MOVT	R0, #hi_addr(_Color01+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2778 :: 		Color01.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color01+36)
MOVT	R0, #hi_addr(_Color01+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2779 :: 		Color01.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color01+40)
MOVT	R0, #hi_addr(_Color01+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2780 :: 		Color01.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color01+44)
MOVT	R0, #hi_addr(_Color01+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2781 :: 		Color01.OnPressPtr      = Color01OnPress;
MOVW	R1, #lo_addr(_Color01OnPress+0)
MOVT	R1, #hi_addr(_Color01OnPress+0)
MOVW	R0, #lo_addr(_Color01+48)
MOVT	R0, #hi_addr(_Color01+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2783 :: 		Color02.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color02+0)
MOVT	R0, #hi_addr(_Color02+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2784 :: 		Color02.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color02+4)
MOVT	R0, #hi_addr(_Color02+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2785 :: 		Color02.Left            = 104;
MOVS	R1, #104
MOVW	R0, #lo_addr(_Color02+6)
MOVT	R0, #hi_addr(_Color02+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2786 :: 		Color02.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color02+8)
MOVT	R0, #hi_addr(_Color02+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2787 :: 		Color02.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color02+10)
MOVT	R0, #hi_addr(_Color02+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2788 :: 		Color02.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color02+12)
MOVT	R0, #hi_addr(_Color02+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2789 :: 		Color02.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color02+14)
MOVT	R0, #hi_addr(_Color02+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2790 :: 		Color02.Pen_Color       = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Color02+16)
MOVT	R0, #hi_addr(_Color02+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2791 :: 		Color02.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color02+18)
MOVT	R0, #hi_addr(_Color02+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2792 :: 		Color02.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color02+19)
MOVT	R0, #hi_addr(_Color02+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2793 :: 		Color02.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color02+20)
MOVT	R0, #hi_addr(_Color02+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2794 :: 		Color02.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color02+21)
MOVT	R0, #hi_addr(_Color02+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2795 :: 		Color02.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color02+22)
MOVT	R0, #hi_addr(_Color02+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2796 :: 		Color02.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color02+24)
MOVT	R0, #hi_addr(_Color02+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2797 :: 		Color02.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color02+26)
MOVT	R0, #hi_addr(_Color02+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2798 :: 		Color02.Color           = 0x8410;
MOVW	R1, #33808
MOVW	R0, #lo_addr(_Color02+28)
MOVT	R0, #hi_addr(_Color02+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2799 :: 		Color02.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color02+30)
MOVT	R0, #hi_addr(_Color02+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2800 :: 		Color02.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color02+32)
MOVT	R0, #hi_addr(_Color02+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2801 :: 		Color02.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color02+36)
MOVT	R0, #hi_addr(_Color02+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2802 :: 		Color02.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color02+40)
MOVT	R0, #hi_addr(_Color02+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2803 :: 		Color02.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color02+44)
MOVT	R0, #hi_addr(_Color02+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2804 :: 		Color02.OnPressPtr      = Color02OnPress;
MOVW	R1, #lo_addr(_Color02OnPress+0)
MOVT	R1, #hi_addr(_Color02OnPress+0)
MOVW	R0, #lo_addr(_Color02+48)
MOVT	R0, #hi_addr(_Color02+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2806 :: 		Color03.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color03+0)
MOVT	R0, #hi_addr(_Color03+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2807 :: 		Color03.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Color03+4)
MOVT	R0, #hi_addr(_Color03+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2808 :: 		Color03.Left            = 117;
MOVS	R1, #117
MOVW	R0, #lo_addr(_Color03+6)
MOVT	R0, #hi_addr(_Color03+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2809 :: 		Color03.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color03+8)
MOVT	R0, #hi_addr(_Color03+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2810 :: 		Color03.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color03+10)
MOVT	R0, #hi_addr(_Color03+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2811 :: 		Color03.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color03+12)
MOVT	R0, #hi_addr(_Color03+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2812 :: 		Color03.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color03+14)
MOVT	R0, #hi_addr(_Color03+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2813 :: 		Color03.Pen_Color       = 0xA534;
MOVW	R1, #42292
MOVW	R0, #lo_addr(_Color03+16)
MOVT	R0, #hi_addr(_Color03+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2814 :: 		Color03.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color03+18)
MOVT	R0, #hi_addr(_Color03+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2815 :: 		Color03.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color03+19)
MOVT	R0, #hi_addr(_Color03+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2816 :: 		Color03.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color03+20)
MOVT	R0, #hi_addr(_Color03+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2817 :: 		Color03.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color03+21)
MOVT	R0, #hi_addr(_Color03+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2818 :: 		Color03.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color03+22)
MOVT	R0, #hi_addr(_Color03+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2819 :: 		Color03.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color03+24)
MOVT	R0, #hi_addr(_Color03+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2820 :: 		Color03.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color03+26)
MOVT	R0, #hi_addr(_Color03+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2821 :: 		Color03.Color           = 0xA534;
MOVW	R1, #42292
MOVW	R0, #lo_addr(_Color03+28)
MOVT	R0, #hi_addr(_Color03+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2822 :: 		Color03.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color03+30)
MOVT	R0, #hi_addr(_Color03+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2823 :: 		Color03.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color03+32)
MOVT	R0, #hi_addr(_Color03+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2824 :: 		Color03.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color03+36)
MOVT	R0, #hi_addr(_Color03+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2825 :: 		Color03.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color03+40)
MOVT	R0, #hi_addr(_Color03+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2826 :: 		Color03.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color03+44)
MOVT	R0, #hi_addr(_Color03+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2827 :: 		Color03.OnPressPtr      = Color03OnPress;
MOVW	R1, #lo_addr(_Color03OnPress+0)
MOVT	R1, #hi_addr(_Color03OnPress+0)
MOVW	R0, #lo_addr(_Color03+48)
MOVT	R0, #hi_addr(_Color03+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2829 :: 		Color04.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color04+0)
MOVT	R0, #hi_addr(_Color04+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2830 :: 		Color04.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Color04+4)
MOVT	R0, #hi_addr(_Color04+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2831 :: 		Color04.Left            = 130;
MOVS	R1, #130
MOVW	R0, #lo_addr(_Color04+6)
MOVT	R0, #hi_addr(_Color04+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2832 :: 		Color04.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color04+8)
MOVT	R0, #hi_addr(_Color04+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2833 :: 		Color04.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color04+10)
MOVT	R0, #hi_addr(_Color04+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2834 :: 		Color04.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color04+12)
MOVT	R0, #hi_addr(_Color04+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2835 :: 		Color04.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color04+14)
MOVT	R0, #hi_addr(_Color04+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2836 :: 		Color04.Pen_Color       = 0xDEDB;
MOVW	R1, #57051
MOVW	R0, #lo_addr(_Color04+16)
MOVT	R0, #hi_addr(_Color04+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2837 :: 		Color04.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color04+18)
MOVT	R0, #hi_addr(_Color04+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2838 :: 		Color04.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color04+19)
MOVT	R0, #hi_addr(_Color04+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2839 :: 		Color04.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color04+20)
MOVT	R0, #hi_addr(_Color04+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2840 :: 		Color04.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color04+21)
MOVT	R0, #hi_addr(_Color04+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2841 :: 		Color04.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color04+22)
MOVT	R0, #hi_addr(_Color04+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2842 :: 		Color04.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color04+24)
MOVT	R0, #hi_addr(_Color04+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2843 :: 		Color04.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color04+26)
MOVT	R0, #hi_addr(_Color04+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2844 :: 		Color04.Color           = 0xDEDB;
MOVW	R1, #57051
MOVW	R0, #lo_addr(_Color04+28)
MOVT	R0, #hi_addr(_Color04+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2845 :: 		Color04.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color04+30)
MOVT	R0, #hi_addr(_Color04+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2846 :: 		Color04.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color04+32)
MOVT	R0, #hi_addr(_Color04+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2847 :: 		Color04.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color04+36)
MOVT	R0, #hi_addr(_Color04+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2848 :: 		Color04.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color04+40)
MOVT	R0, #hi_addr(_Color04+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2849 :: 		Color04.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color04+44)
MOVT	R0, #hi_addr(_Color04+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2850 :: 		Color04.OnPressPtr      = Color04OnPress;
MOVW	R1, #lo_addr(_Color04OnPress+0)
MOVT	R1, #hi_addr(_Color04OnPress+0)
MOVW	R0, #lo_addr(_Color04+48)
MOVT	R0, #hi_addr(_Color04+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2852 :: 		Color05.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color05+0)
MOVT	R0, #hi_addr(_Color05+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2853 :: 		Color05.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Color05+4)
MOVT	R0, #hi_addr(_Color05+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2854 :: 		Color05.Left            = 143;
MOVS	R1, #143
MOVW	R0, #lo_addr(_Color05+6)
MOVT	R0, #hi_addr(_Color05+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2855 :: 		Color05.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color05+8)
MOVT	R0, #hi_addr(_Color05+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2856 :: 		Color05.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color05+10)
MOVT	R0, #hi_addr(_Color05+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2857 :: 		Color05.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color05+12)
MOVT	R0, #hi_addr(_Color05+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2858 :: 		Color05.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color05+14)
MOVT	R0, #hi_addr(_Color05+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2859 :: 		Color05.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color05+16)
MOVT	R0, #hi_addr(_Color05+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2860 :: 		Color05.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color05+18)
MOVT	R0, #hi_addr(_Color05+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2861 :: 		Color05.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color05+19)
MOVT	R0, #hi_addr(_Color05+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2862 :: 		Color05.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color05+20)
MOVT	R0, #hi_addr(_Color05+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2863 :: 		Color05.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color05+21)
MOVT	R0, #hi_addr(_Color05+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2864 :: 		Color05.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color05+22)
MOVT	R0, #hi_addr(_Color05+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2865 :: 		Color05.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color05+24)
MOVT	R0, #hi_addr(_Color05+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2866 :: 		Color05.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color05+26)
MOVT	R0, #hi_addr(_Color05+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2867 :: 		Color05.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color05+28)
MOVT	R0, #hi_addr(_Color05+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2868 :: 		Color05.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color05+30)
MOVT	R0, #hi_addr(_Color05+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2869 :: 		Color05.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color05+32)
MOVT	R0, #hi_addr(_Color05+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2870 :: 		Color05.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color05+36)
MOVT	R0, #hi_addr(_Color05+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2871 :: 		Color05.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color05+40)
MOVT	R0, #hi_addr(_Color05+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2872 :: 		Color05.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color05+44)
MOVT	R0, #hi_addr(_Color05+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2873 :: 		Color05.OnPressPtr      = Color05OnPress;
MOVW	R1, #lo_addr(_Color05OnPress+0)
MOVT	R1, #hi_addr(_Color05OnPress+0)
MOVW	R0, #lo_addr(_Color05+48)
MOVT	R0, #hi_addr(_Color05+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2875 :: 		Color06.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color06+0)
MOVT	R0, #hi_addr(_Color06+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2876 :: 		Color06.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Color06+4)
MOVT	R0, #hi_addr(_Color06+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2877 :: 		Color06.Left            = 156;
MOVS	R1, #156
MOVW	R0, #lo_addr(_Color06+6)
MOVT	R0, #hi_addr(_Color06+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2878 :: 		Color06.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color06+8)
MOVT	R0, #hi_addr(_Color06+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2879 :: 		Color06.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color06+10)
MOVT	R0, #hi_addr(_Color06+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2880 :: 		Color06.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color06+12)
MOVT	R0, #hi_addr(_Color06+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2881 :: 		Color06.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color06+14)
MOVT	R0, #hi_addr(_Color06+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2882 :: 		Color06.Pen_Color       = 0xFF5B;
MOVW	R1, #65371
MOVW	R0, #lo_addr(_Color06+16)
MOVT	R0, #hi_addr(_Color06+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2883 :: 		Color06.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color06+18)
MOVT	R0, #hi_addr(_Color06+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2884 :: 		Color06.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color06+19)
MOVT	R0, #hi_addr(_Color06+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2885 :: 		Color06.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color06+20)
MOVT	R0, #hi_addr(_Color06+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2886 :: 		Color06.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color06+21)
MOVT	R0, #hi_addr(_Color06+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2887 :: 		Color06.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color06+22)
MOVT	R0, #hi_addr(_Color06+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2888 :: 		Color06.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color06+24)
MOVT	R0, #hi_addr(_Color06+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2889 :: 		Color06.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color06+26)
MOVT	R0, #hi_addr(_Color06+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2890 :: 		Color06.Color           = 0xFF5B;
MOVW	R1, #65371
MOVW	R0, #lo_addr(_Color06+28)
MOVT	R0, #hi_addr(_Color06+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2891 :: 		Color06.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color06+30)
MOVT	R0, #hi_addr(_Color06+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2892 :: 		Color06.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color06+32)
MOVT	R0, #hi_addr(_Color06+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2893 :: 		Color06.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color06+36)
MOVT	R0, #hi_addr(_Color06+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2894 :: 		Color06.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color06+40)
MOVT	R0, #hi_addr(_Color06+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2895 :: 		Color06.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color06+44)
MOVT	R0, #hi_addr(_Color06+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2896 :: 		Color06.OnPressPtr      = Color06OnPress;
MOVW	R1, #lo_addr(_Color06OnPress+0)
MOVT	R1, #hi_addr(_Color06OnPress+0)
MOVW	R0, #lo_addr(_Color06+48)
MOVT	R0, #hi_addr(_Color06+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2898 :: 		Color07.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color07+0)
MOVT	R0, #hi_addr(_Color07+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2899 :: 		Color07.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Color07+4)
MOVT	R0, #hi_addr(_Color07+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2900 :: 		Color07.Left            = 169;
MOVS	R1, #169
MOVW	R0, #lo_addr(_Color07+6)
MOVT	R0, #hi_addr(_Color07+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2901 :: 		Color07.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color07+8)
MOVT	R0, #hi_addr(_Color07+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2902 :: 		Color07.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color07+10)
MOVT	R0, #hi_addr(_Color07+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2903 :: 		Color07.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color07+12)
MOVT	R0, #hi_addr(_Color07+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2904 :: 		Color07.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color07+14)
MOVT	R0, #hi_addr(_Color07+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2905 :: 		Color07.Pen_Color       = 0xFE53;
MOVW	R1, #65107
MOVW	R0, #lo_addr(_Color07+16)
MOVT	R0, #hi_addr(_Color07+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2906 :: 		Color07.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color07+18)
MOVT	R0, #hi_addr(_Color07+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2907 :: 		Color07.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color07+19)
MOVT	R0, #hi_addr(_Color07+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2908 :: 		Color07.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color07+20)
MOVT	R0, #hi_addr(_Color07+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2909 :: 		Color07.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color07+21)
MOVT	R0, #hi_addr(_Color07+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2910 :: 		Color07.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color07+22)
MOVT	R0, #hi_addr(_Color07+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2911 :: 		Color07.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color07+24)
MOVT	R0, #hi_addr(_Color07+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2912 :: 		Color07.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color07+26)
MOVT	R0, #hi_addr(_Color07+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2913 :: 		Color07.Color           = 0xFE53;
MOVW	R1, #65107
MOVW	R0, #lo_addr(_Color07+28)
MOVT	R0, #hi_addr(_Color07+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2914 :: 		Color07.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color07+30)
MOVT	R0, #hi_addr(_Color07+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2915 :: 		Color07.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color07+32)
MOVT	R0, #hi_addr(_Color07+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2916 :: 		Color07.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color07+36)
MOVT	R0, #hi_addr(_Color07+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2917 :: 		Color07.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color07+40)
MOVT	R0, #hi_addr(_Color07+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2918 :: 		Color07.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color07+44)
MOVT	R0, #hi_addr(_Color07+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2919 :: 		Color07.OnPressPtr      = Color07OnPress;
MOVW	R1, #lo_addr(_Color07OnPress+0)
MOVT	R1, #hi_addr(_Color07OnPress+0)
MOVW	R0, #lo_addr(_Color07+48)
MOVT	R0, #hi_addr(_Color07+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2921 :: 		Color08.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color08+0)
MOVT	R0, #hi_addr(_Color08+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2922 :: 		Color08.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Color08+4)
MOVT	R0, #hi_addr(_Color08+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2923 :: 		Color08.Left            = 182;
MOVS	R1, #182
MOVW	R0, #lo_addr(_Color08+6)
MOVT	R0, #hi_addr(_Color08+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2924 :: 		Color08.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color08+8)
MOVT	R0, #hi_addr(_Color08+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2925 :: 		Color08.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color08+10)
MOVT	R0, #hi_addr(_Color08+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2926 :: 		Color08.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color08+12)
MOVT	R0, #hi_addr(_Color08+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2927 :: 		Color08.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color08+14)
MOVT	R0, #hi_addr(_Color08+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2928 :: 		Color08.Pen_Color       = 0x9B26;
MOVW	R1, #39718
MOVW	R0, #lo_addr(_Color08+16)
MOVT	R0, #hi_addr(_Color08+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2929 :: 		Color08.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color08+18)
MOVT	R0, #hi_addr(_Color08+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2930 :: 		Color08.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color08+19)
MOVT	R0, #hi_addr(_Color08+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2931 :: 		Color08.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color08+20)
MOVT	R0, #hi_addr(_Color08+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2932 :: 		Color08.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color08+21)
MOVT	R0, #hi_addr(_Color08+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2933 :: 		Color08.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color08+22)
MOVT	R0, #hi_addr(_Color08+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2934 :: 		Color08.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color08+24)
MOVT	R0, #hi_addr(_Color08+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2935 :: 		Color08.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color08+26)
MOVT	R0, #hi_addr(_Color08+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2936 :: 		Color08.Color           = 0x9B26;
MOVW	R1, #39718
MOVW	R0, #lo_addr(_Color08+28)
MOVT	R0, #hi_addr(_Color08+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2937 :: 		Color08.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color08+30)
MOVT	R0, #hi_addr(_Color08+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2938 :: 		Color08.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color08+32)
MOVT	R0, #hi_addr(_Color08+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2939 :: 		Color08.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color08+36)
MOVT	R0, #hi_addr(_Color08+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2940 :: 		Color08.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color08+40)
MOVT	R0, #hi_addr(_Color08+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2941 :: 		Color08.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color08+44)
MOVT	R0, #hi_addr(_Color08+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2942 :: 		Color08.OnPressPtr      = Color08OnPress;
MOVW	R1, #lo_addr(_Color08OnPress+0)
MOVT	R1, #hi_addr(_Color08OnPress+0)
MOVW	R0, #lo_addr(_Color08+48)
MOVT	R0, #hi_addr(_Color08+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2944 :: 		Color09.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color09+0)
MOVT	R0, #hi_addr(_Color09+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2945 :: 		Color09.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Color09+4)
MOVT	R0, #hi_addr(_Color09+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2946 :: 		Color09.Left            = 195;
MOVS	R1, #195
MOVW	R0, #lo_addr(_Color09+6)
MOVT	R0, #hi_addr(_Color09+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2947 :: 		Color09.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color09+8)
MOVT	R0, #hi_addr(_Color09+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2948 :: 		Color09.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color09+10)
MOVT	R0, #hi_addr(_Color09+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2949 :: 		Color09.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color09+12)
MOVT	R0, #hi_addr(_Color09+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2950 :: 		Color09.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color09+14)
MOVT	R0, #hi_addr(_Color09+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2951 :: 		Color09.Pen_Color       = 0x61A0;
MOVW	R1, #24992
MOVW	R0, #lo_addr(_Color09+16)
MOVT	R0, #hi_addr(_Color09+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2952 :: 		Color09.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color09+18)
MOVT	R0, #hi_addr(_Color09+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2953 :: 		Color09.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color09+19)
MOVT	R0, #hi_addr(_Color09+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2954 :: 		Color09.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color09+20)
MOVT	R0, #hi_addr(_Color09+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2955 :: 		Color09.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color09+21)
MOVT	R0, #hi_addr(_Color09+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2956 :: 		Color09.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color09+22)
MOVT	R0, #hi_addr(_Color09+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2957 :: 		Color09.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color09+24)
MOVT	R0, #hi_addr(_Color09+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2958 :: 		Color09.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color09+26)
MOVT	R0, #hi_addr(_Color09+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2959 :: 		Color09.Color           = 0x61A0;
MOVW	R1, #24992
MOVW	R0, #lo_addr(_Color09+28)
MOVT	R0, #hi_addr(_Color09+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2960 :: 		Color09.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color09+30)
MOVT	R0, #hi_addr(_Color09+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2961 :: 		Color09.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color09+32)
MOVT	R0, #hi_addr(_Color09+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2962 :: 		Color09.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color09+36)
MOVT	R0, #hi_addr(_Color09+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2963 :: 		Color09.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color09+40)
MOVT	R0, #hi_addr(_Color09+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2964 :: 		Color09.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color09+44)
MOVT	R0, #hi_addr(_Color09+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2965 :: 		Color09.OnPressPtr      = Color09OnPress;
MOVW	R1, #lo_addr(_Color09OnPress+0)
MOVT	R1, #hi_addr(_Color09OnPress+0)
MOVW	R0, #lo_addr(_Color09+48)
MOVT	R0, #hi_addr(_Color09+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2967 :: 		Color10.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color10+0)
MOVT	R0, #hi_addr(_Color10+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2968 :: 		Color10.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Color10+4)
MOVT	R0, #hi_addr(_Color10+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2969 :: 		Color10.Left            = 208;
MOVS	R1, #208
MOVW	R0, #lo_addr(_Color10+6)
MOVT	R0, #hi_addr(_Color10+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2970 :: 		Color10.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color10+8)
MOVT	R0, #hi_addr(_Color10+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2971 :: 		Color10.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color10+10)
MOVT	R0, #hi_addr(_Color10+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2972 :: 		Color10.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color10+12)
MOVT	R0, #hi_addr(_Color10+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2973 :: 		Color10.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color10+14)
MOVT	R0, #hi_addr(_Color10+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2974 :: 		Color10.Pen_Color       = 0x8800;
MOVW	R1, #34816
MOVW	R0, #lo_addr(_Color10+16)
MOVT	R0, #hi_addr(_Color10+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2975 :: 		Color10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color10+18)
MOVT	R0, #hi_addr(_Color10+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2976 :: 		Color10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color10+19)
MOVT	R0, #hi_addr(_Color10+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2977 :: 		Color10.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color10+20)
MOVT	R0, #hi_addr(_Color10+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2978 :: 		Color10.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color10+21)
MOVT	R0, #hi_addr(_Color10+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2979 :: 		Color10.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color10+22)
MOVT	R0, #hi_addr(_Color10+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2980 :: 		Color10.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color10+24)
MOVT	R0, #hi_addr(_Color10+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2981 :: 		Color10.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color10+26)
MOVT	R0, #hi_addr(_Color10+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2982 :: 		Color10.Color           = 0x8800;
MOVW	R1, #34816
MOVW	R0, #lo_addr(_Color10+28)
MOVT	R0, #hi_addr(_Color10+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2983 :: 		Color10.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color10+30)
MOVT	R0, #hi_addr(_Color10+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2984 :: 		Color10.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color10+32)
MOVT	R0, #hi_addr(_Color10+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2985 :: 		Color10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color10+36)
MOVT	R0, #hi_addr(_Color10+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2986 :: 		Color10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color10+40)
MOVT	R0, #hi_addr(_Color10+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2987 :: 		Color10.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color10+44)
MOVT	R0, #hi_addr(_Color10+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2988 :: 		Color10.OnPressPtr      = Color10OnPress;
MOVW	R1, #lo_addr(_Color10OnPress+0)
MOVT	R1, #hi_addr(_Color10OnPress+0)
MOVW	R0, #lo_addr(_Color10+48)
MOVT	R0, #hi_addr(_Color10+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2990 :: 		Color11.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color11+0)
MOVT	R0, #hi_addr(_Color11+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2991 :: 		Color11.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Color11+4)
MOVT	R0, #hi_addr(_Color11+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2992 :: 		Color11.Left            = 221;
MOVS	R1, #221
MOVW	R0, #lo_addr(_Color11+6)
MOVT	R0, #hi_addr(_Color11+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2993 :: 		Color11.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color11+8)
MOVT	R0, #hi_addr(_Color11+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2994 :: 		Color11.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color11+10)
MOVT	R0, #hi_addr(_Color11+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2995 :: 		Color11.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color11+12)
MOVT	R0, #hi_addr(_Color11+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2996 :: 		Color11.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color11+14)
MOVT	R0, #hi_addr(_Color11+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2997 :: 		Color11.Pen_Color       = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Color11+16)
MOVT	R0, #hi_addr(_Color11+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2998 :: 		Color11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color11+18)
MOVT	R0, #hi_addr(_Color11+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,2999 :: 		Color11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color11+19)
MOVT	R0, #hi_addr(_Color11+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3000 :: 		Color11.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color11+20)
MOVT	R0, #hi_addr(_Color11+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3001 :: 		Color11.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color11+21)
MOVT	R0, #hi_addr(_Color11+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3002 :: 		Color11.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color11+22)
MOVT	R0, #hi_addr(_Color11+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3003 :: 		Color11.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color11+24)
MOVT	R0, #hi_addr(_Color11+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3004 :: 		Color11.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color11+26)
MOVT	R0, #hi_addr(_Color11+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3005 :: 		Color11.Color           = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Color11+28)
MOVT	R0, #hi_addr(_Color11+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3006 :: 		Color11.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color11+30)
MOVT	R0, #hi_addr(_Color11+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3007 :: 		Color11.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color11+32)
MOVT	R0, #hi_addr(_Color11+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3008 :: 		Color11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color11+36)
MOVT	R0, #hi_addr(_Color11+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3009 :: 		Color11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color11+40)
MOVT	R0, #hi_addr(_Color11+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3010 :: 		Color11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color11+44)
MOVT	R0, #hi_addr(_Color11+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3011 :: 		Color11.OnPressPtr      = Color11OnPress;
MOVW	R1, #lo_addr(_Color11OnPress+0)
MOVT	R1, #hi_addr(_Color11OnPress+0)
MOVW	R0, #lo_addr(_Color11+48)
MOVT	R0, #hi_addr(_Color11+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3013 :: 		Color12.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color12+0)
MOVT	R0, #hi_addr(_Color12+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3014 :: 		Color12.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Color12+4)
MOVT	R0, #hi_addr(_Color12+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3015 :: 		Color12.Left            = 234;
MOVS	R1, #234
MOVW	R0, #lo_addr(_Color12+6)
MOVT	R0, #hi_addr(_Color12+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3016 :: 		Color12.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color12+8)
MOVT	R0, #hi_addr(_Color12+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3017 :: 		Color12.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color12+10)
MOVT	R0, #hi_addr(_Color12+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3018 :: 		Color12.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color12+12)
MOVT	R0, #hi_addr(_Color12+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3019 :: 		Color12.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color12+14)
MOVT	R0, #hi_addr(_Color12+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3020 :: 		Color12.Pen_Color       = 0xFB20;
MOVW	R1, #64288
MOVW	R0, #lo_addr(_Color12+16)
MOVT	R0, #hi_addr(_Color12+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3021 :: 		Color12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color12+18)
MOVT	R0, #hi_addr(_Color12+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3022 :: 		Color12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color12+19)
MOVT	R0, #hi_addr(_Color12+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3023 :: 		Color12.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color12+20)
MOVT	R0, #hi_addr(_Color12+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3024 :: 		Color12.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color12+21)
MOVT	R0, #hi_addr(_Color12+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3025 :: 		Color12.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color12+22)
MOVT	R0, #hi_addr(_Color12+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3026 :: 		Color12.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color12+24)
MOVT	R0, #hi_addr(_Color12+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3027 :: 		Color12.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color12+26)
MOVT	R0, #hi_addr(_Color12+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3028 :: 		Color12.Color           = 0xFB20;
MOVW	R1, #64288
MOVW	R0, #lo_addr(_Color12+28)
MOVT	R0, #hi_addr(_Color12+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3029 :: 		Color12.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color12+30)
MOVT	R0, #hi_addr(_Color12+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3030 :: 		Color12.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color12+32)
MOVT	R0, #hi_addr(_Color12+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3031 :: 		Color12.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color12+36)
MOVT	R0, #hi_addr(_Color12+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3032 :: 		Color12.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color12+40)
MOVT	R0, #hi_addr(_Color12+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3033 :: 		Color12.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color12+44)
MOVT	R0, #hi_addr(_Color12+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3034 :: 		Color12.OnPressPtr      = Color12OnPress;
MOVW	R1, #lo_addr(_Color12OnPress+0)
MOVT	R1, #hi_addr(_Color12OnPress+0)
MOVW	R0, #lo_addr(_Color12+48)
MOVT	R0, #hi_addr(_Color12+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3036 :: 		Color13.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color13+0)
MOVT	R0, #hi_addr(_Color13+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3037 :: 		Color13.Order           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Color13+4)
MOVT	R0, #hi_addr(_Color13+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3038 :: 		Color13.Left            = 247;
MOVS	R1, #247
MOVW	R0, #lo_addr(_Color13+6)
MOVT	R0, #hi_addr(_Color13+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3039 :: 		Color13.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color13+8)
MOVT	R0, #hi_addr(_Color13+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3040 :: 		Color13.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color13+10)
MOVT	R0, #hi_addr(_Color13+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3041 :: 		Color13.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color13+12)
MOVT	R0, #hi_addr(_Color13+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3042 :: 		Color13.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color13+14)
MOVT	R0, #hi_addr(_Color13+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3043 :: 		Color13.Pen_Color       = 0xFDC0;
MOVW	R1, #64960
MOVW	R0, #lo_addr(_Color13+16)
MOVT	R0, #hi_addr(_Color13+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3044 :: 		Color13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color13+18)
MOVT	R0, #hi_addr(_Color13+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3045 :: 		Color13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color13+19)
MOVT	R0, #hi_addr(_Color13+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3046 :: 		Color13.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color13+20)
MOVT	R0, #hi_addr(_Color13+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3047 :: 		Color13.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color13+21)
MOVT	R0, #hi_addr(_Color13+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3048 :: 		Color13.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color13+22)
MOVT	R0, #hi_addr(_Color13+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3049 :: 		Color13.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color13+24)
MOVT	R0, #hi_addr(_Color13+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3050 :: 		Color13.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color13+26)
MOVT	R0, #hi_addr(_Color13+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3051 :: 		Color13.Color           = 0xFDC0;
MOVW	R1, #64960
MOVW	R0, #lo_addr(_Color13+28)
MOVT	R0, #hi_addr(_Color13+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3052 :: 		Color13.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color13+30)
MOVT	R0, #hi_addr(_Color13+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3053 :: 		Color13.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color13+32)
MOVT	R0, #hi_addr(_Color13+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3054 :: 		Color13.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color13+36)
MOVT	R0, #hi_addr(_Color13+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3055 :: 		Color13.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color13+40)
MOVT	R0, #hi_addr(_Color13+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3056 :: 		Color13.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color13+44)
MOVT	R0, #hi_addr(_Color13+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3057 :: 		Color13.OnPressPtr      = Color13OnPress;
MOVW	R1, #lo_addr(_Color13OnPress+0)
MOVT	R1, #hi_addr(_Color13OnPress+0)
MOVW	R0, #lo_addr(_Color13+48)
MOVT	R0, #hi_addr(_Color13+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3059 :: 		Color14.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color14+0)
MOVT	R0, #hi_addr(_Color14+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3060 :: 		Color14.Order           = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Color14+4)
MOVT	R0, #hi_addr(_Color14+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3061 :: 		Color14.Left            = 260;
MOVW	R1, #260
MOVW	R0, #lo_addr(_Color14+6)
MOVT	R0, #hi_addr(_Color14+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3062 :: 		Color14.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color14+8)
MOVT	R0, #hi_addr(_Color14+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3063 :: 		Color14.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color14+10)
MOVT	R0, #hi_addr(_Color14+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3064 :: 		Color14.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color14+12)
MOVT	R0, #hi_addr(_Color14+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3065 :: 		Color14.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color14+14)
MOVT	R0, #hi_addr(_Color14+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3066 :: 		Color14.Pen_Color       = 0xFEA4;
MOVW	R1, #65188
MOVW	R0, #lo_addr(_Color14+16)
MOVT	R0, #hi_addr(_Color14+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3067 :: 		Color14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color14+18)
MOVT	R0, #hi_addr(_Color14+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3068 :: 		Color14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color14+19)
MOVT	R0, #hi_addr(_Color14+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3069 :: 		Color14.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color14+20)
MOVT	R0, #hi_addr(_Color14+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3070 :: 		Color14.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color14+21)
MOVT	R0, #hi_addr(_Color14+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3071 :: 		Color14.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color14+22)
MOVT	R0, #hi_addr(_Color14+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3072 :: 		Color14.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color14+24)
MOVT	R0, #hi_addr(_Color14+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3073 :: 		Color14.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color14+26)
MOVT	R0, #hi_addr(_Color14+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3074 :: 		Color14.Color           = 0xFEA4;
MOVW	R1, #65188
MOVW	R0, #lo_addr(_Color14+28)
MOVT	R0, #hi_addr(_Color14+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3075 :: 		Color14.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color14+30)
MOVT	R0, #hi_addr(_Color14+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3076 :: 		Color14.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color14+32)
MOVT	R0, #hi_addr(_Color14+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3077 :: 		Color14.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color14+36)
MOVT	R0, #hi_addr(_Color14+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3078 :: 		Color14.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color14+40)
MOVT	R0, #hi_addr(_Color14+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3079 :: 		Color14.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color14+44)
MOVT	R0, #hi_addr(_Color14+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3080 :: 		Color14.OnPressPtr      = Color14OnPress;
MOVW	R1, #lo_addr(_Color14OnPress+0)
MOVT	R1, #hi_addr(_Color14OnPress+0)
MOVW	R0, #lo_addr(_Color14+48)
MOVT	R0, #hi_addr(_Color14+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3082 :: 		Color15.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color15+0)
MOVT	R0, #hi_addr(_Color15+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3083 :: 		Color15.Order           = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Color15+4)
MOVT	R0, #hi_addr(_Color15+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3084 :: 		Color15.Left            = 273;
MOVW	R1, #273
MOVW	R0, #lo_addr(_Color15+6)
MOVT	R0, #hi_addr(_Color15+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3085 :: 		Color15.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color15+8)
MOVT	R0, #hi_addr(_Color15+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3086 :: 		Color15.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color15+10)
MOVT	R0, #hi_addr(_Color15+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3087 :: 		Color15.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color15+12)
MOVT	R0, #hi_addr(_Color15+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3088 :: 		Color15.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color15+14)
MOVT	R0, #hi_addr(_Color15+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3089 :: 		Color15.Pen_Color       = 0xFFE0;
MOVW	R1, #65504
MOVW	R0, #lo_addr(_Color15+16)
MOVT	R0, #hi_addr(_Color15+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3090 :: 		Color15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color15+18)
MOVT	R0, #hi_addr(_Color15+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3091 :: 		Color15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color15+19)
MOVT	R0, #hi_addr(_Color15+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3092 :: 		Color15.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color15+20)
MOVT	R0, #hi_addr(_Color15+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3093 :: 		Color15.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color15+21)
MOVT	R0, #hi_addr(_Color15+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3094 :: 		Color15.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color15+22)
MOVT	R0, #hi_addr(_Color15+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3095 :: 		Color15.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color15+24)
MOVT	R0, #hi_addr(_Color15+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3096 :: 		Color15.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color15+26)
MOVT	R0, #hi_addr(_Color15+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3097 :: 		Color15.Color           = 0xFFE0;
MOVW	R1, #65504
MOVW	R0, #lo_addr(_Color15+28)
MOVT	R0, #hi_addr(_Color15+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3098 :: 		Color15.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color15+30)
MOVT	R0, #hi_addr(_Color15+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3099 :: 		Color15.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color15+32)
MOVT	R0, #hi_addr(_Color15+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3100 :: 		Color15.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color15+36)
MOVT	R0, #hi_addr(_Color15+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3101 :: 		Color15.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color15+40)
MOVT	R0, #hi_addr(_Color15+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3102 :: 		Color15.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color15+44)
MOVT	R0, #hi_addr(_Color15+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3103 :: 		Color15.OnPressPtr      = Color15OnPress;
MOVW	R1, #lo_addr(_Color15OnPress+0)
MOVT	R1, #hi_addr(_Color15OnPress+0)
MOVW	R0, #lo_addr(_Color15+48)
MOVT	R0, #hi_addr(_Color15+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3105 :: 		Color16.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color16+0)
MOVT	R0, #hi_addr(_Color16+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3106 :: 		Color16.Order           = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Color16+4)
MOVT	R0, #hi_addr(_Color16+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3107 :: 		Color16.Left            = 286;
MOVW	R1, #286
MOVW	R0, #lo_addr(_Color16+6)
MOVT	R0, #hi_addr(_Color16+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3108 :: 		Color16.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color16+8)
MOVT	R0, #hi_addr(_Color16+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3109 :: 		Color16.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color16+10)
MOVT	R0, #hi_addr(_Color16+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3110 :: 		Color16.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color16+12)
MOVT	R0, #hi_addr(_Color16+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3111 :: 		Color16.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color16+14)
MOVT	R0, #hi_addr(_Color16+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3112 :: 		Color16.Pen_Color       = 0xFFF3;
MOVW	R1, #65523
MOVW	R0, #lo_addr(_Color16+16)
MOVT	R0, #hi_addr(_Color16+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3113 :: 		Color16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color16+18)
MOVT	R0, #hi_addr(_Color16+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3114 :: 		Color16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color16+19)
MOVT	R0, #hi_addr(_Color16+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3115 :: 		Color16.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color16+20)
MOVT	R0, #hi_addr(_Color16+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3116 :: 		Color16.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color16+21)
MOVT	R0, #hi_addr(_Color16+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3117 :: 		Color16.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color16+22)
MOVT	R0, #hi_addr(_Color16+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3118 :: 		Color16.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color16+24)
MOVT	R0, #hi_addr(_Color16+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3119 :: 		Color16.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color16+26)
MOVT	R0, #hi_addr(_Color16+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3120 :: 		Color16.Color           = 0xFFF3;
MOVW	R1, #65523
MOVW	R0, #lo_addr(_Color16+28)
MOVT	R0, #hi_addr(_Color16+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3121 :: 		Color16.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color16+30)
MOVT	R0, #hi_addr(_Color16+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3122 :: 		Color16.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color16+32)
MOVT	R0, #hi_addr(_Color16+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3123 :: 		Color16.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color16+36)
MOVT	R0, #hi_addr(_Color16+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3124 :: 		Color16.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color16+40)
MOVT	R0, #hi_addr(_Color16+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3125 :: 		Color16.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color16+44)
MOVT	R0, #hi_addr(_Color16+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3126 :: 		Color16.OnPressPtr      = Color16OnPress;
MOVW	R1, #lo_addr(_Color16OnPress+0)
MOVT	R1, #hi_addr(_Color16OnPress+0)
MOVW	R0, #lo_addr(_Color16+48)
MOVT	R0, #hi_addr(_Color16+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3128 :: 		Color17.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color17+0)
MOVT	R0, #hi_addr(_Color17+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3129 :: 		Color17.Order           = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Color17+4)
MOVT	R0, #hi_addr(_Color17+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3130 :: 		Color17.Left            = 299;
MOVW	R1, #299
MOVW	R0, #lo_addr(_Color17+6)
MOVT	R0, #hi_addr(_Color17+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3131 :: 		Color17.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color17+8)
MOVT	R0, #hi_addr(_Color17+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3132 :: 		Color17.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color17+10)
MOVT	R0, #hi_addr(_Color17+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3133 :: 		Color17.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color17+12)
MOVT	R0, #hi_addr(_Color17+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3134 :: 		Color17.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color17+14)
MOVT	R0, #hi_addr(_Color17+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3135 :: 		Color17.Pen_Color       = 0xCFED;
MOVW	R1, #53229
MOVW	R0, #lo_addr(_Color17+16)
MOVT	R0, #hi_addr(_Color17+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3136 :: 		Color17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color17+18)
MOVT	R0, #hi_addr(_Color17+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3137 :: 		Color17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color17+19)
MOVT	R0, #hi_addr(_Color17+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3138 :: 		Color17.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color17+20)
MOVT	R0, #hi_addr(_Color17+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3139 :: 		Color17.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color17+21)
MOVT	R0, #hi_addr(_Color17+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3140 :: 		Color17.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color17+22)
MOVT	R0, #hi_addr(_Color17+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3141 :: 		Color17.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color17+24)
MOVT	R0, #hi_addr(_Color17+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3142 :: 		Color17.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color17+26)
MOVT	R0, #hi_addr(_Color17+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3143 :: 		Color17.Color           = 0xCFED;
MOVW	R1, #53229
MOVW	R0, #lo_addr(_Color17+28)
MOVT	R0, #hi_addr(_Color17+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3144 :: 		Color17.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color17+30)
MOVT	R0, #hi_addr(_Color17+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3145 :: 		Color17.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color17+32)
MOVT	R0, #hi_addr(_Color17+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3146 :: 		Color17.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color17+36)
MOVT	R0, #hi_addr(_Color17+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3147 :: 		Color17.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color17+40)
MOVT	R0, #hi_addr(_Color17+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3148 :: 		Color17.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color17+44)
MOVT	R0, #hi_addr(_Color17+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3149 :: 		Color17.OnPressPtr      = Color17OnPress;
MOVW	R1, #lo_addr(_Color17OnPress+0)
MOVT	R1, #hi_addr(_Color17OnPress+0)
MOVW	R0, #lo_addr(_Color17+48)
MOVT	R0, #hi_addr(_Color17+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3151 :: 		Color18.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color18+0)
MOVT	R0, #hi_addr(_Color18+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3152 :: 		Color18.Order           = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Color18+4)
MOVT	R0, #hi_addr(_Color18+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3153 :: 		Color18.Left            = 312;
MOVW	R1, #312
MOVW	R0, #lo_addr(_Color18+6)
MOVT	R0, #hi_addr(_Color18+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3154 :: 		Color18.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color18+8)
MOVT	R0, #hi_addr(_Color18+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3155 :: 		Color18.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color18+10)
MOVT	R0, #hi_addr(_Color18+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3156 :: 		Color18.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color18+12)
MOVT	R0, #hi_addr(_Color18+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3157 :: 		Color18.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color18+14)
MOVT	R0, #hi_addr(_Color18+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3158 :: 		Color18.Pen_Color       = 0x97F3;
MOVW	R1, #38899
MOVW	R0, #lo_addr(_Color18+16)
MOVT	R0, #hi_addr(_Color18+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3159 :: 		Color18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color18+18)
MOVT	R0, #hi_addr(_Color18+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3160 :: 		Color18.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color18+19)
MOVT	R0, #hi_addr(_Color18+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3161 :: 		Color18.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color18+20)
MOVT	R0, #hi_addr(_Color18+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3162 :: 		Color18.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color18+21)
MOVT	R0, #hi_addr(_Color18+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3163 :: 		Color18.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color18+22)
MOVT	R0, #hi_addr(_Color18+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3164 :: 		Color18.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color18+24)
MOVT	R0, #hi_addr(_Color18+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3165 :: 		Color18.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color18+26)
MOVT	R0, #hi_addr(_Color18+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3166 :: 		Color18.Color           = 0x97F3;
MOVW	R1, #38899
MOVW	R0, #lo_addr(_Color18+28)
MOVT	R0, #hi_addr(_Color18+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3167 :: 		Color18.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color18+30)
MOVT	R0, #hi_addr(_Color18+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3168 :: 		Color18.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color18+32)
MOVT	R0, #hi_addr(_Color18+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3169 :: 		Color18.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color18+36)
MOVT	R0, #hi_addr(_Color18+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3170 :: 		Color18.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color18+40)
MOVT	R0, #hi_addr(_Color18+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3171 :: 		Color18.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color18+44)
MOVT	R0, #hi_addr(_Color18+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3172 :: 		Color18.OnPressPtr      = Color18OnPress;
MOVW	R1, #lo_addr(_Color18OnPress+0)
MOVT	R1, #hi_addr(_Color18OnPress+0)
MOVW	R0, #lo_addr(_Color18+48)
MOVT	R0, #hi_addr(_Color18+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3174 :: 		Color19.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color19+0)
MOVT	R0, #hi_addr(_Color19+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3175 :: 		Color19.Order           = 29;
MOVS	R1, #29
MOVW	R0, #lo_addr(_Color19+4)
MOVT	R0, #hi_addr(_Color19+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3176 :: 		Color19.Left            = 325;
MOVW	R1, #325
MOVW	R0, #lo_addr(_Color19+6)
MOVT	R0, #hi_addr(_Color19+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3177 :: 		Color19.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color19+8)
MOVT	R0, #hi_addr(_Color19+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3178 :: 		Color19.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color19+10)
MOVT	R0, #hi_addr(_Color19+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3179 :: 		Color19.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color19+12)
MOVT	R0, #hi_addr(_Color19+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3180 :: 		Color19.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color19+14)
MOVT	R0, #hi_addr(_Color19+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3181 :: 		Color19.Pen_Color       = 0x0E21;
MOVW	R1, #3617
MOVW	R0, #lo_addr(_Color19+16)
MOVT	R0, #hi_addr(_Color19+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3182 :: 		Color19.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color19+18)
MOVT	R0, #hi_addr(_Color19+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3183 :: 		Color19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color19+19)
MOVT	R0, #hi_addr(_Color19+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3184 :: 		Color19.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color19+20)
MOVT	R0, #hi_addr(_Color19+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3185 :: 		Color19.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color19+21)
MOVT	R0, #hi_addr(_Color19+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3186 :: 		Color19.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color19+22)
MOVT	R0, #hi_addr(_Color19+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3187 :: 		Color19.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color19+24)
MOVT	R0, #hi_addr(_Color19+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3188 :: 		Color19.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color19+26)
MOVT	R0, #hi_addr(_Color19+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3189 :: 		Color19.Color           = 0x0E21;
MOVW	R1, #3617
MOVW	R0, #lo_addr(_Color19+28)
MOVT	R0, #hi_addr(_Color19+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3190 :: 		Color19.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color19+30)
MOVT	R0, #hi_addr(_Color19+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3191 :: 		Color19.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color19+32)
MOVT	R0, #hi_addr(_Color19+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3192 :: 		Color19.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color19+36)
MOVT	R0, #hi_addr(_Color19+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3193 :: 		Color19.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color19+40)
MOVT	R0, #hi_addr(_Color19+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3194 :: 		Color19.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color19+44)
MOVT	R0, #hi_addr(_Color19+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3195 :: 		Color19.OnPressPtr      = Color19OnPress;
MOVW	R1, #lo_addr(_Color19OnPress+0)
MOVT	R1, #hi_addr(_Color19OnPress+0)
MOVW	R0, #lo_addr(_Color19+48)
MOVT	R0, #hi_addr(_Color19+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3197 :: 		Color20.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color20+0)
MOVT	R0, #hi_addr(_Color20+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3198 :: 		Color20.Order           = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Color20+4)
MOVT	R0, #hi_addr(_Color20+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3199 :: 		Color20.Left            = 338;
MOVW	R1, #338
MOVW	R0, #lo_addr(_Color20+6)
MOVT	R0, #hi_addr(_Color20+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3200 :: 		Color20.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color20+8)
MOVT	R0, #hi_addr(_Color20+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3201 :: 		Color20.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color20+10)
MOVT	R0, #hi_addr(_Color20+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3202 :: 		Color20.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color20+12)
MOVT	R0, #hi_addr(_Color20+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3203 :: 		Color20.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color20+14)
MOVT	R0, #hi_addr(_Color20+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3204 :: 		Color20.Pen_Color       = 0x0400;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_Color20+16)
MOVT	R0, #hi_addr(_Color20+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3205 :: 		Color20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color20+18)
MOVT	R0, #hi_addr(_Color20+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3206 :: 		Color20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color20+19)
MOVT	R0, #hi_addr(_Color20+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3207 :: 		Color20.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color20+20)
MOVT	R0, #hi_addr(_Color20+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3208 :: 		Color20.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color20+21)
MOVT	R0, #hi_addr(_Color20+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3209 :: 		Color20.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color20+22)
MOVT	R0, #hi_addr(_Color20+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3210 :: 		Color20.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color20+24)
MOVT	R0, #hi_addr(_Color20+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3211 :: 		Color20.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color20+26)
MOVT	R0, #hi_addr(_Color20+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3212 :: 		Color20.Color           = 0x0400;
MOVW	R1, #1024
MOVW	R0, #lo_addr(_Color20+28)
MOVT	R0, #hi_addr(_Color20+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3213 :: 		Color20.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color20+30)
MOVT	R0, #hi_addr(_Color20+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3214 :: 		Color20.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color20+32)
MOVT	R0, #hi_addr(_Color20+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3215 :: 		Color20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color20+36)
MOVT	R0, #hi_addr(_Color20+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3216 :: 		Color20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color20+40)
MOVT	R0, #hi_addr(_Color20+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3217 :: 		Color20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color20+44)
MOVT	R0, #hi_addr(_Color20+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3218 :: 		Color20.OnPressPtr      = Color20OnPress;
MOVW	R1, #lo_addr(_Color20OnPress+0)
MOVT	R1, #hi_addr(_Color20OnPress+0)
MOVW	R0, #lo_addr(_Color20+48)
MOVT	R0, #hi_addr(_Color20+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3220 :: 		Color21.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color21+0)
MOVT	R0, #hi_addr(_Color21+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3221 :: 		Color21.Order           = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color21+4)
MOVT	R0, #hi_addr(_Color21+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3222 :: 		Color21.Left            = 351;
MOVW	R1, #351
MOVW	R0, #lo_addr(_Color21+6)
MOVT	R0, #hi_addr(_Color21+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3223 :: 		Color21.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color21+8)
MOVT	R0, #hi_addr(_Color21+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3224 :: 		Color21.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color21+10)
MOVT	R0, #hi_addr(_Color21+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3225 :: 		Color21.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color21+12)
MOVT	R0, #hi_addr(_Color21+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3226 :: 		Color21.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color21+14)
MOVT	R0, #hi_addr(_Color21+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3227 :: 		Color21.Pen_Color       = 0x2CEB;
MOVW	R1, #11499
MOVW	R0, #lo_addr(_Color21+16)
MOVT	R0, #hi_addr(_Color21+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3228 :: 		Color21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color21+18)
MOVT	R0, #hi_addr(_Color21+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3229 :: 		Color21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color21+19)
MOVT	R0, #hi_addr(_Color21+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3230 :: 		Color21.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color21+20)
MOVT	R0, #hi_addr(_Color21+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3231 :: 		Color21.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color21+21)
MOVT	R0, #hi_addr(_Color21+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3232 :: 		Color21.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color21+22)
MOVT	R0, #hi_addr(_Color21+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3233 :: 		Color21.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color21+24)
MOVT	R0, #hi_addr(_Color21+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3234 :: 		Color21.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color21+26)
MOVT	R0, #hi_addr(_Color21+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3235 :: 		Color21.Color           = 0x2CEB;
MOVW	R1, #11499
MOVW	R0, #lo_addr(_Color21+28)
MOVT	R0, #hi_addr(_Color21+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3236 :: 		Color21.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color21+30)
MOVT	R0, #hi_addr(_Color21+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3237 :: 		Color21.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color21+32)
MOVT	R0, #hi_addr(_Color21+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3238 :: 		Color21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color21+36)
MOVT	R0, #hi_addr(_Color21+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3239 :: 		Color21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color21+40)
MOVT	R0, #hi_addr(_Color21+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3240 :: 		Color21.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color21+44)
MOVT	R0, #hi_addr(_Color21+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3241 :: 		Color21.OnPressPtr      = Color21OnPress;
MOVW	R1, #lo_addr(_Color21OnPress+0)
MOVT	R1, #hi_addr(_Color21OnPress+0)
MOVW	R0, #lo_addr(_Color21+48)
MOVT	R0, #hi_addr(_Color21+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3243 :: 		Color22.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color22+0)
MOVT	R0, #hi_addr(_Color22+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3244 :: 		Color22.Order           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Color22+4)
MOVT	R0, #hi_addr(_Color22+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3245 :: 		Color22.Left            = 364;
MOVW	R1, #364
MOVW	R0, #lo_addr(_Color22+6)
MOVT	R0, #hi_addr(_Color22+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3246 :: 		Color22.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color22+8)
MOVT	R0, #hi_addr(_Color22+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3247 :: 		Color22.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color22+10)
MOVT	R0, #hi_addr(_Color22+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3248 :: 		Color22.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color22+12)
MOVT	R0, #hi_addr(_Color22+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3249 :: 		Color22.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color22+14)
MOVT	R0, #hi_addr(_Color22+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3250 :: 		Color22.Pen_Color       = 0x059E;
MOVW	R1, #1438
MOVW	R0, #lo_addr(_Color22+16)
MOVT	R0, #hi_addr(_Color22+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3251 :: 		Color22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color22+18)
MOVT	R0, #hi_addr(_Color22+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3252 :: 		Color22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color22+19)
MOVT	R0, #hi_addr(_Color22+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3253 :: 		Color22.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color22+20)
MOVT	R0, #hi_addr(_Color22+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3254 :: 		Color22.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color22+21)
MOVT	R0, #hi_addr(_Color22+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3255 :: 		Color22.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color22+22)
MOVT	R0, #hi_addr(_Color22+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3256 :: 		Color22.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color22+24)
MOVT	R0, #hi_addr(_Color22+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3257 :: 		Color22.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color22+26)
MOVT	R0, #hi_addr(_Color22+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3258 :: 		Color22.Color           = 0x059E;
MOVW	R1, #1438
MOVW	R0, #lo_addr(_Color22+28)
MOVT	R0, #hi_addr(_Color22+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3259 :: 		Color22.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color22+30)
MOVT	R0, #hi_addr(_Color22+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3260 :: 		Color22.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color22+32)
MOVT	R0, #hi_addr(_Color22+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3261 :: 		Color22.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color22+36)
MOVT	R0, #hi_addr(_Color22+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3262 :: 		Color22.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color22+40)
MOVT	R0, #hi_addr(_Color22+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3263 :: 		Color22.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color22+44)
MOVT	R0, #hi_addr(_Color22+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3264 :: 		Color22.OnPressPtr      = Color22OnPress;
MOVW	R1, #lo_addr(_Color22OnPress+0)
MOVT	R1, #hi_addr(_Color22OnPress+0)
MOVW	R0, #lo_addr(_Color22+48)
MOVT	R0, #hi_addr(_Color22+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3266 :: 		Color23.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color23+0)
MOVT	R0, #hi_addr(_Color23+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3267 :: 		Color23.Order           = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Color23+4)
MOVT	R0, #hi_addr(_Color23+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3268 :: 		Color23.Left            = 377;
MOVW	R1, #377
MOVW	R0, #lo_addr(_Color23+6)
MOVT	R0, #hi_addr(_Color23+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3269 :: 		Color23.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color23+8)
MOVT	R0, #hi_addr(_Color23+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3270 :: 		Color23.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color23+10)
MOVT	R0, #hi_addr(_Color23+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3271 :: 		Color23.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color23+12)
MOVT	R0, #hi_addr(_Color23+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3272 :: 		Color23.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color23+14)
MOVT	R0, #hi_addr(_Color23+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3273 :: 		Color23.Pen_Color       = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color23+16)
MOVT	R0, #hi_addr(_Color23+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3274 :: 		Color23.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color23+18)
MOVT	R0, #hi_addr(_Color23+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3275 :: 		Color23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color23+19)
MOVT	R0, #hi_addr(_Color23+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3276 :: 		Color23.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color23+20)
MOVT	R0, #hi_addr(_Color23+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3277 :: 		Color23.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color23+21)
MOVT	R0, #hi_addr(_Color23+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3278 :: 		Color23.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color23+22)
MOVT	R0, #hi_addr(_Color23+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3279 :: 		Color23.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color23+24)
MOVT	R0, #hi_addr(_Color23+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3280 :: 		Color23.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color23+26)
MOVT	R0, #hi_addr(_Color23+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3281 :: 		Color23.Color           = 0x001F;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color23+28)
MOVT	R0, #hi_addr(_Color23+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3282 :: 		Color23.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color23+30)
MOVT	R0, #hi_addr(_Color23+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3283 :: 		Color23.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color23+32)
MOVT	R0, #hi_addr(_Color23+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3284 :: 		Color23.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color23+36)
MOVT	R0, #hi_addr(_Color23+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3285 :: 		Color23.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color23+40)
MOVT	R0, #hi_addr(_Color23+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3286 :: 		Color23.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color23+44)
MOVT	R0, #hi_addr(_Color23+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3287 :: 		Color23.OnPressPtr      = Color23OnPress;
MOVW	R1, #lo_addr(_Color23OnPress+0)
MOVT	R1, #hi_addr(_Color23OnPress+0)
MOVW	R0, #lo_addr(_Color23+48)
MOVT	R0, #hi_addr(_Color23+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3289 :: 		Color24.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color24+0)
MOVT	R0, #hi_addr(_Color24+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3290 :: 		Color24.Order           = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Color24+4)
MOVT	R0, #hi_addr(_Color24+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3291 :: 		Color24.Left            = 390;
MOVW	R1, #390
MOVW	R0, #lo_addr(_Color24+6)
MOVT	R0, #hi_addr(_Color24+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3292 :: 		Color24.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color24+8)
MOVT	R0, #hi_addr(_Color24+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3293 :: 		Color24.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color24+10)
MOVT	R0, #hi_addr(_Color24+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3294 :: 		Color24.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color24+12)
MOVT	R0, #hi_addr(_Color24+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3295 :: 		Color24.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color24+14)
MOVT	R0, #hi_addr(_Color24+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3296 :: 		Color24.Pen_Color       = 0x0013;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Color24+16)
MOVT	R0, #hi_addr(_Color24+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3297 :: 		Color24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color24+18)
MOVT	R0, #hi_addr(_Color24+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3298 :: 		Color24.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color24+19)
MOVT	R0, #hi_addr(_Color24+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3299 :: 		Color24.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color24+20)
MOVT	R0, #hi_addr(_Color24+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3300 :: 		Color24.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color24+21)
MOVT	R0, #hi_addr(_Color24+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3301 :: 		Color24.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color24+22)
MOVT	R0, #hi_addr(_Color24+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3302 :: 		Color24.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color24+24)
MOVT	R0, #hi_addr(_Color24+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3303 :: 		Color24.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color24+26)
MOVT	R0, #hi_addr(_Color24+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3304 :: 		Color24.Color           = 0x0013;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Color24+28)
MOVT	R0, #hi_addr(_Color24+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3305 :: 		Color24.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color24+30)
MOVT	R0, #hi_addr(_Color24+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3306 :: 		Color24.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color24+32)
MOVT	R0, #hi_addr(_Color24+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3307 :: 		Color24.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color24+36)
MOVT	R0, #hi_addr(_Color24+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3308 :: 		Color24.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color24+40)
MOVT	R0, #hi_addr(_Color24+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3309 :: 		Color24.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color24+44)
MOVT	R0, #hi_addr(_Color24+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3310 :: 		Color24.OnPressPtr      = Color24OnPress;
MOVW	R1, #lo_addr(_Color24OnPress+0)
MOVT	R1, #hi_addr(_Color24OnPress+0)
MOVW	R0, #lo_addr(_Color24+48)
MOVT	R0, #hi_addr(_Color24+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3312 :: 		Color25.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color25+0)
MOVT	R0, #hi_addr(_Color25+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3313 :: 		Color25.Order           = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Color25+4)
MOVT	R0, #hi_addr(_Color25+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3314 :: 		Color25.Left            = 403;
MOVW	R1, #403
MOVW	R0, #lo_addr(_Color25+6)
MOVT	R0, #hi_addr(_Color25+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3315 :: 		Color25.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color25+8)
MOVT	R0, #hi_addr(_Color25+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3316 :: 		Color25.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color25+10)
MOVT	R0, #hi_addr(_Color25+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3317 :: 		Color25.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color25+12)
MOVT	R0, #hi_addr(_Color25+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3318 :: 		Color25.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color25+14)
MOVT	R0, #hi_addr(_Color25+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3319 :: 		Color25.Pen_Color       = 0x5013;
MOVW	R1, #20499
MOVW	R0, #lo_addr(_Color25+16)
MOVT	R0, #hi_addr(_Color25+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3320 :: 		Color25.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color25+18)
MOVT	R0, #hi_addr(_Color25+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3321 :: 		Color25.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color25+19)
MOVT	R0, #hi_addr(_Color25+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3322 :: 		Color25.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color25+20)
MOVT	R0, #hi_addr(_Color25+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3323 :: 		Color25.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color25+21)
MOVT	R0, #hi_addr(_Color25+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3324 :: 		Color25.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color25+22)
MOVT	R0, #hi_addr(_Color25+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3325 :: 		Color25.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color25+24)
MOVT	R0, #hi_addr(_Color25+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3326 :: 		Color25.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color25+26)
MOVT	R0, #hi_addr(_Color25+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3327 :: 		Color25.Color           = 0x5013;
MOVW	R1, #20499
MOVW	R0, #lo_addr(_Color25+28)
MOVT	R0, #hi_addr(_Color25+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3328 :: 		Color25.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color25+30)
MOVT	R0, #hi_addr(_Color25+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3329 :: 		Color25.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color25+32)
MOVT	R0, #hi_addr(_Color25+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3330 :: 		Color25.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color25+36)
MOVT	R0, #hi_addr(_Color25+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3331 :: 		Color25.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color25+40)
MOVT	R0, #hi_addr(_Color25+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3332 :: 		Color25.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color25+44)
MOVT	R0, #hi_addr(_Color25+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3333 :: 		Color25.OnPressPtr      = Color25OnPress;
MOVW	R1, #lo_addr(_Color25OnPress+0)
MOVT	R1, #hi_addr(_Color25OnPress+0)
MOVW	R0, #lo_addr(_Color25+48)
MOVT	R0, #hi_addr(_Color25+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3335 :: 		Color26.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color26+0)
MOVT	R0, #hi_addr(_Color26+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3336 :: 		Color26.Order           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Color26+4)
MOVT	R0, #hi_addr(_Color26+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3337 :: 		Color26.Left            = 416;
MOVW	R1, #416
MOVW	R0, #lo_addr(_Color26+6)
MOVT	R0, #hi_addr(_Color26+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3338 :: 		Color26.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color26+8)
MOVT	R0, #hi_addr(_Color26+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3339 :: 		Color26.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color26+10)
MOVT	R0, #hi_addr(_Color26+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3340 :: 		Color26.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color26+12)
MOVT	R0, #hi_addr(_Color26+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3341 :: 		Color26.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color26+14)
MOVT	R0, #hi_addr(_Color26+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3342 :: 		Color26.Pen_Color       = 0x7194;
MOVW	R1, #29076
MOVW	R0, #lo_addr(_Color26+16)
MOVT	R0, #hi_addr(_Color26+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3343 :: 		Color26.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color26+18)
MOVT	R0, #hi_addr(_Color26+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3344 :: 		Color26.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color26+19)
MOVT	R0, #hi_addr(_Color26+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3345 :: 		Color26.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color26+20)
MOVT	R0, #hi_addr(_Color26+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3346 :: 		Color26.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color26+21)
MOVT	R0, #hi_addr(_Color26+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3347 :: 		Color26.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color26+22)
MOVT	R0, #hi_addr(_Color26+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3348 :: 		Color26.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color26+24)
MOVT	R0, #hi_addr(_Color26+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3349 :: 		Color26.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color26+26)
MOVT	R0, #hi_addr(_Color26+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3350 :: 		Color26.Color           = 0x7194;
MOVW	R1, #29076
MOVW	R0, #lo_addr(_Color26+28)
MOVT	R0, #hi_addr(_Color26+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3351 :: 		Color26.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color26+30)
MOVT	R0, #hi_addr(_Color26+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3352 :: 		Color26.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color26+32)
MOVT	R0, #hi_addr(_Color26+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3353 :: 		Color26.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color26+36)
MOVT	R0, #hi_addr(_Color26+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3354 :: 		Color26.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color26+40)
MOVT	R0, #hi_addr(_Color26+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3355 :: 		Color26.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color26+44)
MOVT	R0, #hi_addr(_Color26+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3356 :: 		Color26.OnPressPtr      = Color26OnPress;
MOVW	R1, #lo_addr(_Color26OnPress+0)
MOVT	R1, #hi_addr(_Color26OnPress+0)
MOVW	R0, #lo_addr(_Color26+48)
MOVT	R0, #hi_addr(_Color26+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3358 :: 		Color27.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color27+0)
MOVT	R0, #hi_addr(_Color27+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3359 :: 		Color27.Order           = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Color27+4)
MOVT	R0, #hi_addr(_Color27+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3360 :: 		Color27.Left            = 428;
MOVW	R1, #428
MOVW	R0, #lo_addr(_Color27+6)
MOVT	R0, #hi_addr(_Color27+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3361 :: 		Color27.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color27+8)
MOVT	R0, #hi_addr(_Color27+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3362 :: 		Color27.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color27+10)
MOVT	R0, #hi_addr(_Color27+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3363 :: 		Color27.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color27+12)
MOVT	R0, #hi_addr(_Color27+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3364 :: 		Color27.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color27+14)
MOVT	R0, #hi_addr(_Color27+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3365 :: 		Color27.Pen_Color       = 0x935F;
MOVW	R1, #37727
MOVW	R0, #lo_addr(_Color27+16)
MOVT	R0, #hi_addr(_Color27+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3366 :: 		Color27.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color27+18)
MOVT	R0, #hi_addr(_Color27+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3367 :: 		Color27.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color27+19)
MOVT	R0, #hi_addr(_Color27+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3368 :: 		Color27.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color27+20)
MOVT	R0, #hi_addr(_Color27+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3369 :: 		Color27.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color27+21)
MOVT	R0, #hi_addr(_Color27+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3370 :: 		Color27.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color27+22)
MOVT	R0, #hi_addr(_Color27+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3371 :: 		Color27.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color27+24)
MOVT	R0, #hi_addr(_Color27+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3372 :: 		Color27.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color27+26)
MOVT	R0, #hi_addr(_Color27+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3373 :: 		Color27.Color           = 0x935F;
MOVW	R1, #37727
MOVW	R0, #lo_addr(_Color27+28)
MOVT	R0, #hi_addr(_Color27+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3374 :: 		Color27.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color27+30)
MOVT	R0, #hi_addr(_Color27+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3375 :: 		Color27.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color27+32)
MOVT	R0, #hi_addr(_Color27+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3376 :: 		Color27.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color27+36)
MOVT	R0, #hi_addr(_Color27+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3377 :: 		Color27.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color27+40)
MOVT	R0, #hi_addr(_Color27+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3378 :: 		Color27.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color27+44)
MOVT	R0, #hi_addr(_Color27+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3379 :: 		Color27.OnPressPtr      = Color27OnPress;
MOVW	R1, #lo_addr(_Color27OnPress+0)
MOVT	R1, #hi_addr(_Color27OnPress+0)
MOVW	R0, #lo_addr(_Color27+48)
MOVT	R0, #hi_addr(_Color27+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3381 :: 		Color28.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color28+0)
MOVT	R0, #hi_addr(_Color28+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3382 :: 		Color28.Order           = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Color28+4)
MOVT	R0, #hi_addr(_Color28+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3383 :: 		Color28.Left            = 441;
MOVW	R1, #441
MOVW	R0, #lo_addr(_Color28+6)
MOVT	R0, #hi_addr(_Color28+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3384 :: 		Color28.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color28+8)
MOVT	R0, #hi_addr(_Color28+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3385 :: 		Color28.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color28+10)
MOVT	R0, #hi_addr(_Color28+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3386 :: 		Color28.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color28+12)
MOVT	R0, #hi_addr(_Color28+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3387 :: 		Color28.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color28+14)
MOVT	R0, #hi_addr(_Color28+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3388 :: 		Color28.Pen_Color       = 0xFCDF;
MOVW	R1, #64735
MOVW	R0, #lo_addr(_Color28+16)
MOVT	R0, #hi_addr(_Color28+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3389 :: 		Color28.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color28+18)
MOVT	R0, #hi_addr(_Color28+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3390 :: 		Color28.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color28+19)
MOVT	R0, #hi_addr(_Color28+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3391 :: 		Color28.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color28+20)
MOVT	R0, #hi_addr(_Color28+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3392 :: 		Color28.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color28+21)
MOVT	R0, #hi_addr(_Color28+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3393 :: 		Color28.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color28+22)
MOVT	R0, #hi_addr(_Color28+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3394 :: 		Color28.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color28+24)
MOVT	R0, #hi_addr(_Color28+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3395 :: 		Color28.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color28+26)
MOVT	R0, #hi_addr(_Color28+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3396 :: 		Color28.Color           = 0xFCDF;
MOVW	R1, #64735
MOVW	R0, #lo_addr(_Color28+28)
MOVT	R0, #hi_addr(_Color28+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3397 :: 		Color28.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color28+30)
MOVT	R0, #hi_addr(_Color28+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3398 :: 		Color28.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color28+32)
MOVT	R0, #hi_addr(_Color28+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3399 :: 		Color28.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color28+36)
MOVT	R0, #hi_addr(_Color28+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3400 :: 		Color28.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color28+40)
MOVT	R0, #hi_addr(_Color28+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3401 :: 		Color28.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color28+44)
MOVT	R0, #hi_addr(_Color28+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3402 :: 		Color28.OnPressPtr      = Color28OnPress;
MOVW	R1, #lo_addr(_Color28OnPress+0)
MOVT	R1, #hi_addr(_Color28OnPress+0)
MOVW	R0, #lo_addr(_Color28+48)
MOVT	R0, #hi_addr(_Color28+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3404 :: 		Color29.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color29+0)
MOVT	R0, #hi_addr(_Color29+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3405 :: 		Color29.Order           = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Color29+4)
MOVT	R0, #hi_addr(_Color29+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3406 :: 		Color29.Left            = 454;
MOVW	R1, #454
MOVW	R0, #lo_addr(_Color29+6)
MOVT	R0, #hi_addr(_Color29+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3407 :: 		Color29.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color29+8)
MOVT	R0, #hi_addr(_Color29+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3408 :: 		Color29.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color29+10)
MOVT	R0, #hi_addr(_Color29+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3409 :: 		Color29.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color29+12)
MOVT	R0, #hi_addr(_Color29+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3410 :: 		Color29.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color29+14)
MOVT	R0, #hi_addr(_Color29+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3411 :: 		Color29.Pen_Color       = 0xF992;
MOVW	R1, #63890
MOVW	R0, #lo_addr(_Color29+16)
MOVT	R0, #hi_addr(_Color29+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3412 :: 		Color29.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color29+18)
MOVT	R0, #hi_addr(_Color29+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3413 :: 		Color29.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color29+19)
MOVT	R0, #hi_addr(_Color29+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3414 :: 		Color29.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color29+20)
MOVT	R0, #hi_addr(_Color29+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3415 :: 		Color29.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color29+21)
MOVT	R0, #hi_addr(_Color29+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3416 :: 		Color29.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color29+22)
MOVT	R0, #hi_addr(_Color29+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3417 :: 		Color29.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color29+24)
MOVT	R0, #hi_addr(_Color29+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3418 :: 		Color29.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color29+26)
MOVT	R0, #hi_addr(_Color29+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3419 :: 		Color29.Color           = 0xF992;
MOVW	R1, #63890
MOVW	R0, #lo_addr(_Color29+28)
MOVT	R0, #hi_addr(_Color29+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3420 :: 		Color29.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color29+30)
MOVT	R0, #hi_addr(_Color29+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3421 :: 		Color29.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color29+32)
MOVT	R0, #hi_addr(_Color29+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3422 :: 		Color29.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color29+36)
MOVT	R0, #hi_addr(_Color29+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3423 :: 		Color29.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color29+40)
MOVT	R0, #hi_addr(_Color29+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3424 :: 		Color29.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color29+44)
MOVT	R0, #hi_addr(_Color29+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3425 :: 		Color29.OnPressPtr      = Color29OnPress;
MOVW	R1, #lo_addr(_Color29OnPress+0)
MOVT	R1, #hi_addr(_Color29OnPress+0)
MOVW	R0, #lo_addr(_Color29+48)
MOVT	R0, #hi_addr(_Color29+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3427 :: 		Color30.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Color30+0)
MOVT	R0, #hi_addr(_Color30+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3428 :: 		Color30.Order           = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Color30+4)
MOVT	R0, #hi_addr(_Color30+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3429 :: 		Color30.Left            = 467;
MOVW	R1, #467
MOVW	R0, #lo_addr(_Color30+6)
MOVT	R0, #hi_addr(_Color30+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3430 :: 		Color30.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color30+8)
MOVT	R0, #hi_addr(_Color30+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3431 :: 		Color30.Width           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Color30+10)
MOVT	R0, #hi_addr(_Color30+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3432 :: 		Color30.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Color30+12)
MOVT	R0, #hi_addr(_Color30+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3433 :: 		Color30.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color30+14)
MOVT	R0, #hi_addr(_Color30+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3434 :: 		Color30.Pen_Color       = 0xC813;
MOVW	R1, #51219
MOVW	R0, #lo_addr(_Color30+16)
MOVT	R0, #hi_addr(_Color30+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3435 :: 		Color30.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color30+18)
MOVT	R0, #hi_addr(_Color30+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3436 :: 		Color30.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color30+19)
MOVT	R0, #hi_addr(_Color30+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3437 :: 		Color30.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Color30+20)
MOVT	R0, #hi_addr(_Color30+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3438 :: 		Color30.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color30+21)
MOVT	R0, #hi_addr(_Color30+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3439 :: 		Color30.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color30+22)
MOVT	R0, #hi_addr(_Color30+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3440 :: 		Color30.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Color30+24)
MOVT	R0, #hi_addr(_Color30+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3441 :: 		Color30.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Color30+26)
MOVT	R0, #hi_addr(_Color30+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3442 :: 		Color30.Color           = 0xC813;
MOVW	R1, #51219
MOVW	R0, #lo_addr(_Color30+28)
MOVT	R0, #hi_addr(_Color30+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3443 :: 		Color30.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color30+30)
MOVT	R0, #hi_addr(_Color30+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3444 :: 		Color30.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Color30+32)
MOVT	R0, #hi_addr(_Color30+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3445 :: 		Color30.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color30+36)
MOVT	R0, #hi_addr(_Color30+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3446 :: 		Color30.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color30+40)
MOVT	R0, #hi_addr(_Color30+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3447 :: 		Color30.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Color30+44)
MOVT	R0, #hi_addr(_Color30+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3448 :: 		Color30.OnPressPtr      = Color30OnPress;
MOVW	R1, #lo_addr(_Color30OnPress+0)
MOVT	R1, #hi_addr(_Color30OnPress+0)
MOVW	R0, #lo_addr(_Color30+48)
MOVT	R0, #hi_addr(_Color30+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3450 :: 		BackGroundColor.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_BackGroundColor+0)
MOVT	R0, #hi_addr(_BackGroundColor+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3451 :: 		BackGroundColor.Order           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_BackGroundColor+4)
MOVT	R0, #hi_addr(_BackGroundColor+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3452 :: 		BackGroundColor.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackGroundColor+6)
MOVT	R0, #hi_addr(_BackGroundColor+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3453 :: 		BackGroundColor.Top             = 166;
MOVS	R1, #166
MOVW	R0, #lo_addr(_BackGroundColor+8)
MOVT	R0, #hi_addr(_BackGroundColor+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3454 :: 		BackGroundColor.Width           = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_BackGroundColor+10)
MOVT	R0, #hi_addr(_BackGroundColor+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3455 :: 		BackGroundColor.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_BackGroundColor+12)
MOVT	R0, #hi_addr(_BackGroundColor+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3456 :: 		BackGroundColor.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackGroundColor+22)
MOVT	R0, #hi_addr(_BackGroundColor+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3457 :: 		BackGroundColor.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BackGroundColor+23)
MOVT	R0, #hi_addr(_BackGroundColor+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3458 :: 		BackGroundColor.Picture_Name    = icon_fill_back_bmp;
MOVW	R1, #lo_addr(_icon_fill_back_bmp+0)
MOVT	R1, #hi_addr(_icon_fill_back_bmp+0)
MOVW	R0, #lo_addr(_BackGroundColor+16)
MOVT	R0, #hi_addr(_BackGroundColor+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3459 :: 		BackGroundColor.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BackGroundColor+20)
MOVT	R0, #hi_addr(_BackGroundColor+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3460 :: 		BackGroundColor.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BackGroundColor+21)
MOVT	R0, #hi_addr(_BackGroundColor+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3461 :: 		BackGroundColor.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackGroundColor+24)
MOVT	R0, #hi_addr(_BackGroundColor+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3462 :: 		BackGroundColor.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackGroundColor+28)
MOVT	R0, #hi_addr(_BackGroundColor+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3463 :: 		BackGroundColor.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BackGroundColor+32)
MOVT	R0, #hi_addr(_BackGroundColor+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3464 :: 		BackGroundColor.OnPressPtr      = BackGroundColorOnPress;
MOVW	R1, #lo_addr(_BackGroundColorOnPress+0)
MOVT	R1, #hi_addr(_BackGroundColorOnPress+0)
MOVW	R0, #lo_addr(_BackGroundColor+36)
MOVT	R0, #hi_addr(_BackGroundColor+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3466 :: 		Pen1.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Pen1+0)
MOVT	R0, #hi_addr(_Pen1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3467 :: 		Pen1.Order           = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Pen1+4)
MOVT	R0, #hi_addr(_Pen1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3468 :: 		Pen1.Left            = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Pen1+6)
MOVT	R0, #hi_addr(_Pen1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3469 :: 		Pen1.Top             = 212;
MOVS	R1, #212
MOVW	R0, #lo_addr(_Pen1+8)
MOVT	R0, #hi_addr(_Pen1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3470 :: 		Pen1.Width           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Pen1+10)
MOVT	R0, #hi_addr(_Pen1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3471 :: 		Pen1.Height          = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Pen1+12)
MOVT	R0, #hi_addr(_Pen1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3472 :: 		Pen1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen1+14)
MOVT	R0, #hi_addr(_Pen1+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3473 :: 		Pen1.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Pen1+16)
MOVT	R0, #hi_addr(_Pen1+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3474 :: 		Pen1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen1+18)
MOVT	R0, #hi_addr(_Pen1+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3475 :: 		Pen1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen1+19)
MOVT	R0, #hi_addr(_Pen1+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3476 :: 		Pen1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen1+20)
MOVT	R0, #hi_addr(_Pen1+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3477 :: 		Pen1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen1+21)
MOVT	R0, #hi_addr(_Pen1+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3478 :: 		Pen1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen1+22)
MOVT	R0, #hi_addr(_Pen1+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3479 :: 		Pen1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Pen1+24)
MOVT	R0, #hi_addr(_Pen1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3480 :: 		Pen1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Pen1+26)
MOVT	R0, #hi_addr(_Pen1+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3481 :: 		Pen1.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Pen1+28)
MOVT	R0, #hi_addr(_Pen1+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3482 :: 		Pen1.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen1+30)
MOVT	R0, #hi_addr(_Pen1+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3483 :: 		Pen1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Pen1+32)
MOVT	R0, #hi_addr(_Pen1+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3484 :: 		Pen1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen1+36)
MOVT	R0, #hi_addr(_Pen1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3485 :: 		Pen1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen1+40)
MOVT	R0, #hi_addr(_Pen1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3486 :: 		Pen1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen1+44)
MOVT	R0, #hi_addr(_Pen1+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3487 :: 		Pen1.OnPressPtr      = Pen1OnPress;
MOVW	R1, #lo_addr(_Pen1OnPress+0)
MOVT	R1, #hi_addr(_Pen1OnPress+0)
MOVW	R0, #lo_addr(_Pen1+48)
MOVT	R0, #hi_addr(_Pen1+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3489 :: 		Pen2.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Pen2+0)
MOVT	R0, #hi_addr(_Pen2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3490 :: 		Pen2.Order           = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Pen2+4)
MOVT	R0, #hi_addr(_Pen2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3491 :: 		Pen2.Left            = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Pen2+6)
MOVT	R0, #hi_addr(_Pen2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3492 :: 		Pen2.Top             = 229;
MOVS	R1, #229
MOVW	R0, #lo_addr(_Pen2+8)
MOVT	R0, #hi_addr(_Pen2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3493 :: 		Pen2.Width           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Pen2+10)
MOVT	R0, #hi_addr(_Pen2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3494 :: 		Pen2.Height          = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Pen2+12)
MOVT	R0, #hi_addr(_Pen2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3495 :: 		Pen2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen2+14)
MOVT	R0, #hi_addr(_Pen2+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3496 :: 		Pen2.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Pen2+16)
MOVT	R0, #hi_addr(_Pen2+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3497 :: 		Pen2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen2+18)
MOVT	R0, #hi_addr(_Pen2+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3498 :: 		Pen2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen2+19)
MOVT	R0, #hi_addr(_Pen2+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3499 :: 		Pen2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen2+20)
MOVT	R0, #hi_addr(_Pen2+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3500 :: 		Pen2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen2+21)
MOVT	R0, #hi_addr(_Pen2+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3501 :: 		Pen2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen2+22)
MOVT	R0, #hi_addr(_Pen2+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3502 :: 		Pen2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Pen2+24)
MOVT	R0, #hi_addr(_Pen2+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3503 :: 		Pen2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Pen2+26)
MOVT	R0, #hi_addr(_Pen2+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3504 :: 		Pen2.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Pen2+28)
MOVT	R0, #hi_addr(_Pen2+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3505 :: 		Pen2.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen2+30)
MOVT	R0, #hi_addr(_Pen2+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3506 :: 		Pen2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Pen2+32)
MOVT	R0, #hi_addr(_Pen2+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3507 :: 		Pen2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen2+36)
MOVT	R0, #hi_addr(_Pen2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3508 :: 		Pen2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen2+40)
MOVT	R0, #hi_addr(_Pen2+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3509 :: 		Pen2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen2+44)
MOVT	R0, #hi_addr(_Pen2+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3510 :: 		Pen2.OnPressPtr      = Pen2OnPress;
MOVW	R1, #lo_addr(_Pen2OnPress+0)
MOVT	R1, #hi_addr(_Pen2OnPress+0)
MOVW	R0, #lo_addr(_Pen2+48)
MOVT	R0, #hi_addr(_Pen2+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3512 :: 		Pen3.OwnerScreen     = &Paint;
MOVW	R1, #lo_addr(_Paint+0)
MOVT	R1, #hi_addr(_Paint+0)
MOVW	R0, #lo_addr(_Pen3+0)
MOVT	R0, #hi_addr(_Pen3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3513 :: 		Pen3.Order           = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Pen3+4)
MOVT	R0, #hi_addr(_Pen3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3514 :: 		Pen3.Left            = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Pen3+6)
MOVT	R0, #hi_addr(_Pen3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3515 :: 		Pen3.Top             = 248;
MOVS	R1, #248
MOVW	R0, #lo_addr(_Pen3+8)
MOVT	R0, #hi_addr(_Pen3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3516 :: 		Pen3.Width           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_Pen3+10)
MOVT	R0, #hi_addr(_Pen3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3517 :: 		Pen3.Height          = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Pen3+12)
MOVT	R0, #hi_addr(_Pen3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3518 :: 		Pen3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen3+14)
MOVT	R0, #hi_addr(_Pen3+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3519 :: 		Pen3.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Pen3+16)
MOVT	R0, #hi_addr(_Pen3+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3520 :: 		Pen3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen3+18)
MOVT	R0, #hi_addr(_Pen3+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3521 :: 		Pen3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen3+19)
MOVT	R0, #hi_addr(_Pen3+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3522 :: 		Pen3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Pen3+20)
MOVT	R0, #hi_addr(_Pen3+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3523 :: 		Pen3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen3+21)
MOVT	R0, #hi_addr(_Pen3+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3524 :: 		Pen3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen3+22)
MOVT	R0, #hi_addr(_Pen3+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3525 :: 		Pen3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Pen3+24)
MOVT	R0, #hi_addr(_Pen3+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3526 :: 		Pen3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Pen3+26)
MOVT	R0, #hi_addr(_Pen3+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3527 :: 		Pen3.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Pen3+28)
MOVT	R0, #hi_addr(_Pen3+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3528 :: 		Pen3.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen3+30)
MOVT	R0, #hi_addr(_Pen3+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3529 :: 		Pen3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Pen3+32)
MOVT	R0, #hi_addr(_Pen3+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3530 :: 		Pen3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen3+36)
MOVT	R0, #hi_addr(_Pen3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3531 :: 		Pen3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen3+40)
MOVT	R0, #hi_addr(_Pen3+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3532 :: 		Pen3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Pen3+44)
MOVT	R0, #hi_addr(_Pen3+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3533 :: 		Pen3.OnPressPtr      = Pen3OnPress;
MOVW	R1, #lo_addr(_Pen3OnPress+0)
MOVT	R1, #hi_addr(_Pen3OnPress+0)
MOVW	R0, #lo_addr(_Pen3+48)
MOVT	R0, #hi_addr(_Pen3+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3535 :: 		Box7.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Box7+0)
MOVT	R0, #hi_addr(_Box7+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3536 :: 		Box7.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+4)
MOVT	R0, #hi_addr(_Box7+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3537 :: 		Box7.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+6)
MOVT	R0, #hi_addr(_Box7+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3538 :: 		Box7.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+8)
MOVT	R0, #hi_addr(_Box7+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3539 :: 		Box7.Width           = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_Box7+10)
MOVT	R0, #hi_addr(_Box7+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3540 :: 		Box7.Height          = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Box7+12)
MOVT	R0, #hi_addr(_Box7+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3541 :: 		Box7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+14)
MOVT	R0, #hi_addr(_Box7+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3542 :: 		Box7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+16)
MOVT	R0, #hi_addr(_Box7+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3543 :: 		Box7.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+18)
MOVT	R0, #hi_addr(_Box7+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3544 :: 		Box7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+19)
MOVT	R0, #hi_addr(_Box7+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3545 :: 		Box7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box7+20)
MOVT	R0, #hi_addr(_Box7+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3546 :: 		Box7.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+21)
MOVT	R0, #hi_addr(_Box7+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3547 :: 		Box7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+22)
MOVT	R0, #hi_addr(_Box7+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3548 :: 		Box7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box7+24)
MOVT	R0, #hi_addr(_Box7+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3549 :: 		Box7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box7+26)
MOVT	R0, #hi_addr(_Box7+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3550 :: 		Box7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box7+28)
MOVT	R0, #hi_addr(_Box7+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3551 :: 		Box7.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+30)
MOVT	R0, #hi_addr(_Box7+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3552 :: 		Box7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box7+32)
MOVT	R0, #hi_addr(_Box7+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3553 :: 		Box7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+36)
MOVT	R0, #hi_addr(_Box7+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3554 :: 		Box7.OnDownPtr       = Box7OnDown;
MOVW	R1, #lo_addr(_Box7OnDown+0)
MOVT	R1, #hi_addr(_Box7OnDown+0)
MOVW	R0, #lo_addr(_Box7+40)
MOVT	R0, #hi_addr(_Box7+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3555 :: 		Box7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+44)
MOVT	R0, #hi_addr(_Box7+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3556 :: 		Box7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box7+48)
MOVT	R0, #hi_addr(_Box7+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3558 :: 		icon_previous_box.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_icon_previous_box+0)
MOVT	R0, #hi_addr(_icon_previous_box+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3559 :: 		icon_previous_box.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous_box+4)
MOVT	R0, #hi_addr(_icon_previous_box+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3560 :: 		icon_previous_box.Left            = 244;
MOVS	R1, #244
MOVW	R0, #lo_addr(_icon_previous_box+6)
MOVT	R0, #hi_addr(_icon_previous_box+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3561 :: 		icon_previous_box.Top             = 244;
MOVS	R1, #244
MOVW	R0, #lo_addr(_icon_previous_box+8)
MOVT	R0, #hi_addr(_icon_previous_box+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3562 :: 		icon_previous_box.Width           = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_icon_previous_box+10)
MOVT	R0, #hi_addr(_icon_previous_box+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3563 :: 		icon_previous_box.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_icon_previous_box+12)
MOVT	R0, #hi_addr(_icon_previous_box+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3564 :: 		icon_previous_box.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous_box+14)
MOVT	R0, #hi_addr(_icon_previous_box+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3565 :: 		icon_previous_box.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+16)
MOVT	R0, #hi_addr(_icon_previous_box+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3566 :: 		icon_previous_box.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+18)
MOVT	R0, #hi_addr(_icon_previous_box+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3567 :: 		icon_previous_box.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous_box+19)
MOVT	R0, #hi_addr(_icon_previous_box+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3568 :: 		icon_previous_box.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous_box+20)
MOVT	R0, #hi_addr(_icon_previous_box+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3569 :: 		icon_previous_box.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+21)
MOVT	R0, #hi_addr(_icon_previous_box+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3570 :: 		icon_previous_box.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+22)
MOVT	R0, #hi_addr(_icon_previous_box+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3571 :: 		icon_previous_box.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_icon_previous_box+24)
MOVT	R0, #hi_addr(_icon_previous_box+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3572 :: 		icon_previous_box.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_icon_previous_box+26)
MOVT	R0, #hi_addr(_icon_previous_box+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3573 :: 		icon_previous_box.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_icon_previous_box+28)
MOVT	R0, #hi_addr(_icon_previous_box+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3574 :: 		icon_previous_box.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+30)
MOVT	R0, #hi_addr(_icon_previous_box+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3575 :: 		icon_previous_box.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_icon_previous_box+32)
MOVT	R0, #hi_addr(_icon_previous_box+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3576 :: 		icon_previous_box.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+36)
MOVT	R0, #hi_addr(_icon_previous_box+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3577 :: 		icon_previous_box.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+40)
MOVT	R0, #hi_addr(_icon_previous_box+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3578 :: 		icon_previous_box.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous_box+44)
MOVT	R0, #hi_addr(_icon_previous_box+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3579 :: 		icon_previous_box.OnPressPtr      = icon_previous_boxOnPress;
MOVW	R1, #lo_addr(_icon_previous_boxOnPress+0)
MOVT	R1, #hi_addr(_icon_previous_boxOnPress+0)
MOVW	R0, #lo_addr(_icon_previous_box+48)
MOVT	R0, #hi_addr(_icon_previous_box+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3581 :: 		Icon_next_box.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Icon_next_box+0)
MOVT	R0, #hi_addr(_Icon_next_box+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3582 :: 		Icon_next_box.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Icon_next_box+4)
MOVT	R0, #hi_addr(_Icon_next_box+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3583 :: 		Icon_next_box.Left            = 206;
MOVS	R1, #206
MOVW	R0, #lo_addr(_Icon_next_box+6)
MOVT	R0, #hi_addr(_Icon_next_box+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3584 :: 		Icon_next_box.Top             = 244;
MOVS	R1, #244
MOVW	R0, #lo_addr(_Icon_next_box+8)
MOVT	R0, #hi_addr(_Icon_next_box+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3585 :: 		Icon_next_box.Width           = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Icon_next_box+10)
MOVT	R0, #hi_addr(_Icon_next_box+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3586 :: 		Icon_next_box.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Icon_next_box+12)
MOVT	R0, #hi_addr(_Icon_next_box+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3587 :: 		Icon_next_box.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_next_box+14)
MOVT	R0, #hi_addr(_Icon_next_box+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3588 :: 		Icon_next_box.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+16)
MOVT	R0, #hi_addr(_Icon_next_box+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3589 :: 		Icon_next_box.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+18)
MOVT	R0, #hi_addr(_Icon_next_box+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3590 :: 		Icon_next_box.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_next_box+19)
MOVT	R0, #hi_addr(_Icon_next_box+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3591 :: 		Icon_next_box.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_next_box+20)
MOVT	R0, #hi_addr(_Icon_next_box+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3592 :: 		Icon_next_box.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+21)
MOVT	R0, #hi_addr(_Icon_next_box+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3593 :: 		Icon_next_box.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+22)
MOVT	R0, #hi_addr(_Icon_next_box+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3594 :: 		Icon_next_box.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Icon_next_box+24)
MOVT	R0, #hi_addr(_Icon_next_box+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3595 :: 		Icon_next_box.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Icon_next_box+26)
MOVT	R0, #hi_addr(_Icon_next_box+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3596 :: 		Icon_next_box.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Icon_next_box+28)
MOVT	R0, #hi_addr(_Icon_next_box+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3597 :: 		Icon_next_box.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+30)
MOVT	R0, #hi_addr(_Icon_next_box+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3598 :: 		Icon_next_box.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Icon_next_box+32)
MOVT	R0, #hi_addr(_Icon_next_box+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3599 :: 		Icon_next_box.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+36)
MOVT	R0, #hi_addr(_Icon_next_box+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3600 :: 		Icon_next_box.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+40)
MOVT	R0, #hi_addr(_Icon_next_box+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3601 :: 		Icon_next_box.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next_box+44)
MOVT	R0, #hi_addr(_Icon_next_box+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3602 :: 		Icon_next_box.OnPressPtr      = Icon_next_boxOnPress;
MOVW	R1, #lo_addr(_Icon_next_boxOnPress+0)
MOVT	R1, #hi_addr(_Icon_next_boxOnPress+0)
MOVW	R0, #lo_addr(_Icon_next_box+48)
MOVT	R0, #hi_addr(_Icon_next_box+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3604 :: 		Label31.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Label31+0)
MOVT	R0, #hi_addr(_Label31+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3605 :: 		Label31.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Label31+4)
MOVT	R0, #hi_addr(_Label31+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3606 :: 		Label31.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label31+6)
MOVT	R0, #hi_addr(_Label31+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3607 :: 		Label31.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label31+8)
MOVT	R0, #hi_addr(_Label31+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3608 :: 		Label31.Width           = 105;
MOVS	R1, #105
MOVW	R0, #lo_addr(_Label31+10)
MOVT	R0, #hi_addr(_Label31+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3609 :: 		Label31.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label31+12)
MOVT	R0, #hi_addr(_Label31+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3610 :: 		Label31.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label31+26)
MOVT	R0, #hi_addr(_Label31+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3611 :: 		Label31.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+27)
MOVT	R0, #hi_addr(_Label31+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3612 :: 		Label31.Caption         = Label31_Caption;
MOVW	R1, #lo_addr(_Label31_Caption+0)
MOVT	R1, #hi_addr(_Label31_Caption+0)
MOVW	R0, #lo_addr(_Label31+16)
MOVT	R0, #hi_addr(_Label31+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3613 :: 		Label31.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Label31+20)
MOVT	R0, #hi_addr(_Label31+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,3614 :: 		Label31.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label31+24)
MOVT	R0, #hi_addr(_Label31+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3615 :: 		Label31.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+28)
MOVT	R0, #hi_addr(_Label31+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3616 :: 		Label31.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+32)
MOVT	R0, #hi_addr(_Label31+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3617 :: 		Label31.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+36)
MOVT	R0, #hi_addr(_Label31+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3618 :: 		Label31.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label31+40)
MOVT	R0, #hi_addr(_Label31+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3620 :: 		back_slide_show.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_back_slide_show+0)
MOVT	R0, #hi_addr(_back_slide_show+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3621 :: 		back_slide_show.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_back_slide_show+4)
MOVT	R0, #hi_addr(_back_slide_show+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3622 :: 		back_slide_show.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_back_slide_show+6)
MOVT	R0, #hi_addr(_back_slide_show+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3623 :: 		back_slide_show.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_back_slide_show+8)
MOVT	R0, #hi_addr(_back_slide_show+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3624 :: 		back_slide_show.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_back_slide_show+10)
MOVT	R0, #hi_addr(_back_slide_show+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3625 :: 		back_slide_show.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_back_slide_show+12)
MOVT	R0, #hi_addr(_back_slide_show+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3626 :: 		back_slide_show.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+22)
MOVT	R0, #hi_addr(_back_slide_show+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3627 :: 		back_slide_show.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_back_slide_show+23)
MOVT	R0, #hi_addr(_back_slide_show+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3628 :: 		back_slide_show.Picture_Name    = icon_back_slideshow_bmp;
MOVW	R1, #lo_addr(_icon_back_slideshow_bmp+0)
MOVT	R1, #hi_addr(_icon_back_slideshow_bmp+0)
MOVW	R0, #lo_addr(_back_slide_show+16)
MOVT	R0, #hi_addr(_back_slide_show+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3629 :: 		back_slide_show.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_back_slide_show+20)
MOVT	R0, #hi_addr(_back_slide_show+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3630 :: 		back_slide_show.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+21)
MOVT	R0, #hi_addr(_back_slide_show+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3631 :: 		back_slide_show.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+24)
MOVT	R0, #hi_addr(_back_slide_show+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3632 :: 		back_slide_show.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+28)
MOVT	R0, #hi_addr(_back_slide_show+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3633 :: 		back_slide_show.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+32)
MOVT	R0, #hi_addr(_back_slide_show+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3634 :: 		back_slide_show.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_back_slide_show+36)
MOVT	R0, #hi_addr(_back_slide_show+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3636 :: 		Label32.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Label32+0)
MOVT	R0, #hi_addr(_Label32+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3637 :: 		Label32.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label32+4)
MOVT	R0, #hi_addr(_Label32+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3638 :: 		Label32.Left            = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label32+6)
MOVT	R0, #hi_addr(_Label32+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3639 :: 		Label32.Top             = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Label32+8)
MOVT	R0, #hi_addr(_Label32+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3640 :: 		Label32.Width           = 106;
MOVS	R1, #106
MOVW	R0, #lo_addr(_Label32+10)
MOVT	R0, #hi_addr(_Label32+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3641 :: 		Label32.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label32+12)
MOVT	R0, #hi_addr(_Label32+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3642 :: 		Label32.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label32+26)
MOVT	R0, #hi_addr(_Label32+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3643 :: 		Label32.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label32+27)
MOVT	R0, #hi_addr(_Label32+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3644 :: 		Label32.Caption         = Label32_Caption;
MOVW	R1, #lo_addr(_Label32_Caption+0)
MOVT	R1, #hi_addr(_Label32_Caption+0)
MOVW	R0, #lo_addr(_Label32+16)
MOVT	R0, #hi_addr(_Label32+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3645 :: 		Label32.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label32+20)
MOVT	R0, #hi_addr(_Label32+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,3646 :: 		Label32.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label32+24)
MOVT	R0, #hi_addr(_Label32+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3647 :: 		Label32.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+28)
MOVT	R0, #hi_addr(_Label32+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3648 :: 		Label32.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+32)
MOVT	R0, #hi_addr(_Label32+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3649 :: 		Label32.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+36)
MOVT	R0, #hi_addr(_Label32+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3650 :: 		Label32.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label32+40)
MOVT	R0, #hi_addr(_Label32+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3652 :: 		Label33.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Label33+0)
MOVT	R0, #hi_addr(_Label33+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3653 :: 		Label33.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label33+4)
MOVT	R0, #hi_addr(_Label33+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3654 :: 		Label33.Left            = 432;
MOVW	R1, #432
MOVW	R0, #lo_addr(_Label33+6)
MOVT	R0, #hi_addr(_Label33+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3655 :: 		Label33.Top             = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Label33+8)
MOVT	R0, #hi_addr(_Label33+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3656 :: 		Label33.Width           = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Label33+10)
MOVT	R0, #hi_addr(_Label33+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3657 :: 		Label33.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label33+12)
MOVT	R0, #hi_addr(_Label33+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3658 :: 		Label33.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label33+26)
MOVT	R0, #hi_addr(_Label33+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3659 :: 		Label33.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label33+27)
MOVT	R0, #hi_addr(_Label33+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3660 :: 		Label33.Caption         = Label33_Caption;
MOVW	R1, #lo_addr(_Label33_Caption+0)
MOVT	R1, #hi_addr(_Label33_Caption+0)
MOVW	R0, #lo_addr(_Label33+16)
MOVT	R0, #hi_addr(_Label33+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3661 :: 		Label33.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label33+20)
MOVT	R0, #hi_addr(_Label33+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,3662 :: 		Label33.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label33+24)
MOVT	R0, #hi_addr(_Label33+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3663 :: 		Label33.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+28)
MOVT	R0, #hi_addr(_Label33+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3664 :: 		Label33.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+32)
MOVT	R0, #hi_addr(_Label33+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3665 :: 		Label33.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+36)
MOVT	R0, #hi_addr(_Label33+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3666 :: 		Label33.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label33+40)
MOVT	R0, #hi_addr(_Label33+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3668 :: 		icon_previous.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_icon_previous+0)
MOVT	R0, #hi_addr(_icon_previous+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3669 :: 		icon_previous.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_icon_previous+4)
MOVT	R0, #hi_addr(_icon_previous+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3670 :: 		icon_previous.Left            = 248;
MOVS	R1, #248
MOVW	R0, #lo_addr(_icon_previous+6)
MOVT	R0, #hi_addr(_icon_previous+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3671 :: 		icon_previous.Top             = 253;
MOVS	R1, #253
MOVW	R0, #lo_addr(_icon_previous+8)
MOVT	R0, #hi_addr(_icon_previous+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3672 :: 		icon_previous.Width           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_icon_previous+10)
MOVT	R0, #hi_addr(_icon_previous+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3673 :: 		icon_previous.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_icon_previous+12)
MOVT	R0, #hi_addr(_icon_previous+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3674 :: 		icon_previous.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+22)
MOVT	R0, #hi_addr(_icon_previous+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3675 :: 		icon_previous.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous+23)
MOVT	R0, #hi_addr(_icon_previous+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3676 :: 		icon_previous.Picture_Name    = icon_prev_slide_bmp;
MOVW	R1, #lo_addr(_icon_prev_slide_bmp+0)
MOVT	R1, #hi_addr(_icon_prev_slide_bmp+0)
MOVW	R0, #lo_addr(_icon_previous+16)
MOVT	R0, #hi_addr(_icon_previous+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3677 :: 		icon_previous.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_icon_previous+20)
MOVT	R0, #hi_addr(_icon_previous+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3678 :: 		icon_previous.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+21)
MOVT	R0, #hi_addr(_icon_previous+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3679 :: 		icon_previous.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+24)
MOVT	R0, #hi_addr(_icon_previous+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3680 :: 		icon_previous.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+28)
MOVT	R0, #hi_addr(_icon_previous+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3681 :: 		icon_previous.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+32)
MOVT	R0, #hi_addr(_icon_previous+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3682 :: 		icon_previous.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_icon_previous+36)
MOVT	R0, #hi_addr(_icon_previous+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3684 :: 		Icon_next.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Icon_next+0)
MOVT	R0, #hi_addr(_Icon_next+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3685 :: 		Icon_next.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Icon_next+4)
MOVT	R0, #hi_addr(_Icon_next+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3686 :: 		Icon_next.Left            = 216;
MOVS	R1, #216
MOVW	R0, #lo_addr(_Icon_next+6)
MOVT	R0, #hi_addr(_Icon_next+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3687 :: 		Icon_next.Top             = 253;
MOVS	R1, #253
MOVW	R0, #lo_addr(_Icon_next+8)
MOVT	R0, #hi_addr(_Icon_next+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3688 :: 		Icon_next.Width           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Icon_next+10)
MOVT	R0, #hi_addr(_Icon_next+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3689 :: 		Icon_next.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Icon_next+12)
MOVT	R0, #hi_addr(_Icon_next+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3690 :: 		Icon_next.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+22)
MOVT	R0, #hi_addr(_Icon_next+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3691 :: 		Icon_next.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_next+23)
MOVT	R0, #hi_addr(_Icon_next+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3692 :: 		Icon_next.Picture_Name    = icon_next_slide_bmp;
MOVW	R1, #lo_addr(_icon_next_slide_bmp+0)
MOVT	R1, #hi_addr(_icon_next_slide_bmp+0)
MOVW	R0, #lo_addr(_Icon_next+16)
MOVT	R0, #hi_addr(_Icon_next+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3693 :: 		Icon_next.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Icon_next+20)
MOVT	R0, #hi_addr(_Icon_next+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3694 :: 		Icon_next.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+21)
MOVT	R0, #hi_addr(_Icon_next+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3695 :: 		Icon_next.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+24)
MOVT	R0, #hi_addr(_Icon_next+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3696 :: 		Icon_next.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+28)
MOVT	R0, #hi_addr(_Icon_next+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3697 :: 		Icon_next.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+32)
MOVT	R0, #hi_addr(_Icon_next+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3698 :: 		Icon_next.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Icon_next+36)
MOVT	R0, #hi_addr(_Icon_next+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3700 :: 		Label35.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Label35+0)
MOVT	R0, #hi_addr(_Label35+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3701 :: 		Label35.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label35+4)
MOVT	R0, #hi_addr(_Label35+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3702 :: 		Label35.Left            = 410;
MOVW	R1, #410
MOVW	R0, #lo_addr(_Label35+6)
MOVT	R0, #hi_addr(_Label35+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3703 :: 		Label35.Top             = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_Label35+8)
MOVT	R0, #hi_addr(_Label35+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3704 :: 		Label35.Width           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+10)
MOVT	R0, #hi_addr(_Label35+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3705 :: 		Label35.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label35+12)
MOVT	R0, #hi_addr(_Label35+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3706 :: 		Label35.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label35+26)
MOVT	R0, #hi_addr(_Label35+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3707 :: 		Label35.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label35+27)
MOVT	R0, #hi_addr(_Label35+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3708 :: 		Label35.Caption         = Label35_Caption;
MOVW	R1, #lo_addr(_Label35_Caption+0)
MOVT	R1, #hi_addr(_Label35_Caption+0)
MOVW	R0, #lo_addr(_Label35+16)
MOVT	R0, #hi_addr(_Label35+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3709 :: 		Label35.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label35+20)
MOVT	R0, #hi_addr(_Label35+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,3710 :: 		Label35.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label35+24)
MOVT	R0, #hi_addr(_Label35+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3711 :: 		Label35.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+28)
MOVT	R0, #hi_addr(_Label35+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3712 :: 		Label35.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+32)
MOVT	R0, #hi_addr(_Label35+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3713 :: 		Label35.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+36)
MOVT	R0, #hi_addr(_Label35+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3714 :: 		Label35.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label35+40)
MOVT	R0, #hi_addr(_Label35+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3716 :: 		Slide_Active_area.OwnerScreen     = &SlideShow;
MOVW	R1, #lo_addr(_SlideShow+0)
MOVT	R1, #hi_addr(_SlideShow+0)
MOVW	R0, #lo_addr(_Slide_Active_area+0)
MOVT	R0, #hi_addr(_Slide_Active_area+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3717 :: 		Slide_Active_area.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Slide_Active_area+4)
MOVT	R0, #hi_addr(_Slide_Active_area+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3718 :: 		Slide_Active_area.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+6)
MOVT	R0, #hi_addr(_Slide_Active_area+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3719 :: 		Slide_Active_area.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Slide_Active_area+8)
MOVT	R0, #hi_addr(_Slide_Active_area+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3720 :: 		Slide_Active_area.Width           = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Slide_Active_area+10)
MOVT	R0, #hi_addr(_Slide_Active_area+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3721 :: 		Slide_Active_area.Height          = 209;
MOVS	R1, #209
MOVW	R0, #lo_addr(_Slide_Active_area+12)
MOVT	R0, #hi_addr(_Slide_Active_area+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3722 :: 		Slide_Active_area.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Slide_Active_area+14)
MOVT	R0, #hi_addr(_Slide_Active_area+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3723 :: 		Slide_Active_area.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+16)
MOVT	R0, #hi_addr(_Slide_Active_area+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3724 :: 		Slide_Active_area.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+18)
MOVT	R0, #hi_addr(_Slide_Active_area+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3725 :: 		Slide_Active_area.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Slide_Active_area+19)
MOVT	R0, #hi_addr(_Slide_Active_area+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3726 :: 		Slide_Active_area.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Slide_Active_area+20)
MOVT	R0, #hi_addr(_Slide_Active_area+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3727 :: 		Slide_Active_area.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+21)
MOVT	R0, #hi_addr(_Slide_Active_area+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3728 :: 		Slide_Active_area.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+22)
MOVT	R0, #hi_addr(_Slide_Active_area+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3729 :: 		Slide_Active_area.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Slide_Active_area+24)
MOVT	R0, #hi_addr(_Slide_Active_area+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3730 :: 		Slide_Active_area.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Slide_Active_area+26)
MOVT	R0, #hi_addr(_Slide_Active_area+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3731 :: 		Slide_Active_area.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Slide_Active_area+28)
MOVT	R0, #hi_addr(_Slide_Active_area+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3732 :: 		Slide_Active_area.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+30)
MOVT	R0, #hi_addr(_Slide_Active_area+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3733 :: 		Slide_Active_area.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Slide_Active_area+32)
MOVT	R0, #hi_addr(_Slide_Active_area+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3734 :: 		Slide_Active_area.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+36)
MOVT	R0, #hi_addr(_Slide_Active_area+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3735 :: 		Slide_Active_area.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+40)
MOVT	R0, #hi_addr(_Slide_Active_area+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3736 :: 		Slide_Active_area.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Slide_Active_area+44)
MOVT	R0, #hi_addr(_Slide_Active_area+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3737 :: 		Slide_Active_area.OnPressPtr      = Slide_Active_areaOnPress;
MOVW	R1, #lo_addr(_Slide_Active_areaOnPress+0)
MOVT	R1, #hi_addr(_Slide_Active_areaOnPress+0)
MOVW	R0, #lo_addr(_Slide_Active_area+48)
MOVT	R0, #hi_addr(_Slide_Active_area+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3739 :: 		Box10.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Box10+0)
MOVT	R0, #hi_addr(_Box10+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3740 :: 		Box10.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+4)
MOVT	R0, #hi_addr(_Box10+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3741 :: 		Box10.Left            = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_Box10+6)
MOVT	R0, #hi_addr(_Box10+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3742 :: 		Box10.Top             = 193;
MOVS	R1, #193
MOVW	R0, #lo_addr(_Box10+8)
MOVT	R0, #hi_addr(_Box10+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3743 :: 		Box10.Width           = 97;
MOVS	R1, #97
MOVW	R0, #lo_addr(_Box10+10)
MOVT	R0, #hi_addr(_Box10+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3744 :: 		Box10.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Box10+12)
MOVT	R0, #hi_addr(_Box10+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3745 :: 		Box10.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box10+14)
MOVT	R0, #hi_addr(_Box10+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3746 :: 		Box10.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+16)
MOVT	R0, #hi_addr(_Box10+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3747 :: 		Box10.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+18)
MOVT	R0, #hi_addr(_Box10+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3748 :: 		Box10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box10+19)
MOVT	R0, #hi_addr(_Box10+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3749 :: 		Box10.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box10+20)
MOVT	R0, #hi_addr(_Box10+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3750 :: 		Box10.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+21)
MOVT	R0, #hi_addr(_Box10+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3751 :: 		Box10.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+22)
MOVT	R0, #hi_addr(_Box10+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3752 :: 		Box10.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box10+24)
MOVT	R0, #hi_addr(_Box10+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3753 :: 		Box10.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box10+26)
MOVT	R0, #hi_addr(_Box10+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3754 :: 		Box10.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box10+28)
MOVT	R0, #hi_addr(_Box10+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3755 :: 		Box10.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+30)
MOVT	R0, #hi_addr(_Box10+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3756 :: 		Box10.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box10+32)
MOVT	R0, #hi_addr(_Box10+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3757 :: 		Box10.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+36)
MOVT	R0, #hi_addr(_Box10+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3758 :: 		Box10.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+40)
MOVT	R0, #hi_addr(_Box10+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3759 :: 		Box10.OnClickPtr      = Box10OnClick;
MOVW	R1, #lo_addr(_Box10OnClick+0)
MOVT	R1, #hi_addr(_Box10OnClick+0)
MOVW	R0, #lo_addr(_Box10+44)
MOVT	R0, #hi_addr(_Box10+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3760 :: 		Box10.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box10+48)
MOVT	R0, #hi_addr(_Box10+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3762 :: 		Box11.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Box11+0)
MOVT	R0, #hi_addr(_Box11+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3763 :: 		Box11.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box11+4)
MOVT	R0, #hi_addr(_Box11+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3764 :: 		Box11.Left            = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Box11+6)
MOVT	R0, #hi_addr(_Box11+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3765 :: 		Box11.Top             = 224;
MOVS	R1, #224
MOVW	R0, #lo_addr(_Box11+8)
MOVT	R0, #hi_addr(_Box11+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3766 :: 		Box11.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_Box11+10)
MOVT	R0, #hi_addr(_Box11+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3767 :: 		Box11.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box11+12)
MOVT	R0, #hi_addr(_Box11+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3768 :: 		Box11.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box11+14)
MOVT	R0, #hi_addr(_Box11+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3769 :: 		Box11.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+16)
MOVT	R0, #hi_addr(_Box11+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3770 :: 		Box11.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+18)
MOVT	R0, #hi_addr(_Box11+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3771 :: 		Box11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box11+19)
MOVT	R0, #hi_addr(_Box11+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3772 :: 		Box11.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box11+20)
MOVT	R0, #hi_addr(_Box11+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3773 :: 		Box11.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+21)
MOVT	R0, #hi_addr(_Box11+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3774 :: 		Box11.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+22)
MOVT	R0, #hi_addr(_Box11+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3775 :: 		Box11.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box11+24)
MOVT	R0, #hi_addr(_Box11+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3776 :: 		Box11.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box11+26)
MOVT	R0, #hi_addr(_Box11+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3777 :: 		Box11.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box11+28)
MOVT	R0, #hi_addr(_Box11+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3778 :: 		Box11.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+30)
MOVT	R0, #hi_addr(_Box11+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3779 :: 		Box11.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box11+32)
MOVT	R0, #hi_addr(_Box11+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3780 :: 		Box11.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+36)
MOVT	R0, #hi_addr(_Box11+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3781 :: 		Box11.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+40)
MOVT	R0, #hi_addr(_Box11+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3782 :: 		Box11.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box11+44)
MOVT	R0, #hi_addr(_Box11+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3783 :: 		Box11.OnPressPtr      = Box11OnPress;
MOVW	R1, #lo_addr(_Box11OnPress+0)
MOVT	R1, #hi_addr(_Box11OnPress+0)
MOVW	R0, #lo_addr(_Box11+48)
MOVT	R0, #hi_addr(_Box11+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3785 :: 		Box9.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Box9+0)
MOVT	R0, #hi_addr(_Box9+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3786 :: 		Box9.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Box9+4)
MOVT	R0, #hi_addr(_Box9+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3787 :: 		Box9.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+6)
MOVT	R0, #hi_addr(_Box9+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3788 :: 		Box9.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+8)
MOVT	R0, #hi_addr(_Box9+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3789 :: 		Box9.Width           = 206;
MOVS	R1, #206
MOVW	R0, #lo_addr(_Box9+10)
MOVT	R0, #hi_addr(_Box9+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3790 :: 		Box9.Height          = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Box9+12)
MOVT	R0, #hi_addr(_Box9+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3791 :: 		Box9.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+14)
MOVT	R0, #hi_addr(_Box9+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3792 :: 		Box9.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+16)
MOVT	R0, #hi_addr(_Box9+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3793 :: 		Box9.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+18)
MOVT	R0, #hi_addr(_Box9+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3794 :: 		Box9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+19)
MOVT	R0, #hi_addr(_Box9+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3795 :: 		Box9.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box9+20)
MOVT	R0, #hi_addr(_Box9+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3796 :: 		Box9.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+21)
MOVT	R0, #hi_addr(_Box9+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3797 :: 		Box9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+22)
MOVT	R0, #hi_addr(_Box9+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3798 :: 		Box9.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box9+24)
MOVT	R0, #hi_addr(_Box9+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3799 :: 		Box9.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box9+26)
MOVT	R0, #hi_addr(_Box9+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3800 :: 		Box9.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box9+28)
MOVT	R0, #hi_addr(_Box9+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3801 :: 		Box9.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+30)
MOVT	R0, #hi_addr(_Box9+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3802 :: 		Box9.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box9+32)
MOVT	R0, #hi_addr(_Box9+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3803 :: 		Box9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+36)
MOVT	R0, #hi_addr(_Box9+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3804 :: 		Box9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+40)
MOVT	R0, #hi_addr(_Box9+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3805 :: 		Box9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box9+44)
MOVT	R0, #hi_addr(_Box9+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3806 :: 		Box9.OnPressPtr      = Box9OnPress;
MOVW	R1, #lo_addr(_Box9OnPress+0)
MOVT	R1, #hi_addr(_Box9OnPress+0)
MOVW	R0, #lo_addr(_Box9+48)
MOVT	R0, #hi_addr(_Box9+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3808 :: 		Button9.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Button9+0)
MOVT	R0, #hi_addr(_Button9+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3809 :: 		Button9.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Button9+4)
MOVT	R0, #hi_addr(_Button9+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3810 :: 		Button9.Left            = 384;
MOVW	R1, #384
MOVW	R0, #lo_addr(_Button9+6)
MOVT	R0, #hi_addr(_Button9+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3811 :: 		Button9.Top             = 176;
MOVS	R1, #176
MOVW	R0, #lo_addr(_Button9+8)
MOVT	R0, #hi_addr(_Button9+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3812 :: 		Button9.Width           = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Button9+10)
MOVT	R0, #hi_addr(_Button9+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3813 :: 		Button9.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_Button9+12)
MOVT	R0, #hi_addr(_Button9+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3814 :: 		Button9.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+14)
MOVT	R0, #hi_addr(_Button9+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3815 :: 		Button9.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+16)
MOVT	R0, #hi_addr(_Button9+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3816 :: 		Button9.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+18)
MOVT	R0, #hi_addr(_Button9+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3817 :: 		Button9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+19)
MOVT	R0, #hi_addr(_Button9+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3818 :: 		Button9.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+20)
MOVT	R0, #hi_addr(_Button9+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3819 :: 		Button9.Caption         = Button9_Caption;
MOVW	R1, #lo_addr(_Button9_Caption+0)
MOVT	R1, #hi_addr(_Button9_Caption+0)
MOVW	R0, #lo_addr(_Button9+24)
MOVT	R0, #hi_addr(_Button9+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3820 :: 		Button9.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button9+28)
MOVT	R0, #hi_addr(_Button9+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3821 :: 		Button9.FontName        = Furro_Script52x60_Regular;
MOVW	R2, #lo_addr(_Furro_Script52x60_Regular+0)
MOVT	R2, #hi_addr(_Furro_Script52x60_Regular+0)
MOVW	R0, #lo_addr(_Button9+32)
MOVT	R0, #hi_addr(_Button9+32)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,3822 :: 		Button9.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+46)
MOVT	R0, #hi_addr(_Button9+46)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3823 :: 		Button9.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+36)
MOVT	R0, #hi_addr(_Button9+36)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3824 :: 		Button9.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+38)
MOVT	R0, #hi_addr(_Button9+38)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3825 :: 		Button9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+39)
MOVT	R0, #hi_addr(_Button9+39)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3826 :: 		Button9.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button9+40)
MOVT	R0, #hi_addr(_Button9+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3827 :: 		Button9.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button9+42)
MOVT	R0, #hi_addr(_Button9+42)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3828 :: 		Button9.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button9+44)
MOVT	R0, #hi_addr(_Button9+44)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3829 :: 		Button9.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button9+48)
MOVT	R0, #hi_addr(_Button9+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3830 :: 		Button9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+52)
MOVT	R0, #hi_addr(_Button9+52)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3831 :: 		Button9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+56)
MOVT	R0, #hi_addr(_Button9+56)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3832 :: 		Button9.OnClickPtr      = Button9OnClick;
MOVW	R1, #lo_addr(_Button9OnClick+0)
MOVT	R1, #hi_addr(_Button9OnClick+0)
MOVW	R0, #lo_addr(_Button9+60)
MOVT	R0, #hi_addr(_Button9+60)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3833 :: 		Button9.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button9+64)
MOVT	R0, #hi_addr(_Button9+64)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3835 :: 		Button8.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Button8+0)
MOVT	R0, #hi_addr(_Button8+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3836 :: 		Button8.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Button8+4)
MOVT	R0, #hi_addr(_Button8+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3837 :: 		Button8.Left            = 310;
MOVW	R1, #310
MOVW	R0, #lo_addr(_Button8+6)
MOVT	R0, #hi_addr(_Button8+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3838 :: 		Button8.Top             = 178;
MOVS	R1, #178
MOVW	R0, #lo_addr(_Button8+8)
MOVT	R0, #hi_addr(_Button8+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3839 :: 		Button8.Width           = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Button8+10)
MOVT	R0, #hi_addr(_Button8+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3840 :: 		Button8.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_Button8+12)
MOVT	R0, #hi_addr(_Button8+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3841 :: 		Button8.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+14)
MOVT	R0, #hi_addr(_Button8+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3842 :: 		Button8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+16)
MOVT	R0, #hi_addr(_Button8+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3843 :: 		Button8.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+18)
MOVT	R0, #hi_addr(_Button8+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3844 :: 		Button8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+19)
MOVT	R0, #hi_addr(_Button8+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3845 :: 		Button8.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+20)
MOVT	R0, #hi_addr(_Button8+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3846 :: 		Button8.Caption         = Button8_Caption;
MOVW	R1, #lo_addr(_Button8_Caption+0)
MOVT	R1, #hi_addr(_Button8_Caption+0)
MOVW	R0, #lo_addr(_Button8+24)
MOVT	R0, #hi_addr(_Button8+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3847 :: 		Button8.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button8+28)
MOVT	R0, #hi_addr(_Button8+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3848 :: 		Button8.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_Button8+32)
MOVT	R0, #hi_addr(_Button8+32)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,3849 :: 		Button8.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+46)
MOVT	R0, #hi_addr(_Button8+46)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3850 :: 		Button8.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+36)
MOVT	R0, #hi_addr(_Button8+36)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3851 :: 		Button8.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+38)
MOVT	R0, #hi_addr(_Button8+38)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3852 :: 		Button8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+39)
MOVT	R0, #hi_addr(_Button8+39)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3853 :: 		Button8.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button8+40)
MOVT	R0, #hi_addr(_Button8+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3854 :: 		Button8.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button8+42)
MOVT	R0, #hi_addr(_Button8+42)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3855 :: 		Button8.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button8+44)
MOVT	R0, #hi_addr(_Button8+44)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3856 :: 		Button8.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button8+48)
MOVT	R0, #hi_addr(_Button8+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3857 :: 		Button8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+52)
MOVT	R0, #hi_addr(_Button8+52)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3858 :: 		Button8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+56)
MOVT	R0, #hi_addr(_Button8+56)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3859 :: 		Button8.OnClickPtr      = Button8OnClick;
MOVW	R1, #lo_addr(_Button8OnClick+0)
MOVT	R1, #hi_addr(_Button8OnClick+0)
MOVW	R0, #lo_addr(_Button8+60)
MOVT	R0, #hi_addr(_Button8+60)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3860 :: 		Button8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button8+64)
MOVT	R0, #hi_addr(_Button8+64)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3862 :: 		Button7.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Button7+0)
MOVT	R0, #hi_addr(_Button7+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3863 :: 		Button7.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Button7+4)
MOVT	R0, #hi_addr(_Button7+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3864 :: 		Button7.Left            = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Button7+6)
MOVT	R0, #hi_addr(_Button7+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3865 :: 		Button7.Top             = 183;
MOVS	R1, #183
MOVW	R0, #lo_addr(_Button7+8)
MOVT	R0, #hi_addr(_Button7+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3866 :: 		Button7.Width           = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Button7+10)
MOVT	R0, #hi_addr(_Button7+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3867 :: 		Button7.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_Button7+12)
MOVT	R0, #hi_addr(_Button7+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3868 :: 		Button7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+14)
MOVT	R0, #hi_addr(_Button7+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3869 :: 		Button7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+16)
MOVT	R0, #hi_addr(_Button7+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3870 :: 		Button7.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+18)
MOVT	R0, #hi_addr(_Button7+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3871 :: 		Button7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+19)
MOVT	R0, #hi_addr(_Button7+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3872 :: 		Button7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+20)
MOVT	R0, #hi_addr(_Button7+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3873 :: 		Button7.Caption         = Button7_Caption;
MOVW	R1, #lo_addr(_Button7_Caption+0)
MOVT	R1, #hi_addr(_Button7_Caption+0)
MOVW	R0, #lo_addr(_Button7+24)
MOVT	R0, #hi_addr(_Button7+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3874 :: 		Button7.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+28)
MOVT	R0, #hi_addr(_Button7+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3875 :: 		Button7.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_Button7+32)
MOVT	R0, #hi_addr(_Button7+32)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,3876 :: 		Button7.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+46)
MOVT	R0, #hi_addr(_Button7+46)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3877 :: 		Button7.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+36)
MOVT	R0, #hi_addr(_Button7+36)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3878 :: 		Button7.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+38)
MOVT	R0, #hi_addr(_Button7+38)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3879 :: 		Button7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+39)
MOVT	R0, #hi_addr(_Button7+39)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3880 :: 		Button7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button7+40)
MOVT	R0, #hi_addr(_Button7+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3881 :: 		Button7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button7+42)
MOVT	R0, #hi_addr(_Button7+42)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3882 :: 		Button7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button7+44)
MOVT	R0, #hi_addr(_Button7+44)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3883 :: 		Button7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button7+48)
MOVT	R0, #hi_addr(_Button7+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3884 :: 		Button7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+52)
MOVT	R0, #hi_addr(_Button7+52)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3885 :: 		Button7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+56)
MOVT	R0, #hi_addr(_Button7+56)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3886 :: 		Button7.OnClickPtr      = Button7OnClick;
MOVW	R1, #lo_addr(_Button7OnClick+0)
MOVT	R1, #hi_addr(_Button7OnClick+0)
MOVW	R0, #lo_addr(_Button7+60)
MOVT	R0, #hi_addr(_Button7+60)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3887 :: 		Button7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+64)
MOVT	R0, #hi_addr(_Button7+64)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3889 :: 		Button6.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Button6+0)
MOVT	R0, #hi_addr(_Button6+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3890 :: 		Button6.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Button6+4)
MOVT	R0, #hi_addr(_Button6+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3891 :: 		Button6.Left            = 382;
MOVW	R1, #382
MOVW	R0, #lo_addr(_Button6+6)
MOVT	R0, #hi_addr(_Button6+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3892 :: 		Button6.Top             = 101;
MOVS	R1, #101
MOVW	R0, #lo_addr(_Button6+8)
MOVT	R0, #hi_addr(_Button6+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3893 :: 		Button6.Width           = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Button6+10)
MOVT	R0, #hi_addr(_Button6+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3894 :: 		Button6.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_Button6+12)
MOVT	R0, #hi_addr(_Button6+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3895 :: 		Button6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+14)
MOVT	R0, #hi_addr(_Button6+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3896 :: 		Button6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+16)
MOVT	R0, #hi_addr(_Button6+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3897 :: 		Button6.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+18)
MOVT	R0, #hi_addr(_Button6+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3898 :: 		Button6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+19)
MOVT	R0, #hi_addr(_Button6+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3899 :: 		Button6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+20)
MOVT	R0, #hi_addr(_Button6+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3900 :: 		Button6.Caption         = Button6_Caption;
MOVW	R1, #lo_addr(_Button6_Caption+0)
MOVT	R1, #hi_addr(_Button6_Caption+0)
MOVW	R0, #lo_addr(_Button6+24)
MOVT	R0, #hi_addr(_Button6+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3901 :: 		Button6.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+28)
MOVT	R0, #hi_addr(_Button6+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3902 :: 		Button6.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_Button6+32)
MOVT	R0, #hi_addr(_Button6+32)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,3903 :: 		Button6.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+46)
MOVT	R0, #hi_addr(_Button6+46)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3904 :: 		Button6.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+36)
MOVT	R0, #hi_addr(_Button6+36)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3905 :: 		Button6.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+38)
MOVT	R0, #hi_addr(_Button6+38)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3906 :: 		Button6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+39)
MOVT	R0, #hi_addr(_Button6+39)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3907 :: 		Button6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button6+40)
MOVT	R0, #hi_addr(_Button6+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3908 :: 		Button6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button6+42)
MOVT	R0, #hi_addr(_Button6+42)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3909 :: 		Button6.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button6+44)
MOVT	R0, #hi_addr(_Button6+44)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3910 :: 		Button6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button6+48)
MOVT	R0, #hi_addr(_Button6+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3911 :: 		Button6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+52)
MOVT	R0, #hi_addr(_Button6+52)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3912 :: 		Button6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+56)
MOVT	R0, #hi_addr(_Button6+56)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3913 :: 		Button6.OnClickPtr      = Button6OnClick;
MOVW	R1, #lo_addr(_Button6OnClick+0)
MOVT	R1, #hi_addr(_Button6OnClick+0)
MOVW	R0, #lo_addr(_Button6+60)
MOVT	R0, #hi_addr(_Button6+60)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3914 :: 		Button6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+64)
MOVT	R0, #hi_addr(_Button6+64)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3916 :: 		Button5.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Button5+0)
MOVT	R0, #hi_addr(_Button5+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3917 :: 		Button5.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Button5+4)
MOVT	R0, #hi_addr(_Button5+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3918 :: 		Button5.Left            = 306;
MOVW	R1, #306
MOVW	R0, #lo_addr(_Button5+6)
MOVT	R0, #hi_addr(_Button5+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3919 :: 		Button5.Top             = 104;
MOVS	R1, #104
MOVW	R0, #lo_addr(_Button5+8)
MOVT	R0, #hi_addr(_Button5+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3920 :: 		Button5.Width           = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Button5+10)
MOVT	R0, #hi_addr(_Button5+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3921 :: 		Button5.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_Button5+12)
MOVT	R0, #hi_addr(_Button5+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3922 :: 		Button5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+14)
MOVT	R0, #hi_addr(_Button5+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3923 :: 		Button5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+16)
MOVT	R0, #hi_addr(_Button5+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3924 :: 		Button5.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+18)
MOVT	R0, #hi_addr(_Button5+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3925 :: 		Button5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+19)
MOVT	R0, #hi_addr(_Button5+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3926 :: 		Button5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+20)
MOVT	R0, #hi_addr(_Button5+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3927 :: 		Button5.Caption         = Button5_Caption;
MOVW	R1, #lo_addr(_Button5_Caption+0)
MOVT	R1, #hi_addr(_Button5_Caption+0)
MOVW	R0, #lo_addr(_Button5+24)
MOVT	R0, #hi_addr(_Button5+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3928 :: 		Button5.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+28)
MOVT	R0, #hi_addr(_Button5+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3929 :: 		Button5.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_Button5+32)
MOVT	R0, #hi_addr(_Button5+32)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,3930 :: 		Button5.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+46)
MOVT	R0, #hi_addr(_Button5+46)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3931 :: 		Button5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+36)
MOVT	R0, #hi_addr(_Button5+36)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3932 :: 		Button5.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+38)
MOVT	R0, #hi_addr(_Button5+38)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3933 :: 		Button5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+39)
MOVT	R0, #hi_addr(_Button5+39)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3934 :: 		Button5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button5+40)
MOVT	R0, #hi_addr(_Button5+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3935 :: 		Button5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button5+42)
MOVT	R0, #hi_addr(_Button5+42)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3936 :: 		Button5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button5+44)
MOVT	R0, #hi_addr(_Button5+44)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3937 :: 		Button5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button5+48)
MOVT	R0, #hi_addr(_Button5+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3938 :: 		Button5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+52)
MOVT	R0, #hi_addr(_Button5+52)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3939 :: 		Button5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+56)
MOVT	R0, #hi_addr(_Button5+56)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3940 :: 		Button5.OnClickPtr      = Button5OnClick;
MOVW	R1, #lo_addr(_Button5OnClick+0)
MOVT	R1, #hi_addr(_Button5OnClick+0)
MOVW	R0, #lo_addr(_Button5+60)
MOVT	R0, #hi_addr(_Button5+60)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3941 :: 		Button5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+64)
MOVT	R0, #hi_addr(_Button5+64)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3943 :: 		Button4.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Button4+0)
MOVT	R0, #hi_addr(_Button4+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3944 :: 		Button4.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Button4+4)
MOVT	R0, #hi_addr(_Button4+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3945 :: 		Button4.Left            = 232;
MOVS	R1, #232
MOVW	R0, #lo_addr(_Button4+6)
MOVT	R0, #hi_addr(_Button4+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3946 :: 		Button4.Top             = 110;
MOVS	R1, #110
MOVW	R0, #lo_addr(_Button4+8)
MOVT	R0, #hi_addr(_Button4+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3947 :: 		Button4.Width           = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Button4+10)
MOVT	R0, #hi_addr(_Button4+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3948 :: 		Button4.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_Button4+12)
MOVT	R0, #hi_addr(_Button4+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3949 :: 		Button4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+14)
MOVT	R0, #hi_addr(_Button4+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3950 :: 		Button4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+16)
MOVT	R0, #hi_addr(_Button4+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3951 :: 		Button4.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+18)
MOVT	R0, #hi_addr(_Button4+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3952 :: 		Button4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+19)
MOVT	R0, #hi_addr(_Button4+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3953 :: 		Button4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+20)
MOVT	R0, #hi_addr(_Button4+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3954 :: 		Button4.Caption         = Button4_Caption;
MOVW	R1, #lo_addr(_Button4_Caption+0)
MOVT	R1, #hi_addr(_Button4_Caption+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3955 :: 		Button4.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+28)
MOVT	R0, #hi_addr(_Button4+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3956 :: 		Button4.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_Button4+32)
MOVT	R0, #hi_addr(_Button4+32)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,3957 :: 		Button4.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+46)
MOVT	R0, #hi_addr(_Button4+46)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3958 :: 		Button4.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+36)
MOVT	R0, #hi_addr(_Button4+36)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3959 :: 		Button4.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+38)
MOVT	R0, #hi_addr(_Button4+38)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3960 :: 		Button4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+39)
MOVT	R0, #hi_addr(_Button4+39)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3961 :: 		Button4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button4+40)
MOVT	R0, #hi_addr(_Button4+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3962 :: 		Button4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button4+42)
MOVT	R0, #hi_addr(_Button4+42)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3963 :: 		Button4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button4+44)
MOVT	R0, #hi_addr(_Button4+44)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3964 :: 		Button4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button4+48)
MOVT	R0, #hi_addr(_Button4+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3965 :: 		Button4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+52)
MOVT	R0, #hi_addr(_Button4+52)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3966 :: 		Button4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+56)
MOVT	R0, #hi_addr(_Button4+56)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3967 :: 		Button4.OnClickPtr      = Button4OnClick;
MOVW	R1, #lo_addr(_Button4OnClick+0)
MOVT	R1, #hi_addr(_Button4OnClick+0)
MOVW	R0, #lo_addr(_Button4+60)
MOVT	R0, #hi_addr(_Button4+60)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3968 :: 		Button4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+64)
MOVT	R0, #hi_addr(_Button4+64)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3970 :: 		Button3.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Button3+0)
MOVT	R0, #hi_addr(_Button3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3971 :: 		Button3.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Button3+4)
MOVT	R0, #hi_addr(_Button3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3972 :: 		Button3.Left            = 379;
MOVW	R1, #379
MOVW	R0, #lo_addr(_Button3+6)
MOVT	R0, #hi_addr(_Button3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3973 :: 		Button3.Top             = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Button3+8)
MOVT	R0, #hi_addr(_Button3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3974 :: 		Button3.Width           = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Button3+10)
MOVT	R0, #hi_addr(_Button3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3975 :: 		Button3.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_Button3+12)
MOVT	R0, #hi_addr(_Button3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3976 :: 		Button3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+14)
MOVT	R0, #hi_addr(_Button3+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3977 :: 		Button3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+16)
MOVT	R0, #hi_addr(_Button3+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3978 :: 		Button3.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+18)
MOVT	R0, #hi_addr(_Button3+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3979 :: 		Button3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+19)
MOVT	R0, #hi_addr(_Button3+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3980 :: 		Button3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+20)
MOVT	R0, #hi_addr(_Button3+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3981 :: 		Button3.Caption         = Button3_Caption;
MOVW	R1, #lo_addr(_Button3_Caption+0)
MOVT	R1, #hi_addr(_Button3_Caption+0)
MOVW	R0, #lo_addr(_Button3+24)
MOVT	R0, #hi_addr(_Button3+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3982 :: 		Button3.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+28)
MOVT	R0, #hi_addr(_Button3+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3983 :: 		Button3.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_Button3+32)
MOVT	R0, #hi_addr(_Button3+32)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,3984 :: 		Button3.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+46)
MOVT	R0, #hi_addr(_Button3+46)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3985 :: 		Button3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+36)
MOVT	R0, #hi_addr(_Button3+36)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3986 :: 		Button3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+38)
MOVT	R0, #hi_addr(_Button3+38)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3987 :: 		Button3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+39)
MOVT	R0, #hi_addr(_Button3+39)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3988 :: 		Button3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button3+40)
MOVT	R0, #hi_addr(_Button3+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3989 :: 		Button3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button3+42)
MOVT	R0, #hi_addr(_Button3+42)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3990 :: 		Button3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button3+44)
MOVT	R0, #hi_addr(_Button3+44)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3991 :: 		Button3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button3+48)
MOVT	R0, #hi_addr(_Button3+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3992 :: 		Button3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+52)
MOVT	R0, #hi_addr(_Button3+52)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3993 :: 		Button3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+56)
MOVT	R0, #hi_addr(_Button3+56)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3994 :: 		Button3.OnClickPtr      = Button3OnClick;
MOVW	R1, #lo_addr(_Button3OnClick+0)
MOVT	R1, #hi_addr(_Button3OnClick+0)
MOVW	R0, #lo_addr(_Button3+60)
MOVT	R0, #hi_addr(_Button3+60)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3995 :: 		Button3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+64)
MOVT	R0, #hi_addr(_Button3+64)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3997 :: 		Button2.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Button2+0)
MOVT	R0, #hi_addr(_Button2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3998 :: 		Button2.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Button2+4)
MOVT	R0, #hi_addr(_Button2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,3999 :: 		Button2.Left            = 302;
MOVW	R1, #302
MOVW	R0, #lo_addr(_Button2+6)
MOVT	R0, #hi_addr(_Button2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4000 :: 		Button2.Top             = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Button2+8)
MOVT	R0, #hi_addr(_Button2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4001 :: 		Button2.Width           = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Button2+10)
MOVT	R0, #hi_addr(_Button2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4002 :: 		Button2.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_Button2+12)
MOVT	R0, #hi_addr(_Button2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4003 :: 		Button2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+14)
MOVT	R0, #hi_addr(_Button2+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4004 :: 		Button2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+16)
MOVT	R0, #hi_addr(_Button2+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4005 :: 		Button2.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+18)
MOVT	R0, #hi_addr(_Button2+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4006 :: 		Button2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+19)
MOVT	R0, #hi_addr(_Button2+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4007 :: 		Button2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+20)
MOVT	R0, #hi_addr(_Button2+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4008 :: 		Button2.Caption         = Button2_Caption;
MOVW	R1, #lo_addr(_Button2_Caption+0)
MOVT	R1, #hi_addr(_Button2_Caption+0)
MOVW	R0, #lo_addr(_Button2+24)
MOVT	R0, #hi_addr(_Button2+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4009 :: 		Button2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+28)
MOVT	R0, #hi_addr(_Button2+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4010 :: 		Button2.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_Button2+32)
MOVT	R0, #hi_addr(_Button2+32)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,4011 :: 		Button2.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+46)
MOVT	R0, #hi_addr(_Button2+46)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4012 :: 		Button2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+36)
MOVT	R0, #hi_addr(_Button2+36)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4013 :: 		Button2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+38)
MOVT	R0, #hi_addr(_Button2+38)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4014 :: 		Button2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+39)
MOVT	R0, #hi_addr(_Button2+39)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4015 :: 		Button2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button2+40)
MOVT	R0, #hi_addr(_Button2+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4016 :: 		Button2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button2+42)
MOVT	R0, #hi_addr(_Button2+42)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4017 :: 		Button2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button2+44)
MOVT	R0, #hi_addr(_Button2+44)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4018 :: 		Button2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button2+48)
MOVT	R0, #hi_addr(_Button2+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4019 :: 		Button2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+52)
MOVT	R0, #hi_addr(_Button2+52)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4020 :: 		Button2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+56)
MOVT	R0, #hi_addr(_Button2+56)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4021 :: 		Button2.OnClickPtr      = Button2OnClick;
MOVW	R1, #lo_addr(_Button2OnClick+0)
MOVT	R1, #hi_addr(_Button2OnClick+0)
MOVW	R0, #lo_addr(_Button2+60)
MOVT	R0, #hi_addr(_Button2+60)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4022 :: 		Button2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+64)
MOVT	R0, #hi_addr(_Button2+64)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4024 :: 		Button1.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Button1+0)
MOVT	R0, #hi_addr(_Button1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4025 :: 		Button1.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Button1+4)
MOVT	R0, #hi_addr(_Button1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4026 :: 		Button1.Left            = 228;
MOVS	R1, #228
MOVW	R0, #lo_addr(_Button1+6)
MOVT	R0, #hi_addr(_Button1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4027 :: 		Button1.Top             = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Button1+8)
MOVT	R0, #hi_addr(_Button1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4028 :: 		Button1.Width           = 66;
MOVS	R1, #66
MOVW	R0, #lo_addr(_Button1+10)
MOVT	R0, #hi_addr(_Button1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4029 :: 		Button1.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_Button1+12)
MOVT	R0, #hi_addr(_Button1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4030 :: 		Button1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+14)
MOVT	R0, #hi_addr(_Button1+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4031 :: 		Button1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+16)
MOVT	R0, #hi_addr(_Button1+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4032 :: 		Button1.Visible         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+18)
MOVT	R0, #hi_addr(_Button1+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4033 :: 		Button1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+19)
MOVT	R0, #hi_addr(_Button1+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4034 :: 		Button1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+20)
MOVT	R0, #hi_addr(_Button1+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4035 :: 		Button1.Caption         = Button1_Caption;
MOVW	R1, #lo_addr(_Button1_Caption+0)
MOVT	R1, #hi_addr(_Button1_Caption+0)
MOVW	R0, #lo_addr(_Button1+24)
MOVT	R0, #hi_addr(_Button1+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4036 :: 		Button1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+28)
MOVT	R0, #hi_addr(_Button1+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4037 :: 		Button1.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_Button1+32)
MOVT	R0, #hi_addr(_Button1+32)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,4038 :: 		Button1.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+46)
MOVT	R0, #hi_addr(_Button1+46)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4039 :: 		Button1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+36)
MOVT	R0, #hi_addr(_Button1+36)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4040 :: 		Button1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+38)
MOVT	R0, #hi_addr(_Button1+38)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4041 :: 		Button1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+39)
MOVT	R0, #hi_addr(_Button1+39)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4042 :: 		Button1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button1+40)
MOVT	R0, #hi_addr(_Button1+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4043 :: 		Button1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button1+42)
MOVT	R0, #hi_addr(_Button1+42)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4044 :: 		Button1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button1+44)
MOVT	R0, #hi_addr(_Button1+44)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4045 :: 		Button1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button1+48)
MOVT	R0, #hi_addr(_Button1+48)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4046 :: 		Button1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+52)
MOVT	R0, #hi_addr(_Button1+52)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4047 :: 		Button1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+56)
MOVT	R0, #hi_addr(_Button1+56)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4048 :: 		Button1.OnClickPtr      = Button1OnClick;
MOVW	R1, #lo_addr(_Button1OnClick+0)
MOVT	R1, #hi_addr(_Button1OnClick+0)
MOVW	R0, #lo_addr(_Button1+60)
MOVT	R0, #hi_addr(_Button1+60)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4049 :: 		Button1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+64)
MOVT	R0, #hi_addr(_Button1+64)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4051 :: 		Box8.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Box8+0)
MOVT	R0, #hi_addr(_Box8+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4052 :: 		Box8.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Box8+4)
MOVT	R0, #hi_addr(_Box8+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4053 :: 		Box8.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Box8+6)
MOVT	R0, #hi_addr(_Box8+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4054 :: 		Box8.Top             = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_Box8+8)
MOVT	R0, #hi_addr(_Box8+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4055 :: 		Box8.Width           = 130;
MOVS	R1, #130
MOVW	R0, #lo_addr(_Box8+10)
MOVT	R0, #hi_addr(_Box8+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4056 :: 		Box8.Height          = 102;
MOVS	R1, #102
MOVW	R0, #lo_addr(_Box8+12)
MOVT	R0, #hi_addr(_Box8+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4057 :: 		Box8.Pen_Width       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+14)
MOVT	R0, #hi_addr(_Box8+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4058 :: 		Box8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+16)
MOVT	R0, #hi_addr(_Box8+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4059 :: 		Box8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box8+18)
MOVT	R0, #hi_addr(_Box8+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4060 :: 		Box8.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+19)
MOVT	R0, #hi_addr(_Box8+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4061 :: 		Box8.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box8+20)
MOVT	R0, #hi_addr(_Box8+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4062 :: 		Box8.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+21)
MOVT	R0, #hi_addr(_Box8+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4063 :: 		Box8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+22)
MOVT	R0, #hi_addr(_Box8+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4064 :: 		Box8.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box8+24)
MOVT	R0, #hi_addr(_Box8+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4065 :: 		Box8.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box8+26)
MOVT	R0, #hi_addr(_Box8+26)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4066 :: 		Box8.Color           = 0x796C;
MOVW	R1, #31084
MOVW	R0, #lo_addr(_Box8+28)
MOVT	R0, #hi_addr(_Box8+28)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4067 :: 		Box8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box8+30)
MOVT	R0, #hi_addr(_Box8+30)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4068 :: 		Box8.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box8+32)
MOVT	R0, #hi_addr(_Box8+32)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4069 :: 		Box8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+36)
MOVT	R0, #hi_addr(_Box8+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4070 :: 		Box8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+40)
MOVT	R0, #hi_addr(_Box8+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4071 :: 		Box8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+44)
MOVT	R0, #hi_addr(_Box8+44)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4072 :: 		Box8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box8+48)
MOVT	R0, #hi_addr(_Box8+48)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4074 :: 		Label36.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Label36+0)
MOVT	R0, #hi_addr(_Label36+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4075 :: 		Label36.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label36+4)
MOVT	R0, #hi_addr(_Label36+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4076 :: 		Label36.Left            = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_Label36+6)
MOVT	R0, #hi_addr(_Label36+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4077 :: 		Label36.Top             = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label36+8)
MOVT	R0, #hi_addr(_Label36+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4078 :: 		Label36.Width           = 173;
MOVS	R1, #173
MOVW	R0, #lo_addr(_Label36+10)
MOVT	R0, #hi_addr(_Label36+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4079 :: 		Label36.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_Label36+12)
MOVT	R0, #hi_addr(_Label36+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4080 :: 		Label36.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label36+26)
MOVT	R0, #hi_addr(_Label36+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4081 :: 		Label36.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+27)
MOVT	R0, #hi_addr(_Label36+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4082 :: 		Label36.Caption         = Label36_Caption;
MOVW	R1, #lo_addr(_Label36_Caption+0)
MOVT	R1, #hi_addr(_Label36_Caption+0)
MOVW	R0, #lo_addr(_Label36+16)
MOVT	R0, #hi_addr(_Label36+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4083 :: 		Label36.FontName        = Open_Sans_Light19x28_Regular;
MOVW	R0, #lo_addr(_Label36+20)
MOVT	R0, #hi_addr(_Label36+20)
STR	R5, [R0, #0]
;mikromedia_STM32plus_driver.c,4084 :: 		Label36.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label36+24)
MOVT	R0, #hi_addr(_Label36+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4085 :: 		Label36.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+28)
MOVT	R0, #hi_addr(_Label36+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4086 :: 		Label36.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+32)
MOVT	R0, #hi_addr(_Label36+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4087 :: 		Label36.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+36)
MOVT	R0, #hi_addr(_Label36+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4088 :: 		Label36.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label36+40)
MOVT	R0, #hi_addr(_Label36+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4090 :: 		Image20.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Image20+0)
MOVT	R0, #hi_addr(_Image20+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4091 :: 		Image20.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Image20+4)
MOVT	R0, #hi_addr(_Image20+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4092 :: 		Image20.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Image20+6)
MOVT	R0, #hi_addr(_Image20+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4093 :: 		Image20.Top             = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Image20+8)
MOVT	R0, #hi_addr(_Image20+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4094 :: 		Image20.Width           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image20+10)
MOVT	R0, #hi_addr(_Image20+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4095 :: 		Image20.Height          = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_Image20+12)
MOVT	R0, #hi_addr(_Image20+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4096 :: 		Image20.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+22)
MOVT	R0, #hi_addr(_Image20+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4097 :: 		Image20.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image20+23)
MOVT	R0, #hi_addr(_Image20+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4098 :: 		Image20.Picture_Name    = icon_back_tictactow_bmp;
MOVW	R1, #lo_addr(_icon_back_tictactow_bmp+0)
MOVT	R1, #hi_addr(_icon_back_tictactow_bmp+0)
MOVW	R0, #lo_addr(_Image20+16)
MOVT	R0, #hi_addr(_Image20+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4099 :: 		Image20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image20+20)
MOVT	R0, #hi_addr(_Image20+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4100 :: 		Image20.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+21)
MOVT	R0, #hi_addr(_Image20+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4101 :: 		Image20.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+24)
MOVT	R0, #hi_addr(_Image20+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4102 :: 		Image20.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+28)
MOVT	R0, #hi_addr(_Image20+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4103 :: 		Image20.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+32)
MOVT	R0, #hi_addr(_Image20+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4104 :: 		Image20.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image20+36)
MOVT	R0, #hi_addr(_Image20+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4106 :: 		Label37.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Label37+0)
MOVT	R0, #hi_addr(_Label37+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4107 :: 		Label37.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label37+4)
MOVT	R0, #hi_addr(_Label37+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4108 :: 		Label37.Left            = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Label37+6)
MOVT	R0, #hi_addr(_Label37+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4109 :: 		Label37.Top             = 226;
MOVS	R1, #226
MOVW	R0, #lo_addr(_Label37+8)
MOVT	R0, #hi_addr(_Label37+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4110 :: 		Label37.Width           = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Label37+10)
MOVT	R0, #hi_addr(_Label37+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4111 :: 		Label37.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label37+12)
MOVT	R0, #hi_addr(_Label37+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4112 :: 		Label37.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label37+26)
MOVT	R0, #hi_addr(_Label37+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4113 :: 		Label37.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+27)
MOVT	R0, #hi_addr(_Label37+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4114 :: 		Label37.Caption         = Label37_Caption;
MOVW	R1, #lo_addr(_Label37_Caption+0)
MOVT	R1, #hi_addr(_Label37_Caption+0)
MOVW	R0, #lo_addr(_Label37+16)
MOVT	R0, #hi_addr(_Label37+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4115 :: 		Label37.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label37+20)
MOVT	R0, #hi_addr(_Label37+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,4116 :: 		Label37.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label37+24)
MOVT	R0, #hi_addr(_Label37+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4117 :: 		Label37.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+28)
MOVT	R0, #hi_addr(_Label37+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4118 :: 		Label37.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+32)
MOVT	R0, #hi_addr(_Label37+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4119 :: 		Label37.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+36)
MOVT	R0, #hi_addr(_Label37+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4120 :: 		Label37.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label37+40)
MOVT	R0, #hi_addr(_Label37+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4122 :: 		Image21.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Image21+0)
MOVT	R0, #hi_addr(_Image21+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4123 :: 		Image21.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image21+4)
MOVT	R0, #hi_addr(_Image21+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4124 :: 		Image21.Left            = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Image21+6)
MOVT	R0, #hi_addr(_Image21+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4125 :: 		Image21.Top             = 229;
MOVS	R1, #229
MOVW	R0, #lo_addr(_Image21+8)
MOVT	R0, #hi_addr(_Image21+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4126 :: 		Image21.Width           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Image21+10)
MOVT	R0, #hi_addr(_Image21+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4127 :: 		Image21.Height          = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Image21+12)
MOVT	R0, #hi_addr(_Image21+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4128 :: 		Image21.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+22)
MOVT	R0, #hi_addr(_Image21+22)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4129 :: 		Image21.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+23)
MOVT	R0, #hi_addr(_Image21+23)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4130 :: 		Image21.Picture_Name    = icon_new_game_bmp;
MOVW	R1, #lo_addr(_icon_new_game_bmp+0)
MOVT	R1, #hi_addr(_icon_new_game_bmp+0)
MOVW	R0, #lo_addr(_Image21+16)
MOVT	R0, #hi_addr(_Image21+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4131 :: 		Image21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image21+20)
MOVT	R0, #hi_addr(_Image21+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4132 :: 		Image21.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+21)
MOVT	R0, #hi_addr(_Image21+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4133 :: 		Image21.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+24)
MOVT	R0, #hi_addr(_Image21+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4134 :: 		Image21.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+28)
MOVT	R0, #hi_addr(_Image21+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4135 :: 		Image21.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+32)
MOVT	R0, #hi_addr(_Image21+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4136 :: 		Image21.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image21+36)
MOVT	R0, #hi_addr(_Image21+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4138 :: 		Label38.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Label38+0)
MOVT	R0, #hi_addr(_Label38+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4139 :: 		Label38.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Label38+4)
MOVT	R0, #hi_addr(_Label38+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4140 :: 		Label38.Left            = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Label38+6)
MOVT	R0, #hi_addr(_Label38+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4141 :: 		Label38.Top             = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_Label38+8)
MOVT	R0, #hi_addr(_Label38+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4142 :: 		Label38.Width           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label38+10)
MOVT	R0, #hi_addr(_Label38+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4143 :: 		Label38.Height          = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_Label38+12)
MOVT	R0, #hi_addr(_Label38+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4144 :: 		Label38.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label38+26)
MOVT	R0, #hi_addr(_Label38+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4145 :: 		Label38.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label38+27)
MOVT	R0, #hi_addr(_Label38+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4146 :: 		Label38.Caption         = Label38_Caption;
MOVW	R1, #lo_addr(_Label38_Caption+0)
MOVT	R1, #hi_addr(_Label38_Caption+0)
MOVW	R0, #lo_addr(_Label38+16)
MOVT	R0, #hi_addr(_Label38+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4147 :: 		Label38.FontName        = Furro_Script38x42_Regular;
MOVW	R1, #lo_addr(_Furro_Script38x42_Regular+0)
MOVT	R1, #hi_addr(_Furro_Script38x42_Regular+0)
MOVW	R0, #lo_addr(_Label38+20)
MOVT	R0, #hi_addr(_Label38+20)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4148 :: 		Label38.Font_Color      = 0x25A4;
MOVW	R1, #9636
MOVW	R0, #lo_addr(_Label38+24)
MOVT	R0, #hi_addr(_Label38+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4149 :: 		Label38.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+28)
MOVT	R0, #hi_addr(_Label38+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4150 :: 		Label38.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+32)
MOVT	R0, #hi_addr(_Label38+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4151 :: 		Label38.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+36)
MOVT	R0, #hi_addr(_Label38+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4152 :: 		Label38.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label38+40)
MOVT	R0, #hi_addr(_Label38+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4154 :: 		Label39.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Label39+0)
MOVT	R0, #hi_addr(_Label39+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4155 :: 		Label39.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Label39+4)
MOVT	R0, #hi_addr(_Label39+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4156 :: 		Label39.Left            = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Label39+6)
MOVT	R0, #hi_addr(_Label39+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4157 :: 		Label39.Top             = 141;
MOVS	R1, #141
MOVW	R0, #lo_addr(_Label39+8)
MOVT	R0, #hi_addr(_Label39+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4158 :: 		Label39.Width           = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Label39+10)
MOVT	R0, #hi_addr(_Label39+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4159 :: 		Label39.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label39+12)
MOVT	R0, #hi_addr(_Label39+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4160 :: 		Label39.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label39+26)
MOVT	R0, #hi_addr(_Label39+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4161 :: 		Label39.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label39+27)
MOVT	R0, #hi_addr(_Label39+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4162 :: 		Label39.Caption         = Label39_Caption;
MOVW	R1, #lo_addr(_Label39_Caption+0)
MOVT	R1, #hi_addr(_Label39_Caption+0)
MOVW	R0, #lo_addr(_Label39+16)
MOVT	R0, #hi_addr(_Label39+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4163 :: 		Label39.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label39+20)
MOVT	R0, #hi_addr(_Label39+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,4164 :: 		Label39.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label39+24)
MOVT	R0, #hi_addr(_Label39+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4165 :: 		Label39.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+28)
MOVT	R0, #hi_addr(_Label39+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4166 :: 		Label39.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+32)
MOVT	R0, #hi_addr(_Label39+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4167 :: 		Label39.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+36)
MOVT	R0, #hi_addr(_Label39+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4168 :: 		Label39.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label39+40)
MOVT	R0, #hi_addr(_Label39+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4170 :: 		XO1.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_XO1+0)
MOVT	R0, #hi_addr(_XO1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4171 :: 		XO1.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_XO1+4)
MOVT	R0, #hi_addr(_XO1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4172 :: 		XO1.Left            = 238;
MOVS	R1, #238
MOVW	R0, #lo_addr(_XO1+6)
MOVT	R0, #hi_addr(_XO1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4173 :: 		XO1.Top             = 44;
MOVS	R1, #44
MOVW	R0, #lo_addr(_XO1+8)
MOVT	R0, #hi_addr(_XO1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4174 :: 		XO1.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_XO1+10)
MOVT	R0, #hi_addr(_XO1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4175 :: 		XO1.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_XO1+12)
MOVT	R0, #hi_addr(_XO1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4176 :: 		XO1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO1+26)
MOVT	R0, #hi_addr(_XO1+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4177 :: 		XO1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO1+27)
MOVT	R0, #hi_addr(_XO1+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4178 :: 		XO1.Caption         = XO1_Caption;
MOVW	R1, #lo_addr(_XO1_Caption+0)
MOVT	R1, #hi_addr(_XO1_Caption+0)
MOVW	R0, #lo_addr(_XO1+16)
MOVT	R0, #hi_addr(_XO1+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4179 :: 		XO1.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_XO1+20)
MOVT	R0, #hi_addr(_XO1+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,4180 :: 		XO1.Font_Color      = 0x25A4;
MOVW	R1, #9636
MOVW	R0, #lo_addr(_XO1+24)
MOVT	R0, #hi_addr(_XO1+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4181 :: 		XO1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO1+28)
MOVT	R0, #hi_addr(_XO1+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4182 :: 		XO1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO1+32)
MOVT	R0, #hi_addr(_XO1+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4183 :: 		XO1.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO1+36)
MOVT	R0, #hi_addr(_XO1+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4184 :: 		XO1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO1+40)
MOVT	R0, #hi_addr(_XO1+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4186 :: 		XO2.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_XO2+0)
MOVT	R0, #hi_addr(_XO2+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4187 :: 		XO2.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_XO2+4)
MOVT	R0, #hi_addr(_XO2+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4188 :: 		XO2.Left            = 314;
MOVW	R1, #314
MOVW	R0, #lo_addr(_XO2+6)
MOVT	R0, #hi_addr(_XO2+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4189 :: 		XO2.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_XO2+8)
MOVT	R0, #hi_addr(_XO2+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4190 :: 		XO2.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_XO2+10)
MOVT	R0, #hi_addr(_XO2+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4191 :: 		XO2.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_XO2+12)
MOVT	R0, #hi_addr(_XO2+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4192 :: 		XO2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO2+26)
MOVT	R0, #hi_addr(_XO2+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4193 :: 		XO2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO2+27)
MOVT	R0, #hi_addr(_XO2+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4194 :: 		XO2.Caption         = XO2_Caption;
MOVW	R1, #lo_addr(_XO2_Caption+0)
MOVT	R1, #hi_addr(_XO2_Caption+0)
MOVW	R0, #lo_addr(_XO2+16)
MOVT	R0, #hi_addr(_XO2+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4195 :: 		XO2.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_XO2+20)
MOVT	R0, #hi_addr(_XO2+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,4196 :: 		XO2.Font_Color      = 0x25A4;
MOVW	R1, #9636
MOVW	R0, #lo_addr(_XO2+24)
MOVT	R0, #hi_addr(_XO2+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4197 :: 		XO2.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO2+28)
MOVT	R0, #hi_addr(_XO2+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4198 :: 		XO2.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO2+32)
MOVT	R0, #hi_addr(_XO2+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4199 :: 		XO2.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO2+36)
MOVT	R0, #hi_addr(_XO2+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4200 :: 		XO2.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO2+40)
MOVT	R0, #hi_addr(_XO2+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4202 :: 		XO3.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_XO3+0)
MOVT	R0, #hi_addr(_XO3+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4203 :: 		XO3.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_XO3+4)
MOVT	R0, #hi_addr(_XO3+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4204 :: 		XO3.Left            = 386;
MOVW	R1, #386
MOVW	R0, #lo_addr(_XO3+6)
MOVT	R0, #hi_addr(_XO3+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4205 :: 		XO3.Top             = 32;
MOVS	R1, #32
MOVW	R0, #lo_addr(_XO3+8)
MOVT	R0, #hi_addr(_XO3+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4206 :: 		XO3.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_XO3+10)
MOVT	R0, #hi_addr(_XO3+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4207 :: 		XO3.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_XO3+12)
MOVT	R0, #hi_addr(_XO3+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4208 :: 		XO3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO3+26)
MOVT	R0, #hi_addr(_XO3+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4209 :: 		XO3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO3+27)
MOVT	R0, #hi_addr(_XO3+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4210 :: 		XO3.Caption         = XO3_Caption;
MOVW	R1, #lo_addr(_XO3_Caption+0)
MOVT	R1, #hi_addr(_XO3_Caption+0)
MOVW	R0, #lo_addr(_XO3+16)
MOVT	R0, #hi_addr(_XO3+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4211 :: 		XO3.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_XO3+20)
MOVT	R0, #hi_addr(_XO3+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,4212 :: 		XO3.Font_Color      = 0x25A4;
MOVW	R1, #9636
MOVW	R0, #lo_addr(_XO3+24)
MOVT	R0, #hi_addr(_XO3+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4213 :: 		XO3.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO3+28)
MOVT	R0, #hi_addr(_XO3+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4214 :: 		XO3.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO3+32)
MOVT	R0, #hi_addr(_XO3+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4215 :: 		XO3.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO3+36)
MOVT	R0, #hi_addr(_XO3+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4216 :: 		XO3.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO3+40)
MOVT	R0, #hi_addr(_XO3+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4218 :: 		XO4.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_XO4+0)
MOVT	R0, #hi_addr(_XO4+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4219 :: 		XO4.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_XO4+4)
MOVT	R0, #hi_addr(_XO4+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4220 :: 		XO4.Left            = 241;
MOVS	R1, #241
MOVW	R0, #lo_addr(_XO4+6)
MOVT	R0, #hi_addr(_XO4+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4221 :: 		XO4.Top             = 120;
MOVS	R1, #120
MOVW	R0, #lo_addr(_XO4+8)
MOVT	R0, #hi_addr(_XO4+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4222 :: 		XO4.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_XO4+10)
MOVT	R0, #hi_addr(_XO4+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4223 :: 		XO4.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_XO4+12)
MOVT	R0, #hi_addr(_XO4+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4224 :: 		XO4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO4+26)
MOVT	R0, #hi_addr(_XO4+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4225 :: 		XO4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO4+27)
MOVT	R0, #hi_addr(_XO4+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4226 :: 		XO4.Caption         = XO4_Caption;
MOVW	R1, #lo_addr(_XO4_Caption+0)
MOVT	R1, #hi_addr(_XO4_Caption+0)
MOVW	R0, #lo_addr(_XO4+16)
MOVT	R0, #hi_addr(_XO4+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4227 :: 		XO4.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_XO4+20)
MOVT	R0, #hi_addr(_XO4+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,4228 :: 		XO4.Font_Color      = 0x25A4;
MOVW	R1, #9636
MOVW	R0, #lo_addr(_XO4+24)
MOVT	R0, #hi_addr(_XO4+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4229 :: 		XO4.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO4+28)
MOVT	R0, #hi_addr(_XO4+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4230 :: 		XO4.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO4+32)
MOVT	R0, #hi_addr(_XO4+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4231 :: 		XO4.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO4+36)
MOVT	R0, #hi_addr(_XO4+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4232 :: 		XO4.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO4+40)
MOVT	R0, #hi_addr(_XO4+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4234 :: 		XO5.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_XO5+0)
MOVT	R0, #hi_addr(_XO5+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4235 :: 		XO5.Order           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_XO5+4)
MOVT	R0, #hi_addr(_XO5+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4236 :: 		XO5.Left            = 316;
MOVW	R1, #316
MOVW	R0, #lo_addr(_XO5+6)
MOVT	R0, #hi_addr(_XO5+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4237 :: 		XO5.Top             = 116;
MOVS	R1, #116
MOVW	R0, #lo_addr(_XO5+8)
MOVT	R0, #hi_addr(_XO5+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4238 :: 		XO5.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_XO5+10)
MOVT	R0, #hi_addr(_XO5+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4239 :: 		XO5.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_XO5+12)
MOVT	R0, #hi_addr(_XO5+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4240 :: 		XO5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO5+26)
MOVT	R0, #hi_addr(_XO5+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4241 :: 		XO5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO5+27)
MOVT	R0, #hi_addr(_XO5+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4242 :: 		XO5.Caption         = XO5_Caption;
MOVW	R1, #lo_addr(_XO5_Caption+0)
MOVT	R1, #hi_addr(_XO5_Caption+0)
MOVW	R0, #lo_addr(_XO5+16)
MOVT	R0, #hi_addr(_XO5+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4243 :: 		XO5.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_XO5+20)
MOVT	R0, #hi_addr(_XO5+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,4244 :: 		XO5.Font_Color      = 0x25A4;
MOVW	R1, #9636
MOVW	R0, #lo_addr(_XO5+24)
MOVT	R0, #hi_addr(_XO5+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4245 :: 		XO5.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO5+28)
MOVT	R0, #hi_addr(_XO5+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4246 :: 		XO5.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO5+32)
MOVT	R0, #hi_addr(_XO5+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4247 :: 		XO5.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO5+36)
MOVT	R0, #hi_addr(_XO5+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4248 :: 		XO5.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO5+40)
MOVT	R0, #hi_addr(_XO5+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4250 :: 		XO6.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_XO6+0)
MOVT	R0, #hi_addr(_XO6+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4251 :: 		XO6.Order           = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_XO6+4)
MOVT	R0, #hi_addr(_XO6+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4252 :: 		XO6.Left            = 392;
MOVW	R1, #392
MOVW	R0, #lo_addr(_XO6+6)
MOVT	R0, #hi_addr(_XO6+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4253 :: 		XO6.Top             = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_XO6+8)
MOVT	R0, #hi_addr(_XO6+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4254 :: 		XO6.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_XO6+10)
MOVT	R0, #hi_addr(_XO6+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4255 :: 		XO6.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_XO6+12)
MOVT	R0, #hi_addr(_XO6+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4256 :: 		XO6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO6+26)
MOVT	R0, #hi_addr(_XO6+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4257 :: 		XO6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO6+27)
MOVT	R0, #hi_addr(_XO6+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4258 :: 		XO6.Caption         = XO6_Caption;
MOVW	R1, #lo_addr(_XO6_Caption+0)
MOVT	R1, #hi_addr(_XO6_Caption+0)
MOVW	R0, #lo_addr(_XO6+16)
MOVT	R0, #hi_addr(_XO6+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4259 :: 		XO6.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_XO6+20)
MOVT	R0, #hi_addr(_XO6+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,4260 :: 		XO6.Font_Color      = 0x25A4;
MOVW	R1, #9636
MOVW	R0, #lo_addr(_XO6+24)
MOVT	R0, #hi_addr(_XO6+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4261 :: 		XO6.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO6+28)
MOVT	R0, #hi_addr(_XO6+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4262 :: 		XO6.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO6+32)
MOVT	R0, #hi_addr(_XO6+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4263 :: 		XO6.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO6+36)
MOVT	R0, #hi_addr(_XO6+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4264 :: 		XO6.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO6+40)
MOVT	R0, #hi_addr(_XO6+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4266 :: 		XO7.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_XO7+0)
MOVT	R0, #hi_addr(_XO7+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4267 :: 		XO7.Order           = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_XO7+4)
MOVT	R0, #hi_addr(_XO7+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4268 :: 		XO7.Left            = 244;
MOVS	R1, #244
MOVW	R0, #lo_addr(_XO7+6)
MOVT	R0, #hi_addr(_XO7+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4269 :: 		XO7.Top             = 193;
MOVS	R1, #193
MOVW	R0, #lo_addr(_XO7+8)
MOVT	R0, #hi_addr(_XO7+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4270 :: 		XO7.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_XO7+10)
MOVT	R0, #hi_addr(_XO7+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4271 :: 		XO7.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_XO7+12)
MOVT	R0, #hi_addr(_XO7+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4272 :: 		XO7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO7+26)
MOVT	R0, #hi_addr(_XO7+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4273 :: 		XO7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO7+27)
MOVT	R0, #hi_addr(_XO7+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4274 :: 		XO7.Caption         = XO7_Caption;
MOVW	R1, #lo_addr(_XO7_Caption+0)
MOVT	R1, #hi_addr(_XO7_Caption+0)
MOVW	R0, #lo_addr(_XO7+16)
MOVT	R0, #hi_addr(_XO7+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4275 :: 		XO7.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_XO7+20)
MOVT	R0, #hi_addr(_XO7+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,4276 :: 		XO7.Font_Color      = 0x25A4;
MOVW	R1, #9636
MOVW	R0, #lo_addr(_XO7+24)
MOVT	R0, #hi_addr(_XO7+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4277 :: 		XO7.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO7+28)
MOVT	R0, #hi_addr(_XO7+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4278 :: 		XO7.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO7+32)
MOVT	R0, #hi_addr(_XO7+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4279 :: 		XO7.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO7+36)
MOVT	R0, #hi_addr(_XO7+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4280 :: 		XO7.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO7+40)
MOVT	R0, #hi_addr(_XO7+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4282 :: 		XO8.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_XO8+0)
MOVT	R0, #hi_addr(_XO8+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4283 :: 		XO8.Order           = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_XO8+4)
MOVT	R0, #hi_addr(_XO8+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4284 :: 		XO8.Left            = 322;
MOVW	R1, #322
MOVW	R0, #lo_addr(_XO8+6)
MOVT	R0, #hi_addr(_XO8+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4285 :: 		XO8.Top             = 190;
MOVS	R1, #190
MOVW	R0, #lo_addr(_XO8+8)
MOVT	R0, #hi_addr(_XO8+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4286 :: 		XO8.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_XO8+10)
MOVT	R0, #hi_addr(_XO8+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4287 :: 		XO8.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_XO8+12)
MOVT	R0, #hi_addr(_XO8+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4288 :: 		XO8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO8+26)
MOVT	R0, #hi_addr(_XO8+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4289 :: 		XO8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO8+27)
MOVT	R0, #hi_addr(_XO8+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4290 :: 		XO8.Caption         = XO8_Caption;
MOVW	R1, #lo_addr(_XO8_Caption+0)
MOVT	R1, #hi_addr(_XO8_Caption+0)
MOVW	R0, #lo_addr(_XO8+16)
MOVT	R0, #hi_addr(_XO8+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4291 :: 		XO8.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_XO8+20)
MOVT	R0, #hi_addr(_XO8+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,4292 :: 		XO8.Font_Color      = 0x25A4;
MOVW	R1, #9636
MOVW	R0, #lo_addr(_XO8+24)
MOVT	R0, #hi_addr(_XO8+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4293 :: 		XO8.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO8+28)
MOVT	R0, #hi_addr(_XO8+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4294 :: 		XO8.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO8+32)
MOVT	R0, #hi_addr(_XO8+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4295 :: 		XO8.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO8+36)
MOVT	R0, #hi_addr(_XO8+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4296 :: 		XO8.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO8+40)
MOVT	R0, #hi_addr(_XO8+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4298 :: 		XO9.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_XO9+0)
MOVT	R0, #hi_addr(_XO9+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4299 :: 		XO9.Order           = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_XO9+4)
MOVT	R0, #hi_addr(_XO9+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4300 :: 		XO9.Left            = 396;
MOVW	R1, #396
MOVW	R0, #lo_addr(_XO9+6)
MOVT	R0, #hi_addr(_XO9+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4301 :: 		XO9.Top             = 186;
MOVS	R1, #186
MOVW	R0, #lo_addr(_XO9+8)
MOVT	R0, #hi_addr(_XO9+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4302 :: 		XO9.Width           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_XO9+10)
MOVT	R0, #hi_addr(_XO9+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4303 :: 		XO9.Height          = 64;
MOVS	R1, #64
MOVW	R0, #lo_addr(_XO9+12)
MOVT	R0, #hi_addr(_XO9+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4304 :: 		XO9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO9+26)
MOVT	R0, #hi_addr(_XO9+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4305 :: 		XO9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_XO9+27)
MOVT	R0, #hi_addr(_XO9+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4306 :: 		XO9.Caption         = XO9_Caption;
MOVW	R1, #lo_addr(_XO9_Caption+0)
MOVT	R1, #hi_addr(_XO9_Caption+0)
MOVW	R0, #lo_addr(_XO9+16)
MOVT	R0, #hi_addr(_XO9+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4307 :: 		XO9.FontName        = Furro_Script52x60_Regular;
MOVW	R0, #lo_addr(_XO9+20)
MOVT	R0, #hi_addr(_XO9+20)
STR	R2, [R0, #0]
;mikromedia_STM32plus_driver.c,4308 :: 		XO9.Font_Color      = 0x25A4;
MOVW	R1, #9636
MOVW	R0, #lo_addr(_XO9+24)
MOVT	R0, #hi_addr(_XO9+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4309 :: 		XO9.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO9+28)
MOVT	R0, #hi_addr(_XO9+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4310 :: 		XO9.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO9+32)
MOVT	R0, #hi_addr(_XO9+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4311 :: 		XO9.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO9+36)
MOVT	R0, #hi_addr(_XO9+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4312 :: 		XO9.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_XO9+40)
MOVT	R0, #hi_addr(_XO9+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4314 :: 		CheckBox1.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_CheckBox1+0)
MOVT	R0, #hi_addr(_CheckBox1+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4315 :: 		CheckBox1.Order           = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_CheckBox1+4)
MOVT	R0, #hi_addr(_CheckBox1+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4316 :: 		CheckBox1.Left            = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_CheckBox1+6)
MOVT	R0, #hi_addr(_CheckBox1+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4317 :: 		CheckBox1.Top             = 198;
MOVS	R1, #198
MOVW	R0, #lo_addr(_CheckBox1+8)
MOVT	R0, #hi_addr(_CheckBox1+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4318 :: 		CheckBox1.Width           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_CheckBox1+10)
MOVT	R0, #hi_addr(_CheckBox1+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4319 :: 		CheckBox1.Height          = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_CheckBox1+12)
MOVT	R0, #hi_addr(_CheckBox1+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4320 :: 		CheckBox1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CheckBox1+14)
MOVT	R0, #hi_addr(_CheckBox1+14)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4321 :: 		CheckBox1.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CheckBox1+16)
MOVT	R0, #hi_addr(_CheckBox1+16)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4322 :: 		CheckBox1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CheckBox1+18)
MOVT	R0, #hi_addr(_CheckBox1+18)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4323 :: 		CheckBox1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CheckBox1+19)
MOVT	R0, #hi_addr(_CheckBox1+19)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4324 :: 		CheckBox1.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CheckBox1+20)
MOVT	R0, #hi_addr(_CheckBox1+20)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4325 :: 		CheckBox1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CheckBox1+21)
MOVT	R0, #hi_addr(_CheckBox1+21)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4326 :: 		CheckBox1.Caption         = CheckBox1_Caption;
MOVW	R1, #lo_addr(_CheckBox1_Caption+0)
MOVT	R1, #hi_addr(_CheckBox1_Caption+0)
MOVW	R0, #lo_addr(_CheckBox1+24)
MOVT	R0, #hi_addr(_CheckBox1+24)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4327 :: 		CheckBox1.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CheckBox1+28)
MOVT	R0, #hi_addr(_CheckBox1+28)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4328 :: 		CheckBox1.FontName        = Open_Sans_Light12x18_Regular;
MOVW	R0, #lo_addr(_CheckBox1+32)
MOVT	R0, #hi_addr(_CheckBox1+32)
STR	R3, [R0, #0]
;mikromedia_STM32plus_driver.c,4329 :: 		CheckBox1.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CheckBox1+48)
MOVT	R0, #hi_addr(_CheckBox1+48)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4330 :: 		CheckBox1.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CheckBox1+36)
MOVT	R0, #hi_addr(_CheckBox1+36)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4331 :: 		CheckBox1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CheckBox1+38)
MOVT	R0, #hi_addr(_CheckBox1+38)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4332 :: 		CheckBox1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CheckBox1+39)
MOVT	R0, #hi_addr(_CheckBox1+39)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4333 :: 		CheckBox1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_CheckBox1+40)
MOVT	R0, #hi_addr(_CheckBox1+40)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4334 :: 		CheckBox1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_CheckBox1+42)
MOVT	R0, #hi_addr(_CheckBox1+42)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4335 :: 		CheckBox1.Color           = 0xA1AE;
MOVW	R1, #41390
MOVW	R0, #lo_addr(_CheckBox1+44)
MOVT	R0, #hi_addr(_CheckBox1+44)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4336 :: 		CheckBox1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_CheckBox1+50)
MOVT	R0, #hi_addr(_CheckBox1+50)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4337 :: 		CheckBox1.Rounded         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CheckBox1+46)
MOVT	R0, #hi_addr(_CheckBox1+46)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4338 :: 		CheckBox1.Corner_Radius   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_CheckBox1+47)
MOVT	R0, #hi_addr(_CheckBox1+47)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4339 :: 		CheckBox1.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CheckBox1+52)
MOVT	R0, #hi_addr(_CheckBox1+52)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4340 :: 		CheckBox1.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CheckBox1+56)
MOVT	R0, #hi_addr(_CheckBox1+56)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4341 :: 		CheckBox1.OnClickPtr      = CheckBox1OnClick;
MOVW	R1, #lo_addr(_CheckBox1OnClick+0)
MOVT	R1, #hi_addr(_CheckBox1OnClick+0)
MOVW	R0, #lo_addr(_CheckBox1+60)
MOVT	R0, #hi_addr(_CheckBox1+60)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4342 :: 		CheckBox1.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_CheckBox1+64)
MOVT	R0, #hi_addr(_CheckBox1+64)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4344 :: 		Label41.OwnerScreen     = &Tic_Tac_Toe;
MOVW	R1, #lo_addr(_Tic_Tac_Toe+0)
MOVT	R1, #hi_addr(_Tic_Tac_Toe+0)
MOVW	R0, #lo_addr(_Label41+0)
MOVT	R0, #hi_addr(_Label41+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4345 :: 		Label41.Order           = 29;
MOVS	R1, #29
MOVW	R0, #lo_addr(_Label41+4)
MOVT	R0, #hi_addr(_Label41+4)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4346 :: 		Label41.Left            = 50;
MOVS	R1, #50
MOVW	R0, #lo_addr(_Label41+6)
MOVT	R0, #hi_addr(_Label41+6)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4347 :: 		Label41.Top             = 193;
MOVS	R1, #193
MOVW	R0, #lo_addr(_Label41+8)
MOVT	R0, #hi_addr(_Label41+8)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4348 :: 		Label41.Width           = 92;
MOVS	R1, #92
MOVW	R0, #lo_addr(_Label41+10)
MOVT	R0, #hi_addr(_Label41+10)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4349 :: 		Label41.Height          = 24;
MOVS	R1, #24
MOVW	R0, #lo_addr(_Label41+12)
MOVT	R0, #hi_addr(_Label41+12)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4350 :: 		Label41.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label41+26)
MOVT	R0, #hi_addr(_Label41+26)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4351 :: 		Label41.Active          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+27)
MOVT	R0, #hi_addr(_Label41+27)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4352 :: 		Label41.Caption         = Label41_Caption;
MOVW	R1, #lo_addr(_Label41_Caption+0)
MOVT	R1, #hi_addr(_Label41_Caption+0)
MOVW	R0, #lo_addr(_Label41+16)
MOVT	R0, #hi_addr(_Label41+16)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4353 :: 		Label41.FontName        = Open_Sans_Light14x22_Regular;
MOVW	R0, #lo_addr(_Label41+20)
MOVT	R0, #hi_addr(_Label41+20)
STR	R4, [R0, #0]
;mikromedia_STM32plus_driver.c,4354 :: 		Label41.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label41+24)
MOVT	R0, #hi_addr(_Label41+24)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4355 :: 		Label41.OnUpPtr         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+28)
MOVT	R0, #hi_addr(_Label41+28)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4356 :: 		Label41.OnDownPtr       = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+32)
MOVT	R0, #hi_addr(_Label41+32)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4357 :: 		Label41.OnClickPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+36)
MOVT	R0, #hi_addr(_Label41+36)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4358 :: 		Label41.OnPressPtr      = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label41+40)
MOVT	R0, #hi_addr(_Label41+40)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,4359 :: 		}
L_end_InitializeObjects:
BX	LR
; end of mikromedia_STM32plus_driver_InitializeObjects
mikromedia_STM32plus_driver_IsInsideObject:
;mikromedia_STM32plus_driver.c,4361 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;mikromedia_STM32plus_driver.c,4362 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_mikromedia_STM32plus_driver_IsInsideObject201
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_mikromedia_STM32plus_driver_IsInsideObject200
; X end address is: 0 (R0)
;mikromedia_STM32plus_driver.c,4363 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_mikromedia_STM32plus_driver_IsInsideObject199
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_mikromedia_STM32plus_driver_IsInsideObject198
; Y end address is: 4 (R1)
L_mikromedia_STM32plus_driver_IsInsideObject197:
;mikromedia_STM32plus_driver.c,4364 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;mikromedia_STM32plus_driver.c,4362 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_mikromedia_STM32plus_driver_IsInsideObject201:
L_mikromedia_STM32plus_driver_IsInsideObject200:
;mikromedia_STM32plus_driver.c,4363 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_mikromedia_STM32plus_driver_IsInsideObject199:
L_mikromedia_STM32plus_driver_IsInsideObject198:
;mikromedia_STM32plus_driver.c,4366 :: 		return 0;
MOVS	R0, #0
;mikromedia_STM32plus_driver.c,4367 :: 		}
L_end_IsInsideObject:
BX	LR
; end of mikromedia_STM32plus_driver_IsInsideObject
_DrawButton:
;mikromedia_STM32plus_driver.c,4378 :: 		void DrawButton(TButton *Abutton) {
; Abutton start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Abutton end address is: 0 (R0)
; Abutton start address is: 0 (R0)
;mikromedia_STM32plus_driver.c,4379 :: 		if (Abutton->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton4
;mikromedia_STM32plus_driver.c,4380 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton5
;mikromedia_STM32plus_driver.c,4381 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,4382 :: 		TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #48
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4383 :: 		}
IT	AL
BAL	L_DrawButton6
L_DrawButton5:
;mikromedia_STM32plus_driver.c,4385 :: 		TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4386 :: 		}
L_DrawButton6:
;mikromedia_STM32plus_driver.c,4387 :: 		TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4388 :: 		TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4389 :: 		TFT_Set_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4390 :: 		TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4391 :: 		if (Abutton->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawButton7
;mikromedia_STM32plus_driver.c,4392 :: 		TFT_Write_Text(Abutton->Caption, Abutton->Left + 4, (Abutton->Top + ((Abutton->Height - caption_height) / 2)));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R3, R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R2, R1, #4
ADDW	R1, R0, #24
; Abutton end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawButton8
L_DrawButton7:
;mikromedia_STM32plus_driver.c,4393 :: 		else if (Abutton->TextAlign == _taCenter)
; Abutton start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton9
;mikromedia_STM32plus_driver.c,4394 :: 		TFT_Write_Text(Abutton->Caption, (Abutton->Left + (Abutton->Width - caption_length) / 2), (Abutton->Top + ((Abutton->Height - caption_height) / 2)));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R4, R3, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #24
; Abutton end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
IT	AL
BAL	L_DrawButton10
L_DrawButton9:
;mikromedia_STM32plus_driver.c,4395 :: 		else if (Abutton->TextAlign == _taRight)
; Abutton start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawButton11
;mikromedia_STM32plus_driver.c,4396 :: 		TFT_Write_Text(Abutton->Caption, Abutton->Left + (Abutton->Width - caption_length - 4), (Abutton->Top + (Abutton->Height - caption_height) / 2));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R4, R3, R1
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
UXTH	R1, R1
ADDS	R2, R3, R1
ADDW	R1, R0, #24
; Abutton end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R4
BL	_TFT_Write_Text+0
L_DrawButton11:
L_DrawButton10:
L_DrawButton8:
;mikromedia_STM32plus_driver.c,4397 :: 		}
L_DrawButton4:
;mikromedia_STM32plus_driver.c,4398 :: 		}
L_end_DrawButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawButton
_DrawLabel:
;mikromedia_STM32plus_driver.c,4400 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
; ALabel end address is: 0 (R0)
; ALabel start address is: 20 (R5)
;mikromedia_STM32plus_driver.c,4401 :: 		if (ALabel->Visible == 1) {
ADDW	R1, R5, #26
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawLabel12
;mikromedia_STM32plus_driver.c,4402 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R5, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R5, #20
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
;mikromedia_STM32plus_driver.c,4403 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R5, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R5, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R5, #16
; ALabel end address is: 20 (R5)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;mikromedia_STM32plus_driver.c,4404 :: 		}
L_DrawLabel12:
;mikromedia_STM32plus_driver.c,4405 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawLabel
_DrawImage:
;mikromedia_STM32plus_driver.c,4407 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;mikromedia_STM32plus_driver.c,4408 :: 		if (AImage->Visible) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage13
;mikromedia_STM32plus_driver.c,4409 :: 		TFT_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
ADDW	R1, R0, #23
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
UXTB	R3, R4
BL	_TFT_Image+0
;mikromedia_STM32plus_driver.c,4410 :: 		}
L_DrawImage13:
;mikromedia_STM32plus_driver.c,4411 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawCircle:
;mikromedia_STM32plus_driver.c,4413 :: 		void DrawCircle(TCircle *ACircle) {
; ACircle start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ACircle end address is: 0 (R0)
; ACircle start address is: 0 (R0)
;mikromedia_STM32plus_driver.c,4414 :: 		if (ACircle->Visible == 1) {
ADDW	R1, R0, #16
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircle14
;mikromedia_STM32plus_driver.c,4415 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCircle15
;mikromedia_STM32plus_driver.c,4416 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,4418 :: 		ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
ADDW	R1, R0, #22
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
;mikromedia_STM32plus_driver.c,4417 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #19
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #30
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;mikromedia_STM32plus_driver.c,4418 :: 		ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_driver.c,4417 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4419 :: 		}
IT	AL
BAL	L_DrawCircle16
L_DrawCircle15:
;mikromedia_STM32plus_driver.c,4422 :: 		ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #22
LDRH	R1, [R1, #0]
UXTH	R5, R1
;mikromedia_STM32plus_driver.c,4421 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #19
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;mikromedia_STM32plus_driver.c,4422 :: 		ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;mikromedia_STM32plus_driver.c,4421 :: 		TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4423 :: 		}
L_DrawCircle16:
;mikromedia_STM32plus_driver.c,4424 :: 		TFT_Set_Pen(ACircle->Pen_Color, ACircle->Pen_Width);
ADDW	R1, R0, #12
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #14
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4427 :: 		ACircle->Radius);
ADDW	R1, R0, #10
LDRH	R4, [R1, #0]
SXTH	R3, R4
;mikromedia_STM32plus_driver.c,4426 :: 		ACircle->Top + ACircle->Radius,
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R4
;mikromedia_STM32plus_driver.c,4425 :: 		TFT_Circle(ACircle->Left + ACircle->Radius,
ADDS	R1, R0, #6
; ACircle end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R1, R4
SXTH	R0, R1
;mikromedia_STM32plus_driver.c,4426 :: 		ACircle->Top + ACircle->Radius,
SXTH	R1, R2
;mikromedia_STM32plus_driver.c,4427 :: 		ACircle->Radius);
SXTH	R2, R3
BL	_TFT_Circle+0
;mikromedia_STM32plus_driver.c,4428 :: 		}
L_DrawCircle14:
;mikromedia_STM32plus_driver.c,4429 :: 		}
L_end_DrawCircle:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCircle
_DrawBox:
;mikromedia_STM32plus_driver.c,4431 :: 		void DrawBox(TBox *ABox) {
; ABox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ABox end address is: 0 (R0)
; ABox start address is: 0 (R0)
;mikromedia_STM32plus_driver.c,4432 :: 		if (ABox->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox17
;mikromedia_STM32plus_driver.c,4433 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox18
;mikromedia_STM32plus_driver.c,4434 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,4435 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4436 :: 		}
IT	AL
BAL	L_DrawBox19
L_DrawBox18:
;mikromedia_STM32plus_driver.c,4438 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4439 :: 		}
L_DrawBox19:
;mikromedia_STM32plus_driver.c,4440 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4441 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; ABox end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;mikromedia_STM32plus_driver.c,4442 :: 		}
L_DrawBox17:
;mikromedia_STM32plus_driver.c,4443 :: 		}
L_end_DrawBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawBox
_DrawCheckBox:
;mikromedia_STM32plus_driver.c,4445 :: 		void DrawCheckBox(TCheckBox *ACheckBox) {
; ACheckBox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ACheckBox end address is: 0 (R0)
; ACheckBox start address is: 0 (R0)
;mikromedia_STM32plus_driver.c,4446 :: 		if (ACheckBox->Visible == 1) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCheckBox20
;mikromedia_STM32plus_driver.c,4447 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCheckBox21
;mikromedia_STM32plus_driver.c,4448 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,4449 :: 		TFT_Set_Brush(ACheckBox->Transparent, ACheckBox->Press_Color, ACheckBox->Gradient, ACheckBox->Gradient_Orientation, ACheckBox->Gradient_End_Color, ACheckBox->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4450 :: 		}
IT	AL
BAL	L_DrawCheckBox22
L_DrawCheckBox21:
;mikromedia_STM32plus_driver.c,4452 :: 		TFT_Set_Brush(ACheckBox->Transparent, ACheckBox->Color, ACheckBox->Gradient, ACheckBox->Gradient_Orientation, ACheckBox->Gradient_Start_Color, ACheckBox->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4453 :: 		}
L_DrawCheckBox22:
;mikromedia_STM32plus_driver.c,4454 :: 		TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4455 :: 		TFT_Set_Font(ACheckBox->FontName, ACheckBox->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4456 :: 		if (ACheckBox->TextAlign == _taLeft) {
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawCheckBox23
;mikromedia_STM32plus_driver.c,4457 :: 		if (ACheckBox->Rounded == 1)
ADDW	R1, R0, #46
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCheckBox24
;mikromedia_STM32plus_driver.c,4458 :: 		TFT_Rectangle_Round_Edges(ACheckBox->Left, ACheckBox->Top, ACheckBox->Left + ACheckBox->Height, ACheckBox->Top + ACheckBox->Height - 1, ACheckBox->Corner_Radius);
ADDW	R1, R0, #47
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R5, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
ADDS	R1, R5, R2
UXTH	R1, R1
SUBS	R4, R1, #1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R3, R1, R2
UXTH	R2, R5
STR	R0, [SP, #4]
UXTH	R0, R1
UXTH	R1, R2
UXTH	R2, R3
UXTH	R3, R4
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawCheckBox25
L_DrawCheckBox24:
;mikromedia_STM32plus_driver.c,4460 :: 		TFT_Rectangle(ACheckBox->Left, ACheckBox->Top, ACheckBox->Left + ACheckBox->Height, ACheckBox->Top + ACheckBox->Height - 1);
ADDW	R1, R0, #8
LDRH	R5, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
ADDS	R1, R5, R2
UXTH	R1, R1
SUBS	R4, R1, #1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R3, R1, R2
SXTH	R2, R5
SXTH	R1, R1
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R4
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
L_DrawCheckBox25:
;mikromedia_STM32plus_driver.c,4461 :: 		if (ACheckBox->Checked == 1) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCheckBox26
;mikromedia_STM32plus_driver.c,4462 :: 		TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Height / 8);
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
LSRS	R2, R1, #3
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4466 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
ADDW	R1, R0, #8
LDRH	R7, [R1, #0]
ADDW	R1, R0, #12
LDRH	R3, [R1, #0]
ADDS	R2, R7, R3
UXTH	R2, R2
MOVS	R1, #5
UDIV	R6, R3, R1
UXTH	R6, R6
SUB	R1, R2, R6
UXTH	R1, R1
SUBS	R5, R1, #1
;mikromedia_STM32plus_driver.c,4465 :: 		ACheckBox->Left  + ACheckBox->Height / 2 - 1,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
LSRS	R2, R3, #1
UXTH	R2, R2
ADDS	R1, R4, R2
UXTH	R1, R1
SUBS	R3, R1, #1
;mikromedia_STM32plus_driver.c,4464 :: 		ACheckBox->Top   + ACheckBox->Height / 2 + 1,
ADDS	R1, R7, R2
UXTH	R1, R1
ADDS	R2, R1, #1
;mikromedia_STM32plus_driver.c,4463 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Height / 5 + 1,
ADDS	R1, R4, R6
UXTH	R1, R1
ADDS	R1, R1, #1
;mikromedia_STM32plus_driver.c,4466 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
STR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4463 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Height / 5 + 1,
SXTH	R0, R1
;mikromedia_STM32plus_driver.c,4464 :: 		ACheckBox->Top   + ACheckBox->Height / 2 + 1,
SXTH	R1, R2
;mikromedia_STM32plus_driver.c,4465 :: 		ACheckBox->Left  + ACheckBox->Height / 2 - 1,
SXTH	R2, R3
;mikromedia_STM32plus_driver.c,4466 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
SXTH	R3, R5
BL	_TFT_Line+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4470 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
ADDW	R1, R0, #8
LDRH	R7, [R1, #0]
ADDW	R1, R0, #12
LDRH	R6, [R1, #0]
MOVS	R1, #5
UDIV	R3, R6, R1
UXTH	R3, R3
ADDS	R1, R7, R3
UXTH	R1, R1
ADDS	R5, R1, #1
;mikromedia_STM32plus_driver.c,4469 :: 		ACheckBox->Left  + ACheckBox->Height - ACheckBox->Height / 5 - 1,
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDS	R1, R2, R6
UXTH	R1, R1
SUB	R1, R1, R3
UXTH	R1, R1
SUBS	R4, R1, #1
;mikromedia_STM32plus_driver.c,4468 :: 		ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
ADDS	R1, R7, R6
UXTH	R1, R1
SUB	R1, R1, R3
UXTH	R1, R1
SUBS	R3, R1, #1
;mikromedia_STM32plus_driver.c,4467 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Height / 2 - ACheckBox->Pen_Width + 1,
LSRS	R1, R6, #1
UXTH	R1, R1
ADDS	R2, R2, R1
UXTH	R2, R2
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
ADDS	R1, R1, #1
;mikromedia_STM32plus_driver.c,4470 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
STR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4469 :: 		ACheckBox->Left  + ACheckBox->Height - ACheckBox->Height / 5 - 1,
SXTH	R2, R4
;mikromedia_STM32plus_driver.c,4467 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Height / 2 - ACheckBox->Pen_Width + 1,
SXTH	R0, R1
;mikromedia_STM32plus_driver.c,4468 :: 		ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
SXTH	R1, R3
;mikromedia_STM32plus_driver.c,4470 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
SXTH	R3, R5
BL	_TFT_Line+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4471 :: 		}
L_DrawCheckBox26:
;mikromedia_STM32plus_driver.c,4472 :: 		TFT_Write_Text_Return_Pos(ACheckBox->Caption, ACheckBox->Left + ACheckBox->Width / 4 + 3, ACheckBox->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
LSRS	R1, R1, #2
UXTH	R1, R1
ADDS	R1, R2, R1
UXTH	R1, R1
ADDS	R2, R1, #3
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4473 :: 		TFT_Write_Text(ACheckBox->Caption, ACheckBox->Left + ACheckBox->Height + 3, (ACheckBox->Top + ((ACheckBox->Height - caption_height) / 2)));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R3, R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R2
UXTH	R1, R1
ADDS	R2, R1, #3
ADDW	R1, R0, #24
; ACheckBox end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;mikromedia_STM32plus_driver.c,4474 :: 		}
IT	AL
BAL	L_DrawCheckBox27
L_DrawCheckBox23:
;mikromedia_STM32plus_driver.c,4475 :: 		else if (ACheckBox->TextAlign == _taRight) {
; ACheckBox start address is: 0 (R0)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawCheckBox28
;mikromedia_STM32plus_driver.c,4476 :: 		if (ACheckBox->Rounded == 1)
ADDW	R1, R0, #46
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCheckBox29
;mikromedia_STM32plus_driver.c,4477 :: 		TFT_Rectangle_Round_Edges(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height  , ACheckBox->Top, ACheckBox->Left + ACheckBox->Width, ACheckBox->Top + ACheckBox->Height - 1, ACheckBox->Corner_Radius);
ADDW	R1, R0, #47
LDRB	R1, [R1, #0]
UXTB	R7, R1
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R5, [R1, #0]
ADDS	R1, R6, R5
UXTH	R1, R1
SUBS	R4, R1, #1
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R3, R2, R1
UXTH	R3, R3
UXTH	R2, R6
SUB	R1, R3, R5
STR	R0, [SP, #4]
UXTH	R0, R1
UXTH	R1, R2
UXTH	R2, R3
UXTH	R3, R4
PUSH	(R7)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawCheckBox30
L_DrawCheckBox29:
;mikromedia_STM32plus_driver.c,4479 :: 		TFT_Rectangle(ACheckBox->Left + ACheckBox->Width - ACheckBox->Height  , ACheckBox->Top, ACheckBox->Left + ACheckBox->Width, ACheckBox->Top + ACheckBox->Height - 1);
ADDW	R1, R0, #8
LDRH	R6, [R1, #0]
ADDW	R1, R0, #12
LDRH	R5, [R1, #0]
ADDS	R1, R6, R5
UXTH	R1, R1
SUBS	R4, R1, #1
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R3, R2, R1
UXTH	R3, R3
SXTH	R2, R6
SUB	R1, R3, R5
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R4
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
L_DrawCheckBox30:
;mikromedia_STM32plus_driver.c,4480 :: 		if (ACheckBox->Checked == 1) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawCheckBox31
;mikromedia_STM32plus_driver.c,4481 :: 		TFT_Set_Pen(ACheckBox->Pen_Color, ACheckBox->Height / 8);
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
LSRS	R2, R1, #3
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4485 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
ADDW	R1, R0, #8
LDRH	R8, [R1, #0]
ADDW	R1, R0, #12
LDRH	R7, [R1, #0]
ADD	R2, R8, R7, LSL #0
UXTH	R2, R2
MOVS	R1, #5
UDIV	R6, R7, R1
UXTH	R6, R6
SUB	R1, R2, R6
UXTH	R1, R1
SUBS	R5, R1, #1
;mikromedia_STM32plus_driver.c,4484 :: 		ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 - 1,
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R4, R2, R1
UXTH	R4, R4
LSRS	R2, R7, #1
UXTH	R2, R2
SUB	R1, R4, R2
UXTH	R1, R1
SUBS	R3, R1, #1
;mikromedia_STM32plus_driver.c,4483 :: 		ACheckBox->Top +  ACheckBox->Height / 2 + 1,
ADD	R1, R8, R2, LSL #0
UXTH	R1, R1
ADDS	R2, R1, #1
;mikromedia_STM32plus_driver.c,4482 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Width - ACheckBox->Height + ACheckBox->Height / 5 + 1,
SUB	R1, R4, R7
UXTH	R1, R1
ADDS	R1, R1, R6
UXTH	R1, R1
ADDS	R1, R1, #1
;mikromedia_STM32plus_driver.c,4485 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
STR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4482 :: 		TFT_Line(ACheckBox->Left  + ACheckBox->Width - ACheckBox->Height + ACheckBox->Height / 5 + 1,
SXTH	R0, R1
;mikromedia_STM32plus_driver.c,4483 :: 		ACheckBox->Top +  ACheckBox->Height / 2 + 1,
SXTH	R1, R2
;mikromedia_STM32plus_driver.c,4484 :: 		ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 - 1,
SXTH	R2, R3
;mikromedia_STM32plus_driver.c,4485 :: 		ACheckBox->Top   + ACheckBox->Height - ACheckBox->Height / 5 - 1);
SXTH	R3, R5
BL	_TFT_Line+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4489 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
ADDW	R1, R0, #8
LDRH	R8, [R1, #0]
ADDW	R1, R0, #12
LDRH	R7, [R1, #0]
MOVS	R1, #5
UDIV	R6, R7, R1
UXTH	R6, R6
ADD	R1, R8, R6, LSL #0
UXTH	R1, R1
ADDS	R5, R1, #1
;mikromedia_STM32plus_driver.c,4488 :: 		ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height / 5 - 1,
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R4, R2, R1
UXTH	R4, R4
SUB	R1, R4, R6
UXTH	R1, R1
SUBS	R3, R1, #1
;mikromedia_STM32plus_driver.c,4487 :: 		ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
ADD	R1, R8, R7, LSL #0
UXTH	R1, R1
SUB	R1, R1, R6
UXTH	R1, R1
SUBS	R2, R1, #1
;mikromedia_STM32plus_driver.c,4486 :: 		TFT_Line(ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 + 1,
LSRS	R1, R7, #1
UXTH	R1, R1
SUB	R1, R4, R1
UXTH	R1, R1
ADDS	R1, R1, #1
;mikromedia_STM32plus_driver.c,4489 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
STR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4486 :: 		TFT_Line(ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height /2 + 1,
SXTH	R0, R1
;mikromedia_STM32plus_driver.c,4487 :: 		ACheckBox->Top   + ACheckBox->Height -  ACheckBox->Height / 5 - 1,
SXTH	R1, R2
;mikromedia_STM32plus_driver.c,4488 :: 		ACheckBox->Left + ACheckBox->Width  - ACheckBox->Height / 5 - 1,
SXTH	R2, R3
;mikromedia_STM32plus_driver.c,4489 :: 		ACheckBox->Top   + ACheckBox->Height / 5 + 1);
SXTH	R3, R5
BL	_TFT_Line+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4490 :: 		}
L_DrawCheckBox31:
;mikromedia_STM32plus_driver.c,4491 :: 		TFT_Write_Text_Return_Pos(ACheckBox->Caption, ACheckBox->Left + 3, ACheckBox->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R2, R1, #3
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,4492 :: 		TFT_Write_Text(ACheckBox->Caption, ACheckBox->Left + 3, ACheckBox->Top + (ACheckBox->Height - caption_height) / 2);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R3, R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R2, R1, #3
ADDW	R1, R0, #24
; ACheckBox end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;mikromedia_STM32plus_driver.c,4493 :: 		}
L_DrawCheckBox28:
L_DrawCheckBox27:
;mikromedia_STM32plus_driver.c,4494 :: 		}
L_DrawCheckBox20:
;mikromedia_STM32plus_driver.c,4495 :: 		}
L_end_DrawCheckBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCheckBox
_DrawScreen:
;mikromedia_STM32plus_driver.c,4497 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #72
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;mikromedia_STM32plus_driver.c,4513 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,4514 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,4515 :: 		button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;mikromedia_STM32plus_driver.c,4516 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;mikromedia_STM32plus_driver.c,4517 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;mikromedia_STM32plus_driver.c,4518 :: 		circle_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;mikromedia_STM32plus_driver.c,4519 :: 		box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #36]
;mikromedia_STM32plus_driver.c,4520 :: 		checkbox_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #44]
;mikromedia_STM32plus_driver.c,4521 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;mikromedia_STM32plus_driver.c,4523 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen204
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen203
IT	AL
BAL	L_DrawScreen34
L__DrawScreen204:
L__DrawScreen203:
;mikromedia_STM32plus_driver.c,4524 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
STR	R2, [SP, #68]
LDR	R1, [R2, #0]
STRB	R1, [SP, #52]
;mikromedia_STM32plus_driver.c,4525 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
STR	R1, [R2, #0]
;mikromedia_STM32plus_driver.c,4526 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R3, #lo_addr(_Write_Data+0)
MOVT	R3, #hi_addr(_Write_Data+0)
MOVW	R2, #lo_addr(_Write_Command+0)
MOVT	R2, #hi_addr(_Write_Command+0)
MOVW	R1, #lo_addr(_Set_Index+0)
MOVT	R1, #hi_addr(_Set_Index+0)
MOV	R0, R1
MOV	R1, R2
MOV	R2, R3
BL	_TFT_Set_Active+0
;mikromedia_STM32plus_driver.c,4527 :: 		TFT_Init_SSD1963(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
STR	R3, [SP, #64]
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_SSD1963+0
;mikromedia_STM32plus_driver.c,4528 :: 		STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_STMPE610_SetSize+0
;mikromedia_STM32plus_driver.c,4529 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;mikromedia_STM32plus_driver.c,4530 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;mikromedia_STM32plus_driver.c,4531 :: 		display_width = CurrentScreen->Width;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,4532 :: 		display_height = CurrentScreen->Height;
LDR	R1, [SP, #64]
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,4533 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #52]
LDR	R1, [SP, #68]
STR	R2, [R1, #0]
;mikromedia_STM32plus_driver.c,4534 :: 		}
IT	AL
BAL	L_DrawScreen35
L_DrawScreen34:
;mikromedia_STM32plus_driver.c,4536 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen35:
;mikromedia_STM32plus_driver.c,4539 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen36:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen37
;mikromedia_STM32plus_driver.c,4540 :: 		if (button_idx < CurrentScreen->ButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen38
;mikromedia_STM32plus_driver.c,4541 :: 		local_button = GetButton(button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #6]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #8]
;mikromedia_STM32plus_driver.c,4542 :: 		if (order == local_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen39
;mikromedia_STM32plus_driver.c,4543 :: 		button_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;mikromedia_STM32plus_driver.c,4544 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,4545 :: 		DrawButton(local_button);
LDR	R0, [SP, #8]
BL	_DrawButton+0
;mikromedia_STM32plus_driver.c,4546 :: 		}
L_DrawScreen39:
;mikromedia_STM32plus_driver.c,4547 :: 		}
L_DrawScreen38:
;mikromedia_STM32plus_driver.c,4549 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen40
;mikromedia_STM32plus_driver.c,4550 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #12]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #16]
;mikromedia_STM32plus_driver.c,4551 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen41
;mikromedia_STM32plus_driver.c,4552 :: 		label_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;mikromedia_STM32plus_driver.c,4553 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,4554 :: 		DrawLabel(local_label);
LDR	R0, [SP, #16]
BL	_DrawLabel+0
;mikromedia_STM32plus_driver.c,4555 :: 		}
L_DrawScreen41:
;mikromedia_STM32plus_driver.c,4556 :: 		}
L_DrawScreen40:
;mikromedia_STM32plus_driver.c,4558 :: 		if (circle_idx < CurrentScreen->CirclesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen42
;mikromedia_STM32plus_driver.c,4559 :: 		local_circle = GetCircle(circle_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #36
LDR	R2, [R1, #0]
LDRB	R1, [SP, #28]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #32]
;mikromedia_STM32plus_driver.c,4560 :: 		if (order == local_circle->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen43
;mikromedia_STM32plus_driver.c,4561 :: 		circle_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;mikromedia_STM32plus_driver.c,4562 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,4563 :: 		DrawCircle(local_circle);
LDR	R0, [SP, #32]
BL	_DrawCircle+0
;mikromedia_STM32plus_driver.c,4564 :: 		}
L_DrawScreen43:
;mikromedia_STM32plus_driver.c,4565 :: 		}
L_DrawScreen42:
;mikromedia_STM32plus_driver.c,4567 :: 		if (box_idx < CurrentScreen->BoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #36]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen44
;mikromedia_STM32plus_driver.c,4568 :: 		local_box = GetBox(box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #44
LDR	R2, [R1, #0]
LDRB	R1, [SP, #36]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #40]
;mikromedia_STM32plus_driver.c,4569 :: 		if (order == local_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen45
;mikromedia_STM32plus_driver.c,4570 :: 		box_idx++;
LDRB	R1, [SP, #36]
ADDS	R1, R1, #1
STRB	R1, [SP, #36]
;mikromedia_STM32plus_driver.c,4571 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,4572 :: 		DrawBox(local_box);
LDR	R0, [SP, #40]
BL	_DrawBox+0
;mikromedia_STM32plus_driver.c,4573 :: 		}
L_DrawScreen45:
;mikromedia_STM32plus_driver.c,4574 :: 		}
L_DrawScreen44:
;mikromedia_STM32plus_driver.c,4576 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen46
;mikromedia_STM32plus_driver.c,4577 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #28
LDR	R2, [R1, #0]
LDRB	R1, [SP, #20]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #24]
;mikromedia_STM32plus_driver.c,4578 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen47
;mikromedia_STM32plus_driver.c,4579 :: 		image_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;mikromedia_STM32plus_driver.c,4580 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,4581 :: 		DrawImage(local_image);
LDR	R0, [SP, #24]
BL	_DrawImage+0
;mikromedia_STM32plus_driver.c,4582 :: 		}
L_DrawScreen47:
;mikromedia_STM32plus_driver.c,4583 :: 		}
L_DrawScreen46:
;mikromedia_STM32plus_driver.c,4585 :: 		if (checkbox_idx < CurrentScreen->CheckBoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #48
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #44]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen48
;mikromedia_STM32plus_driver.c,4586 :: 		local_checkbox = GetCheckBox(checkbox_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #52
LDR	R2, [R1, #0]
LDRB	R1, [SP, #44]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #48]
;mikromedia_STM32plus_driver.c,4587 :: 		if (order == local_checkbox->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen49
;mikromedia_STM32plus_driver.c,4588 :: 		checkbox_idx++;
LDRB	R1, [SP, #44]
ADDS	R1, R1, #1
STRB	R1, [SP, #44]
;mikromedia_STM32plus_driver.c,4589 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,4590 :: 		DrawCheckBox(local_checkbox);
LDR	R0, [SP, #48]
BL	_DrawCheckBox+0
;mikromedia_STM32plus_driver.c,4591 :: 		}
L_DrawScreen49:
;mikromedia_STM32plus_driver.c,4592 :: 		}
L_DrawScreen48:
;mikromedia_STM32plus_driver.c,4594 :: 		}
IT	AL
BAL	L_DrawScreen36
L_DrawScreen37:
;mikromedia_STM32plus_driver.c,4595 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #72
BX	LR
; end of _DrawScreen
_Get_Object:
;mikromedia_STM32plus_driver.c,4597 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;mikromedia_STM32plus_driver.c,4598 :: 		button_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4599 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4600 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4601 :: 		circle_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4602 :: 		box_order           = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4603 :: 		checkbox_order      = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_checkbox_order+0)
MOVT	R2, #hi_addr(_checkbox_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4605 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object50:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object51
;mikromedia_STM32plus_driver.c,4606 :: 		local_button = GetButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_button+0)
MOVT	R2, #hi_addr(_local_button+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4607 :: 		if (local_button->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object53
;mikromedia_STM32plus_driver.c,4609 :: 		local_button->Width, local_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_button+0)
MOVT	R6, #hi_addr(_local_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;mikromedia_STM32plus_driver.c,4608 :: 		if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;mikromedia_STM32plus_driver.c,4609 :: 		local_button->Width, local_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	mikromedia_STM32plus_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object54
;mikromedia_STM32plus_driver.c,4610 :: 		button_order = local_button->Order;
MOVW	R4, #lo_addr(_local_button+0)
MOVT	R4, #hi_addr(_local_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4611 :: 		exec_button = local_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4612 :: 		}
L_Get_Object54:
;mikromedia_STM32plus_driver.c,4613 :: 		}
L_Get_Object53:
;mikromedia_STM32plus_driver.c,4605 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;mikromedia_STM32plus_driver.c,4614 :: 		}
IT	AL
BAL	L_Get_Object50
L_Get_Object51:
;mikromedia_STM32plus_driver.c,4617 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object55:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object56
;mikromedia_STM32plus_driver.c,4618 :: 		local_label = GetLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4619 :: 		if (local_label->Active == 1) {
ADDW	R2, R3, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object58
;mikromedia_STM32plus_driver.c,4621 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;mikromedia_STM32plus_driver.c,4620 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;mikromedia_STM32plus_driver.c,4621 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	mikromedia_STM32plus_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object59
;mikromedia_STM32plus_driver.c,4622 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4623 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4624 :: 		}
L_Get_Object59:
;mikromedia_STM32plus_driver.c,4625 :: 		}
L_Get_Object58:
;mikromedia_STM32plus_driver.c,4617 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;mikromedia_STM32plus_driver.c,4626 :: 		}
IT	AL
BAL	L_Get_Object55
L_Get_Object56:
;mikromedia_STM32plus_driver.c,4629 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object60:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #24
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object61
;mikromedia_STM32plus_driver.c,4630 :: 		local_image = GetImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_image+0)
MOVT	R2, #hi_addr(_local_image+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4631 :: 		if (local_image->Active == 1) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object63
;mikromedia_STM32plus_driver.c,4633 :: 		local_image->Width, local_image->Height) == 1) {
MOVW	R6, #lo_addr(_local_image+0)
MOVT	R6, #hi_addr(_local_image+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;mikromedia_STM32plus_driver.c,4632 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;mikromedia_STM32plus_driver.c,4633 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	mikromedia_STM32plus_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object64
;mikromedia_STM32plus_driver.c,4634 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4635 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4636 :: 		}
L_Get_Object64:
;mikromedia_STM32plus_driver.c,4637 :: 		}
L_Get_Object63:
;mikromedia_STM32plus_driver.c,4629 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;mikromedia_STM32plus_driver.c,4638 :: 		}
IT	AL
BAL	L_Get_Object60
L_Get_Object61:
;mikromedia_STM32plus_driver.c,4641 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
L_Get_Object65:
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #32
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object66
;mikromedia_STM32plus_driver.c,4642 :: 		local_circle = GetCircle(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #36
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_circle+0)
MOVT	R2, #hi_addr(_local_circle+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4643 :: 		if (local_circle->Active == 1) {
ADDW	R2, R3, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object68
;mikromedia_STM32plus_driver.c,4645 :: 		(local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
MOVW	R5, #lo_addr(_local_circle+0)
MOVT	R5, #hi_addr(_local_circle+0)
LDR	R2, [R5, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
LSLS	R4, R2, #1
UXTH	R4, R4
;mikromedia_STM32plus_driver.c,4644 :: 		if (IsInsideObject(X, Y, local_circle->Left, local_circle->Top,
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R5
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;mikromedia_STM32plus_driver.c,4645 :: 		(local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
PUSH	(R4)
PUSH	(R4)
BL	mikromedia_STM32plus_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object69
;mikromedia_STM32plus_driver.c,4646 :: 		circle_order = local_circle->Order;
MOVW	R4, #lo_addr(_local_circle+0)
MOVT	R4, #hi_addr(_local_circle+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4647 :: 		exec_circle = local_circle;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4648 :: 		}
L_Get_Object69:
;mikromedia_STM32plus_driver.c,4649 :: 		}
L_Get_Object68:
;mikromedia_STM32plus_driver.c,4641 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;mikromedia_STM32plus_driver.c,4650 :: 		}
IT	AL
BAL	L_Get_Object65
L_Get_Object66:
;mikromedia_STM32plus_driver.c,4653 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
L_Get_Object70:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #40
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object71
;mikromedia_STM32plus_driver.c,4654 :: 		local_box = GetBox(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #44
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_box+0)
MOVT	R2, #hi_addr(_local_box+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4655 :: 		if (local_box->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object73
;mikromedia_STM32plus_driver.c,4657 :: 		local_box->Width, local_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_box+0)
MOVT	R6, #hi_addr(_local_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;mikromedia_STM32plus_driver.c,4656 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;mikromedia_STM32plus_driver.c,4657 :: 		local_box->Width, local_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	mikromedia_STM32plus_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object74
;mikromedia_STM32plus_driver.c,4658 :: 		box_order = local_box->Order;
MOVW	R4, #lo_addr(_local_box+0)
MOVT	R4, #hi_addr(_local_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4659 :: 		exec_box = local_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4660 :: 		}
L_Get_Object74:
;mikromedia_STM32plus_driver.c,4661 :: 		}
L_Get_Object73:
;mikromedia_STM32plus_driver.c,4653 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;mikromedia_STM32plus_driver.c,4662 :: 		}
IT	AL
BAL	L_Get_Object70
L_Get_Object71:
;mikromedia_STM32plus_driver.c,4665 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CheckBoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object75:
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
; X start address is: 28 (R7)
; X end address is: 28 (R7)
; Y start address is: 32 (R8)
; Y end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object76
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
;mikromedia_STM32plus_driver.c,4666 :: 		local_checkbox = GetCheckBox(_object_count);
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #52
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_checkbox+0)
MOVT	R2, #hi_addr(_local_checkbox+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4667 :: 		if (local_checkbox->Active == 1) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Get_Object78
;mikromedia_STM32plus_driver.c,4669 :: 		local_checkbox->Width, local_checkbox->Height) == 1) {
MOVW	R6, #lo_addr(_local_checkbox+0)
MOVT	R6, #hi_addr(_local_checkbox+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;mikromedia_STM32plus_driver.c,4668 :: 		if (IsInsideObject(X, Y, local_checkbox->Left, local_checkbox->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;mikromedia_STM32plus_driver.c,4669 :: 		local_checkbox->Width, local_checkbox->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	mikromedia_STM32plus_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object79
;mikromedia_STM32plus_driver.c,4670 :: 		checkbox_order = local_checkbox->Order;
MOVW	R4, #lo_addr(_local_checkbox+0)
MOVT	R4, #hi_addr(_local_checkbox+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_checkbox_order+0)
MOVT	R2, #hi_addr(_checkbox_order+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4671 :: 		exec_checkbox = local_checkbox;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4672 :: 		}
L_Get_Object79:
;mikromedia_STM32plus_driver.c,4673 :: 		}
L_Get_Object78:
;mikromedia_STM32plus_driver.c,4665 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CheckBoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;mikromedia_STM32plus_driver.c,4674 :: 		}
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
IT	AL
BAL	L_Get_Object75
L_Get_Object76:
;mikromedia_STM32plus_driver.c,4676 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4677 :: 		if (button_order >  _object_count )
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object80
;mikromedia_STM32plus_driver.c,4678 :: 		_object_count = button_order;
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object80:
;mikromedia_STM32plus_driver.c,4679 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object81
;mikromedia_STM32plus_driver.c,4680 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object81:
;mikromedia_STM32plus_driver.c,4681 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object82
;mikromedia_STM32plus_driver.c,4682 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object82:
;mikromedia_STM32plus_driver.c,4683 :: 		if (circle_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object83
;mikromedia_STM32plus_driver.c,4684 :: 		_object_count = circle_order;
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object83:
;mikromedia_STM32plus_driver.c,4685 :: 		if (box_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object84
;mikromedia_STM32plus_driver.c,4686 :: 		_object_count = box_order;
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object84:
;mikromedia_STM32plus_driver.c,4687 :: 		if (checkbox_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_checkbox_order+0)
MOVT	R2, #hi_addr(_checkbox_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object85
;mikromedia_STM32plus_driver.c,4688 :: 		_object_count = checkbox_order;
MOVW	R2, #lo_addr(_checkbox_order+0)
MOVT	R2, #hi_addr(_checkbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object85:
;mikromedia_STM32plus_driver.c,4689 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
_Process_TP_Press:
;mikromedia_STM32plus_driver.c,4692 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;mikromedia_STM32plus_driver.c,4693 :: 		exec_button         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4694 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4695 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4696 :: 		exec_circle         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4697 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4698 :: 		exec_checkbox       = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4700 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;mikromedia_STM32plus_driver.c,4702 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Press86
;mikromedia_STM32plus_driver.c,4703 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press87
;mikromedia_STM32plus_driver.c,4704 :: 		if (exec_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press88
;mikromedia_STM32plus_driver.c,4705 :: 		if (exec_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press89
;mikromedia_STM32plus_driver.c,4706 :: 		exec_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4707 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;mikromedia_STM32plus_driver.c,4708 :: 		}
L_Process_TP_Press89:
;mikromedia_STM32plus_driver.c,4709 :: 		}
L_Process_TP_Press88:
;mikromedia_STM32plus_driver.c,4710 :: 		}
L_Process_TP_Press87:
;mikromedia_STM32plus_driver.c,4712 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press90
;mikromedia_STM32plus_driver.c,4713 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press91
;mikromedia_STM32plus_driver.c,4714 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press92
;mikromedia_STM32plus_driver.c,4715 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4716 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;mikromedia_STM32plus_driver.c,4717 :: 		}
L_Process_TP_Press92:
;mikromedia_STM32plus_driver.c,4718 :: 		}
L_Process_TP_Press91:
;mikromedia_STM32plus_driver.c,4719 :: 		}
L_Process_TP_Press90:
;mikromedia_STM32plus_driver.c,4721 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press93
;mikromedia_STM32plus_driver.c,4722 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press94
;mikromedia_STM32plus_driver.c,4723 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press95
;mikromedia_STM32plus_driver.c,4724 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4725 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;mikromedia_STM32plus_driver.c,4726 :: 		}
L_Process_TP_Press95:
;mikromedia_STM32plus_driver.c,4727 :: 		}
L_Process_TP_Press94:
;mikromedia_STM32plus_driver.c,4728 :: 		}
L_Process_TP_Press93:
;mikromedia_STM32plus_driver.c,4730 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press96
;mikromedia_STM32plus_driver.c,4731 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press97
;mikromedia_STM32plus_driver.c,4732 :: 		if (exec_circle->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press98
;mikromedia_STM32plus_driver.c,4733 :: 		exec_circle->OnPressPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4734 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;mikromedia_STM32plus_driver.c,4735 :: 		}
L_Process_TP_Press98:
;mikromedia_STM32plus_driver.c,4736 :: 		}
L_Process_TP_Press97:
;mikromedia_STM32plus_driver.c,4737 :: 		}
L_Process_TP_Press96:
;mikromedia_STM32plus_driver.c,4739 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press99
;mikromedia_STM32plus_driver.c,4740 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press100
;mikromedia_STM32plus_driver.c,4741 :: 		if (exec_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press101
;mikromedia_STM32plus_driver.c,4742 :: 		exec_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4743 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;mikromedia_STM32plus_driver.c,4744 :: 		}
L_Process_TP_Press101:
;mikromedia_STM32plus_driver.c,4745 :: 		}
L_Process_TP_Press100:
;mikromedia_STM32plus_driver.c,4746 :: 		}
L_Process_TP_Press99:
;mikromedia_STM32plus_driver.c,4748 :: 		if (_object_count == checkbox_order) {
MOVW	R2, #lo_addr(_checkbox_order+0)
MOVT	R2, #hi_addr(_checkbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press102
;mikromedia_STM32plus_driver.c,4749 :: 		if (exec_checkbox->Active == 1) {
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Press103
;mikromedia_STM32plus_driver.c,4750 :: 		if (exec_checkbox->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_checkbox+0)
MOVT	R4, #hi_addr(_exec_checkbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press104
;mikromedia_STM32plus_driver.c,4751 :: 		exec_checkbox->OnPressPtr();
MOVW	R4, #lo_addr(_exec_checkbox+0)
MOVT	R4, #hi_addr(_exec_checkbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4752 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;mikromedia_STM32plus_driver.c,4753 :: 		}
L_Process_TP_Press104:
;mikromedia_STM32plus_driver.c,4754 :: 		}
L_Process_TP_Press103:
;mikromedia_STM32plus_driver.c,4755 :: 		}
L_Process_TP_Press102:
;mikromedia_STM32plus_driver.c,4757 :: 		}
L_Process_TP_Press86:
;mikromedia_STM32plus_driver.c,4758 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Press
_Process_TP_Up:
;mikromedia_STM32plus_driver.c,4760 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;mikromedia_STM32plus_driver.c,4762 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_Process_TP_Up105
;mikromedia_STM32plus_driver.c,4764 :: 		case 0: {
L_Process_TP_Up107:
;mikromedia_STM32plus_driver.c,4765 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up108
;mikromedia_STM32plus_driver.c,4766 :: 		exec_button = (TButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4767 :: 		if ((exec_button->PressColEnabled == 1) && (exec_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #46
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up209
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up208
L__Process_TP_Up207:
;mikromedia_STM32plus_driver.c,4768 :: 		DrawButton(exec_button);
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,4767 :: 		if ((exec_button->PressColEnabled == 1) && (exec_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up209:
L__Process_TP_Up208:
;mikromedia_STM32plus_driver.c,4770 :: 		break;
IT	AL
BAL	L_Process_TP_Up106
;mikromedia_STM32plus_driver.c,4771 :: 		}
L_Process_TP_Up108:
;mikromedia_STM32plus_driver.c,4772 :: 		break;
IT	AL
BAL	L_Process_TP_Up106
;mikromedia_STM32plus_driver.c,4775 :: 		case 4: {
L_Process_TP_Up112:
;mikromedia_STM32plus_driver.c,4776 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up113
;mikromedia_STM32plus_driver.c,4777 :: 		exec_circle = (TCircle*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4778 :: 		if ((exec_circle->PressColEnabled == 1) && (exec_circle->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up211
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up210
L__Process_TP_Up206:
;mikromedia_STM32plus_driver.c,4779 :: 		DrawCircle(exec_circle);
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawCircle+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,4778 :: 		if ((exec_circle->PressColEnabled == 1) && (exec_circle->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up211:
L__Process_TP_Up210:
;mikromedia_STM32plus_driver.c,4781 :: 		break;
IT	AL
BAL	L_Process_TP_Up106
;mikromedia_STM32plus_driver.c,4782 :: 		}
L_Process_TP_Up113:
;mikromedia_STM32plus_driver.c,4783 :: 		break;
IT	AL
BAL	L_Process_TP_Up106
;mikromedia_STM32plus_driver.c,4786 :: 		case 6: {
L_Process_TP_Up117:
;mikromedia_STM32plus_driver.c,4787 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up118
;mikromedia_STM32plus_driver.c,4788 :: 		exec_box = (TBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4789 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L__Process_TP_Up213
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up212
L__Process_TP_Up205:
;mikromedia_STM32plus_driver.c,4790 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;mikromedia_STM32plus_driver.c,4789 :: 		if ((exec_box->PressColEnabled == 1) && (exec_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up213:
L__Process_TP_Up212:
;mikromedia_STM32plus_driver.c,4792 :: 		break;
IT	AL
BAL	L_Process_TP_Up106
;mikromedia_STM32plus_driver.c,4793 :: 		}
L_Process_TP_Up118:
;mikromedia_STM32plus_driver.c,4794 :: 		break;
IT	AL
BAL	L_Process_TP_Up106
;mikromedia_STM32plus_driver.c,4797 :: 		case 16: {
L_Process_TP_Up122:
;mikromedia_STM32plus_driver.c,4798 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up123
;mikromedia_STM32plus_driver.c,4799 :: 		exec_checkbox = (TCheckBox*)PressedObject;
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4800 :: 		break;
IT	AL
BAL	L_Process_TP_Up106
;mikromedia_STM32plus_driver.c,4801 :: 		}
L_Process_TP_Up123:
;mikromedia_STM32plus_driver.c,4802 :: 		break;
IT	AL
BAL	L_Process_TP_Up106
;mikromedia_STM32plus_driver.c,4804 :: 		}
L_Process_TP_Up105:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up107
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #4
IT	EQ
BEQ	L_Process_TP_Up112
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #6
IT	EQ
BEQ	L_Process_TP_Up117
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #16
IT	EQ
BEQ	L_Process_TP_Up122
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
L_Process_TP_Up106:
;mikromedia_STM32plus_driver.c,4806 :: 		exec_label          = 0;
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4807 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4809 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;mikromedia_STM32plus_driver.c,4812 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Up124
;mikromedia_STM32plus_driver.c,4814 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up125
;mikromedia_STM32plus_driver.c,4815 :: 		if (exec_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up126
;mikromedia_STM32plus_driver.c,4816 :: 		if (exec_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up127
;mikromedia_STM32plus_driver.c,4817 :: 		exec_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up127:
;mikromedia_STM32plus_driver.c,4818 :: 		if (PressedObject == (void *)exec_button)
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up128
;mikromedia_STM32plus_driver.c,4819 :: 		if (exec_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up129
;mikromedia_STM32plus_driver.c,4820 :: 		exec_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up129:
L_Process_TP_Up128:
;mikromedia_STM32plus_driver.c,4821 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4822 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4823 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;mikromedia_STM32plus_driver.c,4824 :: 		}
L_Process_TP_Up126:
;mikromedia_STM32plus_driver.c,4825 :: 		}
L_Process_TP_Up125:
;mikromedia_STM32plus_driver.c,4828 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up130
;mikromedia_STM32plus_driver.c,4829 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up131
;mikromedia_STM32plus_driver.c,4830 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up132
;mikromedia_STM32plus_driver.c,4831 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up132:
;mikromedia_STM32plus_driver.c,4832 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up133
;mikromedia_STM32plus_driver.c,4833 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up134
;mikromedia_STM32plus_driver.c,4834 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up134:
L_Process_TP_Up133:
;mikromedia_STM32plus_driver.c,4835 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4836 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4837 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;mikromedia_STM32plus_driver.c,4838 :: 		}
L_Process_TP_Up131:
;mikromedia_STM32plus_driver.c,4839 :: 		}
L_Process_TP_Up130:
;mikromedia_STM32plus_driver.c,4842 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up135
;mikromedia_STM32plus_driver.c,4843 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up136
;mikromedia_STM32plus_driver.c,4844 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up137
;mikromedia_STM32plus_driver.c,4845 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up137:
;mikromedia_STM32plus_driver.c,4846 :: 		if (PressedObject == (void *)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up138
;mikromedia_STM32plus_driver.c,4847 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up139
;mikromedia_STM32plus_driver.c,4848 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up139:
L_Process_TP_Up138:
;mikromedia_STM32plus_driver.c,4849 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4850 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4851 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;mikromedia_STM32plus_driver.c,4852 :: 		}
L_Process_TP_Up136:
;mikromedia_STM32plus_driver.c,4853 :: 		}
L_Process_TP_Up135:
;mikromedia_STM32plus_driver.c,4856 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up140
;mikromedia_STM32plus_driver.c,4857 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up141
;mikromedia_STM32plus_driver.c,4858 :: 		if (exec_circle->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up142
;mikromedia_STM32plus_driver.c,4859 :: 		exec_circle->OnUpPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up142:
;mikromedia_STM32plus_driver.c,4860 :: 		if (PressedObject == (void *)exec_circle)
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up143
;mikromedia_STM32plus_driver.c,4861 :: 		if (exec_circle->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up144
;mikromedia_STM32plus_driver.c,4862 :: 		exec_circle->OnClickPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up144:
L_Process_TP_Up143:
;mikromedia_STM32plus_driver.c,4863 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4864 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4865 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;mikromedia_STM32plus_driver.c,4866 :: 		}
L_Process_TP_Up141:
;mikromedia_STM32plus_driver.c,4867 :: 		}
L_Process_TP_Up140:
;mikromedia_STM32plus_driver.c,4870 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up145
;mikromedia_STM32plus_driver.c,4871 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up146
;mikromedia_STM32plus_driver.c,4872 :: 		if (exec_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up147
;mikromedia_STM32plus_driver.c,4873 :: 		exec_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up147:
;mikromedia_STM32plus_driver.c,4874 :: 		if (PressedObject == (void *)exec_box)
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up148
;mikromedia_STM32plus_driver.c,4875 :: 		if (exec_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up149
;mikromedia_STM32plus_driver.c,4876 :: 		exec_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up149:
L_Process_TP_Up148:
;mikromedia_STM32plus_driver.c,4877 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4878 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4879 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;mikromedia_STM32plus_driver.c,4880 :: 		}
L_Process_TP_Up146:
;mikromedia_STM32plus_driver.c,4881 :: 		}
L_Process_TP_Up145:
;mikromedia_STM32plus_driver.c,4884 :: 		if (_object_count == checkbox_order) {
MOVW	R2, #lo_addr(_checkbox_order+0)
MOVT	R2, #hi_addr(_checkbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up150
;mikromedia_STM32plus_driver.c,4885 :: 		if (exec_checkbox->Active == 1) {
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up151
;mikromedia_STM32plus_driver.c,4886 :: 		if (exec_checkbox->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_checkbox+0)
MOVT	R4, #hi_addr(_exec_checkbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up152
;mikromedia_STM32plus_driver.c,4887 :: 		exec_checkbox->OnUpPtr();
MOVW	R4, #lo_addr(_exec_checkbox+0)
MOVT	R4, #hi_addr(_exec_checkbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up152:
;mikromedia_STM32plus_driver.c,4888 :: 		if (PressedObject == (void *)exec_checkbox) {
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up153
;mikromedia_STM32plus_driver.c,4889 :: 		if (exec_checkbox->Checked == 1)
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Up154
;mikromedia_STM32plus_driver.c,4890 :: 		exec_checkbox->Checked = 0;
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
LDR	R2, [R2, #0]
ADDW	R3, R2, #20
MOVS	R2, #0
STRB	R2, [R3, #0]
IT	AL
BAL	L_Process_TP_Up155
L_Process_TP_Up154:
;mikromedia_STM32plus_driver.c,4892 :: 		exec_checkbox->Checked = 1;
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
LDR	R2, [R2, #0]
ADDW	R3, R2, #20
MOVS	R2, #1
STRB	R2, [R3, #0]
L_Process_TP_Up155:
;mikromedia_STM32plus_driver.c,4893 :: 		DrawCheckBox(exec_checkbox);
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCheckBox+0
;mikromedia_STM32plus_driver.c,4894 :: 		if (exec_checkbox->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_checkbox+0)
MOVT	R4, #hi_addr(_exec_checkbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up156
;mikromedia_STM32plus_driver.c,4895 :: 		exec_checkbox->OnClickPtr();
MOVW	R4, #lo_addr(_exec_checkbox+0)
MOVT	R4, #hi_addr(_exec_checkbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up156:
;mikromedia_STM32plus_driver.c,4896 :: 		}
L_Process_TP_Up153:
;mikromedia_STM32plus_driver.c,4897 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4898 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4899 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;mikromedia_STM32plus_driver.c,4900 :: 		}
L_Process_TP_Up151:
;mikromedia_STM32plus_driver.c,4901 :: 		}
L_Process_TP_Up150:
;mikromedia_STM32plus_driver.c,4903 :: 		}
L_Process_TP_Up124:
;mikromedia_STM32plus_driver.c,4904 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4905 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4906 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Process_TP_Up
_Process_TP_Down:
;mikromedia_STM32plus_driver.c,4908 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;mikromedia_STM32plus_driver.c,4910 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4911 :: 		exec_button         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4912 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4913 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4914 :: 		exec_circle         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4915 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4916 :: 		exec_checkbox       = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4918 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;mikromedia_STM32plus_driver.c,4920 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Down157
;mikromedia_STM32plus_driver.c,4921 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down158
;mikromedia_STM32plus_driver.c,4922 :: 		if (exec_button->Active == 1) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down159
;mikromedia_STM32plus_driver.c,4923 :: 		if (exec_button->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #46
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down160
;mikromedia_STM32plus_driver.c,4924 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4925 :: 		DrawButton(exec_button);
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawButton+0
;mikromedia_STM32plus_driver.c,4926 :: 		}
L_Process_TP_Down160:
;mikromedia_STM32plus_driver.c,4927 :: 		PressedObject = (void *)exec_button;
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4928 :: 		PressedObjectType = 0;
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4929 :: 		if (exec_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down161
;mikromedia_STM32plus_driver.c,4930 :: 		exec_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4931 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;mikromedia_STM32plus_driver.c,4932 :: 		}
L_Process_TP_Down161:
;mikromedia_STM32plus_driver.c,4933 :: 		}
L_Process_TP_Down159:
;mikromedia_STM32plus_driver.c,4934 :: 		}
L_Process_TP_Down158:
;mikromedia_STM32plus_driver.c,4936 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down162
;mikromedia_STM32plus_driver.c,4937 :: 		if (exec_label->Active == 1) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #27
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down163
;mikromedia_STM32plus_driver.c,4938 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4939 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4940 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down164
;mikromedia_STM32plus_driver.c,4941 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4942 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;mikromedia_STM32plus_driver.c,4943 :: 		}
L_Process_TP_Down164:
;mikromedia_STM32plus_driver.c,4944 :: 		}
L_Process_TP_Down163:
;mikromedia_STM32plus_driver.c,4945 :: 		}
L_Process_TP_Down162:
;mikromedia_STM32plus_driver.c,4947 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down165
;mikromedia_STM32plus_driver.c,4948 :: 		if (exec_image->Active == 1) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down166
;mikromedia_STM32plus_driver.c,4949 :: 		PressedObject = (void *)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4950 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4951 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down167
;mikromedia_STM32plus_driver.c,4952 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4953 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;mikromedia_STM32plus_driver.c,4954 :: 		}
L_Process_TP_Down167:
;mikromedia_STM32plus_driver.c,4955 :: 		}
L_Process_TP_Down166:
;mikromedia_STM32plus_driver.c,4956 :: 		}
L_Process_TP_Down165:
;mikromedia_STM32plus_driver.c,4958 :: 		if (_object_count == circle_order) {
MOVW	R2, #lo_addr(_circle_order+0)
MOVT	R2, #hi_addr(_circle_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down168
;mikromedia_STM32plus_driver.c,4959 :: 		if (exec_circle->Active == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #17
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down169
;mikromedia_STM32plus_driver.c,4960 :: 		if (exec_circle->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down170
;mikromedia_STM32plus_driver.c,4961 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4962 :: 		DrawCircle(exec_circle);
MOVW	R2, #lo_addr(_exec_circle+0)
MOVT	R2, #hi_addr(_exec_circle+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCircle+0
;mikromedia_STM32plus_driver.c,4963 :: 		}
L_Process_TP_Down170:
;mikromedia_STM32plus_driver.c,4964 :: 		PressedObject = (void *)exec_circle;
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4965 :: 		PressedObjectType = 4;
MOVS	R3, #4
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4966 :: 		if (exec_circle->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down171
;mikromedia_STM32plus_driver.c,4967 :: 		exec_circle->OnDownPtr();
MOVW	R4, #lo_addr(_exec_circle+0)
MOVT	R4, #hi_addr(_exec_circle+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4968 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;mikromedia_STM32plus_driver.c,4969 :: 		}
L_Process_TP_Down171:
;mikromedia_STM32plus_driver.c,4970 :: 		}
L_Process_TP_Down169:
;mikromedia_STM32plus_driver.c,4971 :: 		}
L_Process_TP_Down168:
;mikromedia_STM32plus_driver.c,4973 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down172
;mikromedia_STM32plus_driver.c,4974 :: 		if (exec_box->Active == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down173
;mikromedia_STM32plus_driver.c,4975 :: 		if (exec_box->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down174
;mikromedia_STM32plus_driver.c,4976 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4977 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawBox+0
;mikromedia_STM32plus_driver.c,4978 :: 		}
L_Process_TP_Down174:
;mikromedia_STM32plus_driver.c,4979 :: 		PressedObject = (void *)exec_box;
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4980 :: 		PressedObjectType = 6;
MOVS	R3, #6
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4981 :: 		if (exec_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down175
;mikromedia_STM32plus_driver.c,4982 :: 		exec_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4983 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;mikromedia_STM32plus_driver.c,4984 :: 		}
L_Process_TP_Down175:
;mikromedia_STM32plus_driver.c,4985 :: 		}
L_Process_TP_Down173:
;mikromedia_STM32plus_driver.c,4986 :: 		}
L_Process_TP_Down172:
;mikromedia_STM32plus_driver.c,4988 :: 		if (_object_count == checkbox_order) {
MOVW	R2, #lo_addr(_checkbox_order+0)
MOVT	R2, #hi_addr(_checkbox_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down176
;mikromedia_STM32plus_driver.c,4989 :: 		if (exec_checkbox->Active == 1) {
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down177
;mikromedia_STM32plus_driver.c,4990 :: 		if (exec_checkbox->PressColEnabled == 1) {
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Process_TP_Down178
;mikromedia_STM32plus_driver.c,4991 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4992 :: 		DrawCheckBox(exec_checkbox);
MOVW	R2, #lo_addr(_exec_checkbox+0)
MOVT	R2, #hi_addr(_exec_checkbox+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawCheckBox+0
;mikromedia_STM32plus_driver.c,4993 :: 		}
L_Process_TP_Down178:
;mikromedia_STM32plus_driver.c,4994 :: 		PressedObject = (void *)exec_checkbox;
MOVW	R4, #lo_addr(_exec_checkbox+0)
MOVT	R4, #hi_addr(_exec_checkbox+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4995 :: 		PressedObjectType = 16;
MOVS	R3, #16
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;mikromedia_STM32plus_driver.c,4996 :: 		if (exec_checkbox->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down179
;mikromedia_STM32plus_driver.c,4997 :: 		exec_checkbox->OnDownPtr();
MOVW	R4, #lo_addr(_exec_checkbox+0)
MOVT	R4, #hi_addr(_exec_checkbox+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;mikromedia_STM32plus_driver.c,4998 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;mikromedia_STM32plus_driver.c,4999 :: 		}
L_Process_TP_Down179:
;mikromedia_STM32plus_driver.c,5000 :: 		}
L_Process_TP_Down177:
;mikromedia_STM32plus_driver.c,5001 :: 		}
L_Process_TP_Down176:
;mikromedia_STM32plus_driver.c,5003 :: 		}
L_Process_TP_Down157:
;mikromedia_STM32plus_driver.c,5004 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Down
_Check_TP:
;mikromedia_STM32plus_driver.c,5006 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,5007 :: 		if (STMPE610_PressDetect()) {
BL	_STMPE610_PressDetect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP180
;mikromedia_STM32plus_driver.c,5008 :: 		if (STMPE610_GetLastCoordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_STMPE610_GetLastCoordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP181
;mikromedia_STM32plus_driver.c,5010 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Press+0
;mikromedia_STM32plus_driver.c,5011 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP182
;mikromedia_STM32plus_driver.c,5012 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,5013 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Down+0
;mikromedia_STM32plus_driver.c,5014 :: 		}
L_Check_TP182:
;mikromedia_STM32plus_driver.c,5015 :: 		}
L_Check_TP181:
;mikromedia_STM32plus_driver.c,5016 :: 		}
IT	AL
BAL	L_Check_TP183
L_Check_TP180:
;mikromedia_STM32plus_driver.c,5017 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP184
;mikromedia_STM32plus_driver.c,5018 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,5019 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Up+0
;mikromedia_STM32plus_driver.c,5020 :: 		}
L_Check_TP184:
L_Check_TP183:
;mikromedia_STM32plus_driver.c,5021 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;mikromedia_STM32plus_driver.c,5023 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,5025 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;mikromedia_STM32plus_driver.c,5026 :: 		for (_cnt = 0; _cnt < 20; _cnt++) {
; _cnt start address is: 8 (R2)
MOVS	R2, #0
; _cnt end address is: 8 (R2)
L_Init_MCU185:
; _cnt start address is: 8 (R2)
CMP	R2, #20
IT	CS
BCS	L_Init_MCU186
;mikromedia_STM32plus_driver.c,5027 :: 		GPIOB_ODR.B6 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,5028 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_Init_MCU188:
SUBS	R7, R7, #1
BNE	L_Init_MCU188
NOP
NOP
NOP
;mikromedia_STM32plus_driver.c,5029 :: 		GPIOB_ODR.B6 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,5030 :: 		Delay_ms(1);
MOVW	R7, #49998
MOVT	R7, #0
NOP
NOP
L_Init_MCU190:
SUBS	R7, R7, #1
BNE	L_Init_MCU190
NOP
NOP
NOP
;mikromedia_STM32plus_driver.c,5026 :: 		for (_cnt = 0; _cnt < 20; _cnt++) {
ADDS	R2, R2, #1
UXTB	R2, R2
;mikromedia_STM32plus_driver.c,5031 :: 		}
; _cnt end address is: 8 (R2)
IT	AL
BAL	L_Init_MCU185
L_Init_MCU186:
;mikromedia_STM32plus_driver.c,5033 :: 		I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C1_Init_Advanced+0
;mikromedia_STM32plus_driver.c,5034 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;mikromedia_STM32plus_driver.c,5035 :: 		GPIO_Digital_Output(&GPIOG_BASE, 0x00FF);
MOVS	R1, #255
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
;mikromedia_STM32plus_driver.c,5036 :: 		GPIO_Digital_Output(&GPIOE_BASE, 0xFF00);
MOVW	R1, #65280
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;mikromedia_STM32plus_driver.c,5037 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;mikromedia_STM32plus_driver.c,5038 :: 		GPIOB_ODR.B4 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,5039 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;mikromedia_STM32plus_driver.c,5040 :: 		TFT_Set_MM_Plus();
BL	_TFT_Set_MM_Plus+0
;mikromedia_STM32plus_driver.c,5041 :: 		STMPE610_SetDefaultMode();
BL	_STMPE610_SetDefaultMode+0
;mikromedia_STM32plus_driver.c,5042 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_STMPE610_Config:
;mikromedia_STM32plus_driver.c,5044 :: 		char STMPE610_Config()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,5045 :: 		STMPE610_SetI2CAddress(STMPE610_I2C_ADDR1);
MOVS	R0, #136
BL	_STMPE610_SetI2CAddress+0
;mikromedia_STM32plus_driver.c,5046 :: 		if (STMPE610_IsOperational() != 0){
BL	_STMPE610_IsOperational+0
CMP	R0, #0
IT	EQ
BEQ	L_STMPE610_Config192
;mikromedia_STM32plus_driver.c,5047 :: 		return STMPE610_IO_NOT_OPERATIONAL;
MOVS	R0, #4
IT	AL
BAL	L_end_STMPE610_Config
;mikromedia_STM32plus_driver.c,5048 :: 		}
L_STMPE610_Config192:
;mikromedia_STM32plus_driver.c,5050 :: 		STMPE610_Reset();
BL	_STMPE610_Reset+0
;mikromedia_STM32plus_driver.c,5051 :: 		STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #3
BL	_STMPE610_Module+0
;mikromedia_STM32plus_driver.c,5052 :: 		STMPE610_AlternateFunction(STMPE610_GPIO_PIN1, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #2
BL	_STMPE610_AlternateFunction+0
;mikromedia_STM32plus_driver.c,5053 :: 		STMPE610_SetGPIOPin(STMPE610_GPIO_PIN1, 0);   // IN1 to "0" -> I2C communication
MOVS	R1, #0
MOVS	R0, #2
BL	_STMPE610_SetGPIOPin+0
;mikromedia_STM32plus_driver.c,5054 :: 		STMPE610_SetSize(480,272);
MOVW	R1, #272
MOVW	R0, #480
BL	_STMPE610_SetSize+0
;mikromedia_STM32plus_driver.c,5055 :: 		STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #3
BL	_STMPE610_Module+0
;mikromedia_STM32plus_driver.c,5056 :: 		STMPE610_EnableInterrupt(STMPE610_IE_TOUCH_DET | STMPE610_IE_FIFO_TH | STMPE610_IE_FIFO_0FLOW, STMPE610_ENABLE);
MOVS	R1, #1
MOVS	R0, #7
BL	_STMPE610_EnableInterrupt+0
;mikromedia_STM32plus_driver.c,5057 :: 		STMPE610_ConfigureInterrupt(STMPE610_INT_POLARITY_ACTIVE_HIGH | STMPE610_INT_TYPE_EDGE | STMPE610_INT_ENABLE_ALL);
MOVS	R0, #7
BL	_STMPE610_ConfigureInterrupt+0
;mikromedia_STM32plus_driver.c,5058 :: 		STMPE610_SetADC(STMPE610_ADC_CTRL1_SAMPLETIME_44 | STMPE610_ADC_CTRL1_ADC_10BIT | STMPE610_ADC_CTRL1_INT_REFERENCE);
MOVS	R0, #16
BL	_STMPE610_SetADC+0
;mikromedia_STM32plus_driver.c,5059 :: 		Delay_10ms(); Delay_10ms();
BL	_Delay_10ms+0
BL	_Delay_10ms+0
;mikromedia_STM32plus_driver.c,5060 :: 		STMPE610_SetADCClock(STMPE610_ADC_CTRL2_6500_kHZ);
MOVS	R0, #2
BL	_STMPE610_SetADCClock+0
;mikromedia_STM32plus_driver.c,5061 :: 		STMPE610_AlternateFunction(STMPE610_GPIO_PIN4 | STMPE610_GPIO_PIN5 | STMPE610_GPIO_PIN6 | STMPE610_GPIO_PIN7, STMPE610_DISABLE);
MOVS	R1, #0
MOVS	R0, #240
BL	_STMPE610_AlternateFunction+0
;mikromedia_STM32plus_driver.c,5062 :: 		STMPE610_ConfigureTSC(STMPE610_TSC_CFG_AVE_CTRL_8S, STMPE610_TSC_CFG_TOUCH_DET_DELAY_500uS, STMPE610_TSC_CFG_TOUCH_SETTLING_500uS);
MOVS	R2, #2
MOVS	R1, #24
MOVS	R0, #192
BL	_STMPE610_ConfigureTSC+0
;mikromedia_STM32plus_driver.c,5063 :: 		STMPE610_SetFIFOThreshold(1);
MOVS	R0, #1
BL	_STMPE610_SetFIFOThreshold+0
;mikromedia_STM32plus_driver.c,5064 :: 		STMPE610_ResetFIFO();
BL	_STMPE610_ResetFIFO+0
;mikromedia_STM32plus_driver.c,5065 :: 		STMPE610_TSIDrive(STMPE610_TSC_I_DRIVE_20mA);
MOVS	R0, #0
BL	_STMPE610_TSIDrive+0
;mikromedia_STM32plus_driver.c,5066 :: 		STMPE610_TSControl(STMPE610_TSC_CTRL_TRACK0 | STMPE610_TSC_CTRL_ACQU_XYZ | STMPE610_TSC_CTRL_ENABLE);
MOVS	R0, #1
BL	_STMPE610_TSControl+0
;mikromedia_STM32plus_driver.c,5067 :: 		STMPE610_ZDataFraction(STMPE610_FRACP4_WHOLP4);
MOVS	R0, #4
BL	_STMPE610_ZDataFraction+0
;mikromedia_STM32plus_driver.c,5068 :: 		STMPE610_SetTouchPressureThreshold(70);
MOVS	R0, #70
BL	_STMPE610_SetTouchPressureThreshold+0
;mikromedia_STM32plus_driver.c,5069 :: 		STMPE610_ClearInterrupts();
BL	_STMPE610_ClearInterrupts+0
;mikromedia_STM32plus_driver.c,5070 :: 		STMPE610_WriteReg(STMPE610_INT_CTRL_REG, 0x01);
MOVS	R1, #1
MOVS	R0, #9
BL	_STMPE610_WriteReg+0
;mikromedia_STM32plus_driver.c,5071 :: 		return STMPE610_OK;
MOVS	R0, #0
;mikromedia_STM32plus_driver.c,5072 :: 		}
L_end_STMPE610_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _STMPE610_Config
_Start_TP:
;mikromedia_STM32plus_driver.c,5075 :: 		void Start_TP() {
SUB	SP, SP, #16
STR	LR, [SP, #0]
;mikromedia_STM32plus_driver.c,5077 :: 		Init_MCU();
BL	_Init_MCU+0
;mikromedia_STM32plus_driver.c,5079 :: 		InitializeTouchPanel();
BL	mikromedia_STM32plus_driver_InitializeTouchPanel+0
;mikromedia_STM32plus_driver.c,5080 :: 		if (STMPE610_Config() == STMPE610_OK) {
BL	_STMPE610_Config+0
CMP	R0, #0
IT	NE
BNE	L_Start_TP193
;mikromedia_STM32plus_driver.c,5081 :: 		} else {
IT	AL
BAL	L_Start_TP194
L_Start_TP193:
;mikromedia_STM32plus_driver.c,5082 :: 		while(1);
L_Start_TP195:
IT	AL
BAL	L_Start_TP195
;mikromedia_STM32plus_driver.c,5083 :: 		}
L_Start_TP194:
;mikromedia_STM32plus_driver.c,5087 :: 		TPConstsStruct.X_Min = 105;
MOVS	R0, #105
STRH	R0, [SP, #4]
;mikromedia_STM32plus_driver.c,5088 :: 		TPConstsStruct.X_Max = 3925;
MOVW	R0, #3925
STRH	R0, [SP, #6]
;mikromedia_STM32plus_driver.c,5089 :: 		TPConstsStruct.Y_Min = 250;
MOVS	R0, #250
STRH	R0, [SP, #8]
;mikromedia_STM32plus_driver.c,5090 :: 		TPConstsStruct.Y_Max = 3820;
MOVW	R0, #3820
STRH	R0, [SP, #10]
;mikromedia_STM32plus_driver.c,5091 :: 		TPConstsStruct.Rotate = 0;
MOVS	R0, #0
STRB	R0, [SP, #12]
;mikromedia_STM32plus_driver.c,5092 :: 		STMPE610_SetCalibrationConsts(&TPConstsStruct);
ADD	R0, SP, #4
BL	_STMPE610_SetCalibrationConsts+0
;mikromedia_STM32plus_driver.c,5094 :: 		InitializeObjects();
BL	mikromedia_STM32plus_driver_InitializeObjects+0
;mikromedia_STM32plus_driver.c,5095 :: 		display_width = Home.Width;
MOVW	R0, #lo_addr(_Home+2)
MOVT	R0, #hi_addr(_Home+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,5096 :: 		display_height = Home.Height;
MOVW	R0, #lo_addr(_Home+4)
MOVT	R0, #hi_addr(_Home+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;mikromedia_STM32plus_driver.c,5097 :: 		DrawScreen(&Home);
MOVW	R0, #lo_addr(_Home+0)
MOVT	R0, #hi_addr(_Home+0)
BL	_DrawScreen+0
;mikromedia_STM32plus_driver.c,5098 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Start_TP
mikromedia_STM32plus_driver____?ag:
L_end_mikromedia_STM32plus_driver___?ag:
BX	LR
; end of mikromedia_STM32plus_driver____?ag
