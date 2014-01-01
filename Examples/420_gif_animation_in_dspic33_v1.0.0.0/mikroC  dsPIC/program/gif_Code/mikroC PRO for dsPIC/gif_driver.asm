
_Set_Index:

;gif_driver.c,60 :: 		void Set_Index(unsigned short index) {
;gif_driver.c,61 :: 		TFT_RS = 0;
	BCLR	LATB15_bit, BitPos(LATB15_bit+0)
;gif_driver.c,62 :: 		Lo(LATA) = index;
	MOV	#lo_addr(LATA), W0
	MOV.B	W10, [W0]
;gif_driver.c,63 :: 		TFT_WR = 0;
	BCLR	LATD13_bit, BitPos(LATD13_bit+0)
;gif_driver.c,64 :: 		TFT_WR = 1;
	BSET	LATD13_bit, BitPos(LATD13_bit+0)
;gif_driver.c,65 :: 		}
L_end_Set_Index:
	RETURN
; end of _Set_Index

_Write_Command:

;gif_driver.c,68 :: 		void Write_Command(unsigned short cmd) {
;gif_driver.c,69 :: 		TFT_RS = 1;
	BSET	LATB15_bit, BitPos(LATB15_bit+0)
;gif_driver.c,70 :: 		Lo(LATA) = cmd;
	MOV	#lo_addr(LATA), W0
	MOV.B	W10, [W0]
;gif_driver.c,71 :: 		TFT_WR = 0;
	BCLR	LATD13_bit, BitPos(LATD13_bit+0)
;gif_driver.c,72 :: 		TFT_WR = 1;
	BSET	LATD13_bit, BitPos(LATD13_bit+0)
;gif_driver.c,73 :: 		}
L_end_Write_Command:
	RETURN
; end of _Write_Command

_Write_Data:

;gif_driver.c,76 :: 		void Write_Data(unsigned int _data) {
;gif_driver.c,77 :: 		TFT_RS = 1;
	BSET	LATB15_bit, BitPos(LATB15_bit+0)
;gif_driver.c,78 :: 		Lo(LATE) = Hi(_data);
	MOV	#lo_addr(W10), W0
	INC	W0
	MOV.B	[W0], W1
	MOV	#lo_addr(LATE), W0
	MOV.B	W1, [W0]
;gif_driver.c,79 :: 		Lo(LATA) = Lo(_data);
	MOV	#lo_addr(LATA), W0
	MOV.B	W10, [W0]
;gif_driver.c,80 :: 		TFT_WR = 0;
	BCLR	LATD13_bit, BitPos(LATD13_bit+0)
;gif_driver.c,81 :: 		TFT_WR = 1;
	BSET	LATD13_bit, BitPos(LATD13_bit+0)
;gif_driver.c,82 :: 		}
L_end_Write_Data:
	RETURN
; end of _Write_Data

_TFT_Get_Data:
	LNK	#6

;gif_driver.c,85 :: 		char* TFT_Get_Data(unsigned long offset, unsigned int count, unsigned int *num) {
;gif_driver.c,89 :: 		start_sector = Mmc_Get_File_Write_Sector() + offset/512;
	PUSH	W10
	PUSH	W11
	CALL	_Mmc_Get_File_Write_Sector
	MOV	#9, W4
	MOV.D	W10, W2
L__TFT_Get_Data43:
	DEC	W4, W4
	BRA LT	L__TFT_Get_Data44
	LSR	W3, W3
	RRC	W2, W2
	BRA	L__TFT_Get_Data43
L__TFT_Get_Data44:
	ADD	W0, W2, W2
	ADDC	W1, W3, W3
	MOV	W2, [W14+0]
	MOV	W3, [W14+2]
;gif_driver.c,90 :: 		pos = (unsigned long)offset%512;
	MOV	#511, W0
	MOV	#0, W1
	AND	W10, W0, W0
	AND	W11, W1, W1
	MOV	W0, [W14+4]
;gif_driver.c,92 :: 		if(start_sector == currentSector+1) {
	MOV	_currentSector, W0
	MOV	_currentSector+2, W1
	ADD	W0, #1, W0
	ADDC	W1, #0, W1
	CP	W2, W0
	CPB	W3, W1
	BRA Z	L__TFT_Get_Data45
	GOTO	L_TFT_Get_Data0
L__TFT_Get_Data45:
;gif_driver.c,93 :: 		Mmc_Multi_Read_Sector(f16_sector.fSect);
	PUSH.D	W12
	MOV	#lo_addr(_f16_sector), W10
	CALL	_Mmc_Multi_Read_Sector
	POP.D	W12
;gif_driver.c,94 :: 		currentSector = start_sector;
	MOV	[W14+0], W0
	MOV	[W14+2], W1
	MOV	W0, _currentSector
	MOV	W1, _currentSector+2
;gif_driver.c,95 :: 		} else if (start_sector != currentSector) {
	GOTO	L_TFT_Get_Data1
L_TFT_Get_Data0:
	MOV	[W14+0], W1
	MOV	[W14+2], W2
	MOV	#lo_addr(_currentSector), W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__TFT_Get_Data46
	GOTO	L_TFT_Get_Data2
L__TFT_Get_Data46:
;gif_driver.c,96 :: 		if(currentSector != -1)
	MOV	#65535, W1
	MOV	#65535, W2
	MOV	#lo_addr(_currentSector), W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA NZ	L__TFT_Get_Data47
	GOTO	L_TFT_Get_Data3
L__TFT_Get_Data47:
;gif_driver.c,97 :: 		Mmc_Multi_Read_Stop();
	PUSH.D	W12
	CALL	_Mmc_Multi_Read_Stop
	POP.D	W12
L_TFT_Get_Data3:
;gif_driver.c,98 :: 		Mmc_Multi_Read_Start(start_sector);
	PUSH.D	W12
	MOV	[W14+0], W10
	MOV	[W14+2], W11
	CALL	_Mmc_Multi_Read_Start
;gif_driver.c,99 :: 		Mmc_Multi_Read_Sector(f16_sector.fSect);
	MOV	#lo_addr(_f16_sector), W10
	CALL	_Mmc_Multi_Read_Sector
	POP.D	W12
;gif_driver.c,100 :: 		currentSector = start_sector;
	MOV	[W14+0], W0
	MOV	[W14+2], W1
	MOV	W0, _currentSector
	MOV	W1, _currentSector+2
;gif_driver.c,101 :: 		}
L_TFT_Get_Data2:
L_TFT_Get_Data1:
;gif_driver.c,103 :: 		if(count>512-pos)
	MOV	#512, W1
	ADD	W14, #4, W0
	SUB	W1, [W0], W0
	CP	W12, W0
	BRA GTU	L__TFT_Get_Data48
	GOTO	L_TFT_Get_Data4
L__TFT_Get_Data48:
;gif_driver.c,104 :: 		*num = 512-pos;
	MOV	#512, W1
	ADD	W14, #4, W0
	SUB	W1, [W0], W0
	MOV	W0, [W13]
	GOTO	L_TFT_Get_Data5
L_TFT_Get_Data4:
;gif_driver.c,106 :: 		*num = count;
	MOV	W12, [W13]
L_TFT_Get_Data5:
;gif_driver.c,108 :: 		return f16_sector.fSect+pos;
	MOV	#lo_addr(_f16_sector), W1
	ADD	W14, #4, W0
	ADD	W1, [W0], W0
;gif_driver.c,109 :: 		}
;gif_driver.c,108 :: 		return f16_sector.fSect+pos;
;gif_driver.c,109 :: 		}
L_end_TFT_Get_Data:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _TFT_Get_Data

