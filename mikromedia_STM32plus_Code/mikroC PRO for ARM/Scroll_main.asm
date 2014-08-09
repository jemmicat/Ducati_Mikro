_Dummy_Set_address:
;Scroll_main.c,67 :: 		void Dummy_Set_address(unsigned int x1, unsigned int y1, unsigned int x2, unsigned int y2){
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #8
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 0 (R0)
; y1 start address is: 4 (R1)
;Scroll_main.c,68 :: 		if (current_text_column == y1)
MOVW	R4, #lo_addr(_current_text_column+0)
MOVT	R4, #hi_addr(_current_text_column+0)
LDRB	R4, [R4, #0]
CMP	R4, R1
IT	NE
BNE	L_Dummy_Set_address0
; y1 end address is: 4 (R1)
;Scroll_main.c,69 :: 		pix_array[x1] = 1;
MOVW	R4, #lo_addr(_pix_array+0)
MOVT	R4, #hi_addr(_pix_array+0)
ADDS	R5, R4, R0
; x1 end address is: 0 (R0)
MOVS	R4, #1
STRB	R4, [R5, #0]
L_Dummy_Set_address0:
;Scroll_main.c,70 :: 		}
L_end_Dummy_Set_address:
ADD	SP, SP, #8
BX	LR
; end of _Dummy_Set_address
_Dummy_Write_data:
;Scroll_main.c,72 :: 		void Dummy_Write_data(unsigned int ddata){
;Scroll_main.c,74 :: 		}
L_end_Dummy_Write_data:
BX	LR
; end of _Dummy_Write_data
_Scroll_Get_One_Text_Line:
;Scroll_main.c,83 :: 		void Scroll_Get_One_Text_Line(char line, char *text){
; text start address is: 4 (R1)
; line start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R7, R0
MOV	R6, R1
; text end address is: 4 (R1)
; line end address is: 0 (R0)
; line start address is: 28 (R7)
; text start address is: 24 (R6)
;Scroll_main.c,84 :: 		memset(pix_array, 0, 165);
MOVS	R2, #165
SXTH	R2, R2
MOVS	R1, #0
MOVW	R0, #lo_addr(_pix_array+0)
MOVT	R0, #hi_addr(_pix_array+0)
BL	_memset+0
;Scroll_main.c,85 :: 		current_text_column = line;
MOVW	R2, #lo_addr(_current_text_column+0)
MOVT	R2, #hi_addr(_current_text_column+0)
STRB	R7, [R2, #0]
; line end address is: 28 (R7)
;Scroll_main.c,86 :: 		TFT_Write_Data_Ptr =  Dummy_Write_data;
MOVW	R3, #lo_addr(_Dummy_Write_data+0)
MOVT	R3, #hi_addr(_Dummy_Write_data+0)
MOVW	R2, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R2, #hi_addr(_TFT_Write_Data_Ptr+0)
STR	R3, [R2, #0]
;Scroll_main.c,87 :: 		TFT_SSD1963_Set_Address_Ptr = Dummy_Set_address;
MOVW	R3, #lo_addr(_Dummy_Set_address+0)
MOVT	R3, #hi_addr(_Dummy_Set_address+0)
MOVW	R2, #lo_addr(_TFT_SSD1963_Set_Address_Ptr+0)
MOVT	R2, #hi_addr(_TFT_SSD1963_Set_Address_Ptr+0)
STR	R3, [R2, #0]
;Scroll_main.c,88 :: 		TFT_Set_Font(MP3_Font, _MP3_FONT_COLOR, FO_HORIZONTAL);
MOVW	R2, #lo_addr(_MP3_Font+0)
MOVT	R2, #hi_addr(_MP3_Font+0)
LDR	R2, [R2, #0]
MOVW	R1, #65535
MOV	R0, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
;Scroll_main.c,89 :: 		TFT_Write_Text(text, _MP3_TEXT_VLINE, 0);
MOVS	R2, #0
MOVW	R1, #100
MOV	R0, R6
; text end address is: 24 (R6)
BL	_TFT_Write_Text+0
;Scroll_main.c,90 :: 		TFT_SSD1963_Set_Address_Ptr = TFT_Set_Address_SSD1963II;
MOVW	R3, #lo_addr(_TFT_Set_Address_SSD1963II+0)
MOVT	R3, #hi_addr(_TFT_Set_Address_SSD1963II+0)
MOVW	R2, #lo_addr(_TFT_SSD1963_Set_Address_Ptr+0)
MOVT	R2, #hi_addr(_TFT_SSD1963_Set_Address_Ptr+0)
STR	R3, [R2, #0]
;Scroll_main.c,92 :: 		}
L_end_Scroll_Get_One_Text_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Scroll_Get_One_Text_Line
_Scroll_New_Tex_From_List:
;Scroll_main.c,101 :: 		char Scroll_New_Tex_From_List(char text_number, char *Text){
; Text start address is: 4 (R1)
; text_number start address is: 0 (R0)
SUB	SP, SP, #4
MOV	R2, R1
; Text end address is: 4 (R1)
; text_number end address is: 0 (R0)
; text_number start address is: 0 (R0)
; Text start address is: 8 (R2)
;Scroll_main.c,103 :: 		dptr = Text;
; dptr start address is: 4 (R1)
MOV	R1, R2
; Text end address is: 8 (R2)
;Scroll_main.c,104 :: 		ptr = File_List[text_number].FIleName;
MOVS	R2, #14
MUL	R3, R2, R0
MOVW	R2, #lo_addr(_File_List+0)
MOVT	R2, #hi_addr(_File_List+0)
ADDS	R2, R2, R3
; ptr start address is: 12 (R3)
MOV	R3, R2
; dptr end address is: 4 (R1)
; ptr end address is: 12 (R3)
; text_number end address is: 0 (R0)
STR	R3, [SP, #0]
MOV	R3, R1
LDR	R1, [SP, #0]
;Scroll_main.c,106 :: 		while (*dptr++ = *ptr++)
L_Scroll_New_Tex_From_List1:
; ptr start address is: 4 (R1)
; ptr start address is: 4 (R1)
; dptr start address is: 20 (R5)
; dptr start address is: 12 (R3)
; text_number start address is: 0 (R0)
MOV	R4, R3
ADDS	R2, R3, #1
; dptr end address is: 12 (R3)
; dptr start address is: 20 (R5)
MOV	R5, R2
; dptr end address is: 20 (R5)
MOV	R3, R1
ADDS	R2, R1, #1
MOV	R1, R2
; ptr end address is: 4 (R1)
LDRB	R2, [R3, #0]
STRB	R2, [R4, #0]
LDRB	R2, [R4, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Scroll_New_Tex_From_List2
; dptr end address is: 20 (R5)
; ptr end address is: 4 (R1)
;Scroll_main.c,107 :: 		;
; ptr start address is: 4 (R1)
; dptr start address is: 20 (R5)
; dptr end address is: 20 (R5)
; ptr end address is: 4 (R1)
MOV	R3, R5
IT	AL
BAL	L_Scroll_New_Tex_From_List1
L_Scroll_New_Tex_From_List2:
;Scroll_main.c,109 :: 		return File_List[text_number].FIleType;
MOVS	R2, #14
MUL	R3, R2, R0
; text_number end address is: 0 (R0)
MOVW	R2, #lo_addr(_File_List+0)
MOVT	R2, #hi_addr(_File_List+0)
ADDS	R2, R2, R3
ADDS	R2, #13
LDRB	R2, [R2, #0]
UXTB	R0, R2
;Scroll_main.c,110 :: 		}
L_end_Scroll_New_Tex_From_List:
ADD	SP, SP, #4
BX	LR
; end of _Scroll_New_Tex_From_List
_Get_Next_File_Name:
;Scroll_main.c,121 :: 		char Get_Next_File_Name(signed short number, char *Text){
; Text start address is: 4 (R1)
; number start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Text end address is: 4 (R1)
; number end address is: 0 (R0)
; number start address is: 0 (R0)
; Text start address is: 4 (R1)
;Scroll_main.c,123 :: 		if ((number > Total_Entries) || (number < 0))
MOVW	R2, #lo_addr(_Total_Entries+0)
MOVT	R2, #hi_addr(_Total_Entries+0)
LDRB	R2, [R2, #0]
CMP	R0, R2
IT	GT
BGT	L__Get_Next_File_Name105
CMP	R0, #0
IT	LT
BLT	L__Get_Next_File_Name104
IT	AL
BAL	L_Get_Next_File_Name5
; number end address is: 0 (R0)
; Text end address is: 4 (R1)
L__Get_Next_File_Name105:
L__Get_Next_File_Name104:
;Scroll_main.c,124 :: 		return 2;
MOVS	R0, #2
IT	AL
BAL	L_end_Get_Next_File_Name
L_Get_Next_File_Name5:
;Scroll_main.c,125 :: 		temp = Scroll_New_Tex_From_List(number, Text);
; Text start address is: 4 (R1)
; number start address is: 0 (R0)
; Text end address is: 4 (R1)
UXTB	R0, R0
; number end address is: 0 (R0)
BL	_Scroll_New_Tex_From_List+0
; temp start address is: 4 (R1)
UXTB	R1, R0
;Scroll_main.c,126 :: 		if (temp == 1)
CMP	R0, #1
IT	NE
BNE	L_Get_Next_File_Name6
; temp end address is: 4 (R1)
;Scroll_main.c,127 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_Get_Next_File_Name
L_Get_Next_File_Name6:
;Scroll_main.c,128 :: 		else if (temp == 2)
; temp start address is: 4 (R1)
CMP	R1, #2
IT	NE
BNE	L_Get_Next_File_Name8
; temp end address is: 4 (R1)
;Scroll_main.c,129 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_Get_Next_File_Name
L_Get_Next_File_Name8:
;Scroll_main.c,130 :: 		}
L_end_Get_Next_File_Name:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Get_Next_File_Name
_Scrool_Get_new_text:
;Scroll_main.c,140 :: 		char Scrool_Get_new_text(char Text_no){
; Text_no start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Text_no end address is: 0 (R0)
; Text_no start address is: 0 (R0)
;Scroll_main.c,141 :: 		if (current_loaded_text != Text_no){
MOVW	R1, #lo_addr(_current_loaded_text+0)
MOVT	R1, #hi_addr(_current_loaded_text+0)
LDRB	R1, [R1, #0]
CMP	R1, R0
IT	EQ
BEQ	L_Scrool_Get_new_text9
;Scroll_main.c,142 :: 		current_loaded_text = Text_no;
MOVW	R1, #lo_addr(_current_loaded_text+0)
MOVT	R1, #hi_addr(_current_loaded_text+0)
STRB	R0, [R1, #0]
;Scroll_main.c,143 :: 		Scroll_New_Tex_From_List(Text_no, Scroll_Text);
STRB	R0, [SP, #4]
MOVW	R1, #lo_addr(_Scroll_text+0)
MOVT	R1, #hi_addr(_Scroll_text+0)
BL	_Scroll_New_Tex_From_List+0
LDRB	R0, [SP, #4]
;Scroll_main.c,144 :: 		}
L_Scrool_Get_new_text9:
;Scroll_main.c,145 :: 		return File_List[Text_no].FileType;
MOVS	R1, #14
MUL	R2, R1, R0
; Text_no end address is: 0 (R0)
MOVW	R1, #lo_addr(_File_List+0)
MOVT	R1, #hi_addr(_File_List+0)
ADDS	R1, R1, R2
ADDS	R1, #13
LDRB	R1, [R1, #0]
UXTB	R0, R1
;Scroll_main.c,146 :: 		}
L_end_Scrool_Get_new_text:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Scrool_Get_new_text
_Scroll_Write_One_Line:
;Scroll_main.c,155 :: 		void Scroll_Write_One_Line(unsigned int HO_Line, TImage *Img){
; HO_Line start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
STR	R1, [SP, #12]
; HO_Line end address is: 0 (R0)
; HO_Line start address is: 0 (R0)
;Scroll_main.c,160 :: 		ptr = Img->Picture_Name + 6;
LDR	R2, [SP, #12]
ADDS	R2, #16
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
STR	R2, [SP, #4]
;Scroll_main.c,161 :: 		ptr += (long)(Img->Width) * (current_text_column) * 2;
LDR	R2, [SP, #12]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOVW	R2, #lo_addr(_current_text_column+0)
MOVT	R2, #hi_addr(_current_text_column+0)
LDRB	R2, [R2, #0]
MULS	R2, R3, R2
LSLS	R3, R2, #1
LDR	R2, [SP, #4]
ADDS	R2, R2, R3
STR	R2, [SP, #4]
;Scroll_main.c,163 :: 		TFT_CS = 0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(TFT_CS+0)
MOVT	R2, #hi_addr(TFT_CS+0)
STR	R3, [R2, #0]
;Scroll_main.c,165 :: 		TFT_SSD1963_Set_Address_Ptr(0, HO_Line, 479, HO_Line);
UXTH	R3, R0
MOVW	R2, #479
UXTH	R1, R3
; HO_Line end address is: 0 (R0)
MOVS	R0, #0
MOVW	R4, #lo_addr(_TFT_SSD1963_Set_Address_Ptr+0)
MOVT	R4, #hi_addr(_TFT_SSD1963_Set_Address_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;Scroll_main.c,166 :: 		for (i = 0; i < 479; i++)
MOVS	R2, #0
STRH	R2, [SP, #8]
L_Scroll_Write_One_Line10:
LDRH	R3, [SP, #8]
MOVW	R2, #479
CMP	R3, R2
IT	CS
BCS	L_Scroll_Write_One_Line11
;Scroll_main.c,167 :: 		if ((i > _MP3_IMAGE_VLINE - 1) && (i < _MP3_IMAGE_VLINE + Img->Width)){
LDRH	R2, [SP, #8]
CMP	R2, #79
IT	LS
BLS	L__Scroll_Write_One_Line108
LDR	R2, [SP, #12]
ADDS	R2, #10
LDRH	R2, [R2, #0]
ADDW	R3, R2, #80
UXTH	R3, R3
LDRH	R2, [SP, #8]
CMP	R2, R3
IT	CS
BCS	L__Scroll_Write_One_Line107
L__Scroll_Write_One_Line106:
;Scroll_main.c,169 :: 		if (current_text_column < Img->Height){
LDR	R2, [SP, #12]
ADDS	R2, #12
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(_current_text_column+0)
MOVT	R2, #hi_addr(_current_text_column+0)
LDRB	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Scroll_Write_One_Line16
;Scroll_main.c,170 :: 		color = (*ptr++);
LDR	R2, [SP, #4]
LDRB	R2, [R2, #0]
STRH	R2, [SP, #10]
LDR	R2, [SP, #4]
ADDS	R5, R2, #1
;Scroll_main.c,171 :: 		color += (*ptr++) << 8;
LDRB	R2, [R5, #0]
LSLS	R3, R2, #8
UXTH	R3, R3
LDRH	R2, [SP, #10]
ADDS	R4, R2, R3
STRH	R4, [SP, #10]
ADDS	R2, R5, #1
STR	R2, [SP, #4]
;Scroll_main.c,172 :: 		TFT_Write_Data_Ptr(color);
UXTH	R0, R4
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;Scroll_main.c,173 :: 		}
IT	AL
BAL	L_Scroll_Write_One_Line17
L_Scroll_Write_One_Line16:
;Scroll_main.c,175 :: 		TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
MOVW	R0, #11057
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
L_Scroll_Write_One_Line17:
;Scroll_main.c,176 :: 		}
IT	AL
BAL	L_Scroll_Write_One_Line18
;Scroll_main.c,167 :: 		if ((i > _MP3_IMAGE_VLINE - 1) && (i < _MP3_IMAGE_VLINE + Img->Width)){
L__Scroll_Write_One_Line108:
L__Scroll_Write_One_Line107:
;Scroll_main.c,178 :: 		else if (pix_array[i])
LDRH	R3, [SP, #8]
MOVW	R2, #lo_addr(_pix_array+0)
MOVT	R2, #hi_addr(_pix_array+0)
ADDS	R2, R2, R3
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Scroll_Write_One_Line19
;Scroll_main.c,179 :: 		TFT_Write_Data_Ptr(_MP3_FONT_COLOR);
MOVW	R0, #65535
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
IT	AL
BAL	L_Scroll_Write_One_Line20
L_Scroll_Write_One_Line19:
;Scroll_main.c,181 :: 		TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
MOVW	R0, #11057
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
L_Scroll_Write_One_Line20:
L_Scroll_Write_One_Line18:
;Scroll_main.c,166 :: 		for (i = 0; i < 479; i++)
LDRH	R2, [SP, #8]
ADDS	R2, R2, #1
STRH	R2, [SP, #8]
;Scroll_main.c,181 :: 		TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
IT	AL
BAL	L_Scroll_Write_One_Line10
L_Scroll_Write_One_Line11:
;Scroll_main.c,182 :: 		TFT_CS = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(TFT_CS+0)
MOVT	R2, #hi_addr(TFT_CS+0)
STR	R3, [R2, #0]
;Scroll_main.c,184 :: 		}
L_end_Scroll_Write_One_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _Scroll_Write_One_Line
_Add_Image_Line:
;Scroll_main.c,193 :: 		void Add_Image_Line(const unsigned long image, int line, int disp_scroll){
; disp_scroll start address is: 8 (R2)
; line start address is: 4 (R1)
; image start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
; disp_scroll end address is: 8 (R2)
; line end address is: 4 (R1)
; image end address is: 0 (R0)
; image start address is: 0 (R0)
; line start address is: 4 (R1)
; disp_scroll start address is: 8 (R2)
;Scroll_main.c,198 :: 		TFT_CS = 0;
MOVS	R4, #0
SXTB	R4, R4
MOVW	R3, #lo_addr(TFT_CS+0)
MOVT	R3, #hi_addr(TFT_CS+0)
STR	R4, [R3, #0]
;Scroll_main.c,199 :: 		offset = image + 6 + (unsigned long)line*238;
ADDS	R5, R0, #6
; image end address is: 0 (R0)
SXTH	R4, R1
; line end address is: 4 (R1)
MOVS	R3, #238
MULS	R3, R4, R3
ADDS	R3, R5, R3
STR	R3, [SP, #4]
;Scroll_main.c,200 :: 		count = 238;
MOVS	R3, #238
STRH	R3, [SP, #14]
;Scroll_main.c,201 :: 		TFT_SSD1963_Set_Address_Ptr(_MP3_BIGIMAGE_VLINE, disp_scroll, _MP3_BIGIMAGE_VLINE + 118, disp_scroll);
UXTH	R3, R2
MOVW	R2, #418
UXTH	R1, R3
; disp_scroll end address is: 8 (R2)
MOVW	R0, #300
MOVW	R4, #lo_addr(_TFT_SSD1963_Set_Address_Ptr+0)
MOVT	R4, #hi_addr(_TFT_SSD1963_Set_Address_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;Scroll_main.c,202 :: 		while(count>0){
L_Add_Image_Line21:
LDRH	R3, [SP, #14]
CMP	R3, #0
IT	LS
BLS	L_Add_Image_Line22
;Scroll_main.c,203 :: 		ptr = MyTFT_Get_Data(offset,count,&readed);
ADD	R3, SP, #8
MOV	R2, R3
LDRH	R1, [SP, #14]
LDR	R0, [SP, #4]
BL	_MyTFT_Get_Data+0
STR	R0, [SP, #16]
;Scroll_main.c,204 :: 		count -= readed;
LDR	R4, [SP, #8]
LDRH	R3, [SP, #14]
SUB	R3, R3, R4
STRH	R3, [SP, #14]
;Scroll_main.c,205 :: 		offset += readed;
LDR	R4, [SP, #8]
LDR	R3, [SP, #4]
ADDS	R3, R3, R4
STR	R3, [SP, #4]
;Scroll_main.c,206 :: 		readed /= 2;
LDR	R3, [SP, #8]
LSRS	R3, R3, #1
STR	R3, [SP, #8]
;Scroll_main.c,207 :: 		for (i = 0;i<readed;i++){
MOVS	R3, #0
STRH	R3, [SP, #12]
L_Add_Image_Line23:
LDR	R4, [SP, #8]
LDRH	R3, [SP, #12]
CMP	R3, R4
IT	CS
BCS	L_Add_Image_Line24
;Scroll_main.c,208 :: 		color = *ptr++;
LDR	R3, [SP, #16]
LDRB	R3, [R3, #0]
; color start address is: 0 (R0)
UXTB	R0, R3
LDR	R3, [SP, #16]
ADDS	R5, R3, #1
;Scroll_main.c,209 :: 		color += (*ptr++) << 8;
LDRB	R3, [R5, #0]
LSLS	R3, R3, #8
UXTH	R3, R3
ADDS	R4, R0, R3
; color end address is: 0 (R0)
ADDS	R3, R5, #1
STR	R3, [SP, #16]
;Scroll_main.c,210 :: 		TFT_Write_Data_Ptr(color);
UXTH	R0, R4
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;Scroll_main.c,207 :: 		for (i = 0;i<readed;i++){
LDRH	R3, [SP, #12]
ADDS	R3, R3, #1
STRH	R3, [SP, #12]
;Scroll_main.c,211 :: 		}
IT	AL
BAL	L_Add_Image_Line23
L_Add_Image_Line24:
;Scroll_main.c,212 :: 		}
IT	AL
BAL	L_Add_Image_Line21
L_Add_Image_Line22:
;Scroll_main.c,214 :: 		TFT_CS = 1;
MOVS	R4, #1
SXTB	R4, R4
MOVW	R3, #lo_addr(TFT_CS+0)
MOVT	R3, #hi_addr(TFT_CS+0)
STR	R4, [R3, #0]
;Scroll_main.c,215 :: 		}
L_end_Add_Image_Line:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _Add_Image_Line
_Scroll_Fill_Area:
;Scroll_main.c,224 :: 		void Scroll_Fill_Area(){
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Scroll_main.c,227 :: 		dptr = Scroll_text;
MOVW	R0, #lo_addr(_Scroll_text+0)
MOVT	R0, #hi_addr(_Scroll_text+0)
STR	R0, [SP, #8]
;Scroll_main.c,228 :: 		i = 0;
MOVS	R0, #0
STRB	R0, [SP, #12]
;Scroll_main.c,229 :: 		ptr = File_List[i].FileName;
MOVS	R1, #0
MOVW	R0, #lo_addr(_File_List+0)
MOVT	R0, #hi_addr(_File_List+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
;Scroll_main.c,232 :: 		while (*ptr != 0xFF){
L_Scroll_Fill_Area26:
LDR	R0, [SP, #4]
LDRB	R0, [R0, #0]
CMP	R0, #255
IT	EQ
BEQ	L_Scroll_Fill_Area27
;Scroll_main.c,233 :: 		while(*dptr++ = *ptr++)
L_Scroll_Fill_Area28:
LDR	R2, [SP, #8]
LDR	R0, [SP, #8]
ADDS	R0, R0, #1
STR	R0, [SP, #8]
LDR	R1, [SP, #4]
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
LDRB	R0, [R2, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Scroll_Fill_Area29
;Scroll_main.c,234 :: 		;
IT	AL
BAL	L_Scroll_Fill_Area28
L_Scroll_Fill_Area29:
;Scroll_main.c,235 :: 		temp = i * (_FONT_HEIGHT + _FONT_VERTICAL_SPACING);
LDRB	R1, [SP, #12]
MOVS	R0, #34
SXTH	R0, R0
MULS	R0, R1, R0
STRH	R0, [SP, #14]
;Scroll_main.c,236 :: 		ptr = File_List[i+1].FileName;
LDRB	R0, [SP, #12]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVS	R0, #14
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_File_List+0)
MOVT	R0, #hi_addr(_File_List+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
;Scroll_main.c,237 :: 		if (temp < _SCROLL_LAST_LINE - _SCROLL_FIRST_LINE - _FONT_HEIGHT){
LDRH	R0, [SP, #14]
CMP	R0, #171
IT	CS
BCS	L_Scroll_Fill_Area30
;Scroll_main.c,238 :: 		if (File_List[i].FileType == 1)
LDRB	R1, [SP, #12]
MOVS	R0, #14
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_File_List+0)
MOVT	R0, #hi_addr(_File_List+0)
ADDS	R0, R0, R1
ADDS	R0, #13
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Scroll_Fill_Area31
;Scroll_main.c,239 :: 		TFT_Image(_MP3_IMAGE_VLINE, _SCROLL_FIRST_LINE + temp, file_icon.Picture_Name, 1);
MOVW	R0, #lo_addr(_file_icon+16)
MOVT	R0, #hi_addr(_file_icon+16)
LDR	R1, [R0, #0]
LDRH	R0, [SP, #14]
ADDS	R0, #48
MOVS	R3, #1
MOV	R2, R1
UXTH	R1, R0
MOVW	R0, #80
BL	_TFT_Image+0
L_Scroll_Fill_Area31:
;Scroll_main.c,240 :: 		if (File_List[i].FileType == 2)
LDRB	R1, [SP, #12]
MOVS	R0, #14
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_File_List+0)
MOVT	R0, #hi_addr(_File_List+0)
ADDS	R0, R0, R1
ADDS	R0, #13
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_Scroll_Fill_Area32
;Scroll_main.c,241 :: 		TFT_Image(_MP3_IMAGE_VLINE, _SCROLL_FIRST_LINE + temp, folder_icon.Picture_Name, 1);
MOVW	R0, #lo_addr(_folder_icon+16)
MOVT	R0, #hi_addr(_folder_icon+16)
LDR	R1, [R0, #0]
LDRH	R0, [SP, #14]
ADDS	R0, #48
MOVS	R3, #1
MOV	R2, R1
UXTH	R1, R0
MOVW	R0, #80
BL	_TFT_Image+0
L_Scroll_Fill_Area32:
;Scroll_main.c,242 :: 		TFT_Set_Font(MP3_Font, _MP3_FONT_COLOR, FO_HORIZONTAL);
MOVW	R0, #lo_addr(_MP3_Font+0)
MOVT	R0, #hi_addr(_MP3_Font+0)
LDR	R0, [R0, #0]
MOVS	R2, #0
MOVW	R1, #65535
BL	_TFT_Set_Font+0
;Scroll_main.c,243 :: 		TFT_Write_Text(Scroll_text, _MP3_TEXT_VLINE, _SCROLL_FIRST_LINE + temp);
LDRH	R0, [SP, #14]
ADDS	R0, #48
UXTH	R2, R0
MOVW	R1, #100
MOVW	R0, #lo_addr(_Scroll_text+0)
MOVT	R0, #hi_addr(_Scroll_text+0)
BL	_TFT_Write_Text+0
;Scroll_main.c,244 :: 		i ++;
LDRB	R0, [SP, #12]
ADDS	R0, R0, #1
STRB	R0, [SP, #12]
;Scroll_main.c,245 :: 		dptr = Scroll_text;
MOVW	R0, #lo_addr(_Scroll_text+0)
MOVT	R0, #hi_addr(_Scroll_text+0)
STR	R0, [SP, #8]
;Scroll_main.c,246 :: 		temp1 = _SCROLL_FIRST_LINE + temp;
LDRH	R0, [SP, #14]
ADDS	R0, #48
STRH	R0, [SP, #16]
;Scroll_main.c,247 :: 		}
IT	AL
BAL	L_Scroll_Fill_Area33
L_Scroll_Fill_Area30:
;Scroll_main.c,249 :: 		i ++;
LDRB	R0, [SP, #12]
ADDS	R0, R0, #1
STRB	R0, [SP, #12]
;Scroll_main.c,250 :: 		dptr = Scroll_text;
MOVW	R0, #lo_addr(_Scroll_text+0)
MOVT	R0, #hi_addr(_Scroll_text+0)
STR	R0, [SP, #8]
;Scroll_main.c,251 :: 		}
L_Scroll_Fill_Area33:
;Scroll_main.c,252 :: 		}
IT	AL
BAL	L_Scroll_Fill_Area26
L_Scroll_Fill_Area27:
;Scroll_main.c,253 :: 		Scroll_total_columns = temp + (_FONT_HEIGHT + _FONT_VERTICAL_SPACING);
LDRH	R0, [SP, #14]
ADDW	R1, R0, #34
MOVW	R0, #lo_addr(_Scroll_total_columns+0)
MOVT	R0, #hi_addr(_Scroll_total_columns+0)
STRH	R1, [R0, #0]
;Scroll_main.c,256 :: 		temp1 = temp1 + _FONT_HEIGHT + _FONT_VERTICAL_SPACING - 1;
LDRH	R0, [SP, #16]
ADDS	R0, #19
UXTH	R0, R0
ADDS	R0, #15
UXTH	R0, R0
SUBS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [SP, #16]
;Scroll_main.c,257 :: 		if (temp1 < _SCROLL_LAST_LINE)
CMP	R0, #238
IT	CS
BCS	L_Scroll_Fill_Area34
;Scroll_main.c,258 :: 		current_text_column = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_current_text_column+0)
MOVT	R0, #hi_addr(_current_text_column+0)
STRB	R1, [R0, #0]
L_Scroll_Fill_Area34:
;Scroll_main.c,259 :: 		if (temp1 <= temp){
LDRH	R1, [SP, #14]
LDRH	R0, [SP, #16]
CMP	R0, R1
IT	HI
BHI	L_Scroll_Fill_Area35
;Scroll_main.c,260 :: 		while (temp1 < _SCROLL_LAST_LINE){
L_Scroll_Fill_Area36:
LDRH	R0, [SP, #16]
CMP	R0, #238
IT	CS
BCS	L_Scroll_Fill_Area37
;Scroll_main.c,261 :: 		memset(pix_array, 0, 479);
MOVW	R2, #479
SXTH	R2, R2
MOVS	R1, #0
MOVW	R0, #lo_addr(_pix_array+0)
MOVT	R0, #hi_addr(_pix_array+0)
BL	_memset+0
;Scroll_main.c,262 :: 		i = Scrool_Get_new_text(last_window_column / (_FONT_HEIGHT + _FONT_VERTICAL_SPACING));
MOVW	R0, #lo_addr(_last_window_column+0)
MOVT	R0, #hi_addr(_last_window_column+0)
LDRSH	R1, [R0, #0]
MOVS	R0, #34
SXTH	R0, R0
SDIV	R0, R1, R0
UXTB	R0, R0
BL	_Scrool_Get_new_text+0
STRB	R0, [SP, #12]
;Scroll_main.c,263 :: 		Scroll_Get_One_Text_Line(current_text_column, Scroll_text);
MOVW	R0, #lo_addr(_current_text_column+0)
MOVT	R0, #hi_addr(_current_text_column+0)
LDRB	R0, [R0, #0]
MOVW	R1, #lo_addr(_Scroll_text+0)
MOVT	R1, #hi_addr(_Scroll_text+0)
BL	_Scroll_Get_One_Text_Line+0
;Scroll_main.c,265 :: 		if (File_List[i].FileType == 1)
LDRB	R1, [SP, #12]
MOVS	R0, #14
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_File_List+0)
MOVT	R0, #hi_addr(_File_List+0)
ADDS	R0, R0, R1
ADDS	R0, #13
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Scroll_Fill_Area38
;Scroll_main.c,266 :: 		Scroll_Write_One_Line(temp1, &file_icon);
MOVW	R1, #lo_addr(_file_icon+0)
MOVT	R1, #hi_addr(_file_icon+0)
LDRH	R0, [SP, #16]
BL	_Scroll_Write_One_Line+0
L_Scroll_Fill_Area38:
;Scroll_main.c,267 :: 		if (File_List[i].FileType == 2)
LDRB	R1, [SP, #12]
MOVS	R0, #14
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_File_List+0)
MOVT	R0, #hi_addr(_File_List+0)
ADDS	R0, R0, R1
ADDS	R0, #13
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_Scroll_Fill_Area39
;Scroll_main.c,268 :: 		Scroll_Write_One_Line(temp1, &folder_icon);
MOVW	R1, #lo_addr(_folder_icon+0)
MOVT	R1, #hi_addr(_folder_icon+0)
LDRH	R0, [SP, #16]
BL	_Scroll_Write_One_Line+0
L_Scroll_Fill_Area39:
;Scroll_main.c,270 :: 		current_text_column ++;
MOVW	R1, #lo_addr(_current_text_column+0)
MOVT	R1, #hi_addr(_current_text_column+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;Scroll_main.c,271 :: 		temp1 ++;
LDRH	R0, [SP, #16]
ADDS	R0, R0, #1
STRH	R0, [SP, #16]
;Scroll_main.c,272 :: 		}
IT	AL
BAL	L_Scroll_Fill_Area36
L_Scroll_Fill_Area37:
;Scroll_main.c,273 :: 		}
L_Scroll_Fill_Area35:
;Scroll_main.c,275 :: 		TFT_Ext_Image(_MP3_BIGIMAGE_VLINE, _SCROLL_FIRST_LINE, mp3_player_note_bmp, 1);
MOVS	R3, #1
MOVW	R2, _mp3_player_note_bmp
MOVT	R2, _mp3_player_note_bmp+2
MOVW	R1, #48
MOVW	R0, #300
BL	_TFT_Ext_Image+0
;Scroll_main.c,276 :: 		}
L_end_Scroll_Fill_Area:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _Scroll_Fill_Area
_Scroll_Add_newTextLine:
;Scroll_main.c,285 :: 		void Scroll_Add_newTextLine(char ScrollDiection){
; ScrollDiection start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
UXTB	R6, R0
; ScrollDiection end address is: 0 (R0)
; ScrollDiection start address is: 24 (R6)
;Scroll_main.c,289 :: 		memset(pix_array, 0, 479);
MOVW	R2, #479
SXTH	R2, R2
MOVS	R1, #0
MOVW	R0, #lo_addr(_pix_array+0)
MOVT	R0, #hi_addr(_pix_array+0)
BL	_memset+0
;Scroll_main.c,290 :: 		if (ScrollDiection == 0){
CMP	R6, #0
IT	NE
BNE	L_Scroll_Add_newTextLine40
; ScrollDiection end address is: 24 (R6)
;Scroll_main.c,291 :: 		current_text_column = last_window_column % (_FONT_HEIGHT + _FONT_VERTICAL_SPACING);
MOVW	R1, #lo_addr(_last_window_column+0)
MOVT	R1, #hi_addr(_last_window_column+0)
LDRSH	R3, [R1, #0]
MOVS	R1, #34
SXTH	R1, R1
SDIV	R2, R3, R1
MLS	R2, R1, R2, R3
MOVW	R1, #lo_addr(_current_text_column+0)
MOVT	R1, #hi_addr(_current_text_column+0)
STRB	R2, [R1, #0]
;Scroll_main.c,292 :: 		if (current_text_column < _FONT_HEIGHT + 1){
UXTB	R1, R2
CMP	R1, #20
IT	CS
BCS	L_Scroll_Add_newTextLine41
;Scroll_main.c,293 :: 		temp_file_type = Scrool_Get_new_text(last_window_column / (_FONT_HEIGHT + _FONT_VERTICAL_SPACING));
MOVW	R1, #lo_addr(_last_window_column+0)
MOVT	R1, #hi_addr(_last_window_column+0)
LDRSH	R2, [R1, #0]
MOVS	R1, #34
SXTH	R1, R1
SDIV	R1, R2, R1
UXTB	R0, R1
BL	_Scrool_Get_new_text+0
STRB	R0, [SP, #10]
;Scroll_main.c,294 :: 		Scroll_Get_One_Text_Line(current_text_column, Scroll_text);
MOVW	R1, #lo_addr(_current_text_column+0)
MOVT	R1, #hi_addr(_current_text_column+0)
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOVW	R1, #lo_addr(_Scroll_text+0)
MOVT	R1, #hi_addr(_Scroll_text+0)
BL	_Scroll_Get_One_Text_Line+0
;Scroll_main.c,296 :: 		temp = _disp_scroll - 1;
MOVW	R1, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R1, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R1, [R1, #0]
SUBS	R1, R1, #1
STRH	R1, [SP, #8]
;Scroll_main.c,297 :: 		if (temp < _SCROLL_FIRST_LINE)
UXTH	R1, R1
CMP	R1, #48
IT	CS
BCS	L_Scroll_Add_newTextLine42
;Scroll_main.c,298 :: 		temp = _SCROLL_LAST_LINE - 1;
MOVS	R1, #237
STRH	R1, [SP, #8]
L_Scroll_Add_newTextLine42:
;Scroll_main.c,300 :: 		if (temp_file_type == 1)
LDRB	R1, [SP, #10]
CMP	R1, #1
IT	NE
BNE	L_Scroll_Add_newTextLine43
;Scroll_main.c,301 :: 		Scroll_Write_One_Line(temp, &file_icon);
MOVW	R1, #lo_addr(_file_icon+0)
MOVT	R1, #hi_addr(_file_icon+0)
LDRH	R0, [SP, #8]
BL	_Scroll_Write_One_Line+0
L_Scroll_Add_newTextLine43:
;Scroll_main.c,302 :: 		if (temp_file_type == 2)
LDRB	R1, [SP, #10]
CMP	R1, #2
IT	NE
BNE	L_Scroll_Add_newTextLine44
;Scroll_main.c,303 :: 		Scroll_Write_One_Line(temp, &folder_icon);
MOVW	R1, #lo_addr(_folder_icon+0)
MOVT	R1, #hi_addr(_folder_icon+0)
LDRH	R0, [SP, #8]
BL	_Scroll_Write_One_Line+0
L_Scroll_Add_newTextLine44:
;Scroll_main.c,304 :: 		}
IT	AL
BAL	L_Scroll_Add_newTextLine45
L_Scroll_Add_newTextLine41:
;Scroll_main.c,306 :: 		temp = _disp_scroll - 1;
MOVW	R1, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R1, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R1, [R1, #0]
SUBS	R1, R1, #1
STRH	R1, [SP, #8]
;Scroll_main.c,307 :: 		if (temp < _SCROLL_FIRST_LINE)
UXTH	R1, R1
CMP	R1, #48
IT	CS
BCS	L_Scroll_Add_newTextLine46
;Scroll_main.c,308 :: 		temp = _SCROLL_LAST_LINE - 1;
MOVS	R1, #237
STRH	R1, [SP, #8]
L_Scroll_Add_newTextLine46:
;Scroll_main.c,310 :: 		TFT_CS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(TFT_CS+0)
MOVT	R1, #hi_addr(TFT_CS+0)
STR	R2, [R1, #0]
;Scroll_main.c,311 :: 		TFT_SSD1963_Set_Address_Ptr(0, temp, 479, temp);
LDRH	R3, [SP, #8]
MOVW	R2, #479
LDRH	R1, [SP, #8]
MOVS	R0, #0
MOVW	R4, #lo_addr(_TFT_SSD1963_Set_Address_Ptr+0)
MOVT	R4, #hi_addr(_TFT_SSD1963_Set_Address_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;Scroll_main.c,312 :: 		for (i = 0; i < 479; i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
UXTH	R0, R2
L_Scroll_Add_newTextLine47:
; i start address is: 0 (R0)
MOVW	R1, #479
CMP	R0, R1
IT	CS
BCS	L_Scroll_Add_newTextLine48
;Scroll_main.c,313 :: 		TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
STRH	R0, [SP, #4]
MOVW	R0, #11057
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
LDRH	R0, [SP, #4]
;Scroll_main.c,312 :: 		for (i = 0; i < 479; i++)
ADDS	R1, R0, #1
; i end address is: 0 (R0)
; i start address is: 8 (R2)
UXTH	R2, R1
;Scroll_main.c,313 :: 		TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
UXTH	R0, R2
; i end address is: 8 (R2)
IT	AL
BAL	L_Scroll_Add_newTextLine47
L_Scroll_Add_newTextLine48:
;Scroll_main.c,314 :: 		TFT_CS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(TFT_CS+0)
MOVT	R1, #hi_addr(TFT_CS+0)
STR	R2, [R1, #0]
;Scroll_main.c,315 :: 		}
L_Scroll_Add_newTextLine45:
;Scroll_main.c,316 :: 		Add_Image_LIne(mp3_player_note_bmp, imageLine, temp);
MOVW	R1, #lo_addr(Scroll_main_imageLine+0)
MOVT	R1, #hi_addr(Scroll_main_imageLine+0)
LDRSH	R1, [R1, #0]
LDRH	R2, [SP, #8]
MOVW	R0, _mp3_player_note_bmp
MOVT	R0, _mp3_player_note_bmp+2
BL	_Add_Image_Line+0
;Scroll_main.c,317 :: 		}
IT	AL
BAL	L_Scroll_Add_newTextLine50
L_Scroll_Add_newTextLine40:
;Scroll_main.c,319 :: 		current_text_column = first_window_column % (_FONT_HEIGHT + _FONT_VERTICAL_SPACING);
MOVW	R1, #lo_addr(_first_window_column+0)
MOVT	R1, #hi_addr(_first_window_column+0)
LDRSH	R3, [R1, #0]
MOVS	R1, #34
SXTH	R1, R1
SDIV	R2, R3, R1
MLS	R2, R1, R2, R3
MOVW	R1, #lo_addr(_current_text_column+0)
MOVT	R1, #hi_addr(_current_text_column+0)
STRB	R2, [R1, #0]
;Scroll_main.c,320 :: 		if (current_text_column < _FONT_HEIGHT + 1){
UXTB	R1, R2
CMP	R1, #20
IT	CS
BCS	L_Scroll_Add_newTextLine51
;Scroll_main.c,321 :: 		temp_file_type = Scrool_Get_new_text(first_window_column / (_FONT_HEIGHT + _FONT_VERTICAL_SPACING));
MOVW	R1, #lo_addr(_first_window_column+0)
MOVT	R1, #hi_addr(_first_window_column+0)
LDRSH	R2, [R1, #0]
MOVS	R1, #34
SXTH	R1, R1
SDIV	R1, R2, R1
UXTB	R0, R1
BL	_Scrool_Get_new_text+0
STRB	R0, [SP, #10]
;Scroll_main.c,322 :: 		Scroll_Get_One_Text_Line(current_text_column, Scroll_text);
MOVW	R1, #lo_addr(_current_text_column+0)
MOVT	R1, #hi_addr(_current_text_column+0)
LDRB	R1, [R1, #0]
UXTB	R0, R1
MOVW	R1, #lo_addr(_Scroll_text+0)
MOVT	R1, #hi_addr(_Scroll_text+0)
BL	_Scroll_Get_One_Text_Line+0
;Scroll_main.c,324 :: 		if (temp_file_type == 1)
LDRB	R1, [SP, #10]
CMP	R1, #1
IT	NE
BNE	L_Scroll_Add_newTextLine52
;Scroll_main.c,325 :: 		Scroll_Write_One_Line(_disp_scroll, &file_icon);
MOVW	R1, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R1, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R1, [R1, #0]
UXTH	R0, R1
MOVW	R1, #lo_addr(_file_icon+0)
MOVT	R1, #hi_addr(_file_icon+0)
BL	_Scroll_Write_One_Line+0
L_Scroll_Add_newTextLine52:
;Scroll_main.c,326 :: 		if (temp_file_type == 2)
LDRB	R1, [SP, #10]
CMP	R1, #2
IT	NE
BNE	L_Scroll_Add_newTextLine53
;Scroll_main.c,327 :: 		Scroll_Write_One_Line(_disp_scroll, &folder_icon);
MOVW	R1, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R1, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R1, [R1, #0]
UXTH	R0, R1
MOVW	R1, #lo_addr(_folder_icon+0)
MOVT	R1, #hi_addr(_folder_icon+0)
BL	_Scroll_Write_One_Line+0
L_Scroll_Add_newTextLine53:
;Scroll_main.c,328 :: 		}
IT	AL
BAL	L_Scroll_Add_newTextLine54
L_Scroll_Add_newTextLine51:
;Scroll_main.c,330 :: 		TFT_CS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(TFT_CS+0)
MOVT	R1, #hi_addr(TFT_CS+0)
STR	R2, [R1, #0]
;Scroll_main.c,331 :: 		TFT_SSD1963_Set_Address_Ptr(0, _disp_scroll, 479, _disp_scroll);
MOVW	R1, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R1, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R4, [R1, #0]
LDRSH	R1, [R1, #0]
UXTH	R3, R4
MOVW	R2, #479
MOVS	R0, #0
MOVW	R4, #lo_addr(_TFT_SSD1963_Set_Address_Ptr+0)
MOVT	R4, #hi_addr(_TFT_SSD1963_Set_Address_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;Scroll_main.c,332 :: 		for (i = 0; i < 479; i++)
; i start address is: 0 (R0)
MOVS	R0, #0
; i end address is: 0 (R0)
L_Scroll_Add_newTextLine55:
; i start address is: 0 (R0)
MOVW	R1, #479
CMP	R0, R1
IT	CS
BCS	L_Scroll_Add_newTextLine56
;Scroll_main.c,333 :: 		TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
STRH	R0, [SP, #4]
MOVW	R0, #11057
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
LDRH	R0, [SP, #4]
;Scroll_main.c,332 :: 		for (i = 0; i < 479; i++)
ADDS	R1, R0, #1
; i end address is: 0 (R0)
; i start address is: 4 (R1)
;Scroll_main.c,333 :: 		TFT_Write_Data_Ptr(_MP3_BACKGOUND_COLOR);
UXTH	R0, R1
; i end address is: 4 (R1)
IT	AL
BAL	L_Scroll_Add_newTextLine55
L_Scroll_Add_newTextLine56:
;Scroll_main.c,334 :: 		TFT_CS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(TFT_CS+0)
MOVT	R1, #hi_addr(TFT_CS+0)
STR	R2, [R1, #0]
;Scroll_main.c,335 :: 		}
L_Scroll_Add_newTextLine54:
;Scroll_main.c,336 :: 		Add_Image_LIne(mp3_player_note_bmp, imageLine, _disp_scroll);
MOVW	R1, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R1, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R2, [R1, #0]
MOVW	R1, #lo_addr(Scroll_main_imageLine+0)
MOVT	R1, #hi_addr(Scroll_main_imageLine+0)
LDRSH	R1, [R1, #0]
MOVW	R0, _mp3_player_note_bmp
MOVT	R0, _mp3_player_note_bmp+2
BL	_Add_Image_Line+0
;Scroll_main.c,337 :: 		}
L_Scroll_Add_newTextLine50:
;Scroll_main.c,338 :: 		}
L_end_Scroll_Add_newTextLine:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Scroll_Add_newTextLine
_Scroll_Menu:
;Scroll_main.c,347 :: 		void Scroll_Menu(char Adir) {
; Adir start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Adir end address is: 0 (R0)
; Adir start address is: 0 (R0)
;Scroll_main.c,349 :: 		if (Adir == _Up) {
CMP	R0, #1
IT	NE
BNE	L_Scroll_Menu58
; Adir end address is: 0 (R0)
;Scroll_main.c,350 :: 		if (_disp_scroll != _SCROLL_FIRST_LINE)
MOVW	R1, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R1, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R1, [R1, #0]
CMP	R1, #48
IT	EQ
BEQ	L_Scroll_Menu59
;Scroll_main.c,351 :: 		_disp_scroll--;
MOVW	R2, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R2, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
STRH	R1, [R2, #0]
IT	AL
BAL	L_Scroll_Menu60
L_Scroll_Menu59:
;Scroll_main.c,353 :: 		_disp_scroll = _SCROLL_LAST_LINE - 1;
MOVS	R2, #237
SXTH	R2, R2
MOVW	R1, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R1, #hi_addr(Scroll_main__disp_scroll+0)
STRH	R2, [R1, #0]
;Scroll_main.c,354 :: 		_disp_scroll_rollover --;
MOVW	R2, #lo_addr(Scroll_main__disp_scroll_rollover+0)
MOVT	R2, #hi_addr(Scroll_main__disp_scroll_rollover+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
STRH	R1, [R2, #0]
;Scroll_main.c,355 :: 		}
L_Scroll_Menu60:
;Scroll_main.c,356 :: 		}
IT	AL
BAL	L_Scroll_Menu61
L_Scroll_Menu58:
;Scroll_main.c,358 :: 		if (_disp_scroll != _SCROLL_LAST_LINE - 1)
MOVW	R1, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R1, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R1, [R1, #0]
CMP	R1, #237
IT	EQ
BEQ	L_Scroll_Menu62
;Scroll_main.c,359 :: 		_disp_scroll++;
MOVW	R2, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R2, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
IT	AL
BAL	L_Scroll_Menu63
L_Scroll_Menu62:
;Scroll_main.c,361 :: 		_disp_scroll = _SCROLL_FIRST_LINE;
MOVW	R2, #48
SXTH	R2, R2
MOVW	R1, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R1, #hi_addr(Scroll_main__disp_scroll+0)
STRH	R2, [R1, #0]
;Scroll_main.c,362 :: 		_disp_scroll_rollover ++;
MOVW	R2, #lo_addr(Scroll_main__disp_scroll_rollover+0)
MOVT	R2, #hi_addr(Scroll_main__disp_scroll_rollover+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;Scroll_main.c,363 :: 		}
L_Scroll_Menu63:
;Scroll_main.c,364 :: 		}
L_Scroll_Menu61:
;Scroll_main.c,366 :: 		Scroll(_disp_scroll);
MOVW	R1, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R1, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R1, [R1, #0]
UXTH	R0, R1
BL	_Scroll+0
;Scroll_main.c,367 :: 		}
L_end_Scroll_Menu:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Scroll_Menu
_ScrollUp:
;Scroll_main.c,376 :: 		void ScrollUp(int scroll){
; scroll start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; scroll end address is: 0 (R0)
; scroll start address is: 0 (R0)
;Scroll_main.c,377 :: 		while(scroll--){
L_ScrollUp64:
; scroll start address is: 0 (R0)
SXTH	R2, R0
SUBS	R1, R0, #1
SXTH	R0, R1
; scroll end address is: 0 (R0)
CMP	R2, #0
IT	EQ
BEQ	L_ScrollUp65
; scroll end address is: 0 (R0)
;Scroll_main.c,378 :: 		last_window_column --;
; scroll start address is: 0 (R0)
MOVW	R2, #lo_addr(_last_window_column+0)
MOVT	R2, #hi_addr(_last_window_column+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
STRH	R1, [R2, #0]
;Scroll_main.c,379 :: 		first_window_column --;
MOVW	R2, #lo_addr(_first_window_column+0)
MOVT	R2, #hi_addr(_first_window_column+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Scroll_main.c,380 :: 		if (first_window_column >= 0){
CMP	R1, #0
IT	LT
BLT	L_ScrollUp66
;Scroll_main.c,381 :: 		imageLine--;
MOVW	R2, #lo_addr(Scroll_main_imageLine+0)
MOVT	R2, #hi_addr(Scroll_main_imageLine+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Scroll_main.c,382 :: 		if (imageline < 0)
CMP	R1, #0
IT	GE
BGE	L_ScrollUp67
;Scroll_main.c,383 :: 		imageline = 188;
MOVS	R2, #188
SXTH	R2, R2
MOVW	R1, #lo_addr(Scroll_main_imageLine+0)
MOVT	R1, #hi_addr(Scroll_main_imageLine+0)
STRH	R2, [R1, #0]
L_ScrollUp67:
;Scroll_main.c,384 :: 		Scroll_Menu(_Up);              // Scroll image
STRH	R0, [SP, #4]
MOVS	R0, #1
BL	_Scroll_Menu+0
;Scroll_main.c,385 :: 		Scroll_Add_newTextLine(_Up);
MOVS	R0, #1
BL	_Scroll_Add_newTextLine+0
LDRSH	R0, [SP, #4]
;Scroll_main.c,386 :: 		}
IT	AL
BAL	L_ScrollUp68
L_ScrollUp66:
;Scroll_main.c,388 :: 		last_window_column ++;
MOVW	R2, #lo_addr(_last_window_column+0)
MOVT	R2, #hi_addr(_last_window_column+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;Scroll_main.c,389 :: 		first_window_column ++;
MOVW	R2, #lo_addr(_first_window_column+0)
MOVT	R2, #hi_addr(_first_window_column+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;Scroll_main.c,390 :: 		}
L_ScrollUp68:
;Scroll_main.c,391 :: 		}
; scroll end address is: 0 (R0)
IT	AL
BAL	L_ScrollUp64
L_ScrollUp65:
;Scroll_main.c,392 :: 		}
L_end_ScrollUp:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _ScrollUp
_ScrollDown:
;Scroll_main.c,401 :: 		void ScrollDown(int scroll){
; scroll start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; scroll end address is: 0 (R0)
; scroll start address is: 0 (R0)
;Scroll_main.c,402 :: 		while(scroll--){
L_ScrollDown69:
; scroll start address is: 0 (R0)
SXTH	R2, R0
SUBS	R1, R0, #1
SXTH	R0, R1
; scroll end address is: 0 (R0)
CMP	R2, #0
IT	EQ
BEQ	L_ScrollDown70
; scroll end address is: 0 (R0)
;Scroll_main.c,403 :: 		last_window_column ++;
; scroll start address is: 0 (R0)
MOVW	R2, #lo_addr(_last_window_column+0)
MOVT	R2, #hi_addr(_last_window_column+0)
LDRSH	R1, [R2, #0]
ADDS	R3, R1, #1
SXTH	R3, R3
STRH	R3, [R2, #0]
;Scroll_main.c,404 :: 		first_window_column ++;
MOVW	R2, #lo_addr(_first_window_column+0)
MOVT	R2, #hi_addr(_first_window_column+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;Scroll_main.c,405 :: 		if (last_window_column < Scroll_total_columns){
MOVW	R1, #lo_addr(_Scroll_total_columns+0)
MOVT	R1, #hi_addr(_Scroll_total_columns+0)
LDRH	R1, [R1, #0]
CMP	R3, R1
IT	CS
BCS	L_ScrollDown71
;Scroll_main.c,406 :: 		imageLine++;
MOVW	R2, #lo_addr(Scroll_main_imageLine+0)
MOVT	R2, #hi_addr(Scroll_main_imageLine+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;Scroll_main.c,407 :: 		if (imageline > 188)
CMP	R1, #188
IT	LE
BLE	L_ScrollDown72
;Scroll_main.c,408 :: 		imageline = 0;
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #lo_addr(Scroll_main_imageLine+0)
MOVT	R1, #hi_addr(Scroll_main_imageLine+0)
STRH	R2, [R1, #0]
L_ScrollDown72:
;Scroll_main.c,409 :: 		Scroll_Menu(_Down);
STRH	R0, [SP, #4]
MOVS	R0, #0
BL	_Scroll_Menu+0
;Scroll_main.c,410 :: 		Scroll_Add_newTextLine(_Down);
MOVS	R0, #0
BL	_Scroll_Add_newTextLine+0
LDRSH	R0, [SP, #4]
;Scroll_main.c,411 :: 		}
IT	AL
BAL	L_ScrollDown73
L_ScrollDown71:
;Scroll_main.c,413 :: 		last_window_column --;
MOVW	R2, #lo_addr(_last_window_column+0)
MOVT	R2, #hi_addr(_last_window_column+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
STRH	R1, [R2, #0]
;Scroll_main.c,414 :: 		first_window_column --;
MOVW	R2, #lo_addr(_first_window_column+0)
MOVT	R2, #hi_addr(_first_window_column+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
STRH	R1, [R2, #0]
;Scroll_main.c,415 :: 		}
L_ScrollDown73:
;Scroll_main.c,416 :: 		}
; scroll end address is: 0 (R0)
IT	AL
BAL	L_ScrollDown69
L_ScrollDown70:
;Scroll_main.c,417 :: 		}
L_end_ScrollDown:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _ScrollDown
_Scroll_Disp:
;Scroll_main.c,426 :: 		void Scroll_Disp(unsigned int Apos, char Adir) {
; Adir start address is: 4 (R1)
; Apos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Adir end address is: 4 (R1)
; Apos end address is: 0 (R0)
; Apos start address is: 0 (R0)
; Adir start address is: 4 (R1)
;Scroll_main.c,427 :: 		if (Adir == _Up) {
CMP	R1, #1
IT	NE
BNE	L_Scroll_Disp74
; Adir end address is: 4 (R1)
;Scroll_main.c,428 :: 		ScrollUP(Apos);
SXTH	R0, R0
; Apos end address is: 0 (R0)
BL	_ScrollUp+0
;Scroll_main.c,429 :: 		}
IT	AL
BAL	L_Scroll_Disp75
L_Scroll_Disp74:
;Scroll_main.c,431 :: 		ScrollDown(Apos);
; Apos start address is: 0 (R0)
SXTH	R0, R0
; Apos end address is: 0 (R0)
BL	_ScrollDown+0
;Scroll_main.c,432 :: 		}
L_Scroll_Disp75:
;Scroll_main.c,433 :: 		}
L_end_Scroll_Disp:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Scroll_Disp
_ScrollPress:
;Scroll_main.c,444 :: 		void ScrollPress(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Scroll_main.c,449 :: 		if (Xcoord > 240){
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
CMP	R0, #240
IT	LS
BLS	L_ScrollPress76
;Scroll_main.c,450 :: 		if (Scroll_Flag == 0){
MOVW	R0, #lo_addr(_Scroll_Flag+0)
MOVT	R0, #hi_addr(_Scroll_Flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_ScrollPress77
;Scroll_main.c,451 :: 		Scroll_Flag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Scroll_Flag+0)
MOVT	R0, #hi_addr(_Scroll_Flag+0)
STRB	R1, [R0, #0]
;Scroll_main.c,452 :: 		ScrollOldYcoo = Ycoord;
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_ScrollOldYcoo+0)
MOVT	R0, #hi_addr(_ScrollOldYcoo+0)
STRH	R1, [R0, #0]
;Scroll_main.c,453 :: 		return;
IT	AL
BAL	L_end_ScrollPress
;Scroll_main.c,454 :: 		}
L_ScrollPress77:
;Scroll_main.c,455 :: 		delta = Ycoord - ScrollOldYcoo;
MOVW	R0, #lo_addr(_ScrollOldYcoo+0)
MOVT	R0, #hi_addr(_ScrollOldYcoo+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R0, [R0, #0]
SUB	R0, R0, R1
; delta start address is: 4 (R1)
SXTH	R1, R0
;Scroll_main.c,456 :: 		if (delta > 0){
SXTH	R0, R0
CMP	R0, #0
IT	LE
BLE	L_ScrollPress78
;Scroll_main.c,457 :: 		dir = 0;
MOVS	R0, #0
STRB	R0, [SP, #8]
;Scroll_main.c,458 :: 		}
L_ScrollPress78:
;Scroll_main.c,459 :: 		if (delta < 0){
CMP	R1, #0
IT	GE
BGE	L__ScrollPress109
;Scroll_main.c,460 :: 		dir = 1;
MOVS	R0, #1
STRB	R0, [SP, #8]
;Scroll_main.c,461 :: 		delta = - delta;
RSBS	R1, R1, #0
SXTH	R1, R1
; delta end address is: 4 (R1)
;Scroll_main.c,462 :: 		}
IT	AL
BAL	L_ScrollPress79
L__ScrollPress109:
;Scroll_main.c,459 :: 		if (delta < 0){
;Scroll_main.c,462 :: 		}
L_ScrollPress79:
;Scroll_main.c,463 :: 		if (delta < 4)
; delta start address is: 4 (R1)
CMP	R1, #4
IT	GE
BGE	L_ScrollPress80
; delta end address is: 4 (R1)
;Scroll_main.c,464 :: 		return;
IT	AL
BAL	L_end_ScrollPress
L_ScrollPress80:
;Scroll_main.c,465 :: 		if (delta > 7)
; delta start address is: 4 (R1)
CMP	R1, #7
IT	LE
BLE	L__ScrollPress110
;Scroll_main.c,466 :: 		delta = 7;
MOVS	R1, #7
SXTH	R1, R1
; delta end address is: 4 (R1)
IT	AL
BAL	L_ScrollPress81
L__ScrollPress110:
;Scroll_main.c,465 :: 		if (delta > 7)
;Scroll_main.c,466 :: 		delta = 7;
L_ScrollPress81:
;Scroll_main.c,467 :: 		for (Scrollcnt = 0; Scrollcnt < delta; Scrollcnt ++){
; delta start address is: 4 (R1)
; Scrollcnt start address is: 0 (R0)
MOVS	R0, #0
; Scrollcnt end address is: 0 (R0)
; delta end address is: 4 (R1)
UXTB	R2, R0
L_ScrollPress82:
; Scrollcnt start address is: 8 (R2)
; delta start address is: 4 (R1)
CMP	R2, R1
IT	GE
BGE	L_ScrollPress83
;Scroll_main.c,468 :: 		if (dir == 1)
LDRB	R0, [SP, #8]
CMP	R0, #1
IT	NE
BNE	L_ScrollPress85
;Scroll_main.c,469 :: 		Scroll_Disp(1, _DOWN);
STRH	R1, [SP, #4]
STRB	R2, [SP, #6]
MOVS	R1, #0
MOVS	R0, #1
BL	_Scroll_Disp+0
LDRB	R2, [SP, #6]
LDRSH	R1, [SP, #4]
IT	AL
BAL	L_ScrollPress86
L_ScrollPress85:
;Scroll_main.c,471 :: 		Scroll_Disp(1, _UP);
STRH	R1, [SP, #4]
STRB	R2, [SP, #6]
MOVS	R1, #1
MOVS	R0, #1
BL	_Scroll_Disp+0
LDRB	R2, [SP, #6]
LDRSH	R1, [SP, #4]
L_ScrollPress86:
;Scroll_main.c,467 :: 		for (Scrollcnt = 0; Scrollcnt < delta; Scrollcnt ++){
ADDS	R2, R2, #1
UXTB	R2, R2
;Scroll_main.c,472 :: 		}
; delta end address is: 4 (R1)
; Scrollcnt end address is: 8 (R2)
IT	AL
BAL	L_ScrollPress82
L_ScrollPress83:
;Scroll_main.c,473 :: 		ScrollOldYcoo = Ycoord;
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_ScrollOldYcoo+0)
MOVT	R0, #hi_addr(_ScrollOldYcoo+0)
STRH	R1, [R0, #0]
;Scroll_main.c,474 :: 		}
L_ScrollPress76:
;Scroll_main.c,475 :: 		}
L_end_ScrollPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _ScrollPress
_Process_file:
;Scroll_main.c,488 :: 		void Process_file(char File_No){
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R0, [SP, #4]
;Scroll_main.c,489 :: 		BLED_Fade_Out();
BL	_BLED_Fade_Out+0
;Scroll_main.c,490 :: 		Stop_Scroll();
BL	_Stop_Scroll+0
;Scroll_main.c,491 :: 		Start_MP3_Player(File_List[File_No].FileName, File_no);
LDRB	R2, [SP, #4]
MOVS	R1, #14
MULS	R2, R1, R2
MOVW	R1, #lo_addr(_File_List+0)
MOVT	R1, #hi_addr(_File_List+0)
ADDS	R1, R1, R2
MOV	R0, R1
LDRB	R1, [SP, #4]
BL	_Start_MP3_Player+0
;Scroll_main.c,492 :: 		BLED_Fade_In();
BL	_BLED_Fade_In+0
;Scroll_main.c,493 :: 		}
L_end_Process_file:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Process_file
_Process_folder:
;Scroll_main.c,502 :: 		void Process_folder(char File_No){
; File_No start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; File_No end address is: 0 (R0)
; File_No start address is: 0 (R0)
;Scroll_main.c,503 :: 		FAT32_ChangeDir(File_List[File_No].FileName);
MOVS	R1, #14
MUL	R2, R1, R0
; File_No end address is: 0 (R0)
MOVW	R1, #lo_addr(_File_List+0)
MOVT	R1, #hi_addr(_File_List+0)
ADDS	R1, R1, R2
MOV	R0, R1
BL	_FAT32_ChangeDir+0
;Scroll_main.c,504 :: 		DrawBox(&Box6);
MOVW	R0, #lo_addr(_Box6+0)
MOVT	R0, #hi_addr(_Box6+0)
BL	_DrawBox+0
;Scroll_main.c,505 :: 		Initialize_Scroll();
BL	_Initialize_Scroll+0
;Scroll_main.c,506 :: 		}
L_end_Process_folder:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_folder
_ScrollOnClick:
;Scroll_main.c,515 :: 		void ScrollOnClick(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Scroll_main.c,517 :: 		if (Xcoord < 241){
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
CMP	R0, #241
IT	CS
BCS	L_ScrollOnClick87
;Scroll_main.c,518 :: 		temp = (Ycoord - _SCROLL_FIRST_LINE + _disp_scroll - _SCROLL_FIRST_LINE + _disp_scroll_rollover * (_SCROLL_LAST_LINE - _SCROLL_FIRST_LINE)) / (_FONT_HEIGHT + _FONT_VERTICAL_SPACING);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R0, [R0, #0]
SUBW	R1, R0, #48
UXTH	R1, R1
MOVW	R0, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R0, #hi_addr(Scroll_main__disp_scroll+0)
LDRSH	R0, [R0, #0]
ADDS	R0, R1, R0
UXTH	R0, R0
SUBW	R2, R0, #48
UXTH	R2, R2
MOVW	R0, #lo_addr(Scroll_main__disp_scroll_rollover+0)
MOVT	R0, #hi_addr(Scroll_main__disp_scroll_rollover+0)
LDRSH	R1, [R0, #0]
MOVS	R0, #190
SXTH	R0, R0
MULS	R0, R1, R0
SXTH	R0, R0
ADDS	R1, R2, R0
UXTH	R1, R1
MOVS	R0, #34
UDIV	R0, R1, R0
STRB	R0, [SP, #4]
;Scroll_main.c,519 :: 		file_type = Scrool_Get_new_text(temp);
UXTB	R0, R0
BL	_Scrool_Get_new_text+0
STRB	R0, [SP, #5]
;Scroll_main.c,521 :: 		if (file_type == 1)
CMP	R0, #1
IT	NE
BNE	L_ScrollOnClick88
;Scroll_main.c,522 :: 		Process_file(temp);
LDRB	R0, [SP, #4]
BL	_Process_file+0
L_ScrollOnClick88:
;Scroll_main.c,523 :: 		if (file_type == 2)
LDRB	R0, [SP, #5]
CMP	R0, #2
IT	NE
BNE	L_ScrollOnClick89
;Scroll_main.c,524 :: 		Process_folder(temp);
LDRB	R0, [SP, #4]
BL	_Process_folder+0
L_ScrollOnClick89:
;Scroll_main.c,525 :: 		}
L_ScrollOnClick87:
;Scroll_main.c,526 :: 		}
L_end_ScrollOnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _ScrollOnClick
_Fill_List:
;Scroll_main.c,535 :: 		char Fill_List(TScroll_List *List){
; MyError start address is: 24 (R6)
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Scroll_main.c,537 :: 		char MyError = 1;
;Scroll_main.c,535 :: 		char Fill_List(TScroll_List *List){
;Scroll_main.c,537 :: 		char MyError = 1;
;Scroll_main.c,535 :: 		char Fill_List(TScroll_List *List){
STR	R0, [SP, #8]
; MyError end address is: 24 (R6)
;Scroll_main.c,537 :: 		char MyError = 1;
; MyError start address is: 24 (R6)
MOVS	R6, #1
;Scroll_main.c,538 :: 		char File_List_cnt = 0;
MOVS	R1, #0
STRB	R1, [SP, #4]
;Scroll_main.c,539 :: 		memset((char *)List, 0, 100 * (13 + 1));
MOVW	R2, #1400
SXTH	R2, R2
MOVS	R1, #0
LDR	R0, [SP, #8]
BL	_memset+0
; MyError end address is: 24 (R6)
UXTB	R0, R6
;Scroll_main.c,540 :: 		while ((MyError != 0) && (MyError != 0xFF)){
L_Fill_List90:
; MyError start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L__Fill_List119
CMP	R0, #255
IT	EQ
BEQ	L__Fill_List118
; MyError end address is: 0 (R0)
L__Fill_List113:
;Scroll_main.c,541 :: 		MyError = FAT32_FindNext(&MyDir);
MOVW	R0, #lo_addr(_MyDir+0)
MOVT	R0, #hi_addr(_MyDir+0)
BL	_FAT32_FindNext+0
; MyError start address is: 28 (R7)
UXTB	R7, R0
;Scroll_main.c,542 :: 		if ((MyDir.NameExt[0] != 0) && MyError != 0){
MOVW	R1, #lo_addr(_MyDir+0)
MOVT	R1, #hi_addr(_MyDir+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__Fill_List117
CMP	R7, #0
IT	EQ
BEQ	L__Fill_List116
L__Fill_List112:
;Scroll_main.c,543 :: 		if (MyDir.Attrib & ATTR_FILE_MASK){
MOVW	R1, #lo_addr(_MyDir+13)
MOVT	R1, #hi_addr(_MyDir+13)
LDRB	R1, [R1, #0]
AND	R1, R1, #39
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_Fill_List97
;Scroll_main.c,544 :: 		if ((strstr(MyDir.NameExt, ".MP3") != 0) || (strstr(MyDir.NameExt, ".WAV") != 0)){
MOVW	R1, #lo_addr(?lstr1_Scroll_main+0)
MOVT	R1, #hi_addr(?lstr1_Scroll_main+0)
MOVW	R0, #lo_addr(_MyDir+0)
MOVT	R0, #hi_addr(_MyDir+0)
BL	_strstr+0
CMP	R0, #0
IT	NE
BNE	L__Fill_List115
MOVW	R1, #lo_addr(?lstr2_Scroll_main+0)
MOVT	R1, #hi_addr(?lstr2_Scroll_main+0)
MOVW	R0, #lo_addr(_MyDir+0)
MOVT	R0, #hi_addr(_MyDir+0)
BL	_strstr+0
CMP	R0, #0
IT	NE
BNE	L__Fill_List114
IT	AL
BAL	L_Fill_List100
L__Fill_List115:
L__Fill_List114:
;Scroll_main.c,545 :: 		strcat(List->FileName, MyDir.NameExt);
MOVW	R1, #lo_addr(_MyDir+0)
MOVT	R1, #hi_addr(_MyDir+0)
LDR	R0, [SP, #8]
BL	_strcat+0
;Scroll_main.c,546 :: 		List->FileType = 1;
LDR	R1, [SP, #8]
ADDW	R2, R1, #13
MOVS	R1, #1
STRB	R1, [R2, #0]
;Scroll_main.c,547 :: 		File_List_cnt ++;
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
STRB	R1, [SP, #4]
;Scroll_main.c,548 :: 		List ++;
LDR	R1, [SP, #8]
ADDS	R1, #14
STR	R1, [SP, #8]
;Scroll_main.c,549 :: 		}
L_Fill_List100:
;Scroll_main.c,550 :: 		}
IT	AL
BAL	L_Fill_List101
L_Fill_List97:
;Scroll_main.c,551 :: 		else if (MyDir.Attrib == ATTR_DIRECTORY){
MOVW	R1, #lo_addr(_MyDir+13)
MOVT	R1, #hi_addr(_MyDir+13)
LDRB	R1, [R1, #0]
CMP	R1, #16
IT	NE
BNE	L_Fill_List102
;Scroll_main.c,552 :: 		strcat(List->FileName, MyDir.NameExt);
MOVW	R1, #lo_addr(_MyDir+0)
MOVT	R1, #hi_addr(_MyDir+0)
LDR	R0, [SP, #8]
BL	_strcat+0
;Scroll_main.c,553 :: 		List->FileType = 2;
LDR	R1, [SP, #8]
ADDW	R2, R1, #13
MOVS	R1, #2
STRB	R1, [R2, #0]
;Scroll_main.c,554 :: 		File_List_cnt ++;
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
STRB	R1, [SP, #4]
;Scroll_main.c,555 :: 		List ++;
LDR	R1, [SP, #8]
ADDS	R1, #14
STR	R1, [SP, #8]
;Scroll_main.c,556 :: 		}
L_Fill_List102:
L_Fill_List101:
;Scroll_main.c,542 :: 		if ((MyDir.NameExt[0] != 0) && MyError != 0){
L__Fill_List117:
L__Fill_List116:
;Scroll_main.c,558 :: 		}
UXTB	R0, R7
; MyError end address is: 28 (R7)
IT	AL
BAL	L_Fill_List90
;Scroll_main.c,540 :: 		while ((MyError != 0) && (MyError != 0xFF)){
L__Fill_List119:
L__Fill_List118:
;Scroll_main.c,559 :: 		List->FileName[0] = 0xFF;
MOVS	R2, #255
LDR	R1, [SP, #8]
STRB	R2, [R1, #0]
;Scroll_main.c,560 :: 		return File_List_cnt;
LDRB	R0, [SP, #4]
;Scroll_main.c,561 :: 		}
L_end_Fill_List:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Fill_List
_Stop_Scroll:
;Scroll_main.c,570 :: 		void Stop_Scroll(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Scroll_main.c,571 :: 		_disp_scroll = _SCROLL_FIRST_LINE;
MOVW	R1, #48
SXTH	R1, R1
MOVW	R0, #lo_addr(Scroll_main__disp_scroll+0)
MOVT	R0, #hi_addr(Scroll_main__disp_scroll+0)
STRH	R1, [R0, #0]
;Scroll_main.c,572 :: 		_disp_scroll_rollover = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(Scroll_main__disp_scroll_rollover+0)
MOVT	R0, #hi_addr(Scroll_main__disp_scroll_rollover+0)
STRH	R1, [R0, #0]
;Scroll_main.c,573 :: 		first_window_column = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_first_window_column+0)
MOVT	R0, #hi_addr(_first_window_column+0)
STRH	R1, [R0, #0]
;Scroll_main.c,574 :: 		last_window_column = _SCROLL_HEIGHT;
MOVW	R1, #190
SXTH	R1, R1
MOVW	R0, #lo_addr(_last_window_column+0)
MOVT	R0, #hi_addr(_last_window_column+0)
STRH	R1, [R0, #0]
;Scroll_main.c,575 :: 		Scroll_Undone(_SCROLL_FIRST_LINE, _SCROLL_LAST_LINE);
MOVW	R1, #238
MOVW	R0, #48
BL	_Scroll_Undone+0
;Scroll_main.c,576 :: 		}
L_end_Stop_Scroll:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Stop_Scroll
_Initialize_Scroll:
;Scroll_main.c,585 :: 		void Initialize_Scroll(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Scroll_main.c,586 :: 		Stop_Scroll();
BL	_Stop_Scroll+0
;Scroll_main.c,587 :: 		FAT32_FindFirst(&MyDir);
MOVW	R0, #lo_addr(_MyDir+0)
MOVT	R0, #hi_addr(_MyDir+0)
BL	_FAT32_FindFirst+0
;Scroll_main.c,588 :: 		Total_Entries = Fill_List(File_List);
MOVW	R0, #lo_addr(_File_List+0)
MOVT	R0, #hi_addr(_File_List+0)
BL	_Fill_List+0
MOVW	R1, #lo_addr(_Total_Entries+0)
MOVT	R1, #hi_addr(_Total_Entries+0)
STRB	R0, [R1, #0]
;Scroll_main.c,589 :: 		Scroll_Fill_Area();
BL	_Scroll_Fill_Area+0
;Scroll_main.c,590 :: 		imageLine = 188;
MOVS	R1, #188
SXTH	R1, R1
MOVW	R0, #lo_addr(Scroll_main_imageLine+0)
MOVT	R0, #hi_addr(Scroll_main_imageLine+0)
STRH	R1, [R0, #0]
;Scroll_main.c,591 :: 		}
L_end_Initialize_Scroll:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Initialize_Scroll
Scroll_main____?ag:
L_end_Scroll_main___?ag:
BX	LR
; end of Scroll_main____?ag
