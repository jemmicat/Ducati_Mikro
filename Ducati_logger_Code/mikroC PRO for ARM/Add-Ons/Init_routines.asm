_Init_GPIO:
;Init_routines.c,42 :: 		void Init_GPIO(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Init_routines.c,47 :: 		GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_15);
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
;Init_routines.c,48 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3 | _GPIO_PINMASK_4);
MOVS	R1, #24
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Init_routines.c,51 :: 		Power_Man_Init();
BL	_Power_Man_Init+0
;Init_routines.c,54 :: 		Fat_Initialized_Flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Fat_Initialized_Flag+0)
MOVT	R0, #hi_addr(_Fat_Initialized_Flag+0)
STRB	R1, [R0, #0]
;Init_routines.c,55 :: 		Ext_res_initialized = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Ext_res_initialized+0)
MOVT	R0, #hi_addr(_Ext_res_initialized+0)
STRB	R1, [R0, #0]
;Init_routines.c,56 :: 		Ext_fhandle = 0xFF;
MOVS	R1, #255
SXTB	R1, R1
MOVW	R0, #lo_addr(_Ext_fhandle+0)
MOVT	R0, #hi_addr(_Ext_fhandle+0)
STRB	R1, [R0, #0]
;Init_routines.c,57 :: 		}
L_end_Init_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_GPIO
_MyTFT_Get_Data:
;Init_routines.c,68 :: 		char* MyTFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
SUB	SP, SP, #16
STR	LR, [SP, #0]
STR	R1, [SP, #8]
STR	R2, [SP, #12]
;Init_routines.c,72 :: 		FAT32_Seek(Ext_fhandle, offset);
MOVW	R3, #lo_addr(_Ext_fhandle+0)
MOVT	R3, #hi_addr(_Ext_fhandle+0)
LDRSB	R3, [R3, #0]
STR	R0, [SP, #4]
MOV	R1, R0
SXTB	R0, R3
BL	_FAT32_Seek+0
LDR	R0, [SP, #4]
;Init_routines.c,73 :: 		pos = (unsigned long)offset%512;
MOVW	R3, #511
AND	R3, R0, R3, LSL #0
UXTH	R0, R3
;Init_routines.c,74 :: 		FAT32_Read(Ext_fhandle, My_Ext_Data_Buffer, 512);
MOVW	R3, #lo_addr(_Ext_fhandle+0)
MOVT	R3, #hi_addr(_Ext_fhandle+0)
LDRSB	R3, [R3, #0]
STRH	R0, [SP, #4]
MOVW	R2, #512
MOVW	R1, #lo_addr(_My_Ext_Data_Buffer+0)
MOVT	R1, #hi_addr(_My_Ext_Data_Buffer+0)
SXTB	R0, R3
BL	_FAT32_Read+0
LDRH	R0, [SP, #4]
;Init_routines.c,76 :: 		if(count>512-pos)
RSB	R4, R0, #512
UXTH	R4, R4
LDR	R3, [SP, #8]
CMP	R3, R4
IT	LS
BLS	L_MyTFT_Get_Data0
;Init_routines.c,77 :: 		*num = 512-pos;
RSB	R4, R0, #512
UXTH	R4, R4
LDR	R3, [SP, #12]
STR	R4, [R3, #0]
IT	AL
BAL	L_MyTFT_Get_Data1
L_MyTFT_Get_Data0:
;Init_routines.c,79 :: 		*num = count;
LDR	R4, [SP, #8]
LDR	R3, [SP, #12]
STR	R4, [R3, #0]
L_MyTFT_Get_Data1:
;Init_routines.c,81 :: 		return My_Ext_Data_Buffer;
MOVW	R0, #lo_addr(_My_Ext_Data_Buffer+0)
MOVT	R0, #hi_addr(_My_Ext_Data_Buffer+0)
;Init_routines.c,82 :: 		}
L_end_MyTFT_Get_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _MyTFT_Get_Data
_Init_FAT:
;Init_routines.c,92 :: 		char Init_FAT(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Init_routines.c,93 :: 		char FAT_cnt = 0;
; FAT_cnt start address is: 8 (R2)
MOVS	R2, #0
;Init_routines.c,94 :: 		if (MMC_Card_Detect == 0){
MOVW	R1, #lo_addr(GPIOD_IDR+0)
MOVT	R1, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_Init_FAT2
;Init_routines.c,95 :: 		if (Fat_Initialized_Flag == 0){
MOVW	R0, #lo_addr(_Fat_Initialized_Flag+0)
MOVT	R0, #hi_addr(_Fat_Initialized_Flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Init_FAT3
; FAT_cnt end address is: 8 (R2)
UXTB	R1, R2
;Init_routines.c,96 :: 		while ((Fat32_Init() != 0) && (FAT_cnt < 5))
L_Init_FAT4:
; FAT_cnt start address is: 4 (R1)
STRB	R1, [SP, #4]
BL	_FAT32_Init+0
LDRB	R1, [SP, #4]
CMP	R0, #0
IT	EQ
BEQ	L__Init_FAT13
CMP	R1, #5
IT	CS
BCS	L__Init_FAT12
L__Init_FAT11:
;Init_routines.c,97 :: 		Fat_cnt ++;
ADDS	R1, R1, #1
UXTB	R1, R1
IT	AL
BAL	L_Init_FAT4
;Init_routines.c,96 :: 		while ((Fat32_Init() != 0) && (FAT_cnt < 5))
L__Init_FAT13:
L__Init_FAT12:
;Init_routines.c,98 :: 		if (FAT_cnt < 5){
CMP	R1, #5
IT	CS
BCS	L_Init_FAT8
; FAT_cnt end address is: 4 (R1)
;Init_routines.c,100 :: 		| _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 1, &_GPIO_MODULE_SDIO_D0_D3);
MOVW	R2, #lo_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SDIO_D0_D3+0)
MOVS	R1, #1
MOVW	R0, #2048
BL	_SDIO_Init+0
;Init_routines.c,101 :: 		Fat_Initialized_Flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Fat_Initialized_Flag+0)
MOVT	R0, #hi_addr(_Fat_Initialized_Flag+0)
STRB	R1, [R0, #0]
;Init_routines.c,102 :: 		}
L_Init_FAT8:
;Init_routines.c,103 :: 		}
L_Init_FAT3:
;Init_routines.c,104 :: 		if (Ext_res_initialized == 0){
MOVW	R0, #lo_addr(_Ext_res_initialized+0)
MOVT	R0, #hi_addr(_Ext_res_initialized+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Init_FAT9
;Init_routines.c,105 :: 		TFT_Set_Ext_Buffer(MyTFT_Get_Data);
MOVW	R0, #lo_addr(_MyTFT_Get_Data+0)
MOVT	R0, #hi_addr(_MyTFT_Get_Data+0)
BL	_TFT_Set_Ext_Buffer+0
;Init_routines.c,106 :: 		Ext_fhandle = FAT32_Open("Ext_reso.RES", 1);
MOVW	R0, #lo_addr(?lstr1_Init_routines+0)
MOVT	R0, #hi_addr(?lstr1_Init_routines+0)
MOVS	R1, #1
BL	_FAT32_Open+0
MOVW	R1, #lo_addr(_Ext_fhandle+0)
MOVT	R1, #hi_addr(_Ext_fhandle+0)
STRB	R0, [R1, #0]
;Init_routines.c,107 :: 		if (Ext_fhandle != 0xFF)
CMP	R0, #255
IT	EQ
BEQ	L_Init_FAT10
;Init_routines.c,108 :: 		Ext_res_initialized = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Ext_res_initialized+0)
MOVT	R0, #hi_addr(_Ext_res_initialized+0)
STRB	R1, [R0, #0]
L_Init_FAT10:
;Init_routines.c,109 :: 		}
L_Init_FAT9:
;Init_routines.c,110 :: 		}
L_Init_FAT2:
;Init_routines.c,112 :: 		return Ext_res_initialized;
MOVW	R0, #lo_addr(_Ext_res_initialized+0)
MOVT	R0, #hi_addr(_Ext_res_initialized+0)
LDRB	R0, [R0, #0]
;Init_routines.c,113 :: 		}
L_end_Init_FAT:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Init_FAT