gif_driver_InitializeTouchPanel:

;gif_driver.c,110 :: 		static void InitializeTouchPanel() {
;gif_driver.c,111 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_Write_Data), W12
	MOV	#lo_addr(_Write_Command), W11
	MOV	#lo_addr(_Set_Index), W10
	CALL	_TFT_Set_Active
;gif_driver.c,112 :: 		TFT_Init(240, 320);
	MOV	#320, W11
	MOV	#240, W10
	CALL	_TFT_Init
;gif_driver.c,113 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
	MOV	#lo_addr(_TFT_Get_Data), W10
	CALL	_TFT_Set_Ext_Buffer
;gif_driver.c,115 :: 		}
L_end_InitializeTouchPanel:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of gif_driver_InitializeTouchPanel

gif_driver_InitializeObjects:

;gif_driver.c,157 :: 		static void InitializeObjects() {
;gif_driver.c,158 :: 		Screen1.Color                     = 0xC618;
	MOV	#50712, W0
	MOV	W0, _Screen1
;gif_driver.c,159 :: 		Screen1.Width                     = 240;
	MOV	#240, W0
	MOV	W0, _Screen1+2
;gif_driver.c,160 :: 		Screen1.Height                    = 320;
	MOV	#320, W0
	MOV	W0, _Screen1+4
;gif_driver.c,161 :: 		Screen1.ImagesCount               = 14;
	MOV	#14, W0
	MOV	W0, _Screen1+8
;gif_driver.c,162 :: 		Screen1.Images                    = Screen1_Images;
	MOV	#lo_addr(_Screen1_Images), W0
	MOV	#higher_addr(_Screen1_Images), W1
	MOV	W0, _Screen1+10
	MOV	W1, _Screen1+12
;gif_driver.c,163 :: 		Screen1.ObjectsCount              = 14;
	MOV	#lo_addr(_Screen1+6), W1
	MOV.B	#14, W0
	MOV.B	W0, [W1]
;gif_driver.c,166 :: 		Image2.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image2
;gif_driver.c,167 :: 		Image2.Order          = 0;
	MOV	#lo_addr(_Image2+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;gif_driver.c,168 :: 		Image2.Left           = 0;
	CLR	W0
	MOV	W0, _Image2+4
;gif_driver.c,169 :: 		Image2.Top            = 0;
	CLR	W0
	MOV	W0, _Image2+6
;gif_driver.c,170 :: 		Image2.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image2+8
;gif_driver.c,171 :: 		Image2.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image2+10
;gif_driver.c,172 :: 		Image2.Picture_Type        = 1;
	MOV	#lo_addr(_Image2+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,173 :: 		Image2.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image2+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,174 :: 		Image2.Picture_Name   = a_jpg;
	MOV	#288, W0
	MOV	#0, W1
	MOV	W0, _Image2+12
	MOV	W1, _Image2+14
;gif_driver.c,175 :: 		Image2.Visible        = 1;
	MOV	#lo_addr(_Image2+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,176 :: 		Image2.Active         = 1;
	MOV	#lo_addr(_Image2+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,177 :: 		Image2.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image2+20
;gif_driver.c,178 :: 		Image2.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image2+22
;gif_driver.c,179 :: 		Image2.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image2+24
;gif_driver.c,180 :: 		Image2.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image2+26
;gif_driver.c,182 :: 		Image1.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image1
;gif_driver.c,183 :: 		Image1.Order          = 1;
	MOV	#lo_addr(_Image1+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,184 :: 		Image1.Left           = 0;
	CLR	W0
	MOV	W0, _Image1+4
;gif_driver.c,185 :: 		Image1.Top            = 0;
	CLR	W0
	MOV	W0, _Image1+6
;gif_driver.c,186 :: 		Image1.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image1+8
;gif_driver.c,187 :: 		Image1.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image1+10
;gif_driver.c,188 :: 		Image1.Picture_Type        = 1;
	MOV	#lo_addr(_Image1+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,189 :: 		Image1.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image1+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,190 :: 		Image1.Picture_Name   = b_jpg;
	MOV	#22822, W0
	MOV	#2, W1
	MOV	W0, _Image1+12
	MOV	W1, _Image1+14
;gif_driver.c,191 :: 		Image1.Visible        = 1;
	MOV	#lo_addr(_Image1+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,192 :: 		Image1.Active         = 1;
	MOV	#lo_addr(_Image1+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,193 :: 		Image1.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image1+20
;gif_driver.c,194 :: 		Image1.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image1+22
;gif_driver.c,195 :: 		Image1.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image1+24
;gif_driver.c,196 :: 		Image1.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image1+26
;gif_driver.c,198 :: 		Image3.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image3
;gif_driver.c,199 :: 		Image3.Order          = 2;
	MOV	#lo_addr(_Image3+2), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;gif_driver.c,200 :: 		Image3.Left           = 0;
	CLR	W0
	MOV	W0, _Image3+4
;gif_driver.c,201 :: 		Image3.Top            = 0;
	CLR	W0
	MOV	W0, _Image3+6
;gif_driver.c,202 :: 		Image3.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image3+8
;gif_driver.c,203 :: 		Image3.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image3+10
;gif_driver.c,204 :: 		Image3.Picture_Type        = 1;
	MOV	#lo_addr(_Image3+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,205 :: 		Image3.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image3+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,206 :: 		Image3.Picture_Name   = c_jpg;
	MOV	#45356, W0
	MOV	#4, W1
	MOV	W0, _Image3+12
	MOV	W1, _Image3+14
;gif_driver.c,207 :: 		Image3.Visible        = 1;
	MOV	#lo_addr(_Image3+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,208 :: 		Image3.Active         = 1;
	MOV	#lo_addr(_Image3+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,209 :: 		Image3.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image3+20
;gif_driver.c,210 :: 		Image3.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image3+22
;gif_driver.c,211 :: 		Image3.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image3+24
;gif_driver.c,212 :: 		Image3.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image3+26
;gif_driver.c,214 :: 		Image4.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image4
;gif_driver.c,215 :: 		Image4.Order          = 3;
	MOV	#lo_addr(_Image4+2), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;gif_driver.c,216 :: 		Image4.Left           = 0;
	CLR	W0
	MOV	W0, _Image4+4
;gif_driver.c,217 :: 		Image4.Top            = 0;
	CLR	W0
	MOV	W0, _Image4+6
;gif_driver.c,218 :: 		Image4.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image4+8
;gif_driver.c,219 :: 		Image4.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image4+10
;gif_driver.c,220 :: 		Image4.Picture_Type        = 1;
	MOV	#lo_addr(_Image4+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,221 :: 		Image4.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image4+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,222 :: 		Image4.Picture_Name   = d_jpg;
	MOV	#2354, W0
	MOV	#7, W1
	MOV	W0, _Image4+12
	MOV	W1, _Image4+14
;gif_driver.c,223 :: 		Image4.Visible        = 1;
	MOV	#lo_addr(_Image4+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,224 :: 		Image4.Active         = 1;
	MOV	#lo_addr(_Image4+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,225 :: 		Image4.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image4+20
;gif_driver.c,226 :: 		Image4.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image4+22
;gif_driver.c,227 :: 		Image4.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image4+24
;gif_driver.c,228 :: 		Image4.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image4+26
;gif_driver.c,230 :: 		Image5.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image5
;gif_driver.c,231 :: 		Image5.Order          = 4;
	MOV	#lo_addr(_Image5+2), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;gif_driver.c,232 :: 		Image5.Left           = 0;
	CLR	W0
	MOV	W0, _Image5+4
;gif_driver.c,233 :: 		Image5.Top            = 0;
	CLR	W0
	MOV	W0, _Image5+6
;gif_driver.c,234 :: 		Image5.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image5+8
;gif_driver.c,235 :: 		Image5.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image5+10
;gif_driver.c,236 :: 		Image5.Picture_Type        = 1;
	MOV	#lo_addr(_Image5+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,237 :: 		Image5.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image5+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,238 :: 		Image5.Picture_Name   = e_jpg;
	MOV	#24888, W0
	MOV	#9, W1
	MOV	W0, _Image5+12
	MOV	W1, _Image5+14
;gif_driver.c,239 :: 		Image5.Visible        = 1;
	MOV	#lo_addr(_Image5+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,240 :: 		Image5.Active         = 1;
	MOV	#lo_addr(_Image5+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,241 :: 		Image5.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image5+20
;gif_driver.c,242 :: 		Image5.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image5+22
;gif_driver.c,243 :: 		Image5.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image5+24
;gif_driver.c,244 :: 		Image5.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image5+26
;gif_driver.c,246 :: 		Image6.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image6
;gif_driver.c,247 :: 		Image6.Order          = 5;
	MOV	#lo_addr(_Image6+2), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
;gif_driver.c,248 :: 		Image6.Left           = 0;
	CLR	W0
	MOV	W0, _Image6+4
;gif_driver.c,249 :: 		Image6.Top            = 0;
	CLR	W0
	MOV	W0, _Image6+6
;gif_driver.c,250 :: 		Image6.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image6+8
;gif_driver.c,251 :: 		Image6.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image6+10
;gif_driver.c,252 :: 		Image6.Picture_Type        = 1;
	MOV	#lo_addr(_Image6+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,253 :: 		Image6.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image6+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,254 :: 		Image6.Picture_Name   = f_jpg;
	MOV	#47422, W0
	MOV	#11, W1
	MOV	W0, _Image6+12
	MOV	W1, _Image6+14
;gif_driver.c,255 :: 		Image6.Visible        = 1;
	MOV	#lo_addr(_Image6+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,256 :: 		Image6.Active         = 1;
	MOV	#lo_addr(_Image6+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,257 :: 		Image6.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image6+20
;gif_driver.c,258 :: 		Image6.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image6+22
;gif_driver.c,259 :: 		Image6.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image6+24
;gif_driver.c,260 :: 		Image6.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image6+26
;gif_driver.c,262 :: 		Image7.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image7
;gif_driver.c,263 :: 		Image7.Order          = 6;
	MOV	#lo_addr(_Image7+2), W1
	MOV.B	#6, W0
	MOV.B	W0, [W1]
;gif_driver.c,264 :: 		Image7.Left           = 0;
	CLR	W0
	MOV	W0, _Image7+4
;gif_driver.c,265 :: 		Image7.Top            = 0;
	CLR	W0
	MOV	W0, _Image7+6
;gif_driver.c,266 :: 		Image7.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image7+8
;gif_driver.c,267 :: 		Image7.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image7+10
;gif_driver.c,268 :: 		Image7.Picture_Type        = 1;
	MOV	#lo_addr(_Image7+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,269 :: 		Image7.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image7+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,270 :: 		Image7.Picture_Name   = g_jpg;
	MOV	#4420, W0
	MOV	#14, W1
	MOV	W0, _Image7+12
	MOV	W1, _Image7+14
;gif_driver.c,271 :: 		Image7.Visible        = 1;
	MOV	#lo_addr(_Image7+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,272 :: 		Image7.Active         = 1;
	MOV	#lo_addr(_Image7+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,273 :: 		Image7.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image7+20
;gif_driver.c,274 :: 		Image7.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image7+22
;gif_driver.c,275 :: 		Image7.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image7+24
;gif_driver.c,276 :: 		Image7.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image7+26
;gif_driver.c,278 :: 		Image8.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image8
;gif_driver.c,279 :: 		Image8.Order          = 7;
	MOV	#lo_addr(_Image8+2), W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
;gif_driver.c,280 :: 		Image8.Left           = 0;
	CLR	W0
	MOV	W0, _Image8+4
;gif_driver.c,281 :: 		Image8.Top            = 0;
	CLR	W0
	MOV	W0, _Image8+6
;gif_driver.c,282 :: 		Image8.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image8+8
;gif_driver.c,283 :: 		Image8.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image8+10
;gif_driver.c,284 :: 		Image8.Picture_Type        = 1;
	MOV	#lo_addr(_Image8+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,285 :: 		Image8.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image8+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,286 :: 		Image8.Picture_Name   = h_jpg;
	MOV	#26954, W0
	MOV	#16, W1
	MOV	W0, _Image8+12
	MOV	W1, _Image8+14
;gif_driver.c,287 :: 		Image8.Visible        = 1;
	MOV	#lo_addr(_Image8+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,288 :: 		Image8.Active         = 1;
	MOV	#lo_addr(_Image8+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,289 :: 		Image8.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image8+20
;gif_driver.c,290 :: 		Image8.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image8+22
;gif_driver.c,291 :: 		Image8.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image8+24
;gif_driver.c,292 :: 		Image8.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image8+26
;gif_driver.c,294 :: 		Image9.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image9
;gif_driver.c,295 :: 		Image9.Order          = 8;
	MOV	#lo_addr(_Image9+2), W1
	MOV.B	#8, W0
	MOV.B	W0, [W1]
;gif_driver.c,296 :: 		Image9.Left           = 0;
	CLR	W0
	MOV	W0, _Image9+4
;gif_driver.c,297 :: 		Image9.Top            = 0;
	CLR	W0
	MOV	W0, _Image9+6
;gif_driver.c,298 :: 		Image9.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image9+8
;gif_driver.c,299 :: 		Image9.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image9+10
;gif_driver.c,300 :: 		Image9.Picture_Type        = 1;
	MOV	#lo_addr(_Image9+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,301 :: 		Image9.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image9+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,302 :: 		Image9.Picture_Name   = i_jpg;
	MOV	#49488, W0
	MOV	#18, W1
	MOV	W0, _Image9+12
	MOV	W1, _Image9+14
;gif_driver.c,303 :: 		Image9.Visible        = 1;
	MOV	#lo_addr(_Image9+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,304 :: 		Image9.Active         = 1;
	MOV	#lo_addr(_Image9+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,305 :: 		Image9.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image9+20
;gif_driver.c,306 :: 		Image9.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image9+22
;gif_driver.c,307 :: 		Image9.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image9+24
;gif_driver.c,308 :: 		Image9.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image9+26
;gif_driver.c,310 :: 		Image10.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image10
;gif_driver.c,311 :: 		Image10.Order          = 9;
	MOV	#lo_addr(_Image10+2), W1
	MOV.B	#9, W0
	MOV.B	W0, [W1]
;gif_driver.c,312 :: 		Image10.Left           = 0;
	CLR	W0
	MOV	W0, _Image10+4
;gif_driver.c,313 :: 		Image10.Top            = 0;
	CLR	W0
	MOV	W0, _Image10+6
;gif_driver.c,314 :: 		Image10.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image10+8
;gif_driver.c,315 :: 		Image10.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image10+10
;gif_driver.c,316 :: 		Image10.Picture_Type        = 1;
	MOV	#lo_addr(_Image10+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,317 :: 		Image10.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image10+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,318 :: 		Image10.Picture_Name   = j_jpg;
	MOV	#6486, W0
	MOV	#21, W1
	MOV	W0, _Image10+12
	MOV	W1, _Image10+14
;gif_driver.c,319 :: 		Image10.Visible        = 1;
	MOV	#lo_addr(_Image10+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,320 :: 		Image10.Active         = 1;
	MOV	#lo_addr(_Image10+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,321 :: 		Image10.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image10+20
;gif_driver.c,322 :: 		Image10.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image10+22
;gif_driver.c,323 :: 		Image10.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image10+24
;gif_driver.c,324 :: 		Image10.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image10+26
;gif_driver.c,326 :: 		Image11.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image11
;gif_driver.c,327 :: 		Image11.Order          = 10;
	MOV	#lo_addr(_Image11+2), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;gif_driver.c,328 :: 		Image11.Left           = 0;
	CLR	W0
	MOV	W0, _Image11+4
;gif_driver.c,329 :: 		Image11.Top            = 0;
	CLR	W0
	MOV	W0, _Image11+6
;gif_driver.c,330 :: 		Image11.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image11+8
;gif_driver.c,331 :: 		Image11.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image11+10
;gif_driver.c,332 :: 		Image11.Picture_Type        = 1;
	MOV	#lo_addr(_Image11+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,333 :: 		Image11.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image11+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,334 :: 		Image11.Picture_Name   = k_jpg;
	MOV	#29020, W0
	MOV	#23, W1
	MOV	W0, _Image11+12
	MOV	W1, _Image11+14
;gif_driver.c,335 :: 		Image11.Visible        = 1;
	MOV	#lo_addr(_Image11+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,336 :: 		Image11.Active         = 1;
	MOV	#lo_addr(_Image11+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,337 :: 		Image11.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image11+20
;gif_driver.c,338 :: 		Image11.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image11+22
;gif_driver.c,339 :: 		Image11.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image11+24
;gif_driver.c,340 :: 		Image11.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image11+26
;gif_driver.c,342 :: 		Image12.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image12
;gif_driver.c,343 :: 		Image12.Order          = 11;
	MOV	#lo_addr(_Image12+2), W1
	MOV.B	#11, W0
	MOV.B	W0, [W1]
;gif_driver.c,344 :: 		Image12.Left           = 0;
	CLR	W0
	MOV	W0, _Image12+4
;gif_driver.c,345 :: 		Image12.Top            = 0;
	CLR	W0
	MOV	W0, _Image12+6
;gif_driver.c,346 :: 		Image12.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image12+8
;gif_driver.c,347 :: 		Image12.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image12+10
;gif_driver.c,348 :: 		Image12.Picture_Type        = 1;
	MOV	#lo_addr(_Image12+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,349 :: 		Image12.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image12+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,350 :: 		Image12.Picture_Name   = l_jpg;
	MOV	#51554, W0
	MOV	#25, W1
	MOV	W0, _Image12+12
	MOV	W1, _Image12+14
;gif_driver.c,351 :: 		Image12.Visible        = 1;
	MOV	#lo_addr(_Image12+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,352 :: 		Image12.Active         = 1;
	MOV	#lo_addr(_Image12+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,353 :: 		Image12.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image12+20
;gif_driver.c,354 :: 		Image12.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image12+22
;gif_driver.c,355 :: 		Image12.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image12+24
;gif_driver.c,356 :: 		Image12.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image12+26
;gif_driver.c,358 :: 		Image13.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image13
;gif_driver.c,359 :: 		Image13.Order          = 12;
	MOV	#lo_addr(_Image13+2), W1
	MOV.B	#12, W0
	MOV.B	W0, [W1]
;gif_driver.c,360 :: 		Image13.Left           = 0;
	CLR	W0
	MOV	W0, _Image13+4
;gif_driver.c,361 :: 		Image13.Top            = 0;
	CLR	W0
	MOV	W0, _Image13+6
;gif_driver.c,362 :: 		Image13.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image13+8
;gif_driver.c,363 :: 		Image13.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image13+10
;gif_driver.c,364 :: 		Image13.Picture_Type        = 1;
	MOV	#lo_addr(_Image13+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,365 :: 		Image13.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image13+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,366 :: 		Image13.Picture_Name   = m_jpg;
	MOV	#8552, W0
	MOV	#28, W1
	MOV	W0, _Image13+12
	MOV	W1, _Image13+14
;gif_driver.c,367 :: 		Image13.Visible        = 1;
	MOV	#lo_addr(_Image13+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,368 :: 		Image13.Active         = 1;
	MOV	#lo_addr(_Image13+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,369 :: 		Image13.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image13+20
;gif_driver.c,370 :: 		Image13.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image13+22
;gif_driver.c,371 :: 		Image13.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image13+24
;gif_driver.c,372 :: 		Image13.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image13+26
;gif_driver.c,374 :: 		Image14.OwnerScreen     = &Screen1;
	MOV	#lo_addr(_Screen1), W0
	MOV	W0, _Image14
;gif_driver.c,375 :: 		Image14.Order          = 13;
	MOV	#lo_addr(_Image14+2), W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
;gif_driver.c,376 :: 		Image14.Left           = 0;
	CLR	W0
	MOV	W0, _Image14+4
;gif_driver.c,377 :: 		Image14.Top            = 0;
	CLR	W0
	MOV	W0, _Image14+6
;gif_driver.c,378 :: 		Image14.Width          = 240;
	MOV	#240, W0
	MOV	W0, _Image14+8
;gif_driver.c,379 :: 		Image14.Height         = 320;
	MOV	#320, W0
	MOV	W0, _Image14+10
;gif_driver.c,380 :: 		Image14.Picture_Type        = 1;
	MOV	#lo_addr(_Image14+18), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,381 :: 		Image14.Picture_Ratio  = 1;
	MOV	#lo_addr(_Image14+19), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,382 :: 		Image14.Picture_Name   = n_jpg;
	MOV	#31086, W0
	MOV	#30, W1
	MOV	W0, _Image14+12
	MOV	W1, _Image14+14
;gif_driver.c,383 :: 		Image14.Visible        = 1;
	MOV	#lo_addr(_Image14+16), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,384 :: 		Image14.Active         = 1;
	MOV	#lo_addr(_Image14+17), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;gif_driver.c,385 :: 		Image14.OnUpPtr         = 0;
	CLR	W0
	MOV	W0, _Image14+20
;gif_driver.c,386 :: 		Image14.OnDownPtr       = 0;
	CLR	W0
	MOV	W0, _Image14+22
;gif_driver.c,387 :: 		Image14.OnClickPtr      = 0;
	CLR	W0
	MOV	W0, _Image14+24
;gif_driver.c,388 :: 		Image14.OnPressPtr      = 0;
	CLR	W0
	MOV	W0, _Image14+26
;gif_driver.c,389 :: 		}
L_end_InitializeObjects:
	RETURN
