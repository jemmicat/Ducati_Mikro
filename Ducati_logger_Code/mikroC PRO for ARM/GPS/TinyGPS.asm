TinyGPS_library_version:
;tinygps.h,150 :: 		static int library_version() { return _GPS_VERSION; }
MOVS	R0, #12
SXTH	R0, R0
L_end_library_version:
BX	LR
; end of TinyGPS_library_version
_millis:
;TinyGPS.c,27 :: 		unsigned long millis()
;TinyGPS.c,29 :: 		return 0;
MOVS	R0, #0
;TinyGPS.c,30 :: 		}
L_end_millis:
BX	LR
; end of _millis
_gpsisdigit:
;TinyGPS.c,31 :: 		bool gpsisdigit(char c)
; c start address is: 0 (R0)
; c end address is: 0 (R0)
; c start address is: 0 (R0)
;TinyGPS.c,33 :: 		return c >= '0' && c <= '9';
CMP	R0, #48
IT	CC
BCC	L_gpsisdigit1
CMP	R0, #57
IT	HI
BHI	L_gpsisdigit1
; c end address is: 0 (R0)
MOVS	R1, #1
IT	AL
BAL	L_gpsisdigit0
L_gpsisdigit1:
MOVS	R1, #0
L_gpsisdigit0:
UXTB	R0, R1
;TinyGPS.c,34 :: 		}
L_end_gpsisdigit:
BX	LR
; end of _gpsisdigit
_satellites:
;TinyGPS.c,37 :: 		unsigned short satellites(TinyGPS* gps)
; gps start address is: 0 (R0)
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
;TinyGPS.c,39 :: 		return gps->_numsats;
ADDW	R1, R0, #64
; gps end address is: 0 (R0)
LDRB	R1, [R1, #0]
UXTB	R0, R1
;TinyGPS.c,40 :: 		}
L_end_satellites:
BX	LR
; end of _satellites
_hdop:
;TinyGPS.c,43 :: 		unsigned long hdop(TinyGPS* gps)
; gps start address is: 0 (R0)
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
;TinyGPS.c,45 :: 		return gps->_hdop;
ADDW	R1, R0, #56
; gps end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;TinyGPS.c,46 :: 		}
L_end_hdop:
BX	LR
; end of _hdop
_altitude:
;TinyGPS.c,49 :: 		long altitude(TinyGPS* gps)
; gps start address is: 0 (R0)
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
;TinyGPS.c,51 :: 		return gps->_altitude;
ADDW	R1, R0, #32
; gps end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;TinyGPS.c,52 :: 		}
L_end_altitude:
BX	LR
; end of _altitude
_course:
;TinyGPS.c,55 :: 		unsigned long course(TinyGPS* gps)
; gps start address is: 0 (R0)
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
;TinyGPS.c,57 :: 		return gps->_course;
ADDW	R1, R0, #48
; gps end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;TinyGPS.c,58 :: 		}
L_end_course:
BX	LR
; end of _course
_speed:
;TinyGPS.c,61 :: 		unsigned long speed(TinyGPS* gps)
; gps start address is: 0 (R0)
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
;TinyGPS.c,63 :: 		return gps->_speed;
ADDW	R1, R0, #40
; gps end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
;TinyGPS.c,64 :: 		}
L_end_speed:
BX	LR
; end of _speed
_TinyGPS_init:
;TinyGPS.c,66 :: 		void TinyGPS_init(TinyGPS* gps)
; gps start address is: 0 (R0)
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
;TinyGPS.c,69 :: 		gps->_time = GPS_INVALID_TIME;
MOV	R1, #-1
STR	R1, [R0, #0]
;TinyGPS.c,70 :: 		gps->_date = GPS_INVALID_DATE;
ADDW	R2, R0, #8
MOVS	R1, #0
STR	R1, [R2, #0]
;TinyGPS.c,71 :: 		gps->_latitude = GPS_INVALID_ANGLE;
ADDW	R2, R0, #16
MOVW	R1, #51711
MOVT	R1, #15258
STR	R1, [R2, #0]
;TinyGPS.c,72 :: 		gps->_longitude = GPS_INVALID_ANGLE;
ADDW	R2, R0, #24
MOVW	R1, #51711
MOVT	R1, #15258
STR	R1, [R2, #0]
;TinyGPS.c,73 :: 		gps->_altitude = GPS_INVALID_ALTITUDE;
ADDW	R2, R0, #32
MOVW	R1, #51711
MOVT	R1, #15258
STR	R1, [R2, #0]
;TinyGPS.c,74 :: 		gps->_speed = GPS_INVALID_SPEED;
ADDW	R2, R0, #40
MOVW	R1, #51711
MOVT	R1, #15258
STR	R1, [R2, #0]
;TinyGPS.c,75 :: 		gps->_course = GPS_INVALID_ANGLE;
ADDW	R2, R0, #48
MOVW	R1, #51711
MOVT	R1, #15258
STR	R1, [R2, #0]
;TinyGPS.c,79 :: 		gps->_last_time_fix = GPS_INVALID_FIX_TIME;
ADDW	R2, R0, #68
MOV	R1, #-1
STR	R1, [R2, #0]
;TinyGPS.c,80 :: 		gps->_last_position_fix = GPS_INVALID_FIX_TIME;
ADDW	R2, R0, #76
MOV	R1, #-1
STR	R1, [R2, #0]
;TinyGPS.c,83 :: 		gps->_parity = 0;
ADDW	R2, R0, #84
MOVS	R1, #0
STRB	R1, [R2, #0]
;TinyGPS.c,84 :: 		gps->_is_checksum_term = false;
ADDW	R2, R0, #85
MOVS	R1, #0
STRB	R1, [R2, #0]
;TinyGPS.c,85 :: 		gps->_sentence_type = _GPS_SENTENCE_OTHER;
ADDW	R2, R0, #101
MOVS	R1, #3
STRB	R1, [R2, #0]
;TinyGPS.c,86 :: 		gps->_term_number = 0;
ADDW	R2, R0, #102
MOVS	R1, #0
STRB	R1, [R2, #0]
;TinyGPS.c,87 :: 		gps->_term_offset = 0;
ADDW	R2, R0, #103
MOVS	R1, #0
STRB	R1, [R2, #0]
;TinyGPS.c,88 :: 		gps->_gps_data_good = false;
ADDW	R2, R0, #104
MOVS	R1, #0
STRB	R1, [R2, #0]
;TinyGPS.c,90 :: 		gps->_encoded_characters = 0;
ADDW	R2, R0, #108
MOVS	R1, #0
STR	R1, [R2, #0]
;TinyGPS.c,91 :: 		gps->_good_sentences = 0;
ADDW	R2, R0, #112
MOVS	R1, #0
STRB	R1, [R2, #0]
;TinyGPS.c,92 :: 		gps->_failed_checksum = 0;
ADDW	R2, R0, #113
MOVS	R1, #0
STRB	R1, [R2, #0]
;TinyGPS.c,95 :: 		gps->_term[0] = '\0';
ADDW	R2, R0, #86
; gps end address is: 0 (R0)
MOVS	R1, #0
STRB	R1, [R2, #0]
;TinyGPS.c,96 :: 		}
L_end_TinyGPS_init:
BX	LR
; end of _TinyGPS_init
_encode:
;TinyGPS.c,102 :: 		bool encode(TinyGPS* gps, char c)
; c start address is: 4 (R1)
; gps start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R8, R0
UXTB	R9, R1
; c end address is: 4 (R1)
; gps end address is: 0 (R0)
; gps start address is: 32 (R8)
; c start address is: 36 (R9)
;TinyGPS.c,104 :: 		bool valid_sentence = false;
; valid_sentence start address is: 0 (R0)
MOVS	R0, #0
;TinyGPS.c,106 :: 		++gps->_encoded_characters;
ADD	R3, R8, #108
LDR	R2, [R3, #0]
ADDS	R2, R2, #1
STR	R2, [R3, #0]
;TinyGPS.c,107 :: 		switch(c)
IT	AL
BAL	L_encode2
;TinyGPS.c,109 :: 		case ',': // term terminators
L_encode4:
;TinyGPS.c,110 :: 		gps->_parity ^= c;
ADD	R3, R8, #84
LDRB	R2, [R3, #0]
EOR	R2, R2, R9, LSL #0
STRB	R2, [R3, #0]
;TinyGPS.c,111 :: 		case '\r':
L_encode5:
;TinyGPS.c,112 :: 		case '\n':
L_encode6:
;TinyGPS.c,113 :: 		case '*':
L_encode7:
;TinyGPS.c,114 :: 		if (gps->_term_offset < sizeof(gps->_term))
ADD	R2, R8, #103
LDRB	R2, [R2, #0]
CMP	R2, #15
IT	CS
BCS	L__encode134
; valid_sentence end address is: 0 (R0)
;TinyGPS.c,116 :: 		gps->_term[gps->_term_offset] = 0;
ADD	R3, R8, #86
ADD	R2, R8, #103
LDRB	R2, [R2, #0]
ADDS	R3, R3, R2
MOVS	R2, #0
STRB	R2, [R3, #0]
;TinyGPS.c,117 :: 		valid_sentence = term_complete(gps);
MOV	R0, R8
BL	_term_complete+0
; valid_sentence start address is: 4 (R1)
UXTB	R1, R0
; valid_sentence end address is: 4 (R1)
UXTB	R0, R1
;TinyGPS.c,118 :: 		}
IT	AL
BAL	L_encode8
L__encode134:
;TinyGPS.c,114 :: 		if (gps->_term_offset < sizeof(gps->_term))
;TinyGPS.c,118 :: 		}
L_encode8:
;TinyGPS.c,119 :: 		++gps->_term_number;
; valid_sentence start address is: 0 (R0)
ADD	R3, R8, #102
LDRB	R2, [R3, #0]
ADDS	R2, R2, #1
STRB	R2, [R3, #0]
;TinyGPS.c,120 :: 		gps->_term_offset = 0;
ADD	R3, R8, #103
MOVS	R2, #0
STRB	R2, [R3, #0]
;TinyGPS.c,121 :: 		gps->_is_checksum_term = c == '*';
ADD	R3, R8, #85
; gps end address is: 32 (R8)
CMP	R9, #42
MOVW	R2, #0
BNE	L__encode145
MOVS	R2, #1
L__encode145:
; c end address is: 36 (R9)
STRB	R2, [R3, #0]
;TinyGPS.c,122 :: 		return valid_sentence;
; valid_sentence end address is: 0 (R0)
IT	AL
BAL	L_end_encode
;TinyGPS.c,124 :: 		case '$': // sentence begin
L_encode9:
;TinyGPS.c,125 :: 		gps->_term_number = gps->_term_offset = 0;
; valid_sentence start address is: 0 (R0)
; gps start address is: 32 (R8)
ADD	R4, R8, #102
ADD	R3, R8, #103
MOVS	R2, #0
STRB	R2, [R3, #0]
LDRB	R2, [R3, #0]
STRB	R2, [R4, #0]
;TinyGPS.c,126 :: 		gps->_parity = 0;
ADD	R3, R8, #84
MOVS	R2, #0
STRB	R2, [R3, #0]
;TinyGPS.c,127 :: 		gps->_sentence_type = _GPS_SENTENCE_OTHER;
ADD	R3, R8, #101
MOVS	R2, #3
STRB	R2, [R3, #0]
;TinyGPS.c,128 :: 		gps->_is_checksum_term = false;
ADD	R3, R8, #85
MOVS	R2, #0
STRB	R2, [R3, #0]
;TinyGPS.c,129 :: 		gps->_gps_data_good = false;
ADD	R3, R8, #104
; gps end address is: 32 (R8)
MOVS	R2, #0
STRB	R2, [R3, #0]
;TinyGPS.c,130 :: 		return valid_sentence;
; valid_sentence end address is: 0 (R0)
IT	AL
BAL	L_end_encode
;TinyGPS.c,131 :: 		}
L_encode2:
; valid_sentence start address is: 0 (R0)
; c start address is: 36 (R9)
; gps start address is: 32 (R8)
CMP	R9, #44
IT	EQ
BEQ	L_encode4
CMP	R9, #13
IT	EQ
BEQ	L_encode5
CMP	R9, #10
IT	EQ
BEQ	L_encode6
CMP	R9, #42
IT	EQ
BEQ	L_encode7
CMP	R9, #36
IT	EQ
BEQ	L_encode9
;TinyGPS.c,134 :: 		if (gps->_term_offset < sizeof(gps->_term) - 1)
ADD	R2, R8, #103
LDRB	R2, [R2, #0]
CMP	R2, #14
IT	CS
BCS	L_encode10
;TinyGPS.c,135 :: 		gps->_term[gps->_term_offset++] = c;
ADD	R4, R8, #86
ADD	R3, R8, #103
LDRB	R2, [R3, #0]
ADDS	R2, R4, R2
STRB	R9, [R2, #0]
LDRB	R2, [R3, #0]
ADDS	R2, R2, #1
STRB	R2, [R3, #0]
L_encode10:
;TinyGPS.c,136 :: 		if (!gps->_is_checksum_term)
ADD	R2, R8, #85
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_encode11
;TinyGPS.c,137 :: 		gps->_parity ^= c;
ADD	R3, R8, #84
; gps end address is: 32 (R8)
LDRB	R2, [R3, #0]
EOR	R2, R2, R9, LSL #0
; c end address is: 36 (R9)
STRB	R2, [R3, #0]
L_encode11:
;TinyGPS.c,139 :: 		return valid_sentence;
; valid_sentence end address is: 0 (R0)
;TinyGPS.c,140 :: 		}
L_end_encode:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _encode
_stats:
;TinyGPS.c,145 :: 		void stats(TinyGPS* gps, unsigned long *chars, unsigned short *sentences, unsigned short *failed_cs)
; failed_cs start address is: 12 (R3)
; sentences start address is: 8 (R2)
; chars start address is: 4 (R1)
; gps start address is: 0 (R0)
; failed_cs end address is: 12 (R3)
; sentences end address is: 8 (R2)
; chars end address is: 4 (R1)
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
; chars start address is: 4 (R1)
; sentences start address is: 8 (R2)
; failed_cs start address is: 12 (R3)
;TinyGPS.c,147 :: 		if (chars) *chars = gps->_encoded_characters;
CMP	R1, #0
IT	EQ
BEQ	L_stats12
ADDW	R4, R0, #108
LDR	R4, [R4, #0]
STR	R4, [R1, #0]
; chars end address is: 4 (R1)
L_stats12:
;TinyGPS.c,148 :: 		if (sentences) *sentences = gps->_good_sentences;
CMP	R2, #0
IT	EQ
BEQ	L_stats13
ADDW	R4, R0, #112
LDRB	R4, [R4, #0]
STRB	R4, [R2, #0]
; sentences end address is: 8 (R2)
L_stats13:
;TinyGPS.c,149 :: 		if (failed_cs) *failed_cs = gps->_failed_checksum;
CMP	R3, #0
IT	EQ
BEQ	L_stats14
ADDW	R4, R0, #113
; gps end address is: 0 (R0)
LDRB	R4, [R4, #0]
STRB	R4, [R3, #0]
; failed_cs end address is: 12 (R3)
L_stats14:
;TinyGPS.c,150 :: 		}
L_end_stats:
BX	LR
; end of _stats
_from_hex:
;TinyGPS.c,156 :: 		int from_hex(char a)
; a start address is: 0 (R0)
; a end address is: 0 (R0)
; a start address is: 0 (R0)
;TinyGPS.c,158 :: 		if (a >= 'A' && a <= 'F')
CMP	R0, #65
IT	CC
BCC	L__from_hex120
CMP	R0, #70
IT	HI
BHI	L__from_hex119
L__from_hex118:
;TinyGPS.c,159 :: 		return a - 'A' + 10;
SUBW	R1, R0, #65
SXTH	R1, R1
; a end address is: 0 (R0)
ADDS	R1, #10
SXTH	R0, R1
IT	AL
BAL	L_end_from_hex
;TinyGPS.c,158 :: 		if (a >= 'A' && a <= 'F')
L__from_hex120:
; a start address is: 0 (R0)
L__from_hex119:
;TinyGPS.c,160 :: 		else if (a >= 'a' && a <= 'f')
CMP	R0, #97
IT	CC
BCC	L__from_hex122
CMP	R0, #102
IT	HI
BHI	L__from_hex121
L__from_hex117:
;TinyGPS.c,161 :: 		return a - 'a' + 10;
SUBW	R1, R0, #97
SXTH	R1, R1
; a end address is: 0 (R0)
ADDS	R1, #10
SXTH	R0, R1
IT	AL
BAL	L_end_from_hex
;TinyGPS.c,160 :: 		else if (a >= 'a' && a <= 'f')
L__from_hex122:
; a start address is: 0 (R0)
L__from_hex121:
;TinyGPS.c,163 :: 		return a - '0';
SUBW	R1, R0, #48
; a end address is: 0 (R0)
SXTH	R0, R1
;TinyGPS.c,164 :: 		}
L_end_from_hex:
BX	LR
; end of _from_hex
_parse_decimal:
;TinyGPS.c,166 :: 		unsigned long parse_decimal(TinyGPS* gps)
; gps start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
;TinyGPS.c,169 :: 		char *p = gps->_term;
ADDW	R1, R0, #86
; gps end address is: 0 (R0)
; p start address is: 24 (R6)
MOV	R6, R1
;TinyGPS.c,170 :: 		bool isneg = *p == '-';
LDRB	R1, [R1, #0]
CMP	R1, #45
MOVW	R1, #0
BNE	L__parse_decimal149
MOVS	R1, #1
L__parse_decimal149:
UXTB	R1, R1
; isneg start address is: 20 (R5)
UXTB	R5, R1
;TinyGPS.c,171 :: 		if (isneg)
CMP	R1, #0
IT	EQ
BEQ	L__parse_decimal126
;TinyGPS.c,173 :: 		++p;
ADDS	R6, R6, #1
; p end address is: 24 (R6)
;TinyGPS.c,174 :: 		}
IT	AL
BAL	L_parse_decimal23
L__parse_decimal126:
;TinyGPS.c,171 :: 		if (isneg)
;TinyGPS.c,174 :: 		}
L_parse_decimal23:
;TinyGPS.c,175 :: 		ret = 100UL * gpsatol(p);
; p start address is: 24 (R6)
MOV	R0, R6
BL	_gpsatol+0
MOV	R1, #100
MUL	R4, R1, R0
; ret start address is: 16 (R4)
; isneg end address is: 20 (R5)
; p end address is: 24 (R6)
; ret end address is: 16 (R4)
UXTB	R3, R5
MOV	R5, R6
;TinyGPS.c,176 :: 		while (gpsisdigit(*p)) ++p;
L_parse_decimal24:
; ret start address is: 16 (R4)
; p start address is: 20 (R5)
; isneg start address is: 12 (R3)
LDRB	R1, [R5, #0]
UXTB	R0, R1
BL	_gpsisdigit+0
CMP	R0, #0
IT	EQ
BEQ	L_parse_decimal25
ADDS	R5, R5, #1
IT	AL
BAL	L_parse_decimal24
L_parse_decimal25:
;TinyGPS.c,177 :: 		if (*p == '.')
LDRB	R1, [R5, #0]
CMP	R1, #46
IT	NE
BNE	L__parse_decimal129
;TinyGPS.c,179 :: 		if (gpsisdigit(p[1]))
ADDS	R1, R5, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_gpsisdigit+0
CMP	R0, #0
IT	EQ
BEQ	L__parse_decimal128
;TinyGPS.c,181 :: 		ret += 10 * (p[1] - '0');
ADDS	R1, R5, #1
LDRB	R1, [R1, #0]
SUBW	R2, R1, #48
SXTH	R2, R2
MOVS	R1, #10
SXTH	R1, R1
MULS	R1, R2, R1
SXTH	R1, R1
ADDS	R1, R4, R1
; ret end address is: 16 (R4)
; ret start address is: 8 (R2)
MOV	R2, R1
;TinyGPS.c,182 :: 		if (gpsisdigit(p[2]))
ADDS	R1, R5, #2
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_gpsisdigit+0
CMP	R0, #0
IT	EQ
BEQ	L__parse_decimal127
;TinyGPS.c,183 :: 		ret += p[2] - '0';
ADDS	R1, R5, #2
; p end address is: 20 (R5)
LDRB	R1, [R1, #0]
SUBS	R1, #48
SXTH	R1, R1
ADDS	R0, R2, R1
; ret end address is: 8 (R2)
; ret start address is: 0 (R0)
; ret end address is: 0 (R0)
IT	AL
BAL	L_parse_decimal28
L__parse_decimal127:
;TinyGPS.c,182 :: 		if (gpsisdigit(p[2]))
MOV	R0, R2
;TinyGPS.c,183 :: 		ret += p[2] - '0';
L_parse_decimal28:
;TinyGPS.c,184 :: 		}
; ret start address is: 0 (R0)
; ret end address is: 0 (R0)
IT	AL
BAL	L_parse_decimal27
L__parse_decimal128:
;TinyGPS.c,179 :: 		if (gpsisdigit(p[1]))
MOV	R0, R4
;TinyGPS.c,184 :: 		}
L_parse_decimal27:
;TinyGPS.c,185 :: 		}
; ret start address is: 0 (R0)
; ret end address is: 0 (R0)
IT	AL
BAL	L_parse_decimal26
L__parse_decimal129:
;TinyGPS.c,177 :: 		if (*p == '.')
MOV	R0, R4
;TinyGPS.c,185 :: 		}
L_parse_decimal26:
;TinyGPS.c,186 :: 		return isneg ? -ret : ret;
; ret start address is: 0 (R0)
CMP	R3, #0
IT	EQ
BEQ	L_parse_decimal29
; isneg end address is: 12 (R3)
RSBS	R0, R0, #0
; ret end address is: 0 (R0)
; ?FLOC___parse_decimal?T281 start address is: 0 (R0)
; ?FLOC___parse_decimal?T281 end address is: 0 (R0)
IT	AL
BAL	L_parse_decimal30
L_parse_decimal29:
; ?FLOC___parse_decimal?T281 start address is: 4 (R1)
; ret start address is: 0 (R0)
MOV	R1, R0
; ret end address is: 0 (R0)
; ?FLOC___parse_decimal?T281 end address is: 4 (R1)
MOV	R0, R1
L_parse_decimal30:
; ?FLOC___parse_decimal?T281 start address is: 0 (R0)
; ?FLOC___parse_decimal?T281 end address is: 0 (R0)
;TinyGPS.c,187 :: 		}
L_end_parse_decimal:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _parse_decimal
_parse_degrees:
;TinyGPS.c,189 :: 		unsigned long parse_degrees(TinyGPS* gps)
; gps start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R5, R0
; gps end address is: 0 (R0)
; gps start address is: 20 (R5)
;TinyGPS.c,192 :: 		unsigned long left = gpsatol(gps->_term);
ADDW	R1, R5, #86
MOV	R0, R1
BL	_gpsatol+0
; left start address is: 12 (R3)
MOV	R3, R0
;TinyGPS.c,193 :: 		unsigned long tenk_minutes = (left % 100UL) * 10000UL;
MOV	R1, #100
UDIV	R4, R0, R1
MLS	R4, R1, R4, R0
MOVW	R1, #10000
MOVT	R1, #0
MULS	R4, R1, R4
; tenk_minutes start address is: 16 (R4)
;TinyGPS.c,194 :: 		for (p=gps->_term; gpsisdigit(*p); ++p);
ADDS	R5, #86
; gps end address is: 20 (R5)
; p start address is: 20 (R5)
; tenk_minutes end address is: 16 (R4)
; p end address is: 20 (R5)
; left end address is: 12 (R3)
L_parse_degrees31:
; p start address is: 20 (R5)
; tenk_minutes start address is: 16 (R4)
; left start address is: 12 (R3)
LDRB	R1, [R5, #0]
UXTB	R0, R1
BL	_gpsisdigit+0
CMP	R0, #0
IT	EQ
BEQ	L_parse_degrees32
ADDS	R5, R5, #1
IT	AL
BAL	L_parse_degrees31
L_parse_degrees32:
;TinyGPS.c,195 :: 		if (*p == '.')
LDRB	R1, [R5, #0]
CMP	R1, #46
IT	NE
BNE	L__parse_degrees130
;TinyGPS.c,197 :: 		unsigned long mult = 1000;
; mult start address is: 8 (R2)
MOV	R2, #1000
; tenk_minutes end address is: 16 (R4)
; p end address is: 20 (R5)
; left end address is: 12 (R3)
; mult end address is: 8 (R2)
MOV	R0, R5
MOV	R5, R4
;TinyGPS.c,198 :: 		while (gpsisdigit(*++p))
L_parse_degrees35:
; mult start address is: 8 (R2)
; p start address is: 16 (R4)
; left start address is: 12 (R3)
; tenk_minutes start address is: 20 (R5)
; p start address is: 0 (R0)
ADDS	R1, R0, #1
; p end address is: 0 (R0)
; p start address is: 16 (R4)
MOV	R4, R1
; p end address is: 16 (R4)
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_gpsisdigit+0
CMP	R0, #0
IT	EQ
BEQ	L_parse_degrees36
; p end address is: 16 (R4)
;TinyGPS.c,200 :: 		tenk_minutes += mult * (*p - '0');
; p start address is: 16 (R4)
LDRB	R1, [R4, #0]
SUBS	R1, #48
SXTH	R1, R1
MULS	R1, R2, R1
ADDS	R5, R5, R1
;TinyGPS.c,201 :: 		mult /= 10;
MOVS	R1, #10
UDIV	R2, R2, R1
;TinyGPS.c,202 :: 		}
MOV	R0, R4
; p end address is: 16 (R4)
; mult end address is: 8 (R2)
IT	AL
BAL	L_parse_degrees35
L_parse_degrees36:
;TinyGPS.c,203 :: 		}
MOV	R0, R3
; tenk_minutes end address is: 20 (R5)
MOV	R3, R5
IT	AL
BAL	L_parse_degrees34
; left end address is: 12 (R3)
L__parse_degrees130:
;TinyGPS.c,195 :: 		if (*p == '.')
MOV	R0, R3
MOV	R3, R4
;TinyGPS.c,203 :: 		}
L_parse_degrees34:
;TinyGPS.c,204 :: 		return (left / 100) * 100000 + tenk_minutes / 6;
; left start address is: 0 (R0)
; tenk_minutes start address is: 12 (R3)
MOVS	R1, #100
UDIV	R2, R0, R1
; left end address is: 0 (R0)
MOVW	R1, #34464
MOVT	R1, #1
MULS	R2, R1, R2
MOVS	R1, #6
UDIV	R1, R3, R1
; tenk_minutes end address is: 12 (R3)
ADDS	R1, R2, R1
MOV	R0, R1
;TinyGPS.c,205 :: 		}
L_end_parse_degrees:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _parse_degrees
_term_complete:
;TinyGPS.c,211 :: 		bool term_complete(TinyGPS* gps)
; gps start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R7, R0
; gps end address is: 0 (R0)
; gps start address is: 28 (R7)
;TinyGPS.c,213 :: 		if (gps->_is_checksum_term)
ADDW	R1, R7, #85
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_term_complete37
;TinyGPS.c,215 :: 		byte checksum = 16 * from_hex(gps->_term[0]) + from_hex(gps->_term[1]);
ADDW	R1, R7, #86
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_from_hex+0
LSLS	R1, R0, #4
STRH	R1, [SP, #4]
ADDW	R1, R7, #86
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_from_hex+0
LDRSH	R1, [SP, #4]
ADDS	R3, R1, R0
;TinyGPS.c,216 :: 		if (checksum == gps->_parity)
ADDW	R1, R7, #84
LDRB	R2, [R1, #0]
UXTB	R1, R3
CMP	R1, R2
IT	NE
BNE	L_term_complete38
;TinyGPS.c,218 :: 		if (gps->_gps_data_good)
ADDW	R1, R7, #104
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_term_complete39
;TinyGPS.c,221 :: 		++gps->_good_sentences;
ADDW	R2, R7, #112
LDRB	R1, [R2, #0]
ADDS	R1, R1, #1
STRB	R1, [R2, #0]
;TinyGPS.c,223 :: 		gps->_last_time_fix = gps->_new_time_fix;
ADDW	R2, R7, #68
ADDW	R1, R7, #72
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;TinyGPS.c,224 :: 		gps->_last_position_fix = gps->_new_position_fix;
ADDW	R2, R7, #76
ADDW	R1, R7, #80
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;TinyGPS.c,226 :: 		switch(gps->_sentence_type)
ADDW	R3, R7, #101
IT	AL
BAL	L_term_complete40
;TinyGPS.c,228 :: 		case _GPS_SENTENCE_GPRMC:
L_term_complete42:
;TinyGPS.c,229 :: 		gps->_time      = gps->_new_time;
ADDS	R1, R7, #4
LDR	R1, [R1, #0]
STR	R1, [R7, #0]
;TinyGPS.c,230 :: 		gps->_date      = gps->_new_date;
ADDW	R2, R7, #8
ADDW	R1, R7, #12
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;TinyGPS.c,231 :: 		gps->_latitude  = gps->_new_latitude;
ADDW	R2, R7, #16
ADDW	R1, R7, #20
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;TinyGPS.c,232 :: 		gps->_longitude = gps->_new_longitude;
ADDW	R2, R7, #24
ADDW	R1, R7, #28
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;TinyGPS.c,233 :: 		gps->_speed     = gps->_new_speed;
ADDW	R2, R7, #40
ADDW	R1, R7, #44
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;TinyGPS.c,234 :: 		gps->_course    = gps->_new_course;
ADDW	R2, R7, #48
ADDW	R1, R7, #52
; gps end address is: 28 (R7)
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;TinyGPS.c,235 :: 		break;
IT	AL
BAL	L_term_complete41
;TinyGPS.c,236 :: 		case _GPS_SENTENCE_GPGGA:
L_term_complete43:
;TinyGPS.c,237 :: 		gps->_altitude  = gps->_new_altitude;
; gps start address is: 28 (R7)
ADDW	R2, R7, #32
ADDW	R1, R7, #36
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;TinyGPS.c,238 :: 		gps->_time      = gps->_new_time;
ADDS	R1, R7, #4
LDR	R1, [R1, #0]
STR	R1, [R7, #0]
;TinyGPS.c,239 :: 		gps->_latitude  = gps->_new_latitude;
ADDW	R2, R7, #16
ADDW	R1, R7, #20
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;TinyGPS.c,240 :: 		gps->_longitude = gps->_new_longitude;
ADDW	R2, R7, #24
ADDW	R1, R7, #28
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;TinyGPS.c,241 :: 		gps->_numsats   = gps->_new_numsats;
ADDW	R2, R7, #64
ADDW	R1, R7, #65
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;TinyGPS.c,242 :: 		gps->_hdop      = gps->_new_hdop;
ADDW	R2, R7, #56
ADDW	R1, R7, #60
; gps end address is: 28 (R7)
LDR	R1, [R1, #0]
STR	R1, [R2, #0]
;TinyGPS.c,243 :: 		break;
IT	AL
BAL	L_term_complete41
;TinyGPS.c,244 :: 		}
L_term_complete40:
; gps start address is: 28 (R7)
LDRB	R1, [R3, #0]
CMP	R1, #2
IT	EQ
BEQ	L_term_complete42
LDRB	R1, [R3, #0]
CMP	R1, #1
IT	EQ
BEQ	L_term_complete43
; gps end address is: 28 (R7)
L_term_complete41:
;TinyGPS.c,246 :: 		return true;
MOVS	R0, #1
IT	AL
BAL	L_end_term_complete
;TinyGPS.c,247 :: 		}
L_term_complete39:
;TinyGPS.c,248 :: 		}
IT	AL
BAL	L_term_complete44
L_term_complete38:
;TinyGPS.c,252 :: 		++gps->_failed_checksum;
; gps start address is: 28 (R7)
ADDW	R2, R7, #113
; gps end address is: 28 (R7)
LDRB	R1, [R2, #0]
ADDS	R1, R1, #1
STRB	R1, [R2, #0]
L_term_complete44:
;TinyGPS.c,254 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_term_complete
;TinyGPS.c,255 :: 		}
L_term_complete37:
;TinyGPS.c,258 :: 		if (gps->_term_number == 0)
; gps start address is: 28 (R7)
ADDW	R1, R7, #102
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_term_complete45
;TinyGPS.c,260 :: 		if (!gpsstrcmp(gps->_term, _GPRMC_TERM))
MOVW	R2, #lo_addr(?lstr_1_TinyGPS+0)
MOVT	R2, #hi_addr(?lstr_1_TinyGPS+0)
ADDW	R1, R7, #86
MOV	R0, R1
MOV	R1, R2
BL	_gpsstrcmp+0
CMP	R0, #0
IT	NE
BNE	L_term_complete46
;TinyGPS.c,261 :: 		gps->_sentence_type = _GPS_SENTENCE_GPRMC;
ADDW	R2, R7, #101
; gps end address is: 28 (R7)
MOVS	R1, #2
STRB	R1, [R2, #0]
IT	AL
BAL	L_term_complete47
L_term_complete46:
;TinyGPS.c,262 :: 		else if (!gpsstrcmp(gps->_term, _GPGGA_TERM))
; gps start address is: 28 (R7)
MOVW	R2, #lo_addr(?lstr_2_TinyGPS+0)
MOVT	R2, #hi_addr(?lstr_2_TinyGPS+0)
ADDW	R1, R7, #86
MOV	R0, R1
MOV	R1, R2
BL	_gpsstrcmp+0
CMP	R0, #0
IT	NE
BNE	L_term_complete48
;TinyGPS.c,263 :: 		gps->_sentence_type = _GPS_SENTENCE_GPGGA;
ADDW	R2, R7, #101
; gps end address is: 28 (R7)
MOVS	R1, #1
STRB	R1, [R2, #0]
IT	AL
BAL	L_term_complete49
L_term_complete48:
;TinyGPS.c,265 :: 		gps->_sentence_type = _GPS_SENTENCE_OTHER;
; gps start address is: 28 (R7)
ADDW	R2, R7, #101
; gps end address is: 28 (R7)
MOVS	R1, #3
STRB	R1, [R2, #0]
L_term_complete49:
L_term_complete47:
;TinyGPS.c,266 :: 		return false;
MOVS	R0, #0
IT	AL
BAL	L_end_term_complete
;TinyGPS.c,267 :: 		}
L_term_complete45:
;TinyGPS.c,269 :: 		if (gps->_sentence_type != _GPS_SENTENCE_OTHER && gps->_term[0])
; gps start address is: 28 (R7)
ADDW	R1, R7, #101
LDRB	R1, [R1, #0]
CMP	R1, #3
IT	EQ
BEQ	L__term_complete133
ADDW	R1, R7, #86
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__term_complete132
L__term_complete131:
;TinyGPS.c,270 :: 		switch(COMBINE(gps->_sentence_type, gps->_term_number))
ADDW	R1, R7, #101
LDRB	R1, [R1, #0]
LSLS	R2, R1, #5
UXTH	R2, R2
ADDW	R1, R7, #102
LDRB	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STRH	R1, [SP, #8]
IT	AL
BAL	L_term_complete53
;TinyGPS.c,272 :: 		case COMBINE(_GPS_SENTENCE_GPRMC, 1): // Time in both sentences
L_term_complete55:
;TinyGPS.c,274 :: 		case COMBINE(_GPS_SENTENCE_GPGGA, 1):
L_term_complete56:
;TinyGPS.c,275 :: 		gps->_new_time = parse_decimal(gps);
ADDS	R1, R7, #4
STR	R1, [SP, #4]
MOV	R0, R7
BL	_parse_decimal+0
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;TinyGPS.c,276 :: 		gps->_new_time_fix = millis();
ADDW	R1, R7, #72
; gps end address is: 28 (R7)
STR	R1, [SP, #4]
BL	_millis+0
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;TinyGPS.c,277 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,278 :: 		case COMBINE(_GPS_SENTENCE_GPRMC, 2): // GPRMC validity
L_term_complete57:
;TinyGPS.c,279 :: 		gps->_gps_data_good = gps->_term[0] == 'A';
; gps start address is: 28 (R7)
ADDW	R2, R7, #104
ADDW	R1, R7, #86
; gps end address is: 28 (R7)
LDRB	R1, [R1, #0]
CMP	R1, #65
MOVW	R1, #0
BNE	L__term_complete152
MOVS	R1, #1
L__term_complete152:
STRB	R1, [R2, #0]
;TinyGPS.c,280 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,281 :: 		case COMBINE(_GPS_SENTENCE_GPRMC, 3): // Latitude
L_term_complete58:
;TinyGPS.c,283 :: 		case COMBINE(_GPS_SENTENCE_GPGGA, 2):
; gps start address is: 28 (R7)
L_term_complete59:
;TinyGPS.c,284 :: 		gps->_new_latitude = parse_degrees(gps);
ADDW	R1, R7, #20
STR	R1, [SP, #4]
MOV	R0, R7
BL	_parse_degrees+0
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;TinyGPS.c,285 :: 		gps->_new_position_fix = millis();
ADDW	R1, R7, #80
; gps end address is: 28 (R7)
STR	R1, [SP, #4]
BL	_millis+0
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;TinyGPS.c,286 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,287 :: 		case COMBINE(_GPS_SENTENCE_GPRMC, 4): // N/S
L_term_complete60:
;TinyGPS.c,289 :: 		case COMBINE(_GPS_SENTENCE_GPGGA, 3):
; gps start address is: 28 (R7)
L_term_complete61:
;TinyGPS.c,290 :: 		if (gps->_term[0] == 'S')
ADDW	R1, R7, #86
LDRB	R1, [R1, #0]
CMP	R1, #83
IT	NE
BNE	L_term_complete62
;TinyGPS.c,291 :: 		gps->_new_latitude = -(gps->_new_latitude);
ADDW	R2, R7, #20
; gps end address is: 28 (R7)
LDR	R1, [R2, #0]
RSBS	R1, R1, #0
STR	R1, [R2, #0]
L_term_complete62:
;TinyGPS.c,292 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,293 :: 		case COMBINE(_GPS_SENTENCE_GPRMC, 5): // Longitude
L_term_complete63:
;TinyGPS.c,295 :: 		case COMBINE(_GPS_SENTENCE_GPGGA, 4):
; gps start address is: 28 (R7)
L_term_complete64:
;TinyGPS.c,296 :: 		gps->_new_longitude = parse_degrees(gps);
ADDW	R1, R7, #28
STR	R1, [SP, #4]
MOV	R0, R7
; gps end address is: 28 (R7)
BL	_parse_degrees+0
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;TinyGPS.c,297 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,298 :: 		case COMBINE(_GPS_SENTENCE_GPRMC, 6): // E/W
L_term_complete65:
;TinyGPS.c,300 :: 		case COMBINE(_GPS_SENTENCE_GPGGA, 5):
; gps start address is: 28 (R7)
L_term_complete66:
;TinyGPS.c,301 :: 		if (gps->_term[0] == 'W')
ADDW	R1, R7, #86
LDRB	R1, [R1, #0]
CMP	R1, #87
IT	NE
BNE	L_term_complete67
;TinyGPS.c,302 :: 		gps->_new_longitude = -gps->_new_longitude;
ADDW	R2, R7, #28
; gps end address is: 28 (R7)
LDR	R1, [R2, #0]
RSBS	R1, R1, #0
STR	R1, [R2, #0]
L_term_complete67:
;TinyGPS.c,303 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,304 :: 		case COMBINE(_GPS_SENTENCE_GPRMC, 7): // Speed (GPRMC)
L_term_complete68:
;TinyGPS.c,305 :: 		gps->_new_speed = parse_decimal(gps);
; gps start address is: 28 (R7)
ADDW	R1, R7, #44
STR	R1, [SP, #4]
MOV	R0, R7
; gps end address is: 28 (R7)
BL	_parse_decimal+0
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;TinyGPS.c,306 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,307 :: 		case COMBINE(_GPS_SENTENCE_GPRMC, 8): // Course (GPRMC)
L_term_complete69:
;TinyGPS.c,308 :: 		gps->_new_course = parse_decimal(gps);
; gps start address is: 28 (R7)
ADDW	R1, R7, #52
STR	R1, [SP, #4]
MOV	R0, R7
; gps end address is: 28 (R7)
BL	_parse_decimal+0
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;TinyGPS.c,309 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,310 :: 		case COMBINE(_GPS_SENTENCE_GPRMC, 9): // Date (GPRMC)
L_term_complete70:
;TinyGPS.c,311 :: 		gps->_new_date = gpsatol(gps->_term);
; gps start address is: 28 (R7)
ADDW	R1, R7, #12
STR	R1, [SP, #4]
ADDW	R1, R7, #86
; gps end address is: 28 (R7)
MOV	R0, R1
BL	_gpsatol+0
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;TinyGPS.c,312 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,313 :: 		case COMBINE(_GPS_SENTENCE_GPGGA, 6): // Fix data (GPGGA)
L_term_complete71:
;TinyGPS.c,314 :: 		gps->_gps_data_good = gps->_term[0] > '0';
; gps start address is: 28 (R7)
ADDW	R2, R7, #104
ADDW	R1, R7, #86
; gps end address is: 28 (R7)
LDRB	R1, [R1, #0]
CMP	R1, #48
MOVW	R1, #0
BLS	L__term_complete153
MOVS	R1, #1
L__term_complete153:
STRB	R1, [R2, #0]
;TinyGPS.c,315 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,316 :: 		case COMBINE(_GPS_SENTENCE_GPGGA, 7): // Satellites used (GPGGA)
L_term_complete72:
;TinyGPS.c,317 :: 		gps->_new_numsats = (unsigned char)atoi(gps->_term);
; gps start address is: 28 (R7)
ADDW	R1, R7, #65
STR	R1, [SP, #4]
ADDW	R1, R7, #86
; gps end address is: 28 (R7)
MOV	R0, R1
BL	_atoi+0
UXTB	R2, R0
LDR	R1, [SP, #4]
STRB	R2, [R1, #0]
;TinyGPS.c,318 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,319 :: 		case COMBINE(_GPS_SENTENCE_GPGGA, 8): // HDOP
L_term_complete73:
;TinyGPS.c,320 :: 		gps->_new_hdop = parse_decimal(gps);
; gps start address is: 28 (R7)
ADDW	R1, R7, #60
STR	R1, [SP, #4]
MOV	R0, R7
; gps end address is: 28 (R7)
BL	_parse_decimal+0
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;TinyGPS.c,321 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,322 :: 		case COMBINE(_GPS_SENTENCE_GPGGA, 9): // Altitude (GPGGA)
L_term_complete74:
;TinyGPS.c,323 :: 		gps->_new_altitude = parse_decimal(gps);
; gps start address is: 28 (R7)
ADDW	R1, R7, #36
STR	R1, [SP, #4]
MOV	R0, R7
; gps end address is: 28 (R7)
BL	_parse_decimal+0
LDR	R1, [SP, #4]
STR	R0, [R1, #0]
;TinyGPS.c,324 :: 		break;
IT	AL
BAL	L_term_complete54
;TinyGPS.c,325 :: 		}
L_term_complete53:
; gps start address is: 28 (R7)
LDRH	R1, [SP, #8]
CMP	R1, #65
IT	EQ
BEQ	L_term_complete55
CMP	R1, #33
IT	EQ
BEQ	L_term_complete56
CMP	R1, #66
IT	EQ
BEQ	L_term_complete57
CMP	R1, #67
IT	EQ
BEQ	L_term_complete58
CMP	R1, #34
IT	EQ
BEQ	L_term_complete59
CMP	R1, #68
IT	EQ
BEQ	L_term_complete60
CMP	R1, #35
IT	EQ
BEQ	L_term_complete61
CMP	R1, #69
IT	EQ
BEQ	L_term_complete63
CMP	R1, #36
IT	EQ
BEQ	L_term_complete64
CMP	R1, #70
IT	EQ
BEQ	L_term_complete65
CMP	R1, #37
IT	EQ
BEQ	L_term_complete66
CMP	R1, #71
IT	EQ
BEQ	L_term_complete68
CMP	R1, #72
IT	EQ
BEQ	L_term_complete69
CMP	R1, #73
IT	EQ
BEQ	L_term_complete70
CMP	R1, #38
IT	EQ
BEQ	L_term_complete71
CMP	R1, #39
IT	EQ
BEQ	L_term_complete72
CMP	R1, #40
IT	EQ
BEQ	L_term_complete73
CMP	R1, #41
IT	EQ
BEQ	L_term_complete74
; gps end address is: 28 (R7)
L_term_complete54:
;TinyGPS.c,269 :: 		if (gps->_sentence_type != _GPS_SENTENCE_OTHER && gps->_term[0])
L__term_complete133:
L__term_complete132:
;TinyGPS.c,326 :: 		return false;
MOVS	R0, #0
;TinyGPS.c,327 :: 		}
L_end_term_complete:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _term_complete
_gpsatol:
;TinyGPS.c,329 :: 		long gpsatol(const char *str)
; str start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; str end address is: 0 (R0)
; str start address is: 0 (R0)
;TinyGPS.c,331 :: 		long ret = 0;
; ret start address is: 16 (R4)
MOV	R4, #0
; str end address is: 0 (R0)
; ret end address is: 16 (R4)
MOV	R3, R0
;TinyGPS.c,332 :: 		while (gpsisdigit(*str))
L_gpsatol75:
; ret start address is: 16 (R4)
; str start address is: 12 (R3)
LDRB	R1, [R3, #0]
UXTB	R0, R1
BL	_gpsisdigit+0
CMP	R0, #0
IT	EQ
BEQ	L_gpsatol76
;TinyGPS.c,333 :: 		ret = 10 * ret + *str++ - '0';
MOVS	R1, #10
MUL	R2, R1, R4
; ret end address is: 16 (R4)
LDRB	R1, [R3, #0]
ADDS	R1, R2, R1
SUBS	R1, #48
; ret start address is: 16 (R4)
MOV	R4, R1
ADDS	R3, R3, #1
; str end address is: 12 (R3)
IT	AL
BAL	L_gpsatol75
L_gpsatol76:
;TinyGPS.c,334 :: 		return ret;
MOV	R0, R4
; ret end address is: 16 (R4)
;TinyGPS.c,335 :: 		}
L_end_gpsatol:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _gpsatol
_gpsstrcmp:
;TinyGPS.c,337 :: 		int gpsstrcmp(const char *str1, const char *str2)
; str2 start address is: 4 (R1)
; str1 start address is: 0 (R0)
SUB	SP, SP, #4
; str2 end address is: 4 (R1)
; str1 end address is: 0 (R0)
; str1 start address is: 0 (R0)
; str2 start address is: 4 (R1)
STR	R1, [SP, #0]
; str1 end address is: 0 (R0)
; str2 end address is: 4 (R1)
MOV	R1, R0
LDR	R0, [SP, #0]
;TinyGPS.c,339 :: 		while (*str1 && *str1 == *str2)
L_gpsstrcmp77:
; str2 start address is: 0 (R0)
; str1 start address is: 4 (R1)
LDRB	R2, [R1, #0]
CMP	R2, #0
IT	EQ
BEQ	L__gpsstrcmp125
LDRB	R3, [R0, #0]
LDRB	R2, [R1, #0]
CMP	R2, R3
IT	NE
BNE	L__gpsstrcmp124
L__gpsstrcmp123:
;TinyGPS.c,340 :: 		++str1, ++str2;
ADDS	R1, R1, #1
ADDS	R0, R0, #1
; str2 end address is: 0 (R0)
IT	AL
BAL	L_gpsstrcmp77
;TinyGPS.c,339 :: 		while (*str1 && *str1 == *str2)
L__gpsstrcmp125:
L__gpsstrcmp124:
;TinyGPS.c,341 :: 		return *str1;
LDRB	R2, [R1, #0]
; str1 end address is: 4 (R1)
UXTB	R0, R2
;TinyGPS.c,342 :: 		}
L_end_gpsstrcmp:
ADD	SP, SP, #4
BX	LR
; end of _gpsstrcmp
TinyGPS_distance_between:
;TinyGPS.c,347 :: 		static float distance_between (float lat1, float long1, float lat2, float long2)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; long2 start address is: 12 (R3)
; lat2 start address is: 8 (R2)
; long1 start address is: 4 (R1)
; lat1 start address is: 0 (R0)
VMOV.F32	S10, S0
VMOV.F32	S0, S1
VMOV.F32	S7, S2
; long2 end address is: 12 (R3)
; lat2 end address is: 8 (R2)
; long1 end address is: 4 (R1)
; lat1 end address is: 0 (R0)
; lat1 start address is: 40 (R10)
; long1 start address is: 0 (R0)
; lat2 start address is: 28 (R7)
; long2 start address is: 12 (R3)
;TinyGPS.c,354 :: 		float delta = (PI/180)*(long1-long2);
MOVW	R4, #lo_addr(_PI+0)
MOVT	R4, #hi_addr(_PI+0)
LDR	R5, [R4, #0]
MOVS	R4, #180
UDIV	R4, R5, R4
VSUB.F32	S1, S0, S3
; long1 end address is: 0 (R0)
; long2 end address is: 12 (R3)
VMOV	S0, R4
VCVT.F32	#0, S0, S0
VMUL.F32	S0, S0, S1
; delta start address is: 20 (R5)
VMOV.F32	S5, S0
;TinyGPS.c,355 :: 		float sdlong = sin(delta);
BL	_sin+0
; sdlong start address is: 24 (R6)
VMOV.F32	S6, S0
;TinyGPS.c,356 :: 		float cdlong = cos(delta);
VMOV.F32	S0, S5
; delta end address is: 20 (R5)
BL	_cos+0
; cdlong start address is: 32 (R8)
VMOV.F32	S8, S0
;TinyGPS.c,357 :: 		float slat1 = sin(lat1);
VMOV.F32	S0, S10
BL	_sin+0
; slat1 start address is: 36 (R9)
VMOV.F32	S9, S0
;TinyGPS.c,358 :: 		float clat1 = cos(lat1);
VMOV.F32	S0, S10
; lat1 end address is: 40 (R10)
BL	_cos+0
; clat1 start address is: 40 (R10)
VMOV.F32	S10, S0
;TinyGPS.c,359 :: 		float slat2 = sin(lat2);
VMOV.F32	S0, S7
BL	_sin+0
; slat2 start address is: 44 (R11)
VMOV.F32	S11, S0
;TinyGPS.c,360 :: 		float clat2 = cos(lat2);
VMOV.F32	S0, S7
; lat2 end address is: 28 (R7)
BL	_cos+0
; clat2 start address is: 8 (R2)
VMOV.F32	S2, S0
;TinyGPS.c,361 :: 		float denom = (slat1 * slat2) + (clat1 * clat2 * cdlong);
VMUL.F32	S1, S9, S11
VMUL.F32	S0, S10, S2
VMUL.F32	S0, S0, S8
VADD.F32	S0, S1, S0
; denom start address is: 16 (R4)
VMOV.F32	S4, S0
;TinyGPS.c,364 :: 		delta = (clat1 * slat2) - (slat1 * clat2 * cdlong);
VMUL.F32	S1, S10, S11
; clat1 end address is: 40 (R10)
; slat2 end address is: 44 (R11)
VMUL.F32	S0, S9, S2
; slat1 end address is: 36 (R9)
VMUL.F32	S0, S0, S8
; cdlong end address is: 32 (R8)
VSUB.F32	S0, S1, S0
;TinyGPS.c,365 :: 		delta = (delta * delta );
VMUL.F32	S0, S0, S0
; delta start address is: 4 (R1)
VMOV.F32	S1, S0
;TinyGPS.c,366 :: 		delta += (clat2 * sdlong) * (clat2 * sdlong);
VMUL.F32	S0, S2, S6
; sdlong end address is: 24 (R6)
; clat2 end address is: 8 (R2)
VMUL.F32	S0, S0, S0
VADD.F32	S0, S1, S0
; delta end address is: 4 (R1)
;TinyGPS.c,367 :: 		delta = sqrt(delta);
BL	_sqrt+0
;TinyGPS.c,368 :: 		delta = atan2(delta, denom);
VMOV.F32	S1, S4
; denom end address is: 16 (R4)
VMOV.F32	S0, S0
BL	_atan2+0
;TinyGPS.c,369 :: 		return delta * 6372795;
MOVW	R4, #31606
MOVT	R4, #19138
VMOV	S1, R4
VMUL.F32	S0, S0, S1
;TinyGPS.c,370 :: 		}
L_end_distance_between:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of TinyGPS_distance_between
TinyGPS_course_to:
;TinyGPS.c,372 :: 		static float course_to (float lat1, float long1, float lat2, float long2)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; long2 start address is: 12 (R3)
; lat2 start address is: 8 (R2)
; long1 start address is: 4 (R1)
; lat1 start address is: 0 (R0)
VMOV.F32	S7, S0
VMOV.F32	S0, S1
VMOV.F32	S6, S2
; long2 end address is: 12 (R3)
; lat2 end address is: 8 (R2)
; long1 end address is: 4 (R1)
; lat1 end address is: 0 (R0)
; lat1 start address is: 28 (R7)
; long1 start address is: 0 (R0)
; lat2 start address is: 24 (R6)
; long2 start address is: 12 (R3)
;TinyGPS.c,378 :: 		float dlon = (PI/180)*(long2-long1);
MOVW	R4, #lo_addr(_PI+0)
MOVT	R4, #hi_addr(_PI+0)
LDR	R5, [R4, #0]
MOVS	R4, #180
UDIV	R4, R5, R4
VSUB.F32	S1, S3, S0
; long1 end address is: 0 (R0)
; long2 end address is: 12 (R3)
VMOV	S0, R4
VCVT.F32	#0, S0, S0
VMUL.F32	S0, S0, S1
; dlon start address is: 36 (R9)
VMOV.F32	S9, S0
;TinyGPS.c,379 :: 		float a1 = sin(dlon) * cos(lat2);
BL	_sin+0
VSTR	#1, S0, [SP, #4]
VMOV.F32	S0, S6
BL	_cos+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S0, S1, S0
; a1 start address is: 32 (R8)
VMOV.F32	S8, S0
;TinyGPS.c,380 :: 		float a2 = sin(lat1) * cos(lat2) * cos(dlon);
VMOV.F32	S0, S7
BL	_sin+0
VSTR	#1, S0, [SP, #4]
VMOV.F32	S0, S6
BL	_cos+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [SP, #4]
VMOV.F32	S0, S9
; dlon end address is: 36 (R9)
BL	_cos+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S0, S1, S0
; a2 start address is: 36 (R9)
VMOV.F32	S9, S0
;TinyGPS.c,381 :: 		float degrees = (180/PI)*(a2);
MOVW	R6, #lo_addr(_PI+0)
MOVT	R6, #hi_addr(_PI+0)
LDR	R5, [R6, #0]
MOVS	R4, #180
UDIV	R4, R4, R5
VMOV	S0, R4
VCVT.F32	#0, S0, S0
VMUL.F32	S0, S0, S9
; degrees start address is: 40 (R10)
VMOV.F32	S10, S0
;TinyGPS.c,382 :: 		lat1 = (PI/180)*(lat1);
MOV	R4, R6
LDR	R5, [R4, #0]
MOVS	R4, #180
UDIV	R4, R5, R4
VMOV	S1, R4
VCVT.F32	#0, S1, S1
VMUL.F32	S0, S1, S7
; lat1 end address is: 28 (R7)
; lat1 start address is: 8 (R2)
VMOV.F32	S2, S0
;TinyGPS.c,383 :: 		lat2 = (PI/180)*(lat2);
VMUL.F32	S6, S1, S6
;TinyGPS.c,384 :: 		a2 = cos(lat1) * sin(lat2) - a2;
VMOV.F32	S0, S2
; lat1 end address is: 8 (R2)
BL	_cos+0
VSTR	#1, S0, [SP, #4]
VMOV.F32	S0, S6
; lat2 end address is: 24 (R6)
BL	_sin+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S0, S1, S0
VSUB.F32	S0, S0, S9
; a2 end address is: 36 (R9)
;TinyGPS.c,385 :: 		a2 = atan2(a1, a2);
VMOV.F32	S1, S0
VMOV.F32	S0, S8
; a1 end address is: 32 (R8)
BL	_atan2+0
;TinyGPS.c,386 :: 		if (a2 < 0.0)
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	GE
BGE	L_TinyGPS_course_to81
;TinyGPS.c,389 :: 		}
L_TinyGPS_course_to81:
;TinyGPS.c,391 :: 		return degrees;
VMOV.F32	S0, S10
; degrees end address is: 40 (R10)
;TinyGPS.c,392 :: 		}
L_end_course_to:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of TinyGPS_course_to
TinyGPS_cardinal:
;TinyGPS.c,394 :: 		static const char *cardinal (float course)
; course start address is: 0 (R0)
VMOV.F32	S2, S0
; course end address is: 0 (R0)
; course start address is: 8 (R2)
;TinyGPS.c,397 :: 		int direction = (int)((course + 11.25f) / 22.5f);
MOVW	R1, #0
MOVT	R1, #16692
VMOV	S0, R1
VADD.F32	S1, S2, S0
; course end address is: 8 (R2)
MOVW	R1, #0
MOVT	R1, #16820
VMOV	S0, R1
VDIV.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
SXTH	R3, R3
;TinyGPS.c,398 :: 		return directions[direction % 16];
MOVS	R2, #16
SXTH	R2, R2
SDIV	R1, R3, R2
MLS	R1, R2, R1, R3
SXTH	R1, R1
LSLS	R2, R1, #2
MOVW	R1, #lo_addr(TinyGPS_cardinal_directions_L0+0)
MOVT	R1, #hi_addr(TinyGPS_cardinal_directions_L0+0)
ADDS	R1, R1, R2
LDR	R1, [R1, #0]
MOV	R0, R1
;TinyGPS.c,399 :: 		}
L_end_cardinal:
BX	LR
; end of TinyGPS_cardinal
_get_position:
;TinyGPS.c,402 :: 		void get_position(TinyGPS* gps, long *latitude, long *longitude, unsigned long *fix_age)
; fix_age start address is: 12 (R3)
; longitude start address is: 8 (R2)
; latitude start address is: 4 (R1)
; gps start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
; fix_age end address is: 12 (R3)
; longitude end address is: 8 (R2)
; latitude end address is: 4 (R1)
; gps end address is: 0 (R0)
; gps start address is: 4 (R1)
; latitude start address is: 0 (R0)
; longitude start address is: 8 (R2)
; fix_age start address is: 12 (R3)
;TinyGPS.c,404 :: 		if (latitude) *latitude = gps->_latitude;
CMP	R0, #0
IT	EQ
BEQ	L_get_position82
ADDW	R4, R1, #16
LDR	R4, [R4, #0]
STR	R4, [R0, #0]
; latitude end address is: 0 (R0)
L_get_position82:
;TinyGPS.c,405 :: 		if (longitude) *longitude = gps->_longitude;
CMP	R2, #0
IT	EQ
BEQ	L_get_position83
ADDW	R4, R1, #24
LDR	R4, [R4, #0]
STR	R4, [R2, #0]
; longitude end address is: 8 (R2)
L_get_position83:
;TinyGPS.c,406 :: 		if (fix_age) *fix_age = gps->_last_position_fix == GPS_INVALID_FIX_TIME ?
CMP	R3, #0
IT	EQ
BEQ	L_get_position84
ADDW	R4, R1, #76
LDR	R4, [R4, #0]
CMP	R4, #-1
IT	NE
BNE	L_get_position85
; gps end address is: 4 (R1)
;TinyGPS.c,407 :: 		GPS_INVALID_AGE : millis() - gps->_last_position_fix;
; ?FLOC___get_position?T810 start address is: 0 (R0)
MOV	R0, #-1
; ?FLOC___get_position?T810 end address is: 0 (R0)
IT	AL
BAL	L_get_position86
L_get_position85:
; gps start address is: 4 (R1)
BL	_millis+0
ADDW	R4, R1, #76
; gps end address is: 4 (R1)
LDR	R4, [R4, #0]
SUB	R0, R0, R4
; ?FLOC___get_position?T810 start address is: 0 (R0)
; ?FLOC___get_position?T810 end address is: 0 (R0)
L_get_position86:
; ?FLOC___get_position?T810 start address is: 0 (R0)
STR	R0, [R3, #0]
; fix_age end address is: 12 (R3)
; ?FLOC___get_position?T810 end address is: 0 (R0)
L_get_position84:
;TinyGPS.c,408 :: 		}
L_end_get_position:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _get_position
_get_datetime:
;TinyGPS.c,411 :: 		void get_datetime(TinyGPS* gps, unsigned long *date, unsigned long *time, unsigned long *fix_age)
; fix_age start address is: 12 (R3)
; time start address is: 8 (R2)
; date start address is: 4 (R1)
; gps start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STR	R1, [SP, #4]
MOV	R1, R0
LDR	R0, [SP, #4]
; fix_age end address is: 12 (R3)
; time end address is: 8 (R2)
; date end address is: 4 (R1)
; gps end address is: 0 (R0)
; gps start address is: 4 (R1)
; date start address is: 0 (R0)
; time start address is: 8 (R2)
; fix_age start address is: 12 (R3)
;TinyGPS.c,413 :: 		if (date) *date = gps->_date;
CMP	R0, #0
IT	EQ
BEQ	L_get_datetime87
ADDW	R4, R1, #8
LDR	R4, [R4, #0]
STR	R4, [R0, #0]
; date end address is: 0 (R0)
L_get_datetime87:
;TinyGPS.c,414 :: 		if (time) *time = gps->_time;
CMP	R2, #0
IT	EQ
BEQ	L_get_datetime88
LDR	R4, [R1, #0]
STR	R4, [R2, #0]
; time end address is: 8 (R2)
L_get_datetime88:
;TinyGPS.c,415 :: 		if (fix_age) *fix_age = gps->_last_time_fix == GPS_INVALID_FIX_TIME ?
CMP	R3, #0
IT	EQ
BEQ	L_get_datetime89
ADDW	R4, R1, #68
LDR	R4, [R4, #0]
CMP	R4, #-1
IT	NE
BNE	L_get_datetime90
; gps end address is: 4 (R1)
;TinyGPS.c,416 :: 		GPS_INVALID_AGE : millis() - gps->_last_time_fix;
; ?FLOC___get_datetime?T832 start address is: 0 (R0)
MOV	R0, #-1
; ?FLOC___get_datetime?T832 end address is: 0 (R0)
IT	AL
BAL	L_get_datetime91
L_get_datetime90:
; gps start address is: 4 (R1)
BL	_millis+0
ADDW	R4, R1, #68
; gps end address is: 4 (R1)
LDR	R4, [R4, #0]
SUB	R0, R0, R4
; ?FLOC___get_datetime?T832 start address is: 0 (R0)
; ?FLOC___get_datetime?T832 end address is: 0 (R0)
L_get_datetime91:
; ?FLOC___get_datetime?T832 start address is: 0 (R0)
STR	R0, [R3, #0]
; fix_age end address is: 12 (R3)
; ?FLOC___get_datetime?T832 end address is: 0 (R0)
L_get_datetime89:
;TinyGPS.c,417 :: 		}
L_end_get_datetime:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _get_datetime
_f_get_position:
;TinyGPS.c,419 :: 		void f_get_position(TinyGPS* gps, float *latitude, float *longitude, unsigned long *fix_age)
; fix_age start address is: 12 (R3)
; longitude start address is: 8 (R2)
; latitude start address is: 4 (R1)
; gps start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R7, R1
MOV	R6, R2
; fix_age end address is: 12 (R3)
; longitude end address is: 8 (R2)
; latitude end address is: 4 (R1)
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
; latitude start address is: 28 (R7)
; longitude start address is: 24 (R6)
; fix_age start address is: 12 (R3)
;TinyGPS.c,422 :: 		get_position(gps, &lat, &lon, fix_age);
ADD	R5, SP, #8
ADD	R4, SP, #4
; fix_age end address is: 12 (R3)
MOV	R2, R5
MOV	R1, R4
; gps end address is: 0 (R0)
BL	_get_position+0
;TinyGPS.c,423 :: 		*latitude = lat == GPS_INVALID_ANGLE ? GPS_INVALID_F_ANGLE : (lat / 100000.0);
LDR	R5, [SP, #4]
MOVW	R4, #51711
MOVT	R4, #15258
CMP	R5, R4
IT	NE
BNE	L_f_get_position92
MOVW	R4, TinyGPS_GPS_INVALID_F_ANGLE
MOVT	R4, TinyGPS_GPS_INVALID_F_ANGLE+2
; ?FLOC___f_get_position?T842 start address is: 0 (R0)
VMOV	S0, R4
; ?FLOC___f_get_position?T842 end address is: 0 (R0)
IT	AL
BAL	L_f_get_position93
L_f_get_position92:
VLDR	#1, S0, [SP, #4]
VCVT.F32	#1, S1, S0
MOVW	R4, #20480
MOVT	R4, #18371
VMOV	S0, R4
VDIV.F32	S0, S1, S0
; ?FLOC___f_get_position?T842 start address is: 4 (R1)
VMOV.F32	S1, S0
; ?FLOC___f_get_position?T842 end address is: 4 (R1)
VMOV.F32	S0, S1
L_f_get_position93:
; ?FLOC___f_get_position?T842 start address is: 0 (R0)
VSTR	#1, S0, [R7, #0]
; latitude end address is: 28 (R7)
; ?FLOC___f_get_position?T842 end address is: 0 (R0)
;TinyGPS.c,424 :: 		*longitude = lat == GPS_INVALID_ANGLE ? GPS_INVALID_F_ANGLE : (lon / 100000.0);
LDR	R5, [SP, #4]
MOVW	R4, #51711
MOVT	R4, #15258
CMP	R5, R4
IT	NE
BNE	L_f_get_position94
MOVW	R4, TinyGPS_GPS_INVALID_F_ANGLE
MOVT	R4, TinyGPS_GPS_INVALID_F_ANGLE+2
; ?FLOC___f_get_position?T846 start address is: 0 (R0)
VMOV	S0, R4
; ?FLOC___f_get_position?T846 end address is: 0 (R0)
IT	AL
BAL	L_f_get_position95
L_f_get_position94:
VLDR	#1, S0, [SP, #8]
VCVT.F32	#1, S1, S0
MOVW	R4, #20480
MOVT	R4, #18371
VMOV	S0, R4
VDIV.F32	S0, S1, S0
; ?FLOC___f_get_position?T846 start address is: 4 (R1)
VMOV.F32	S1, S0
; ?FLOC___f_get_position?T846 end address is: 4 (R1)
VMOV.F32	S0, S1
L_f_get_position95:
; ?FLOC___f_get_position?T846 start address is: 0 (R0)
VSTR	#1, S0, [R6, #0]
; longitude end address is: 24 (R6)
; ?FLOC___f_get_position?T846 end address is: 0 (R0)
;TinyGPS.c,425 :: 		}
L_end_f_get_position:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _f_get_position
_crack_datetime:
;TinyGPS.c,428 :: 		byte *hour, byte *minute, byte *second, byte *hundredths, unsigned long *fix_age)
; day start address is: 12 (R3)
; month start address is: 8 (R2)
; year start address is: 4 (R1)
; gps start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
MOV	R7, R1
MOV	R1, R0
MOV	R8, R2
MOV	R9, R3
; day end address is: 12 (R3)
; month end address is: 8 (R2)
; year end address is: 4 (R1)
; gps end address is: 0 (R0)
; gps start address is: 4 (R1)
; year start address is: 28 (R7)
; month start address is: 32 (R8)
; day start address is: 36 (R9)
; hour start address is: 40 (R10)
LDR	R10, [SP, #16]
; minute start address is: 44 (R11)
LDR	R11, [SP, #20]
; second start address is: 48 (R12)
LDR	R12, [SP, #24]
; hundredths start address is: 0 (R0)
LDR	R0, [SP, #28]
; fix_age start address is: 8 (R2)
LDR	R2, [SP, #32]
;TinyGPS.c,431 :: 		get_datetime(gps, &date, &time, fix_age);
ADD	R5, SP, #12
ADD	R4, SP, #8
STR	R0, [SP, #4]
; fix_age end address is: 8 (R2)
MOV	R3, R2
MOV	R2, R5
MOV	R0, R1
MOV	R1, R4
; gps end address is: 4 (R1)
BL	_get_datetime+0
LDR	R0, [SP, #4]
;TinyGPS.c,432 :: 		if (year)
CMP	R7, #0
IT	EQ
BEQ	L_crack_datetime96
;TinyGPS.c,434 :: 		*year = date % 100;
LDR	R6, [SP, #8]
MOVS	R5, #100
UDIV	R4, R6, R5
MLS	R4, R5, R4, R6
STRH	R4, [R7, #0]
;TinyGPS.c,435 :: 		*year += *year > 80 ? 1900 : 2000;
LDRSH	R4, [R7, #0]
CMP	R4, #80
IT	LE
BLE	L_crack_datetime97
; ?FLOC___crack_datetime?T854 start address is: 4 (R1)
MOVW	R1, #1900
SXTH	R1, R1
; ?FLOC___crack_datetime?T854 end address is: 4 (R1)
IT	AL
BAL	L_crack_datetime98
L_crack_datetime97:
; ?FLOC___crack_datetime?T854 start address is: 4 (R1)
MOVW	R1, #2000
SXTH	R1, R1
; ?FLOC___crack_datetime?T854 end address is: 4 (R1)
L_crack_datetime98:
; ?FLOC___crack_datetime?T854 start address is: 4 (R1)
LDRSH	R4, [R7, #0]
ADDS	R4, R4, R1
; ?FLOC___crack_datetime?T854 end address is: 4 (R1)
STRH	R4, [R7, #0]
; year end address is: 28 (R7)
;TinyGPS.c,436 :: 		}
L_crack_datetime96:
;TinyGPS.c,437 :: 		if (month) *month = (date / 100) % 100;
CMP	R8, #0
IT	EQ
BEQ	L_crack_datetime99
LDR	R5, [SP, #8]
MOVS	R4, #100
UDIV	R6, R5, R4
MOVS	R5, #100
UDIV	R4, R6, R5
MLS	R4, R5, R4, R6
STRB	R4, [R8, #0]
; month end address is: 32 (R8)
L_crack_datetime99:
;TinyGPS.c,438 :: 		if (day) *day = date / 10000;
CMP	R9, #0
IT	EQ
BEQ	L_crack_datetime100
LDR	R5, [SP, #8]
MOVW	R4, #10000
UDIV	R4, R5, R4
STRB	R4, [R9, #0]
; day end address is: 36 (R9)
L_crack_datetime100:
;TinyGPS.c,439 :: 		if (hour) *hour = time / 1000000;
CMP	R10, #0
IT	EQ
BEQ	L_crack_datetime101
LDR	R5, [SP, #12]
MOVW	R4, #16960
MOVT	R4, #15
UDIV	R4, R5, R4
STRB	R4, [R10, #0]
; hour end address is: 40 (R10)
L_crack_datetime101:
;TinyGPS.c,440 :: 		if (minute) *minute = (time / 10000) % 100;
CMP	R11, #0
IT	EQ
BEQ	L_crack_datetime102
LDR	R5, [SP, #12]
MOVW	R4, #10000
UDIV	R6, R5, R4
MOVS	R5, #100
UDIV	R4, R6, R5
MLS	R4, R5, R4, R6
STRB	R4, [R11, #0]
; minute end address is: 44 (R11)
L_crack_datetime102:
;TinyGPS.c,441 :: 		if (second) *second = (time / 100) % 100;
CMP	R12, #0
IT	EQ
BEQ	L_crack_datetime103
LDR	R5, [SP, #12]
MOVS	R4, #100
UDIV	R6, R5, R4
MOVS	R5, #100
UDIV	R4, R6, R5
MLS	R4, R5, R4, R6
STRB	R4, [R12, #0]
; second end address is: 48 (R12)
L_crack_datetime103:
;TinyGPS.c,442 :: 		if (hundredths) *hundredths = time % 100;
CMP	R0, #0
IT	EQ
BEQ	L_crack_datetime104
LDR	R6, [SP, #12]
MOVS	R5, #100
UDIV	R4, R6, R5
MLS	R4, R5, R4, R6
STRB	R4, [R0, #0]
; hundredths end address is: 0 (R0)
L_crack_datetime104:
;TinyGPS.c,443 :: 		}
L_end_crack_datetime:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _crack_datetime
_f_altitude:
;TinyGPS.c,445 :: 		float f_altitude(TinyGPS* gps)
; gps start address is: 0 (R0)
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
;TinyGPS.c,447 :: 		return gps->_altitude == GPS_INVALID_ALTITUDE ? GPS_INVALID_F_ALTITUDE : gps->_altitude / 100.0;
ADDW	R1, R0, #32
LDR	R2, [R1, #0]
MOVW	R1, #51711
MOVT	R1, #15258
CMP	R2, R1
IT	NE
BNE	L_f_altitude105
; gps end address is: 0 (R0)
MOVW	R1, TinyGPS_GPS_INVALID_F_ALTITUDE
MOVT	R1, TinyGPS_GPS_INVALID_F_ALTITUDE+2
; ?FLOC___f_altitude?T872 start address is: 0 (R0)
VMOV	S0, R1
; ?FLOC___f_altitude?T872 end address is: 0 (R0)
IT	AL
BAL	L_f_altitude106
L_f_altitude105:
; gps start address is: 0 (R0)
ADDW	R1, R0, #32
; gps end address is: 0 (R0)
VLDR	#1, S0, [R1, #0]
VCVT.F32	#1, S1, S0
MOVW	R1, #0
MOVT	R1, #17096
VMOV	S0, R1
VDIV.F32	S0, S1, S0
; ?FLOC___f_altitude?T872 start address is: 4 (R1)
VMOV.F32	S1, S0
; ?FLOC___f_altitude?T872 end address is: 4 (R1)
VMOV.F32	S0, S1
L_f_altitude106:
; ?FLOC___f_altitude?T872 start address is: 0 (R0)
; ?FLOC___f_altitude?T872 end address is: 0 (R0)
;TinyGPS.c,448 :: 		}
L_end_f_altitude:
BX	LR
; end of _f_altitude
_f_course:
;TinyGPS.c,450 :: 		float f_course(TinyGPS* gps)
; gps start address is: 0 (R0)
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
;TinyGPS.c,452 :: 		return gps->_course == GPS_INVALID_ANGLE ? GPS_INVALID_F_ANGLE : gps->_course / 100.0;
ADDW	R1, R0, #48
LDR	R2, [R1, #0]
MOVW	R1, #51711
MOVT	R1, #15258
CMP	R2, R1
IT	NE
BNE	L_f_course107
; gps end address is: 0 (R0)
MOVW	R1, TinyGPS_GPS_INVALID_F_ANGLE
MOVT	R1, TinyGPS_GPS_INVALID_F_ANGLE+2
; ?FLOC___f_course?T885 start address is: 0 (R0)
VMOV	S0, R1
; ?FLOC___f_course?T885 end address is: 0 (R0)
IT	AL
BAL	L_f_course108
L_f_course107:
; gps start address is: 0 (R0)
ADDW	R1, R0, #48
; gps end address is: 0 (R0)
VLDR	#1, S0, [R1, #0]
VCVT.F32	#0, S1, S0
MOVW	R1, #0
MOVT	R1, #17096
VMOV	S0, R1
VDIV.F32	S0, S1, S0
; ?FLOC___f_course?T885 start address is: 4 (R1)
VMOV.F32	S1, S0
; ?FLOC___f_course?T885 end address is: 4 (R1)
VMOV.F32	S0, S1
L_f_course108:
; ?FLOC___f_course?T885 start address is: 0 (R0)
; ?FLOC___f_course?T885 end address is: 0 (R0)
;TinyGPS.c,453 :: 		}
L_end_f_course:
BX	LR
; end of _f_course
_f_speed_knots:
;TinyGPS.c,455 :: 		float f_speed_knots(TinyGPS* gps)
; gps start address is: 0 (R0)
; gps end address is: 0 (R0)
; gps start address is: 0 (R0)
;TinyGPS.c,457 :: 		return gps->_speed == GPS_INVALID_SPEED ? GPS_INVALID_F_SPEED : gps->_speed / 100.0;
ADDW	R1, R0, #40
LDR	R2, [R1, #0]
MOVW	R1, #51711
MOVT	R1, #15258
CMP	R2, R1
IT	NE
BNE	L_f_speed_knots109
; gps end address is: 0 (R0)
MOVW	R1, TinyGPS_GPS_INVALID_F_SPEED
MOVT	R1, TinyGPS_GPS_INVALID_F_SPEED+2
; ?FLOC___f_speed_knots?T898 start address is: 0 (R0)
VMOV	S0, R1
; ?FLOC___f_speed_knots?T898 end address is: 0 (R0)
IT	AL
BAL	L_f_speed_knots110
L_f_speed_knots109:
; gps start address is: 0 (R0)
ADDW	R1, R0, #40
; gps end address is: 0 (R0)
VLDR	#1, S0, [R1, #0]
VCVT.F32	#0, S1, S0
MOVW	R1, #0
MOVT	R1, #17096
VMOV	S0, R1
VDIV.F32	S0, S1, S0
; ?FLOC___f_speed_knots?T898 start address is: 4 (R1)
VMOV.F32	S1, S0
; ?FLOC___f_speed_knots?T898 end address is: 4 (R1)
VMOV.F32	S0, S1
L_f_speed_knots110:
; ?FLOC___f_speed_knots?T898 start address is: 0 (R0)
; ?FLOC___f_speed_knots?T898 end address is: 0 (R0)
;TinyGPS.c,458 :: 		}
L_end_f_speed_knots:
BX	LR
; end of _f_speed_knots
_f_speed_mph:
;TinyGPS.c,460 :: 		float f_speed_mph(TinyGPS* gps)
; gps start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R3, R0
; gps end address is: 0 (R0)
; gps start address is: 12 (R3)
;TinyGPS.c,462 :: 		float sk = f_speed_knots(gps);
MOV	R0, R3
BL	_f_speed_knots+0
;TinyGPS.c,463 :: 		return sk == GPS_INVALID_F_SPEED ? GPS_INVALID_F_SPEED : _GPS_MPH_PER_KNOT * f_speed_knots(gps);
MOVW	R1, TinyGPS_GPS_INVALID_F_SPEED
MOVT	R1, TinyGPS_GPS_INVALID_F_SPEED+2
VMOV	S1, R1
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	NE
BNE	L_f_speed_mph111
; gps end address is: 12 (R3)
MOVW	R1, TinyGPS_GPS_INVALID_F_SPEED
MOVT	R1, TinyGPS_GPS_INVALID_F_SPEED+2
; ?FLOC___f_speed_mph?T906 start address is: 0 (R0)
VMOV	S0, R1
; ?FLOC___f_speed_mph?T906 end address is: 0 (R0)
IT	AL
BAL	L_f_speed_mph112
L_f_speed_mph111:
; gps start address is: 12 (R3)
MOV	R0, R3
; gps end address is: 12 (R3)
BL	_f_speed_knots+0
MOVW	R1, #19646
MOVT	R1, #16275
VMOV	S1, R1
VMUL.F32	S0, S1, S0
; ?FLOC___f_speed_mph?T906 start address is: 4 (R1)
VMOV.F32	S1, S0
; ?FLOC___f_speed_mph?T906 end address is: 4 (R1)
VMOV.F32	S0, S1
L_f_speed_mph112:
; ?FLOC___f_speed_mph?T906 start address is: 0 (R0)
; ?FLOC___f_speed_mph?T906 end address is: 0 (R0)
;TinyGPS.c,464 :: 		}
L_end_f_speed_mph:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _f_speed_mph
_f_speed_mps:
;TinyGPS.c,466 :: 		float f_speed_mps(TinyGPS* gps)
; gps start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R3, R0
; gps end address is: 0 (R0)
; gps start address is: 12 (R3)
;TinyGPS.c,468 :: 		float sk = f_speed_knots(gps);
MOV	R0, R3
BL	_f_speed_knots+0
;TinyGPS.c,469 :: 		return sk == GPS_INVALID_F_SPEED ? GPS_INVALID_F_SPEED : _GPS_MPS_PER_KNOT * f_speed_knots(gps);
MOVW	R1, TinyGPS_GPS_INVALID_F_SPEED
MOVT	R1, TinyGPS_GPS_INVALID_F_SPEED+2
VMOV	S1, R1
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	NE
BNE	L_f_speed_mps113
; gps end address is: 12 (R3)
MOVW	R1, TinyGPS_GPS_INVALID_F_SPEED
MOVT	R1, TinyGPS_GPS_INVALID_F_SPEED+2
; ?FLOC___f_speed_mps?T909 start address is: 0 (R0)
VMOV	S0, R1
; ?FLOC___f_speed_mps?T909 end address is: 0 (R0)
IT	AL
BAL	L_f_speed_mps114
L_f_speed_mps113:
; gps start address is: 12 (R3)
MOV	R0, R3
; gps end address is: 12 (R3)
BL	_f_speed_knots+0
MOVW	R1, #45729
MOVT	R1, #16131
VMOV	S1, R1
VMUL.F32	S0, S1, S0
; ?FLOC___f_speed_mps?T909 start address is: 4 (R1)
VMOV.F32	S1, S0
; ?FLOC___f_speed_mps?T909 end address is: 4 (R1)
VMOV.F32	S0, S1
L_f_speed_mps114:
; ?FLOC___f_speed_mps?T909 start address is: 0 (R0)
; ?FLOC___f_speed_mps?T909 end address is: 0 (R0)
;TinyGPS.c,470 :: 		}
L_end_f_speed_mps:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _f_speed_mps
_f_speed_kmph:
;TinyGPS.c,472 :: 		float f_speed_kmph(TinyGPS* gps)
; gps start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R3, R0
; gps end address is: 0 (R0)
; gps start address is: 12 (R3)
;TinyGPS.c,474 :: 		float sk = f_speed_knots(gps);
MOV	R0, R3
BL	_f_speed_knots+0
;TinyGPS.c,475 :: 		return sk == GPS_INVALID_F_SPEED ? GPS_INVALID_F_SPEED : _GPS_KMPH_PER_KNOT * f_speed_knots(gps);
MOVW	R1, TinyGPS_GPS_INVALID_F_SPEED
MOVT	R1, TinyGPS_GPS_INVALID_F_SPEED+2
VMOV	S1, R1
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	NE
BNE	L_f_speed_kmph115
; gps end address is: 12 (R3)
MOVW	R1, TinyGPS_GPS_INVALID_F_SPEED
MOVT	R1, TinyGPS_GPS_INVALID_F_SPEED+2
; ?FLOC___f_speed_kmph?T912 start address is: 0 (R0)
VMOV	S0, R1
; ?FLOC___f_speed_kmph?T912 end address is: 0 (R0)
IT	AL
BAL	L_f_speed_kmph116
L_f_speed_kmph115:
; gps start address is: 12 (R3)
MOV	R0, R3
; gps end address is: 12 (R3)
BL	_f_speed_knots+0
MOVW	R1, #3670
MOVT	R1, #16365
VMOV	S1, R1
VMUL.F32	S0, S1, S0
; ?FLOC___f_speed_kmph?T912 start address is: 4 (R1)
VMOV.F32	S1, S0
; ?FLOC___f_speed_kmph?T912 end address is: 4 (R1)
VMOV.F32	S0, S1
L_f_speed_kmph116:
; ?FLOC___f_speed_kmph?T912 start address is: 0 (R0)
; ?FLOC___f_speed_kmph?T912 end address is: 0 (R0)
;TinyGPS.c,476 :: 		}
L_end_f_speed_kmph:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _f_speed_kmph
