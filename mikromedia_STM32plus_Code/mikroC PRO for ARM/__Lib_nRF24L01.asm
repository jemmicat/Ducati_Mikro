_nRF_SPI_RW:
;__Lib_nRF24L01.c,65 :: 		unsigned char nRF_SPI_RW(unsigned char byte)
; byte start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; byte end address is: 0 (R0)
; byte start address is: 0 (R0)
;__Lib_nRF24L01.c,67 :: 		return(SPI_Read(byte));                        // Perform HW SPI operation
; byte end address is: 0 (R0)
BL	_SPI_Read+0
UXTB	R0, R0
;__Lib_nRF24L01.c,68 :: 		}
L_end_nRF_SPI_RW:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_SPI_RW
_nRF_SPI_Read:
;__Lib_nRF24L01.c,80 :: 		unsigned char nRF_SPI_Read(unsigned char reg)
; reg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
;__Lib_nRF24L01.c,84 :: 		nRF_CS = 0;                                     // CSN low, initialize SPI communication...
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(nRF_CS+0)
MOVT	R1, #hi_addr(nRF_CS+0)
STR	R2, [R1, #0]
;__Lib_nRF24L01.c,85 :: 		nRF_SPI_RW(reg);                                // Select register to read from..
; reg end address is: 0 (R0)
BL	_nRF_SPI_RW+0
;__Lib_nRF24L01.c,86 :: 		reg_val = nRF_SPI_RW(0);                        // ..then read registervalue
MOVS	R0, #0
BL	_nRF_SPI_RW+0
;__Lib_nRF24L01.c,87 :: 		nRF_CS = 1;                                     // CSN high, terminate SPI communication
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(nRF_CS+0)
MOVT	R1, #hi_addr(nRF_CS+0)
STR	R2, [R1, #0]
;__Lib_nRF24L01.c,89 :: 		return(reg_val);                                // return register value
;__Lib_nRF24L01.c,90 :: 		}
L_end_nRF_SPI_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_SPI_Read
_nRF_SPI_RW_Reg:
;__Lib_nRF24L01.c,102 :: 		unsigned char nRF_SPI_RW_Reg(unsigned char reg, unsigned char value)
; reg start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R1, [SP, #8]
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
;__Lib_nRF24L01.c,106 :: 		nRF_CS = 0;                                     // CSN low, init SPI transaction
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(nRF_CS+0)
MOVT	R2, #hi_addr(nRF_CS+0)
STR	R3, [R2, #0]
;__Lib_nRF24L01.c,107 :: 		status = nRF_SPI_RW(reg);                       // select register
; reg end address is: 0 (R0)
BL	_nRF_SPI_RW+0
STRB	R0, [SP, #4]
;__Lib_nRF24L01.c,108 :: 		nRF_SPI_RW(value);                              // ..and write value to it..
LDRB	R0, [SP, #8]
BL	_nRF_SPI_RW+0
;__Lib_nRF24L01.c,109 :: 		nRF_CS = 1;                                     // CSN high again
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(nRF_CS+0)
MOVT	R2, #hi_addr(nRF_CS+0)
STR	R3, [R2, #0]
;__Lib_nRF24L01.c,111 :: 		return(status);                                 // return nRF24L01 status byte
LDRB	R0, [SP, #4]
;__Lib_nRF24L01.c,112 :: 		}
L_end_nRF_SPI_RW_Reg:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _nRF_SPI_RW_Reg
_nRF_SPI_RW_Reg_IRQ:
;__Lib_nRF24L01.c,124 :: 		unsigned char nRF_SPI_RW_Reg_IRQ(unsigned char reg, unsigned char value)
; reg start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R1, [SP, #8]
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
;__Lib_nRF24L01.c,128 :: 		nRF_CS = 0;                                     // CSN low, init SPI transaction
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(nRF_CS+0)
MOVT	R2, #hi_addr(nRF_CS+0)
STR	R3, [R2, #0]
;__Lib_nRF24L01.c,130 :: 		status = SPI_Read(reg);
; reg end address is: 0 (R0)
BL	_SPI_Read+0
STRB	R0, [SP, #4]
;__Lib_nRF24L01.c,131 :: 		reg = SPI_Read(value);
LDRB	R0, [SP, #8]
BL	_SPI_Read+0
;__Lib_nRF24L01.c,133 :: 		nRF_CS = 1;                                     // CSN high again
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(nRF_CS+0)
MOVT	R2, #hi_addr(nRF_CS+0)
STR	R3, [R2, #0]
;__Lib_nRF24L01.c,135 :: 		return(status);                                 // return nRF24L01 status byte
LDRB	R0, [SP, #4]
;__Lib_nRF24L01.c,136 :: 		}
L_end_nRF_SPI_RW_Reg_IRQ:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _nRF_SPI_RW_Reg_IRQ
_nRF_SPI_Write_Buf:
;__Lib_nRF24L01.c,151 :: 		unsigned char nRF_SPI_Write_Buf(unsigned char reg, unsigned char *pBuf, unsigned char bytes)
; reg start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STR	R1, [SP, #8]
STRB	R2, [SP, #12]
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
;__Lib_nRF24L01.c,155 :: 		nRF_CS = 0;                                     // Set CSN low, init SPI tranaction
MOVS	R4, #0
SXTB	R4, R4
MOVW	R3, #lo_addr(nRF_CS+0)
MOVT	R3, #hi_addr(nRF_CS+0)
STR	R4, [R3, #0]
;__Lib_nRF24L01.c,156 :: 		status = nRF_SPI_RW(reg);                       // Select register to write to and read status byte
; reg end address is: 0 (R0)
BL	_nRF_SPI_RW+0
STRB	R0, [SP, #4]
;__Lib_nRF24L01.c,158 :: 		for(byte_ctr=0; byte_ctr<bytes; byte_ctr++)     // then write all byte in buffer(*pBuf)
MOVS	R3, #0
STRB	R3, [SP, #5]
L_nRF_SPI_Write_Buf0:
LDRB	R4, [SP, #12]
LDRB	R3, [SP, #5]
CMP	R3, R4
IT	CS
BCS	L_nRF_SPI_Write_Buf1
;__Lib_nRF24L01.c,160 :: 		nRF_SPI_RW(*pBuf++);
LDR	R3, [SP, #8]
LDRB	R3, [R3, #0]
UXTB	R0, R3
BL	_nRF_SPI_RW+0
LDR	R3, [SP, #8]
ADDS	R3, R3, #1
STR	R3, [SP, #8]
;__Lib_nRF24L01.c,158 :: 		for(byte_ctr=0; byte_ctr<bytes; byte_ctr++)     // then write all byte in buffer(*pBuf)
LDRB	R3, [SP, #5]
ADDS	R3, R3, #1
STRB	R3, [SP, #5]
;__Lib_nRF24L01.c,161 :: 		}
IT	AL
BAL	L_nRF_SPI_Write_Buf0
L_nRF_SPI_Write_Buf1:
;__Lib_nRF24L01.c,163 :: 		nRF_CS = 1;                                     // Set CSN high again
MOVS	R4, #1
SXTB	R4, R4
MOVW	R3, #lo_addr(nRF_CS+0)
MOVT	R3, #hi_addr(nRF_CS+0)
STR	R4, [R3, #0]
;__Lib_nRF24L01.c,165 :: 		return(status);                                 // return nRF24L01 status byte
LDRB	R0, [SP, #4]
;__Lib_nRF24L01.c,166 :: 		}
L_end_nRF_SPI_Write_Buf:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _nRF_SPI_Write_Buf
_nRF_SPI_Read_Buf:
;__Lib_nRF24L01.c,181 :: 		unsigned char nRF_SPI_Read_Buf(unsigned char reg, unsigned char *pBuf, unsigned char bytes)
; reg start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
STR	R1, [SP, #12]
STRB	R2, [SP, #16]
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
;__Lib_nRF24L01.c,185 :: 		nRF_CS = 0;                                     // Set CSN low, init SPI tranaction
MOVS	R4, #0
SXTB	R4, R4
MOVW	R3, #lo_addr(nRF_CS+0)
MOVT	R3, #hi_addr(nRF_CS+0)
STR	R4, [R3, #0]
;__Lib_nRF24L01.c,186 :: 		status = nRF_SPI_RW(reg);                       // Select register to write to and read status byte
; reg end address is: 0 (R0)
BL	_nRF_SPI_RW+0
STRB	R0, [SP, #8]
;__Lib_nRF24L01.c,188 :: 		for(byte_ctr=0;byte_ctr<bytes;byte_ctr++)       // Perform SPI_RW to read byte from nRF24L01
; byte_ctr start address is: 20 (R5)
MOVS	R5, #0
; byte_ctr end address is: 20 (R5)
UXTB	R1, R5
L_nRF_SPI_Read_Buf3:
; byte_ctr start address is: 4 (R1)
LDRB	R3, [SP, #16]
CMP	R1, R3
IT	CS
BCS	L_nRF_SPI_Read_Buf4
;__Lib_nRF24L01.c,190 :: 		pBuf[byte_ctr] = nRF_SPI_RW(0);
LDR	R3, [SP, #12]
ADDS	R3, R3, R1
STR	R3, [SP, #24]
STRB	R1, [SP, #4]
MOVS	R0, #0
BL	_nRF_SPI_RW+0
LDRB	R1, [SP, #4]
LDR	R3, [SP, #24]
STRB	R0, [R3, #0]
;__Lib_nRF24L01.c,188 :: 		for(byte_ctr=0;byte_ctr<bytes;byte_ctr++)       // Perform SPI_RW to read byte from nRF24L01
ADDS	R3, R1, #1
; byte_ctr end address is: 4 (R1)
; byte_ctr start address is: 20 (R5)
UXTB	R5, R3
;__Lib_nRF24L01.c,191 :: 		}
UXTB	R1, R5
; byte_ctr end address is: 20 (R5)
IT	AL
BAL	L_nRF_SPI_Read_Buf3
L_nRF_SPI_Read_Buf4:
;__Lib_nRF24L01.c,193 :: 		nRF_CS = 1;                                     // Set CSN high again
MOVS	R4, #1
SXTB	R4, R4
MOVW	R3, #lo_addr(nRF_CS+0)
MOVT	R3, #hi_addr(nRF_CS+0)
STR	R4, [R3, #0]
;__Lib_nRF24L01.c,195 :: 		return(status);                                 // return nRF24L01 status byte
LDRB	R0, [SP, #8]
;__Lib_nRF24L01.c,196 :: 		}
L_end_nRF_SPI_Read_Buf:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _nRF_SPI_Read_Buf
_nRF_CE_Pin:
;__Lib_nRF24L01.c,207 :: 		void nRF_CE_Pin(unsigned char action)    // CE pin high, low or pulse..
; action start address is: 0 (R0)
; action end address is: 0 (R0)
; action start address is: 0 (R0)
;__Lib_nRF24L01.c,209 :: 		switch(action)
IT	AL
BAL	L_nRF_CE_Pin6
; action end address is: 0 (R0)
;__Lib_nRF24L01.c,211 :: 		case nRF_CE_LOW:                     // action == 0, CE low
L_nRF_CE_Pin8:
;__Lib_nRF24L01.c,212 :: 		nRF_CE = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(nRF_CE+0)
MOVT	R1, #hi_addr(nRF_CE+0)
STR	R2, [R1, #0]
;__Lib_nRF24L01.c,213 :: 		break;
IT	AL
BAL	L_nRF_CE_Pin7
;__Lib_nRF24L01.c,215 :: 		case nRF_CE_HIGH:                    // action == 1, CE high
L_nRF_CE_Pin9:
;__Lib_nRF24L01.c,216 :: 		nRF_CE = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(nRF_CE+0)
MOVT	R1, #hi_addr(nRF_CE+0)
STR	R2, [R1, #0]
;__Lib_nRF24L01.c,217 :: 		break;
IT	AL
BAL	L_nRF_CE_Pin7
;__Lib_nRF24L01.c,219 :: 		case nRF_CE_PULSE:                   // action == 2, CE pulse (10µs)
L_nRF_CE_Pin10:
;__Lib_nRF24L01.c,220 :: 		nRF_CE = 1;                    // Set CE pin high
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(nRF_CE+0)
MOVT	R1, #hi_addr(nRF_CE+0)
STR	R2, [R1, #0]
;__Lib_nRF24L01.c,221 :: 		TIM2_CR1.CEN = 1;             // Enable timer
MOVW	R1, #lo_addr(TIM2_CR1+0)
MOVT	R1, #hi_addr(TIM2_CR1+0)
STR	R2, [R1, #0]
;__Lib_nRF24L01.c,222 :: 		break;
IT	AL
BAL	L_nRF_CE_Pin7
;__Lib_nRF24L01.c,223 :: 		}
L_nRF_CE_Pin6:
; action start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_nRF_CE_Pin8
CMP	R0, #1
IT	EQ
BEQ	L_nRF_CE_Pin9
CMP	R0, #2
IT	EQ
BEQ	L_nRF_CE_Pin10
; action end address is: 0 (R0)
L_nRF_CE_Pin7:
;__Lib_nRF24L01.c,224 :: 		}
L_end_nRF_CE_Pin:
BX	LR
; end of _nRF_CE_Pin
_nRF24L01_IRQ:
;__Lib_nRF24L01.c,229 :: 		void nRF24L01_IRQ(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;__Lib_nRF24L01.c,233 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;__Lib_nRF24L01.c,234 :: 		temp = nRF_SPI_RW_Reg_IRQ(nRF_MASK_IRQ_FLAGS, nRF_WRITE_REG + nRF_STATUS);
MOVS	R1, #39
MOVS	R0, #112
BL	_nRF_SPI_RW_Reg_IRQ+0
;__Lib_nRF24L01.c,236 :: 		switch(temp & nRF_MASK_IRQ_FLAGS)
AND	R2, R0, #112
UXTB	R2, R2
IT	AL
BAL	L_nRF24L01_IRQ11
;__Lib_nRF24L01.c,238 :: 		case nRF_MAX_RT:
L_nRF24L01_IRQ13:
;__Lib_nRF24L01.c,239 :: 		ucIRQ_Source = nRF_MAX_RT;              // Max Retries
MOVS	R1, #16
MOVW	R0, #lo_addr(_ucIRQ_Source+0)
MOVT	R0, #hi_addr(_ucIRQ_Source+0)
STRB	R1, [R0, #0]
;__Lib_nRF24L01.c,240 :: 		break;
IT	AL
BAL	L_nRF24L01_IRQ12
;__Lib_nRF24L01.c,241 :: 		case nRF_TX_DS:                           // TX data sent
L_nRF24L01_IRQ14:
;__Lib_nRF24L01.c,242 :: 		ucIRQ_Source = nRF_TX_DS;
MOVS	R1, #32
MOVW	R0, #lo_addr(_ucIRQ_Source+0)
MOVT	R0, #hi_addr(_ucIRQ_Source+0)
STRB	R1, [R0, #0]
;__Lib_nRF24L01.c,243 :: 		break;
IT	AL
BAL	L_nRF24L01_IRQ12
;__Lib_nRF24L01.c,244 :: 		case nRF_RX_DR:                           // RX data received
L_nRF24L01_IRQ15:
;__Lib_nRF24L01.c,245 :: 		ucIRQ_Source = nRF_RX_DR;
MOVS	R1, #64
MOVW	R0, #lo_addr(_ucIRQ_Source+0)
MOVT	R0, #hi_addr(_ucIRQ_Source+0)
STRB	R1, [R0, #0]
;__Lib_nRF24L01.c,246 :: 		break;
IT	AL
BAL	L_nRF24L01_IRQ12
;__Lib_nRF24L01.c,247 :: 		}
L_nRF24L01_IRQ11:
CMP	R2, #16
IT	EQ
BEQ	L_nRF24L01_IRQ13
CMP	R2, #32
IT	EQ
BEQ	L_nRF24L01_IRQ14
CMP	R2, #64
IT	EQ
BEQ	L_nRF24L01_IRQ15
L_nRF24L01_IRQ12:
;__Lib_nRF24L01.c,248 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;__Lib_nRF24L01.c,249 :: 		}
L_end_nRF24L01_IRQ:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF24L01_IRQ
_TIMER2_IRQ:
;__Lib_nRF24L01.c,254 :: 		void TIMER2_IRQ(void)
;__Lib_nRF24L01.c,256 :: 		TIM2_CR1.CEN = 0;       // Disable Timer2
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;__Lib_nRF24L01.c,257 :: 		nRF_CE = 0;
MOVW	R0, #lo_addr(nRF_CE+0)
MOVT	R0, #hi_addr(nRF_CE+0)
STR	R1, [R0, #0]
;__Lib_nRF24L01.c,258 :: 		}
L_end_TIMER2_IRQ:
BX	LR
; end of _TIMER2_IRQ
_nRF_Clear_IRQ:
;__Lib_nRF24L01.c,270 :: 		unsigned char nRF_Clear_IRQ(unsigned char irq_flag)
; irq_flag start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; irq_flag end address is: 0 (R0)
; irq_flag start address is: 0 (R0)
;__Lib_nRF24L01.c,272 :: 		return nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_STATUS, irq_flag);
UXTB	R1, R0
; irq_flag end address is: 0 (R0)
MOVS	R0, #39
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,273 :: 		}
L_end_nRF_Clear_IRQ:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_Clear_IRQ
_nRF_Flush_TX:
;__Lib_nRF24L01.c,285 :: 		void nRF_Flush_TX(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;__Lib_nRF24L01.c,287 :: 		nRF_SPI_RW_Reg(nRF_FLUSH_TX,0);
MOVS	R1, #0
MOVS	R0, #225
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,288 :: 		}
L_end_nRF_Flush_TX:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_Flush_TX
_nRF_Flush_RX:
;__Lib_nRF24L01.c,300 :: 		void nRF_Flush_RX(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;__Lib_nRF24L01.c,302 :: 		nRF_SPI_RW_Reg(nRF_FLUSH_RX,0);
MOVS	R1, #0
MOVS	R0, #226
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,303 :: 		}
L_end_nRF_Flush_RX:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_Flush_RX
_nRF_RD_RX_PW_n:
;__Lib_nRF24L01.c,315 :: 		unsigned char nRF_RD_RX_PW_n(unsigned char pipe)
; pipe start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; pipe end address is: 0 (R0)
; pipe start address is: 0 (R0)
;__Lib_nRF24L01.c,317 :: 		return nRF_SPI_Read(nRF_RX_PW_P0 + pipe);
ADDW	R1, R0, #17
; pipe end address is: 0 (R0)
UXTB	R0, R1
BL	_nRF_SPI_Read+0
;__Lib_nRF24L01.c,318 :: 		}
L_end_nRF_RD_RX_PW_n:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_RD_RX_PW_n
_nRF_Get_Status:
;__Lib_nRF24L01.c,330 :: 		unsigned char nRF_Get_Status(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;__Lib_nRF24L01.c,332 :: 		return nRF_SPI_Read(nRF_STATUS);
MOVS	R0, #7
BL	_nRF_SPI_Read+0
;__Lib_nRF24L01.c,333 :: 		}
L_end_nRF_Get_Status:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_Get_Status
_nRF_Get_Current_Pipenum:
;__Lib_nRF24L01.c,345 :: 		unsigned char nRF_Get_Current_Pipenum(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;__Lib_nRF24L01.c,347 :: 		return ((nRF_Get_Status() & nRF_RX_P_NO) >> 1);
BL	_nRF_Get_Status+0
AND	R0, R0, #14
UXTB	R0, R0
LSRS	R0, R0, #1
;__Lib_nRF24L01.c,348 :: 		}
L_end_nRF_Get_Current_Pipenum:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_Get_Current_Pipenum
_nRF_Get_FIFO:
;__Lib_nRF24L01.c,360 :: 		unsigned char nRF_Get_FIFO(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;__Lib_nRF24L01.c,362 :: 		return nRF_SPI_Read(nRF_FIFO_STATUS);
MOVS	R0, #23
BL	_nRF_SPI_Read+0
;__Lib_nRF24L01.c,363 :: 		}
L_end_nRF_Get_FIFO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_Get_FIFO
_nRF_Read_RX_Pload:
;__Lib_nRF24L01.c,375 :: 		unsigned int nRF_Read_RX_Pload(unsigned char *pBuf)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #8]
;__Lib_nRF24L01.c,378 :: 		plWidth = nRF_RD_RX_PW_n(pipe = nRF_Get_Current_Pipenum());   // Read current pipe's payload width
BL	_nRF_Get_Current_Pipenum+0
STRB	R0, [SP, #5]
BL	_nRF_RD_RX_PW_n+0
STRB	R0, [SP, #4]
;__Lib_nRF24L01.c,379 :: 		nRF_SPI_Read_Buf(nRF_RD_RX_PLOAD, pBuf, plWidth);             // Then get RX data
UXTB	R2, R0
LDR	R1, [SP, #8]
MOVS	R0, #97
BL	_nRF_SPI_Read_Buf+0
;__Lib_nRF24L01.c,381 :: 		return ((pipe << 8) + plWidth);                               // return pipe# & pipe#.plWidth
LDRB	R1, [SP, #5]
LSLS	R2, R1, #8
UXTH	R2, R2
LDRB	R1, [SP, #4]
ADDS	R1, R2, R1
UXTH	R0, R1
;__Lib_nRF24L01.c,382 :: 		}
L_end_nRF_Read_RX_Pload:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _nRF_Read_RX_Pload
_nRF_Init:
;__Lib_nRF24L01.c,394 :: 		void nRF_Init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;__Lib_nRF24L01.c,397 :: 		MOVW  R0, #lo_addr(nRF_CS)
MOVW	R0, #lo_addr(nRF_CS+0)
;__Lib_nRF24L01.c,398 :: 		MOVT  R0, #hi_addr(nRF_CS)
MOVT	R0, #hi_addr(nRF_CS+0)
;__Lib_nRF24L01.c,399 :: 		MOV   R1, #1
MOV	R1, #1
;__Lib_nRF24L01.c,400 :: 		LSL   R1, R1, #bitPos(nRF_CS)
LSL	R1, R1, BitPos(nRF_CS+0)
;__Lib_nRF24L01.c,402 :: 		GPIO_Digital_Output(R0, R1);
BL	_GPIO_Digital_Output+0
;__Lib_nRF24L01.c,405 :: 		MOVW R0, #lo_addr(nRF_CE)
MOVW	R0, #lo_addr(nRF_CE+0)
;__Lib_nRF24L01.c,406 :: 		MOVT R0, #hi_addr(nRF_CE)
MOVT	R0, #hi_addr(nRF_CE+0)
;__Lib_nRF24L01.c,407 :: 		MOV  R1, #1
MOV	R1, #1
;__Lib_nRF24L01.c,408 :: 		LSL  R1, R1, #bitPos(nRF_CE)
LSL	R1, R1, BitPos(nRF_CE+0)
;__Lib_nRF24L01.c,410 :: 		GPIO_Digital_Output(R0, R1);
BL	_GPIO_Digital_Output+0
;__Lib_nRF24L01.c,413 :: 		MOVW R0, #lo_addr(nRF_IRQ)
MOVW	R0, #lo_addr(nRF_IRQ+0)
;__Lib_nRF24L01.c,414 :: 		MOVT R0, #hi_addr(nRF_IRQ)
MOVT	R0, #hi_addr(nRF_IRQ+0)
;__Lib_nRF24L01.c,415 :: 		MOV R1, #1
MOV	R1, #1
;__Lib_nRF24L01.c,416 :: 		LSL R1, R1, #bitPos(nRF_IRQ)
LSL	R1, R1, BitPos(nRF_IRQ+0)
;__Lib_nRF24L01.c,418 :: 		GPIO_Digital_Input(R0, R1);
BL	_GPIO_Digital_Input+0
;__Lib_nRF24L01.c,419 :: 		}
L_end_nRF_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_Init
_nRF_TX_Mode_Init_Advanced:
;__Lib_nRF24L01.c,439 :: 		unsigned char outputPower, unsigned char channel)
; outputPower start address is: 12 (R3)
; autoRetransmitCount start address is: 8 (R2)
; autoRetransmitDelay start address is: 4 (R1)
; dataRate start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; outputPower end address is: 12 (R3)
; autoRetransmitCount end address is: 8 (R2)
; autoRetransmitDelay end address is: 4 (R1)
; dataRate end address is: 0 (R0)
; dataRate start address is: 0 (R0)
; autoRetransmitDelay start address is: 4 (R1)
; autoRetransmitCount start address is: 8 (R2)
; outputPower start address is: 12 (R3)
LDRB	R4, [SP, #8]
STRB	R4, [SP, #8]
;__Lib_nRF24L01.c,445 :: 		setupRetr = autoRetransmitDelay + autoRetransmitCount;
ADDS	R4, R1, R2
; autoRetransmitDelay end address is: 4 (R1)
; autoRetransmitCount end address is: 8 (R2)
STRB	R4, [SP, #4]
;__Lib_nRF24L01.c,446 :: 		rfSetup   = dataRate + outputPower + 1;// + 0x20;
ADDS	R4, R0, R3
SXTH	R4, R4
; dataRate end address is: 0 (R0)
; outputPower end address is: 12 (R3)
ADDS	R4, R4, #1
STRB	R4, [SP, #5]
;__Lib_nRF24L01.c,447 :: 		ucCom_Mode = nRF_TX_MODE;
MOVS	R5, #0
MOVW	R4, #lo_addr(_ucCom_Mode+0)
MOVT	R4, #hi_addr(_ucCom_Mode+0)
STRB	R5, [R4, #0]
;__Lib_nRF24L01.c,449 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;__Lib_nRF24L01.c,451 :: 		nRF_CE_Pin(nRF_CE_LOW);
MOVS	R0, #0
BL	_nRF_CE_Pin+0
;__Lib_nRF24L01.c,453 :: 		nRF_Flush_TX();
BL	_nRF_Flush_TX+0
;__Lib_nRF24L01.c,454 :: 		nRF_Flush_RX();
BL	_nRF_Flush_RX+0
;__Lib_nRF24L01.c,456 :: 		nRF_Clear_IRQ(nRF_MASK_IRQ_FLAGS);                           // Clear interrupts
MOVS	R0, #112
BL	_nRF_Clear_IRQ+0
;__Lib_nRF24L01.c,457 :: 		ucIRQ_Source = nRF_IDLE;
MOVS	R5, #0
MOVW	R4, #lo_addr(_ucIRQ_Source+0)
MOVT	R4, #hi_addr(_ucIRQ_Source+0)
STRB	R5, [R4, #0]
;__Lib_nRF24L01.c,458 :: 		ucLastStat = ucLinkStat = nRF_LINK_ESTABLISH;
MOVS	R5, #2
MOVW	R4, #lo_addr(_ucLinkStat+0)
MOVT	R4, #hi_addr(_ucLinkStat+0)
STRB	R5, [R4, #0]
MOVS	R5, #2
MOVW	R4, #lo_addr(_ucLastStat+0)
MOVT	R4, #hi_addr(_ucLastStat+0)
STRB	R5, [R4, #0]
;__Lib_nRF24L01.c,460 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_EN_AA, 0x3F);             // Enable Auto.Ack:Pipes 0-5
MOVS	R1, #63
MOVS	R0, #33
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,461 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_EN_RXADDR, 0x3F);         // Enable Pipes 0-5
MOVS	R1, #63
MOVS	R0, #34
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,462 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_SETUP_RETR, setupRetr);   // Set auto retransmit delay and count
LDRB	R1, [SP, #4]
MOVS	R0, #36
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,463 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RF_CH, channel);          // select RF channel
LDRB	R1, [SP, #8]
MOVS	R0, #37
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,464 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RF_SETUP, rfSetup);
LDRB	R1, [SP, #5]
MOVS	R0, #38
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,465 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_CONFIG, 0x0E);
MOVS	R1, #14
MOVS	R0, #32
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,467 :: 		nRF_SPI_Write_Buf(nRF_WRITE_REG + nRF_TX_ADDR, &ADDRESS_P0, sizeof(ADDRESS_P0));    // Writes TX_Address to nRF24L01
MOVS	R2, #5
MOVW	R1, #lo_addr(_ADDRESS_P0+0)
MOVT	R1, #hi_addr(_ADDRESS_P0+0)
MOVS	R0, #48
BL	_nRF_SPI_Write_Buf+0
;__Lib_nRF24L01.c,468 :: 		nRF_SPI_Write_Buf(nRF_WRITE_REG + nRF_RX_ADDR_P0, &ADDRESS_P0, sizeof(ADDRESS_P0)); // RX_Addr0 same as TX_Adr for Auto.Ack
MOVS	R2, #5
MOVW	R1, #lo_addr(_ADDRESS_P0+0)
MOVT	R1, #hi_addr(_ADDRESS_P0+0)
MOVS	R0, #42
BL	_nRF_SPI_Write_Buf+0
;__Lib_nRF24L01.c,470 :: 		Delay_ms(10);
MOVW	R7, #41246
MOVT	R7, #7
NOP
NOP
L_nRF_TX_Mode_Init_Advanced16:
SUBS	R7, R7, #1
BNE	L_nRF_TX_Mode_Init_Advanced16
NOP
NOP
NOP
;__Lib_nRF24L01.c,472 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;__Lib_nRF24L01.c,473 :: 		}
L_end_nRF_TX_Mode_Init_Advanced:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _nRF_TX_Mode_Init_Advanced
_nRF_TX_Mode_Init:
;__Lib_nRF24L01.c,491 :: 		void nRF_TX_Mode_Init(unsigned char channel)
; channel start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; channel end address is: 0 (R0)
; channel start address is: 0 (R0)
;__Lib_nRF24L01.c,493 :: 		nRF_TX_Mode_Init_Advanced(nRF_DATA_RATE_1Mbps, nRF_AUTO_RETRANSMIT_DELAY_4000us, nRF_AUTO_RETRANSMIT_COUNT_05, nRF_OUTPUT_POWER_0dBm, channel);
PUSH	(R0)
MOVS	R3, #6
MOVS	R2, #5
MOVS	R1, #240
MOVS	R0, #0
; channel end address is: 0 (R0)
BL	_nRF_TX_Mode_Init_Advanced+0
ADD	SP, SP, #4
;__Lib_nRF24L01.c,494 :: 		}
L_end_nRF_TX_Mode_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_TX_Mode_Init
_nRF_RX_Mode_Init_Advanced:
;__Lib_nRF24L01.c,509 :: 		void nRF_RX_Mode_Init_Advanced(unsigned char dataRate, unsigned char outputPower, unsigned char channel)
; outputPower start address is: 4 (R1)
; dataRate start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R2, [SP, #8]
; outputPower end address is: 4 (R1)
; dataRate end address is: 0 (R0)
; dataRate start address is: 0 (R0)
; outputPower start address is: 4 (R1)
;__Lib_nRF24L01.c,515 :: 		rfSetup   = dataRate + outputPower + 1;// + 0x20;
ADDS	R3, R0, R1
SXTH	R3, R3
; dataRate end address is: 0 (R0)
; outputPower end address is: 4 (R1)
ADDS	R3, R3, #1
STRB	R3, [SP, #4]
;__Lib_nRF24L01.c,517 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;__Lib_nRF24L01.c,519 :: 		ucCom_Mode = nRF_RX_MODE;
MOVS	R4, #1
MOVW	R3, #lo_addr(_ucCom_Mode+0)
MOVT	R3, #hi_addr(_ucCom_Mode+0)
STRB	R4, [R3, #0]
;__Lib_nRF24L01.c,520 :: 		nRF_CE_Pin(nRF_CE_LOW);
MOVS	R0, #0
BL	_nRF_CE_Pin+0
;__Lib_nRF24L01.c,522 :: 		nRF_Flush_TX();
BL	_nRF_Flush_TX+0
;__Lib_nRF24L01.c,523 :: 		nRF_Flush_RX();
BL	_nRF_Flush_RX+0
;__Lib_nRF24L01.c,525 :: 		nRF_Clear_IRQ(nRF_MASK_IRQ_FLAGS);
MOVS	R0, #112
BL	_nRF_Clear_IRQ+0
;__Lib_nRF24L01.c,526 :: 		ucIRQ_Source = nRF_IDLE;
MOVS	R4, #0
MOVW	R3, #lo_addr(_ucIRQ_Source+0)
MOVT	R3, #hi_addr(_ucIRQ_Source+0)
STRB	R4, [R3, #0]
;__Lib_nRF24L01.c,528 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_EN_AA, 0x3F);             // Enable Auto.Ack:Pipes 0-5
MOVS	R1, #63
MOVS	R0, #33
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,529 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_EN_RXADDR, 0x3F);         // Enable Pipes 0-5
MOVS	R1, #63
MOVS	R0, #34
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,530 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RF_CH, channel);          // select RF channel
LDRB	R1, [SP, #8]
MOVS	R0, #37
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,531 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RF_SETUP, rfSetup);
LDRB	R1, [SP, #4]
MOVS	R0, #38
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,532 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_CONFIG, 0x0F);
MOVS	R1, #15
MOVS	R0, #32
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,534 :: 		nRF_SPI_Write_Buf(nRF_WRITE_REG + nRF_RX_ADDR_P0, &ADDRESS_P0, sizeof(ADDRESS_P0)); // Use the same address on the RX device as the TX device
MOVS	R2, #5
MOVW	R1, #lo_addr(_ADDRESS_P0+0)
MOVT	R1, #hi_addr(_ADDRESS_P0+0)
MOVS	R0, #42
BL	_nRF_SPI_Write_Buf+0
;__Lib_nRF24L01.c,535 :: 		nRF_SPI_Write_Buf(nRF_WRITE_REG + nRF_RX_ADDR_P1, &ADDRESS_P1, sizeof(ADDRESS_P1));
MOVS	R2, #5
MOVW	R1, #lo_addr(_ADDRESS_P1+0)
MOVT	R1, #hi_addr(_ADDRESS_P1+0)
MOVS	R0, #43
BL	_nRF_SPI_Write_Buf+0
;__Lib_nRF24L01.c,537 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_ADDR_P2, 0x03);
MOVS	R1, #3
MOVS	R0, #44
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,538 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_ADDR_P3, 0x04);
MOVS	R1, #4
MOVS	R0, #45
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,539 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_ADDR_P4, 0x05);
MOVS	R1, #5
MOVS	R0, #46
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,540 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_ADDR_P5, 0x06);
MOVS	R1, #6
MOVS	R0, #47
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,542 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P0, nRF_RX_PLOAD_WIDTH); // Select same RX payload width as TX Payload width
MOVS	R1, #32
MOVS	R0, #49
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,543 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P1, nRF_RX_PLOAD_WIDTH);
MOVS	R1, #32
MOVS	R0, #50
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,544 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P2, nRF_RX_PLOAD_WIDTH);
MOVS	R1, #32
MOVS	R0, #51
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,545 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P3, nRF_RX_PLOAD_WIDTH);
MOVS	R1, #32
MOVS	R0, #52
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,546 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P4, nRF_RX_PLOAD_WIDTH);
MOVS	R1, #32
MOVS	R0, #53
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,547 :: 		nRF_SPI_RW_Reg(nRF_WRITE_REG + nRF_RX_PW_P5, nRF_RX_PLOAD_WIDTH);
MOVS	R1, #32
MOVS	R0, #54
BL	_nRF_SPI_RW_Reg+0
;__Lib_nRF24L01.c,549 :: 		Delay_ms(200);
MOVW	R7, #38526
MOVT	R7, #152
NOP
NOP
L_nRF_RX_Mode_Init_Advanced18:
SUBS	R7, R7, #1
BNE	L_nRF_RX_Mode_Init_Advanced18
NOP
NOP
NOP
;__Lib_nRF24L01.c,551 :: 		TIM2_SR.UIF = 0;
MOVS	R4, #0
SXTB	R4, R4
MOVW	R3, #lo_addr(TIM2_SR+0)
MOVT	R3, #hi_addr(TIM2_SR+0)
STR	R4, [R3, #0]
;__Lib_nRF24L01.c,552 :: 		TIM2_CR1.CEN = 0;
MOVW	R3, #lo_addr(TIM2_CR1+0)
MOVT	R3, #hi_addr(TIM2_CR1+0)
STR	R4, [R3, #0]
;__Lib_nRF24L01.c,554 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;__Lib_nRF24L01.c,556 :: 		nRF_CE_Pin(nRF_CE_HIGH);                                      // Set CE pin high to enable RX device
MOVS	R0, #1
BL	_nRF_CE_Pin+0
;__Lib_nRF24L01.c,557 :: 		}
L_end_nRF_RX_Mode_Init_Advanced:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _nRF_RX_Mode_Init_Advanced
_nRF_RX_Mode_Init:
;__Lib_nRF24L01.c,570 :: 		void nRF_RX_Mode_Init(unsigned char channel)
; channel start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; channel end address is: 0 (R0)
; channel start address is: 0 (R0)
;__Lib_nRF24L01.c,572 :: 		nRF_RX_Mode_Init_Advanced(nRF_DATA_RATE_1Mbps, nRF_OUTPUT_POWER_0dBm, channel);
UXTB	R2, R0
; channel end address is: 0 (R0)
MOVS	R1, #6
MOVS	R0, #0
BL	_nRF_RX_Mode_Init_Advanced+0
;__Lib_nRF24L01.c,573 :: 		}
L_end_nRF_RX_Mode_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_RX_Mode_Init
_nRF_Process:
;__Lib_nRF24L01.c,585 :: 		void nRF_Process(TnRF_Status *nRFstatus)
; nRFstatus start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R4, R0
; nRFstatus end address is: 0 (R0)
; nRFstatus start address is: 16 (R4)
;__Lib_nRF24L01.c,587 :: 		nRFstatus->_status = nRF_IDLE;
MOVS	R1, #0
STRB	R1, [R4, #0]
;__Lib_nRF24L01.c,588 :: 		nRFstatus->_pipe   = 0;
ADDS	R2, R4, #2
MOVS	R1, #0
STRH	R1, [R2, #0]
;__Lib_nRF24L01.c,589 :: 		nRFstatus->_plos_cnt = 0;
ADDS	R2, R4, #4
MOVS	R1, #0
STRB	R1, [R2, #0]
;__Lib_nRF24L01.c,590 :: 		nRFstatus->_arc_cnt  = 0;
ADDS	R2, R4, #5
MOVS	R1, #0
STRB	R1, [R2, #0]
;__Lib_nRF24L01.c,591 :: 		nRFstatus->_pBuff    = 0;
ADDW	R2, R4, #8
MOVS	R1, #0
STR	R1, [R2, #0]
;__Lib_nRF24L01.c,593 :: 		if(ucIRQ_Source == nRF_IDLE)
MOVW	R1, #lo_addr(_ucIRQ_Source+0)
MOVT	R1, #hi_addr(_ucIRQ_Source+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_nRF_Process20
; nRFstatus end address is: 16 (R4)
;__Lib_nRF24L01.c,594 :: 		return;
IT	AL
BAL	L_end_nRF_Process
L_nRF_Process20:
;__Lib_nRF24L01.c,596 :: 		DisableInterrupts();
; nRFstatus start address is: 16 (R4)
BL	_DisableInterrupts+0
;__Lib_nRF24L01.c,598 :: 		switch(ucIRQ_Source)
IT	AL
BAL	L_nRF_Process21
;__Lib_nRF24L01.c,600 :: 		case nRF_RX_DR:
L_nRF_Process23:
;__Lib_nRF24L01.c,602 :: 		do
MOV	R3, R4
IT	AL
BAL	L_nRF_Process24
; nRFstatus end address is: 16 (R4)
L__nRF_Process43:
;__Lib_nRF24L01.c,606 :: 		}while(!(nRF_Get_FIFO() & nRF_RX_EMPTY));
;__Lib_nRF24L01.c,602 :: 		do
L_nRF_Process24:
;__Lib_nRF24L01.c,604 :: 		uiRX_info = nRF_Read_RX_Pload(RX_pload);
; nRFstatus start address is: 12 (R3)
; nRFstatus start address is: 12 (R3)
; nRFstatus end address is: 12 (R3)
STR	R3, [SP, #4]
MOVW	R0, #lo_addr(_RX_pload+0)
MOVT	R0, #hi_addr(_RX_pload+0)
BL	_nRF_Read_RX_Pload+0
MOVW	R1, #lo_addr(_uiRX_info+0)
MOVT	R1, #hi_addr(_uiRX_info+0)
STRH	R0, [R1, #0]
;__Lib_nRF24L01.c,606 :: 		}while(!(nRF_Get_FIFO() & nRF_RX_EMPTY));
BL	_nRF_Get_FIFO+0
LDR	R3, [SP, #4]
AND	R1, R0, #1
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L__nRF_Process43
; nRFstatus end address is: 12 (R3)
;__Lib_nRF24L01.c,608 :: 		ucLinkStat = nRF_LINK_ESTABLISH;                                  // stavi da je uspostavljen link
; nRFstatus start address is: 12 (R3)
MOVS	R2, #2
MOVW	R1, #lo_addr(_ucLinkStat+0)
MOVT	R1, #hi_addr(_ucLinkStat+0)
STRB	R2, [R1, #0]
;__Lib_nRF24L01.c,609 :: 		nRF_Clear_IRQ(nRF_MASK_RX_DR_FLAG);                               // resetuj interrupt flag kada se primi paket
STR	R3, [SP, #4]
MOVS	R0, #64
BL	_nRF_Clear_IRQ+0
LDR	R3, [SP, #4]
;__Lib_nRF24L01.c,611 :: 		nRFstatus->_status = ucIRQ_Source;
MOVW	R1, #lo_addr(_ucIRQ_Source+0)
MOVT	R1, #hi_addr(_ucIRQ_Source+0)
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
;__Lib_nRF24L01.c,612 :: 		nRFstatus->_pipe   = uiRX_info;
ADDS	R2, R3, #2
MOVW	R1, #lo_addr(_uiRX_info+0)
MOVT	R1, #hi_addr(_uiRX_info+0)
LDRH	R1, [R1, #0]
STRH	R1, [R2, #0]
;__Lib_nRF24L01.c,613 :: 		nRFstatus->_pBuff  = &RX_pload;
ADDW	R2, R3, #8
; nRFstatus end address is: 12 (R3)
MOVW	R1, #lo_addr(_RX_pload+0)
MOVT	R1, #hi_addr(_RX_pload+0)
STR	R1, [R2, #0]
;__Lib_nRF24L01.c,616 :: 		break;
IT	AL
BAL	L_nRF_Process22
;__Lib_nRF24L01.c,618 :: 		case nRF_TX_DS:
L_nRF_Process27:
;__Lib_nRF24L01.c,621 :: 		ucLinkStat = nRF_LINK_ESTABLISH;
; nRFstatus start address is: 16 (R4)
MOVS	R2, #2
MOVW	R1, #lo_addr(_ucLinkStat+0)
MOVT	R1, #hi_addr(_ucLinkStat+0)
STRB	R2, [R1, #0]
;__Lib_nRF24L01.c,622 :: 		nRF_Clear_IRQ(nRF_MASK_TX_DS_FLAG);       // Interrupt ako je paket poslat
STR	R4, [SP, #4]
MOVS	R0, #32
BL	_nRF_Clear_IRQ+0
;__Lib_nRF24L01.c,623 :: 		nRF_Clear_IRQ(nRF_MASK_MAX_RT_FLAG);      // Interrupt broj retransmisija paketa
MOVS	R0, #16
BL	_nRF_Clear_IRQ+0
;__Lib_nRF24L01.c,626 :: 		ucRX_info = nRF_SPI_RW(nRF_READ_REG + nRF_OBSERVE_TX);
MOVS	R0, #8
BL	_nRF_SPI_RW+0
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_ucRX_info+0)
MOVT	R3, #hi_addr(_ucRX_info+0)
STRH	R0, [R3, #0]
;__Lib_nRF24L01.c,628 :: 		nRFstatus->_status = nRF_TX_DS;
MOVS	R1, #32
STRB	R1, [R4, #0]
;__Lib_nRF24L01.c,629 :: 		nRFstatus->_arc_cnt = (ucRX_info & 0x0F);
ADDS	R2, R4, #5
MOV	R1, R3
LDRH	R1, [R1, #0]
AND	R1, R1, #15
STRB	R1, [R2, #0]
;__Lib_nRF24L01.c,630 :: 		nRFstatus->_plos_cnt = (ucRX_info & 0xF0) >> 4;
ADDS	R2, R4, #4
; nRFstatus end address is: 16 (R4)
MOV	R1, R3
LDRH	R1, [R1, #0]
AND	R1, R1, #240
UXTH	R1, R1
LSRS	R1, R1, #4
STRB	R1, [R2, #0]
;__Lib_nRF24L01.c,632 :: 		break;
IT	AL
BAL	L_nRF_Process22
;__Lib_nRF24L01.c,634 :: 		case nRF_MAX_RT:
L_nRF_Process28:
;__Lib_nRF24L01.c,636 :: 		if(ucTry_Ctr++ == 3)
; nRFstatus start address is: 16 (R4)
MOVW	R3, #lo_addr(_ucTry_Ctr+0)
MOVT	R3, #hi_addr(_ucTry_Ctr+0)
LDRB	R2, [R3, #0]
MOV	R1, R3
LDRB	R1, [R1, #0]
ADDS	R1, R1, #1
STRB	R1, [R3, #0]
CMP	R2, #3
IT	NE
BNE	L_nRF_Process29
;__Lib_nRF24L01.c,637 :: 		ucLinkStat = nRF_STOP;
MOVS	R2, #4
MOVW	R1, #lo_addr(_ucLinkStat+0)
MOVT	R1, #hi_addr(_ucLinkStat+0)
STRB	R2, [R1, #0]
L_nRF_Process29:
;__Lib_nRF24L01.c,639 :: 		ucRX_info = nRF_SPI_Read(nRF_READ_REG + nRF_OBSERVE_TX);
STR	R4, [SP, #4]
MOVS	R0, #8
BL	_nRF_SPI_Read+0
LDR	R4, [SP, #4]
MOVW	R3, #lo_addr(_ucRX_info+0)
MOVT	R3, #hi_addr(_ucRX_info+0)
STRH	R0, [R3, #0]
;__Lib_nRF24L01.c,641 :: 		nRFstatus->_status = nRF_MAX_RT;
MOVS	R1, #16
STRB	R1, [R4, #0]
;__Lib_nRF24L01.c,642 :: 		nRFstatus->_arc_cnt = (ucRX_info & 0x0F);
ADDS	R2, R4, #5
MOV	R1, R3
LDRH	R1, [R1, #0]
AND	R1, R1, #15
STRB	R1, [R2, #0]
;__Lib_nRF24L01.c,643 :: 		nRFstatus->_plos_cnt = (ucRX_info & 0xF0)>>4;
ADDS	R2, R4, #4
; nRFstatus end address is: 16 (R4)
MOV	R1, R3
LDRH	R1, [R1, #0]
AND	R1, R1, #240
UXTH	R1, R1
LSRS	R1, R1, #4
STRB	R1, [R2, #0]
;__Lib_nRF24L01.c,645 :: 		switch(ucLinkStat)
IT	AL
BAL	L_nRF_Process30
;__Lib_nRF24L01.c,647 :: 		case nRF_LINK_ESTABLISH:                         // max retransmitt, but had comm on last channel
L_nRF_Process32:
;__Lib_nRF24L01.c,648 :: 		nRF_Clear_IRQ(nRF_MASK_MAX_RT_FLAG);             // clear MAX_RT flag (nRF24L01)
MOVS	R0, #16
BL	_nRF_Clear_IRQ+0
;__Lib_nRF24L01.c,649 :: 		ucLinkStat = nRF_LINK_LOSS;                      // change LinkStat state to LINK_LOSS, wait for new timeout
MOVS	R2, #1
MOVW	R1, #lo_addr(_ucLinkStat+0)
MOVT	R1, #hi_addr(_ucLinkStat+0)
STRB	R2, [R1, #0]
;__Lib_nRF24L01.c,650 :: 		break;
IT	AL
BAL	L_nRF_Process31
;__Lib_nRF24L01.c,652 :: 		case nRF_LINK_LOSS:                              // still not connected, run channel scan..
L_nRF_Process33:
;__Lib_nRF24L01.c,653 :: 		nRF_Clear_IRQ(nRF_MASK_MAX_RT_FLAG);             // clear MAX_RT flag (nRF24L01)
MOVS	R0, #16
BL	_nRF_Clear_IRQ+0
;__Lib_nRF24L01.c,654 :: 		nRF_CE_Pin(nRF_CE_PULSE);                            // retransmitt packet
MOVS	R0, #2
BL	_nRF_CE_Pin+0
;__Lib_nRF24L01.c,655 :: 		ucLinkStat = nRF_LINK_RELOST;                    // change LinkStat state to LINK_RELOST
MOVS	R2, #3
MOVW	R1, #lo_addr(_ucLinkStat+0)
MOVT	R1, #hi_addr(_ucLinkStat+0)
STRB	R2, [R1, #0]
;__Lib_nRF24L01.c,656 :: 		break;
IT	AL
BAL	L_nRF_Process31
;__Lib_nRF24L01.c,658 :: 		case nRF_LINK_RELOST:
L_nRF_Process34:
;__Lib_nRF24L01.c,659 :: 		nRF_Clear_IRQ(nRF_MASK_MAX_RT_FLAG);             // clear MAX_RT flag (nRF24L01)
MOVS	R0, #16
BL	_nRF_Clear_IRQ+0
;__Lib_nRF24L01.c,660 :: 		nRF_CE_Pin(nRF_CE_PULSE);                            // retransmitt packet
MOVS	R0, #2
BL	_nRF_CE_Pin+0
;__Lib_nRF24L01.c,661 :: 		ucLinkStat = nRF_LINK_RELOST;
MOVS	R2, #3
MOVW	R1, #lo_addr(_ucLinkStat+0)
MOVT	R1, #hi_addr(_ucLinkStat+0)
STRB	R2, [R1, #0]
;__Lib_nRF24L01.c,662 :: 		break;
IT	AL
BAL	L_nRF_Process31
;__Lib_nRF24L01.c,664 :: 		case nRF_STOP:
L_nRF_Process35:
;__Lib_nRF24L01.c,665 :: 		nRF_Clear_IRQ(nRF_MASK_MAX_RT_FLAG);           // clear MAX_RT flag
MOVS	R0, #16
BL	_nRF_Clear_IRQ+0
;__Lib_nRF24L01.c,666 :: 		ucLinkStat = nRF_LINK_ESTABLISH;               // stop retransmission
MOVS	R2, #2
MOVW	R1, #lo_addr(_ucLinkStat+0)
MOVT	R1, #hi_addr(_ucLinkStat+0)
STRB	R2, [R1, #0]
;__Lib_nRF24L01.c,667 :: 		break;
IT	AL
BAL	L_nRF_Process31
;__Lib_nRF24L01.c,668 :: 		}
L_nRF_Process30:
MOVW	R1, #lo_addr(_ucLinkStat+0)
MOVT	R1, #hi_addr(_ucLinkStat+0)
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	EQ
BEQ	L_nRF_Process32
MOVW	R1, #lo_addr(_ucLinkStat+0)
MOVT	R1, #hi_addr(_ucLinkStat+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	EQ
BEQ	L_nRF_Process33
MOVW	R1, #lo_addr(_ucLinkStat+0)
MOVT	R1, #hi_addr(_ucLinkStat+0)
LDRB	R1, [R1, #0]
CMP	R1, #3
IT	EQ
BEQ	L_nRF_Process34
MOVW	R1, #lo_addr(_ucLinkStat+0)
MOVT	R1, #hi_addr(_ucLinkStat+0)
LDRB	R1, [R1, #0]
CMP	R1, #4
IT	EQ
BEQ	L_nRF_Process35
L_nRF_Process31:
;__Lib_nRF24L01.c,670 :: 		break;
IT	AL
BAL	L_nRF_Process22
;__Lib_nRF24L01.c,672 :: 		default:
L_nRF_Process36:
;__Lib_nRF24L01.c,674 :: 		nRF_Clear_IRQ(nRF_MASK_IRQ_FLAGS);
MOVS	R0, #112
BL	_nRF_Clear_IRQ+0
;__Lib_nRF24L01.c,676 :: 		break;
IT	AL
BAL	L_nRF_Process22
;__Lib_nRF24L01.c,678 :: 		}
L_nRF_Process21:
; nRFstatus start address is: 16 (R4)
MOVW	R1, #lo_addr(_ucIRQ_Source+0)
MOVT	R1, #hi_addr(_ucIRQ_Source+0)
LDRB	R1, [R1, #0]
CMP	R1, #64
IT	EQ
BEQ	L_nRF_Process23
MOVW	R1, #lo_addr(_ucIRQ_Source+0)
MOVT	R1, #hi_addr(_ucIRQ_Source+0)
LDRB	R1, [R1, #0]
CMP	R1, #32
IT	EQ
BEQ	L_nRF_Process27
MOVW	R1, #lo_addr(_ucIRQ_Source+0)
MOVT	R1, #hi_addr(_ucIRQ_Source+0)
LDRB	R1, [R1, #0]
CMP	R1, #16
IT	EQ
BEQ	L_nRF_Process28
; nRFstatus end address is: 16 (R4)
IT	AL
BAL	L_nRF_Process36
L_nRF_Process22:
;__Lib_nRF24L01.c,679 :: 		ucIRQ_Source = nRF_IDLE;
MOVS	R2, #0
MOVW	R1, #lo_addr(_ucIRQ_Source+0)
MOVT	R1, #hi_addr(_ucIRQ_Source+0)
STRB	R2, [R1, #0]
;__Lib_nRF24L01.c,680 :: 		EnableInterrupts();                            // Enable global interrupt
BL	_EnableInterrupts+0
;__Lib_nRF24L01.c,681 :: 		}
L_end_nRF_Process:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _nRF_Process
_nRF_Write_TX_Pload:
;__Lib_nRF24L01.c,693 :: 		void nRF_Write_TX_Pload(unsigned char *pBuf, unsigned char plWidth)
; plWidth start address is: 4 (R1)
; pBuf start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; plWidth end address is: 4 (R1)
; pBuf end address is: 0 (R0)
; pBuf start address is: 0 (R0)
; plWidth start address is: 4 (R1)
;__Lib_nRF24L01.c,695 :: 		nRF_SPI_Write_Buf(nRF_WR_TX_PLOAD, pBuf, plWidth);
UXTB	R2, R1
; plWidth end address is: 4 (R1)
MOV	R1, R0
; pBuf end address is: 0 (R0)
MOVS	R0, #160
BL	_nRF_SPI_Write_Buf+0
;__Lib_nRF24L01.c,696 :: 		}
L_end_nRF_Write_TX_Pload:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_Write_TX_Pload
_nRF_Send_Packet:
;__Lib_nRF24L01.c,709 :: 		unsigned char nRF_Send_Packet()                          // Send one data packet
SUB	SP, SP, #4
STR	LR, [SP, #0]
;__Lib_nRF24L01.c,711 :: 		if ((ucCom_Mode == nRF_RX_MODE) || (ucIRQ_Source != nRF_IDLE)) //ubacen IDLE
MOVW	R0, #lo_addr(_ucCom_Mode+0)
MOVT	R0, #hi_addr(_ucCom_Mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L__nRF_Send_Packet46
MOVW	R0, #lo_addr(_ucIRQ_Source+0)
MOVT	R0, #hi_addr(_ucIRQ_Source+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__nRF_Send_Packet45
IT	AL
BAL	L_nRF_Send_Packet39
L__nRF_Send_Packet46:
L__nRF_Send_Packet45:
;__Lib_nRF24L01.c,712 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_nRF_Send_Packet
L_nRF_Send_Packet39:
;__Lib_nRF24L01.c,714 :: 		nRF_Write_TX_Pload(&TX_pload, nRF_TX_PLOAD_WIDTH);     // Write new TX payload
MOVS	R1, #32
MOVW	R0, #lo_addr(_TX_pload+0)
MOVT	R0, #hi_addr(_TX_pload+0)
BL	_nRF_Write_TX_Pload+0
;__Lib_nRF24L01.c,715 :: 		nRF_CE_Pin(nRF_CE_PULSE);                                  // Enable CE pulse, 12µs
MOVS	R0, #2
BL	_nRF_CE_Pin+0
;__Lib_nRF24L01.c,716 :: 		ucTry_Ctr = 0;                                     // Reset Try_Ctr before nex transmitt..
MOVS	R1, #0
MOVW	R0, #lo_addr(_ucTry_Ctr+0)
MOVT	R0, #hi_addr(_ucTry_Ctr+0)
STRB	R1, [R0, #0]
;__Lib_nRF24L01.c,718 :: 		return 1;
MOVS	R0, #1
;__Lib_nRF24L01.c,719 :: 		}
L_end_nRF_Send_Packet:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _nRF_Send_Packet
_nRF_Receive_Packet:
;__Lib_nRF24L01.c,724 :: 		unsigned char nRF_Receive_Packet()
;__Lib_nRF24L01.c,726 :: 		if((ucCom_Mode == nRF_TX_MODE) || (ucIRQ_Source == nRF_IDLE))
MOVW	R0, #lo_addr(_ucCom_Mode+0)
MOVT	R0, #hi_addr(_ucCom_Mode+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__nRF_Receive_Packet49
MOVW	R0, #lo_addr(_ucIRQ_Source+0)
MOVT	R0, #hi_addr(_ucIRQ_Source+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__nRF_Receive_Packet48
IT	AL
BAL	L_nRF_Receive_Packet42
L__nRF_Receive_Packet49:
L__nRF_Receive_Packet48:
;__Lib_nRF24L01.c,727 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_nRF_Receive_Packet
L_nRF_Receive_Packet42:
;__Lib_nRF24L01.c,729 :: 		return 1;
MOVS	R0, #1
;__Lib_nRF24L01.c,730 :: 		}
L_end_nRF_Receive_Packet:
BX	LR
; end of _nRF_Receive_Packet