; end of gif_driver_InitializeObjects

gif_driver_IsInsideObject:
	LNK	#0

;gif_driver.c,391 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
;gif_driver.c,392 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
; Width start address is: 2 (W1)
	MOV	[W14-8], W1
; Height start address is: 4 (W2)
	MOV	[W14-10], W2
	CP	W12, W10
	BRA LEU	L_gif_driver_IsInsideObject52
	GOTO	L_gif_driver_IsInsideObject35
L_gif_driver_IsInsideObject52:
	ADD	W12, W1, W0
; Width end address is: 2 (W1)
	DEC	W0
	CP	W0, W10
	BRA GEU	L_gif_driver_IsInsideObject53
	GOTO	L_gif_driver_IsInsideObject34
L_gif_driver_IsInsideObject53:
;gif_driver.c,393 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
	CP	W13, W11
	BRA LEU	L_gif_driver_IsInsideObject54
	GOTO	L_gif_driver_IsInsideObject33
L_gif_driver_IsInsideObject54:
	ADD	W13, W2, W0
; Height end address is: 4 (W2)
	DEC	W0
	CP	W0, W11
	BRA GEU	L_gif_driver_IsInsideObject55
	GOTO	L_gif_driver_IsInsideObject32
L_gif_driver_IsInsideObject55:
L_gif_driver_IsInsideObject31:
;gif_driver.c,394 :: 		return 1;
	MOV.B	#1, W0
	GOTO	L_end_IsInsideObject
;gif_driver.c,392 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_gif_driver_IsInsideObject35:
L_gif_driver_IsInsideObject34:
;gif_driver.c,393 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_gif_driver_IsInsideObject33:
L_gif_driver_IsInsideObject32:
;gif_driver.c,396 :: 		return 0;
	CLR	W0
;gif_driver.c,397 :: 		}
L_end_IsInsideObject:
	ULNK
	RETURN
; end of gif_driver_IsInsideObject

_DeleteTrailingSpaces:

;gif_driver.c,402 :: 		void DeleteTrailingSpaces(char* str){
;gif_driver.c,405 :: 		while(1) {
L_DeleteTrailingSpaces10:
;gif_driver.c,406 :: 		if(str[0] == ' ') {
	MOV.B	[W10], W1
	MOV.B	#32, W0
	CP.B	W1, W0
	BRA Z	L__DeleteTrailingSpaces57
	GOTO	L_DeleteTrailingSpaces12
L__DeleteTrailingSpaces57:
;gif_driver.c,407 :: 		for(i = 0; i < strlen(str); i++) {
; i start address is: 4 (W2)
	CLR	W2
; i end address is: 4 (W2)
L_DeleteTrailingSpaces13:
; i start address is: 4 (W2)
	CALL	_strlen
	ZE	W2, W1
	CP	W1, W0
	BRA LT	L__DeleteTrailingSpaces58
	GOTO	L_DeleteTrailingSpaces14
L__DeleteTrailingSpaces58:
;gif_driver.c,408 :: 		str[i] = str[i+1];
	ZE	W2, W0
	ADD	W10, W0, W1
	ZE	W2, W0
	INC	W0
	ADD	W10, W0, W0
	MOV.B	[W0], [W1]
;gif_driver.c,407 :: 		for(i = 0; i < strlen(str); i++) {
	INC.B	W2
;gif_driver.c,409 :: 		}
; i end address is: 4 (W2)
	GOTO	L_DeleteTrailingSpaces13
L_DeleteTrailingSpaces14:
;gif_driver.c,410 :: 		}
	GOTO	L_DeleteTrailingSpaces16
L_DeleteTrailingSpaces12:
;gif_driver.c,412 :: 		break;
	GOTO	L_DeleteTrailingSpaces11
L_DeleteTrailingSpaces16:
;gif_driver.c,413 :: 		}
	GOTO	L_DeleteTrailingSpaces10
L_DeleteTrailingSpaces11:
;gif_driver.c,414 :: 		}
L_end_DeleteTrailingSpaces:
	RETURN
; end of _DeleteTrailingSpaces

_DrawImage:

;gif_driver.c,416 :: 		void DrawImage(TImage *AImage) {
;gif_driver.c,417 :: 		if (AImage->Visible) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W10, #16, W0
	CP0.B	[W0]
	BRA NZ	L__DrawImage60
	GOTO	L_DrawImage17
L__DrawImage60:
;gif_driver.c,418 :: 		TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
	ADD	W10, #19, W0
	MOV.B	[W0], W3
	ADD	W10, #12, W2
	ADD	W10, #6, W1
	ADD	W10, #4, W0
	MOV.D	[W2], W12
	MOV	[W1], W11
	MOV	[W0], W10
	ZE	W3, W0
	PUSH	W0
	CALL	_TFT_Ext_Image
	SUB	#2, W15
;gif_driver.c,419 :: 		}
L_DrawImage17:
;gif_driver.c,420 :: 		}
L_end_DrawImage:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawImage

_DrawScreen:
	LNK	#8

;gif_driver.c,422 :: 		void DrawScreen(TScreen *aScreen) {
;gif_driver.c,428 :: 		object_pressed = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_object_pressed), W1
	CLR	W0
	MOV.B	W0, [W1]
;gif_driver.c,429 :: 		order = 0;
	CLR	W0
	MOV	W0, [W14+0]
;gif_driver.c,430 :: 		image_idx = 0;
	CLR	W0
	MOV.B	W0, [W14+2]
;gif_driver.c,431 :: 		CurrentScreen = aScreen;
	MOV	W10, _CurrentScreen
;gif_driver.c,433 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
	ADD	W10, #2, W0
	MOV	[W0], W1
	MOV	#lo_addr(_display_width), W0
	CP	W1, [W0]
	BRA Z	L__DrawScreen62
	GOTO	L__DrawScreen38
L__DrawScreen62:
	MOV	_CurrentScreen, W0
	ADD	W0, #4, W0
	MOV	[W0], W1
	MOV	#lo_addr(_display_height), W0
	CP	W1, [W0]
	BRA Z	L__DrawScreen63
	GOTO	L__DrawScreen37
L__DrawScreen63:
	GOTO	L_DrawScreen20
L__DrawScreen38:
L__DrawScreen37:
;gif_driver.c,434 :: 		save_bled = TFT_BLED;
	ADD	W14, #6, W0
	CLR.B	[W0]
	BTSC	LATD7_bit, BitPos(LATD7_bit+0)
	INC.B	[W0], [W0]
;gif_driver.c,435 :: 		save_bled_direction = TFT_BLED_Direction;
	ADD	W14, #7, W0
	CLR.B	[W0]
	BTSC	TRISD7_bit, BitPos(TRISD7_bit+0)
	INC.B	[W0], [W0]
;gif_driver.c,436 :: 		TFT_BLED_Direction = 0;
	BCLR	TRISD7_bit, BitPos(TRISD7_bit+0)
;gif_driver.c,437 :: 		TFT_BLED           = 0;
	BCLR	LATD7_bit, BitPos(LATD7_bit+0)
;gif_driver.c,438 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
	PUSH	W10
	MOV	#lo_addr(_Write_Data), W12
	MOV	#lo_addr(_Write_Command), W11
	MOV	#lo_addr(_Set_Index), W10
	CALL	_TFT_Set_Active
;gif_driver.c,439 :: 		TFT_Init(CurrentScreen->Width, CurrentScreen->Height);
	MOV	_CurrentScreen, W0
	ADD	W0, #4, W1
	MOV	_CurrentScreen, W0
	INC2	W0
	MOV	[W1], W11
	MOV	[W0], W10
	CALL	_TFT_Init
;gif_driver.c,440 :: 		TFT_Set_Ext_Buffer(TFT_Get_Data);
	MOV	#lo_addr(_TFT_Get_Data), W10
	CALL	_TFT_Set_Ext_Buffer
;gif_driver.c,441 :: 		TFT_Fill_Screen(CurrentScreen->Color);
	MOV	_CurrentScreen, W0
	MOV	[W0], W10
	CALL	_TFT_Fill_Screen
	POP	W10
;gif_driver.c,442 :: 		display_width = CurrentScreen->Width;
	MOV	_CurrentScreen, W0
	INC2	W0
	MOV	[W0], W0
	MOV	W0, _display_width
;gif_driver.c,443 :: 		display_height = CurrentScreen->Height;
	MOV	_CurrentScreen, W0
	ADD	W0, #4, W0
	MOV	[W0], W0
	MOV	W0, _display_height
;gif_driver.c,444 :: 		TFT_BLED           = save_bled;
	ADD	W14, #6, W0
	MOV.B	[W0], W0
	BTSS	W0, #0
	BCLR	LATD7_bit, BitPos(LATD7_bit+0)
	BTSC	W0, #0
	BSET	LATD7_bit, BitPos(LATD7_bit+0)
;gif_driver.c,445 :: 		TFT_BLED_Direction = save_bled_direction;
	ADD	W14, #7, W0
	MOV.B	[W0], W0
	BTSS	W0, #0
	BCLR	TRISD7_bit, BitPos(TRISD7_bit+0)
	BTSC	W0, #0
	BSET	TRISD7_bit, BitPos(TRISD7_bit+0)
;gif_driver.c,446 :: 		}
	GOTO	L_DrawScreen21
L_DrawScreen20:
;gif_driver.c,448 :: 		TFT_Fill_Screen(CurrentScreen->Color);
	MOV	_CurrentScreen, W0
	MOV	[W0], W10
	CALL	_TFT_Fill_Screen
L_DrawScreen21:
;gif_driver.c,451 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen22:
	MOV	_CurrentScreen, W0
	ADD	W0, #6, W0
	MOV.B	[W0], W0
	ZE	W0, W1
	ADD	W14, #0, W0
	CP	W1, [W0]
	BRA GT	L__DrawScreen64
	GOTO	L_DrawScreen23
L__DrawScreen64:
;gif_driver.c,452 :: 		if (image_idx  < CurrentScreen->ImagesCount) {
	MOV	_CurrentScreen, W0
	ADD	W0, #8, W0
	MOV	[W0], W1
	ADD	W14, #2, W0
	ZE	[W0], W0
	CP	W0, W1
	BRA LTU	L__DrawScreen65
	GOTO	L_DrawScreen24
L__DrawScreen65:
;gif_driver.c,453 :: 		local_image = GetImage(image_idx);
	MOV	_CurrentScreen, W0
	ADD	W0, #10, W4
	ADD	W14, #2, W0
	ZE	[W0], W0
	CLR	W1
	MOV.D	W0, W2
	SL	W2, W2
	RLC	W3, W3
	ADD	W2, [W4++], W0
	ADDC	W3, [W4--], W1
	MOV	W1, 52
	MOV	[W0], W0
	MOV	W0, [W14+4]
;gif_driver.c,454 :: 		if (order == local_image->Order) {
	INC2	W0
	MOV.B	[W0], W0
	ZE	W0, W1
	ADD	W14, #0, W0
	CP	W1, [W0]
	BRA Z	L__DrawScreen66
	GOTO	L_DrawScreen25
L__DrawScreen66:
;gif_driver.c,455 :: 		image_idx++;
	MOV.B	[W14+2], W1
	ADD	W14, #2, W0
	ADD.B	W1, #1, [W0]
;gif_driver.c,456 :: 		order++;
	MOV	[W14+0], W1
	ADD	W14, #0, W0
	ADD	W1, #1, [W0]
;gif_driver.c,457 :: 		DrawImage(local_image);
	PUSH	W10
	MOV	[W14+4], W10
	CALL	_DrawImage
	POP	W10
;gif_driver.c,458 :: 		}
L_DrawScreen25:
;gif_driver.c,459 :: 		}
L_DrawScreen24:
;gif_driver.c,461 :: 		}
	GOTO	L_DrawScreen22
L_DrawScreen23:
;gif_driver.c,462 :: 		}
L_end_DrawScreen:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _DrawScreen

_Init_MCU:

;gif_driver.c,464 :: 		void Init_MCU() {
;gif_driver.c,465 :: 		TRISE = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	TRISE
;gif_driver.c,466 :: 		TFT_DataPort_Direction = 0;
	CLR.B	TRISA
;gif_driver.c,467 :: 		CLKDIVbits.PLLPRE = 0;      // PLLPRE<4:0> = 0  ->  N1 = 2    8MHz / 2 = 4MHz
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;gif_driver.c,469 :: 		PLLFBD =   38;              // PLLDIV<8:0> = 38 ->  M = 40    4MHz * 40 = 160MHz
	MOV	#38, W0
	MOV	WREG, PLLFBD
;gif_driver.c,471 :: 		CLKDIVbits.PLLPOST = 0;     // PLLPOST<1:0> = 0 ->  N2 = 2    160MHz / 2 = 80MHz
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;gif_driver.c,473 :: 		Delay_ms(150);
	MOV	#31, W8
	MOV	#33929, W7
L_Init_MCU26:
	DEC	W7
	BRA NZ	L_Init_MCU26
	DEC	W8
	BRA NZ	L_Init_MCU26
;gif_driver.c,475 :: 		TFT_Set_Active(Set_Index,Write_Command,Write_Data);
	MOV	#lo_addr(_Write_Data), W12
	MOV	#lo_addr(_Write_Command), W11
	MOV	#lo_addr(_Set_Index), W10
	CALL	_TFT_Set_Active
;gif_driver.c,476 :: 		}
L_end_Init_MCU:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Init_MCU

_Init_Ext_Mem:

;gif_driver.c,478 :: 		void Init_Ext_Mem() {
;gif_driver.c,480 :: 		SPI2_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, _SPI_PRESCALE_SEC_1, _SPI_PRESCALE_PRI_64,
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W13
	MOV	#28, W12
	CLR	W11
	MOV	#32, W10
;gif_driver.c,481 :: 		_SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);
	MOV	#256, W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CALL	_SPI2_Init_Advanced
	SUB	#8, W15
;gif_driver.c,482 :: 		Delay_ms(10);
	MOV	#3, W8
	MOV	#2261, W7
L_Init_Ext_Mem28:
	DEC	W7
	BRA NZ	L_Init_Ext_Mem28
	DEC	W8
	BRA NZ	L_Init_Ext_Mem28
;gif_driver.c,485 :: 		if (!Mmc_Fat_Init()) {
	CALL	_Mmc_Fat_Init
	CP0.B	W0
	BRA Z	L__Init_Ext_Mem69
	GOTO	L_Init_Ext_Mem30
L__Init_Ext_Mem69:
;gif_driver.c,487 :: 		SPI2_Init_Advanced(_SPI_MASTER, _SPI_8_BIT, _SPI_PRESCALE_SEC_1, _SPI_PRESCALE_PRI_4,
	MOV	#2, W13
	MOV	#28, W12
	CLR	W11
	MOV	#32, W10
;gif_driver.c,488 :: 		_SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_IDLE_2_ACTIVE);
	MOV	#256, W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CALL	_SPI2_Init_Advanced
	SUB	#8, W15
;gif_driver.c,491 :: 		Mmc_Fat_Assign("gif_reso.RES", 0);
	CLR	W11
	MOV	#lo_addr(?lstr1_gif_driver), W10
	CALL	_Mmc_Fat_Assign
;gif_driver.c,492 :: 		Mmc_Fat_Reset(&res_file_size);
	MOV	#lo_addr(_res_file_size), W10
	CALL	_Mmc_Fat_Reset
;gif_driver.c,493 :: 		}
L_Init_Ext_Mem30:
;gif_driver.c,494 :: 		}
L_end_Init_Ext_Mem:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Init_Ext_Mem

_Start_TP:

;gif_driver.c,496 :: 		void Start_TP() {
;gif_driver.c,497 :: 		Init_MCU();
	PUSH	W10
	CALL	_Init_MCU
;gif_driver.c,499 :: 		Init_Ext_Mem();
	CALL	_Init_Ext_Mem
;gif_driver.c,501 :: 		InitializeTouchPanel();
	CALL	gif_driver_InitializeTouchPanel
;gif_driver.c,503 :: 		InitializeObjects();
	CALL	gif_driver_InitializeObjects
;gif_driver.c,504 :: 		display_width = Screen1.Width;
	MOV	_Screen1+2, W0
	MOV	W0, _display_width
;gif_driver.c,505 :: 		display_height = Screen1.Height;
	MOV	_Screen1+4, W0
	MOV	W0, _display_height
;gif_driver.c,506 :: 		DrawScreen(&Screen1);
	MOV	#lo_addr(_Screen1), W10
	CALL	_DrawScreen
;gif_driver.c,507 :: 		}
L_end_Start_TP:
	POP	W10
	RETURN
; end of _Start_TP

gif_driver____?ag:

L_end_gif_driver___?ag:
	RETURN
; end of gif_driver____?ag
