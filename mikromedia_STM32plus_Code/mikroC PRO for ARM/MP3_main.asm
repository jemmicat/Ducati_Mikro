_MP3_play:
;MP3_main.c,81 :: 		void MP3_play(char *Song_Name, char File_No){
; File_No start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRB	R1, [SP, #4]
MOV	R1, R0
LDRB	R0, [SP, #4]
; File_No end address is: 4 (R1)
; Song_Name start address is: 4 (R1)
;MP3_main.c,82 :: 		current_file = File_No;
MOVW	R2, #lo_addr(_current_file+0)
MOVT	R2, #hi_addr(_current_file+0)
STRB	R0, [R2, #0]
;MP3_main.c,83 :: 		Buffer_count = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_Buffer_count+0)
MOVT	R2, #hi_addr(_Buffer_count+0)
STR	R3, [R2, #0]
;MP3_main.c,84 :: 		current_fhandle = FAT32_Open(Song_Name, FILE_READ);
STR	R1, [SP, #4]
MOV	R0, R1
MOVS	R1, #1
BL	_FAT32_Open+0
LDR	R1, [SP, #4]
MOVW	R2, #lo_addr(_current_fhandle+0)
MOVT	R2, #hi_addr(_current_fhandle+0)
STRB	R0, [R2, #0]
;MP3_main.c,85 :: 		FAT32_Size(Song_Name, &file_size);
MOV	R0, R1
MOVW	R1, #lo_addr(_file_size+0)
MOVT	R1, #hi_addr(_file_size+0)
; Song_Name end address is: 4 (R1)
BL	_FAT32_Size+0
;MP3_main.c,86 :: 		Buffer_count = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_Buffer_count+0)
MOVT	R2, #hi_addr(_Buffer_count+0)
STR	R3, [R2, #0]
;MP3_main.c,87 :: 		Total_Buffers = File_size / BUFFER_SIZE;
MOVW	R2, #lo_addr(_file_size+0)
MOVT	R2, #hi_addr(_file_size+0)
LDR	R2, [R2, #0]
LSRS	R3, R2, #8
MOVW	R2, #lo_addr(_Total_Buffers+0)
MOVT	R2, #hi_addr(_Total_Buffers+0)
STR	R3, [R2, #0]
;MP3_main.c,88 :: 		MP3_Reset_Time();
BL	_MP3_Reset_Time+0
;MP3_main.c,89 :: 		MP3_Check_Time();
BL	_MP3_Check_Time+0
;MP3_main.c,90 :: 		MP3_Set_Volume(100 - level, 100 - level);
MOVW	R2, #lo_addr(_level+0)
MOVT	R2, #hi_addr(_level+0)
LDRB	R2, [R2, #0]
RSB	R2, R2, #100
UXTB	R1, R2
UXTB	R0, R2
BL	_MP3_Set_Volume+0
;MP3_main.c,91 :: 		UpdateVolumeBar( level, 0);
MOVW	R2, #lo_addr(_level+0)
MOVT	R2, #hi_addr(_level+0)
LDRB	R2, [R2, #0]
MOVS	R1, #0
UXTB	R0, R2
BL	_UpdateVolumeBar+0
;MP3_main.c,92 :: 		MP3_Example_State = 2;
MOVS	R3, #2
MOVW	R2, #lo_addr(_MP3_Example_State+0)
MOVT	R2, #hi_addr(_MP3_Example_State+0)
STRB	R3, [R2, #0]
;MP3_main.c,93 :: 		}
L_end_MP3_play:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _MP3_play
_Start_MP3_Player:
;MP3_main.c,102 :: 		void Start_MP3_Player(char *Song_Name, char File_No){
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #4]
STRB	R1, [SP, #8]
;MP3_main.c,103 :: 		strcpy(Label28_Caption, Song_Name);
LDR	R1, [SP, #4]
MOVW	R0, #lo_addr(_Label28_Caption+0)
MOVT	R0, #hi_addr(_Label28_Caption+0)
BL	_strcpy+0
;MP3_main.c,104 :: 		DrawScreen(&MP3_Player);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
BL	_DrawScreen+0
;MP3_main.c,105 :: 		TFT_Ext_Image(204, 57, mp3_note_bmp, 1);
MOVS	R3, #1
MOVW	R2, _mp3_note_bmp
MOVT	R2, _mp3_note_bmp+2
MOVS	R1, #57
MOVS	R0, #204
BL	_TFT_Ext_Image+0
;MP3_main.c,106 :: 		pause_icon.Active = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_pause_icon+21)
MOVT	R2, #hi_addr(_pause_icon+21)
STRB	R3, [R2, #0]
;MP3_main.c,107 :: 		Play_icon.Active = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_Play_icon+21)
MOVT	R2, #hi_addr(_Play_icon+21)
STRB	R3, [R2, #0]
;MP3_main.c,108 :: 		DrawImage(&pause_icon);
MOVW	R0, #lo_addr(_pause_icon+0)
MOVT	R0, #hi_addr(_pause_icon+0)
BL	_DrawImage+0
;MP3_main.c,109 :: 		MP3_play(Song_Name, File_No);
LDRB	R1, [SP, #8]
LDR	R0, [SP, #4]
BL	_MP3_play+0
;MP3_main.c,110 :: 		}
L_end_Start_MP3_Player:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Start_MP3_Player
_StopMP3_File:
;MP3_main.c,119 :: 		void StopMP3_File(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MP3_main.c,120 :: 		FAT32_Close(current_fhandle);
MOVW	R0, #lo_addr(_current_fhandle+0)
MOVT	R0, #hi_addr(_current_fhandle+0)
LDRB	R0, [R0, #0]
BL	_FAT32_Close+0
;MP3_main.c,121 :: 		MP3_Example_State = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;MP3_main.c,122 :: 		}
L_end_StopMP3_File:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _StopMP3_File
_GetNext_mp3_File:
;MP3_main.c,131 :: 		void GetNext_mp3_File(char Next_Previous){      // 0 for previous, 1 for next
SUB	SP, SP, #12
STR	LR, [SP, #0]
;MP3_main.c,132 :: 		char temp = 0, temp1;
;MP3_main.c,131 :: 		void GetNext_mp3_File(char Next_Previous){      // 0 for previous, 1 for next
;MP3_main.c,132 :: 		char temp = 0, temp1;
;MP3_main.c,131 :: 		void GetNext_mp3_File(char Next_Previous){      // 0 for previous, 1 for next
STRB	R0, [SP, #8]
;MP3_main.c,132 :: 		char temp = 0, temp1;
MOVS	R0, #0
;MP3_main.c,133 :: 		StopMP3_File();
STRB	R0, [SP, #4]
BL	_StopMP3_File+0
LDRB	R0, [SP, #4]
;MP3_main.c,135 :: 		if (Next_Previous)
LDRB	R1, [SP, #8]
CMP	R1, #0
IT	EQ
BEQ	L_GetNext_mp3_File0
UXTB	R1, R0
;MP3_main.c,136 :: 		while (temp == 0 && temp != 2)
L_GetNext_mp3_File1:
; temp start address is: 4 (R1)
CMP	R1, #0
IT	NE
BNE	L__GetNext_mp3_File42
CMP	R1, #2
IT	EQ
BEQ	L__GetNext_mp3_File41
; temp end address is: 4 (R1)
L__GetNext_mp3_File40:
;MP3_main.c,137 :: 		temp = Get_Next_File_Name( ++current_file, MP3_song);
MOVW	R2, #lo_addr(_current_file+0)
MOVT	R2, #hi_addr(_current_file+0)
LDRSB	R1, [R2, #0]
ADDS	R1, R1, #1
STRB	R1, [R2, #0]
SXTB	R0, R1
MOVW	R1, #lo_addr(_MP3_song+0)
MOVT	R1, #hi_addr(_MP3_song+0)
BL	_Get_Next_File_Name+0
; temp start address is: 4 (R1)
UXTB	R1, R0
IT	AL
BAL	L_GetNext_mp3_File1
;MP3_main.c,136 :: 		while (temp == 0 && temp != 2)
L__GetNext_mp3_File42:
L__GetNext_mp3_File41:
;MP3_main.c,137 :: 		temp = Get_Next_File_Name( ++current_file, MP3_song);
UXTB	R0, R1
; temp end address is: 4 (R1)
IT	AL
BAL	L_GetNext_mp3_File5
L_GetNext_mp3_File0:
;MP3_main.c,139 :: 		while (temp == 0 && temp != 2)
UXTB	R1, R0
L_GetNext_mp3_File6:
; temp start address is: 4 (R1)
CMP	R1, #0
IT	NE
BNE	L__GetNext_mp3_File44
CMP	R1, #2
IT	EQ
BEQ	L__GetNext_mp3_File43
; temp end address is: 4 (R1)
L__GetNext_mp3_File39:
;MP3_main.c,140 :: 		temp = Get_Next_File_Name( --current_file, MP3_song);
MOVW	R2, #lo_addr(_current_file+0)
MOVT	R2, #hi_addr(_current_file+0)
LDRSB	R1, [R2, #0]
SUBS	R1, R1, #1
STRB	R1, [R2, #0]
SXTB	R0, R1
MOVW	R1, #lo_addr(_MP3_song+0)
MOVT	R1, #hi_addr(_MP3_song+0)
BL	_Get_Next_File_Name+0
UXTB	R1, R0
IT	AL
BAL	L_GetNext_mp3_File6
;MP3_main.c,139 :: 		while (temp == 0 && temp != 2)
L__GetNext_mp3_File44:
; temp start address is: 4 (R1)
L__GetNext_mp3_File43:
;MP3_main.c,140 :: 		temp = Get_Next_File_Name( --current_file, MP3_song);
UXTB	R0, R1
L_GetNext_mp3_File5:
; temp end address is: 4 (R1)
;MP3_main.c,141 :: 		if (temp == 1){
CMP	R0, #1
IT	NE
BNE	L_GetNext_mp3_File10
;MP3_main.c,142 :: 		MP3_play(MP3_song, current_file);
MOVW	R1, #lo_addr(_current_file+0)
MOVT	R1, #hi_addr(_current_file+0)
LDRSB	R1, [R1, #0]
MOVW	R0, #lo_addr(_MP3_song+0)
MOVT	R0, #hi_addr(_MP3_song+0)
BL	_MP3_play+0
;MP3_main.c,143 :: 		strcpy(Label28_Caption, MP3_song);
MOVW	R1, #lo_addr(_MP3_song+0)
MOVT	R1, #hi_addr(_MP3_song+0)
MOVW	R0, #lo_addr(_Label28_Caption+0)
MOVT	R0, #hi_addr(_Label28_Caption+0)
BL	_strcpy+0
;MP3_main.c,144 :: 		RedrawLabel(MP3_Player.Color, &Label28, 200, 40);
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
LDRH	R1, [R1, #0]
MOVS	R3, #40
MOVS	R2, #200
UXTH	R0, R1
MOVW	R1, #lo_addr(_Label28+0)
MOVT	R1, #hi_addr(_Label28+0)
BL	_RedrawLabel+0
;MP3_main.c,145 :: 		}
IT	AL
BAL	L_GetNext_mp3_File11
L_GetNext_mp3_File10:
;MP3_main.c,147 :: 		if (Next_Previous)
LDRB	R1, [SP, #8]
CMP	R1, #0
IT	EQ
BEQ	L_GetNext_mp3_File12
;MP3_main.c,148 :: 		current_file = 0xFF;
MOVS	R2, #255
SXTB	R2, R2
MOVW	R1, #lo_addr(_current_file+0)
MOVT	R1, #hi_addr(_current_file+0)
STRB	R2, [R1, #0]
IT	AL
BAL	L_GetNext_mp3_File13
L_GetNext_mp3_File12:
;MP3_main.c,150 :: 		current_file = Total_Entries + 1;
MOVW	R1, #lo_addr(_Total_Entries+0)
MOVT	R1, #hi_addr(_Total_Entries+0)
LDRB	R1, [R1, #0]
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(_current_file+0)
MOVT	R1, #hi_addr(_current_file+0)
STRB	R2, [R1, #0]
L_GetNext_mp3_File13:
;MP3_main.c,151 :: 		MP3_Song[0] = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_MP3_song+0)
MOVT	R1, #hi_addr(_MP3_song+0)
STRB	R2, [R1, #0]
;MP3_main.c,152 :: 		strcpy(Label28_Caption, MP3_song);
MOVW	R1, #lo_addr(_MP3_song+0)
MOVT	R1, #hi_addr(_MP3_song+0)
MOVW	R0, #lo_addr(_Label28_Caption+0)
MOVT	R0, #hi_addr(_Label28_Caption+0)
BL	_strcpy+0
;MP3_main.c,153 :: 		RedrawLabel(MP3_Player.Color, &Label28, 200, 40);
MOVW	R1, #lo_addr(_MP3_Player+0)
MOVT	R1, #hi_addr(_MP3_Player+0)
LDRH	R1, [R1, #0]
MOVS	R3, #40
MOVS	R2, #200
UXTH	R0, R1
MOVW	R1, #lo_addr(_Label28+0)
MOVT	R1, #hi_addr(_Label28+0)
BL	_RedrawLabel+0
;MP3_main.c,154 :: 		}
L_GetNext_mp3_File11:
;MP3_main.c,155 :: 		}
L_end_GetNext_mp3_File:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _GetNext_mp3_File
_MP3_Check_Time:
;MP3_main.c,165 :: 		void MP3_Check_Time(){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;MP3_main.c,168 :: 		MP3_Get_Decode_Time(&time);
ADD	R0, SP, #4
BL	_MP3_Get_Decode_Time+0
;MP3_main.c,169 :: 		mp3_mins = time / 60;
LDRH	R1, [SP, #4]
MOVS	R0, #60
UDIV	R1, R1, R0
MOVW	R0, #lo_addr(_mp3_mins+0)
MOVT	R0, #hi_addr(_mp3_mins+0)
STRB	R1, [R0, #0]
;MP3_main.c,170 :: 		mp3_secs = time % 60;
LDRH	R1, [SP, #4]
MOVS	R0, #60
UDIV	R2, R1, R0
MLS	R2, R0, R2, R1
MOVW	R0, #lo_addr(_mp3_secs+0)
MOVT	R0, #hi_addr(_mp3_secs+0)
STRB	R2, [R0, #0]
;MP3_main.c,171 :: 		if (mp3_secs != mp3_old_secs){
MOVW	R0, #lo_addr(_mp3_old_secs+0)
MOVT	R0, #hi_addr(_mp3_old_secs+0)
LDRB	R1, [R0, #0]
UXTB	R0, R2
CMP	R0, R1
IT	EQ
BEQ	L_MP3_Check_Time14
;MP3_main.c,172 :: 		Label6_Caption[0] = mp3_mins / 10 + 48;
MOVW	R2, #lo_addr(_mp3_mins+0)
MOVT	R2, #hi_addr(_mp3_mins+0)
LDRB	R1, [R2, #0]
MOVS	R0, #10
UDIV	R0, R1, R0
UXTB	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_Label6_Caption+0)
MOVT	R0, #hi_addr(_Label6_Caption+0)
STRB	R1, [R0, #0]
;MP3_main.c,173 :: 		Label6_Caption[1] = mp3_mins % 10 + 48;
MOV	R0, R2
LDRB	R2, [R0, #0]
MOVS	R1, #10
UDIV	R0, R2, R1
MLS	R0, R1, R0, R2
UXTB	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_Label6_Caption+1)
MOVT	R0, #hi_addr(_Label6_Caption+1)
STRB	R1, [R0, #0]
;MP3_main.c,174 :: 		Label6_Caption[3] = mp3_secs / 10 + 48;
MOVW	R2, #lo_addr(_mp3_secs+0)
MOVT	R2, #hi_addr(_mp3_secs+0)
STR	R2, [SP, #8]
LDRB	R1, [R2, #0]
MOVS	R0, #10
UDIV	R0, R1, R0
UXTB	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_Label6_Caption+3)
MOVT	R0, #hi_addr(_Label6_Caption+3)
STRB	R1, [R0, #0]
;MP3_main.c,175 :: 		Label6_Caption[4] = mp3_secs % 10 + 48;
MOV	R0, R2
LDRB	R2, [R0, #0]
MOVS	R1, #10
UDIV	R0, R2, R1
MLS	R0, R1, R0, R2
UXTB	R0, R0
ADDW	R1, R0, #48
MOVW	R0, #lo_addr(_Label6_Caption+4)
MOVT	R0, #hi_addr(_Label6_Caption+4)
STRB	R1, [R0, #0]
;MP3_main.c,176 :: 		RedrawLabel(MP3_player.Color, &Label6, 35, 25);
MOVW	R0, #lo_addr(_MP3_Player+0)
MOVT	R0, #hi_addr(_MP3_Player+0)
LDRH	R0, [R0, #0]
MOVS	R3, #25
MOVS	R2, #35
MOVW	R1, #lo_addr(_Label6+0)
MOVT	R1, #hi_addr(_Label6+0)
BL	_RedrawLabel+0
;MP3_main.c,177 :: 		mp3_old_mins = mp3_mins;
MOVW	R0, #lo_addr(_mp3_mins+0)
MOVT	R0, #hi_addr(_mp3_mins+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_mp3_old_mins+0)
MOVT	R0, #hi_addr(_mp3_old_mins+0)
STRB	R1, [R0, #0]
;MP3_main.c,178 :: 		mp3_old_secs = mp3_secs;
LDR	R0, [SP, #8]
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_mp3_old_secs+0)
MOVT	R0, #hi_addr(_mp3_old_secs+0)
STRB	R1, [R0, #0]
;MP3_main.c,179 :: 		}
L_MP3_Check_Time14:
;MP3_main.c,180 :: 		}
L_end_MP3_Check_Time:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _MP3_Check_Time
_UpdateProgressBar:
;MP3_main.c,190 :: 		void UpdateProgressBar(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MP3_main.c,192 :: 		progress = (Buffer_count * 250) / Total_Buffers;
MOVW	R0, #lo_addr(_Buffer_count+0)
MOVT	R0, #hi_addr(_Buffer_count+0)
LDR	R1, [R0, #0]
MOVS	R0, #250
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_Total_Buffers+0)
MOVT	R0, #hi_addr(_Total_Buffers+0)
LDR	R0, [R0, #0]
UDIV	R2, R1, R0
; progress start address is: 24 (R6)
UXTB	R6, R2
;MP3_main.c,193 :: 		if (progress != old_Progress){
MOVW	R0, #lo_addr(_old_Progress+0)
MOVT	R0, #hi_addr(_old_Progress+0)
LDRB	R1, [R0, #0]
UXTB	R0, R2
CMP	R0, R1
IT	EQ
BEQ	L_UpdateProgressBar15
;MP3_main.c,194 :: 		if ((progress > 0) && (progress < 250)){
CMP	R6, #0
IT	LS
BLS	L__UpdateProgressBar47
CMP	R6, #250
IT	CS
BCS	L__UpdateProgressBar46
L__UpdateProgressBar45:
;MP3_main.c,195 :: 		TFT_Set_Brush(1, 0x55FF, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
STRB	R6, [SP, #4]
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #22015
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDRB	R6, [SP, #4]
;MP3_main.c,196 :: 		TFT_Set_Pen(0x55FF, 0);
MOVS	R1, #0
MOVW	R0, #22015
BL	_TFT_Set_Pen+0
;MP3_main.c,197 :: 		TFT_Rectangle(ProgressBar.Left, ProgressBar.Top, ProgressBar.Left + progress, ProgressBar.Top + ProgressBar.Height);
MOVW	R0, #lo_addr(_ProgressBar+12)
MOVT	R0, #hi_addr(_ProgressBar+12)
LDRH	R2, [R0, #0]
MOVW	R1, #lo_addr(_ProgressBar+8)
MOVT	R1, #hi_addr(_ProgressBar+8)
LDRH	R0, [R1, #0]
ADDS	R4, R0, R2
MOVW	R3, #lo_addr(_ProgressBar+6)
MOVT	R3, #hi_addr(_ProgressBar+6)
LDRH	R0, [R3, #0]
ADDS	R2, R0, R6
MOV	R0, R1
LDRH	R1, [R0, #0]
MOV	R0, R3
LDRH	R0, [R0, #0]
STRB	R6, [SP, #4]
SXTH	R3, R4
SXTH	R2, R2
BL	_TFT_Rectangle+0
;MP3_main.c,199 :: 		TFT_Set_Brush(1, ProgressBar.Color, 0, 0, 0, 0);
MOVS	R2, #0
MOVS	R1, #0
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
MOVS	R2, #0
UXTH	R1, R0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDRB	R6, [SP, #4]
;MP3_main.c,200 :: 		TFT_Set_Pen(ProgressBar.Color, 0);
MOVW	R0, #lo_addr(_ProgressBar+28)
MOVT	R0, #hi_addr(_ProgressBar+28)
LDRH	R0, [R0, #0]
MOVS	R1, #0
BL	_TFT_Set_Pen+0
;MP3_main.c,201 :: 		TFT_Rectangle(ProgressBar.Left + progress + 1, ProgressBar.Top, ProgressBar.Left + ProgressBar.Width, ProgressBar.Top + ProgressBar.Height);
MOVW	R0, #lo_addr(_ProgressBar+12)
MOVT	R0, #hi_addr(_ProgressBar+12)
LDRH	R1, [R0, #0]
MOVW	R5, #lo_addr(_ProgressBar+8)
MOVT	R5, #hi_addr(_ProgressBar+8)
LDRH	R0, [R5, #0]
ADDS	R4, R0, R1
MOVW	R0, #lo_addr(_ProgressBar+10)
MOVT	R0, #hi_addr(_ProgressBar+10)
LDRH	R1, [R0, #0]
MOVW	R3, #lo_addr(_ProgressBar+6)
MOVT	R3, #hi_addr(_ProgressBar+6)
LDRH	R0, [R3, #0]
ADDS	R2, R0, R1
MOV	R0, R5
LDRH	R1, [R0, #0]
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, R6
UXTH	R0, R0
ADDS	R0, R0, #1
STRB	R6, [SP, #4]
SXTH	R3, R4
SXTH	R2, R2
SXTH	R0, R0
BL	_TFT_Rectangle+0
LDRB	R6, [SP, #4]
;MP3_main.c,203 :: 		old_progress = progress;
MOVW	R0, #lo_addr(_old_Progress+0)
MOVT	R0, #hi_addr(_old_Progress+0)
STRB	R6, [R0, #0]
; progress end address is: 24 (R6)
;MP3_main.c,194 :: 		if ((progress > 0) && (progress < 250)){
L__UpdateProgressBar47:
L__UpdateProgressBar46:
;MP3_main.c,205 :: 		}
L_UpdateProgressBar15:
;MP3_main.c,206 :: 		}
L_end_UpdateProgressBar:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _UpdateProgressBar
_doMP3:
;MP3_main.c,215 :: 		void doMP3(){
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MP3_main.c,217 :: 		switch (MP3_Example_State){
IT	AL
BAL	L_doMP319
;MP3_main.c,218 :: 		case 0 : { // mp3 example started
L_doMP321:
;MP3_main.c,219 :: 		if (MMC_Card_Detect == 0){        // if SD card detected
MOVW	R1, #lo_addr(MMC_Card_Detect+0)
MOVT	R1, #hi_addr(MMC_Card_Detect+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_doMP322
;MP3_main.c,220 :: 		DrawScreen(&MP3_SongList);
MOVW	R0, #lo_addr(_MP3_SongList+0)
MOVT	R0, #hi_addr(_MP3_SongList+0)
BL	_DrawScreen+0
;MP3_main.c,221 :: 		Delay_ms(100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_doMP323:
SUBS	R7, R7, #1
BNE	L_doMP323
NOP
NOP
NOP
;MP3_main.c,222 :: 		Mp3_Init();
BL	_Mp3_Init+0
;MP3_main.c,223 :: 		MP3_Example_State = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;MP3_main.c,224 :: 		}
IT	AL
BAL	L_doMP325
L_doMP322:
;MP3_main.c,226 :: 		DrawImage(Images[MP3_Example_cnt / 200]);
MOVW	R0, #lo_addr(_MP3_Example_cnt+0)
MOVT	R0, #hi_addr(_MP3_Example_cnt+0)
LDRSH	R1, [R0, #0]
MOVS	R0, #200
SXTH	R0, R0
SDIV	R0, R1, R0
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_Images+0)
MOVT	R0, #hi_addr(_Images+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
BL	_DrawImage+0
;MP3_main.c,227 :: 		MP3_Example_cnt++;
MOVW	R2, #lo_addr(_MP3_Example_cnt+0)
MOVT	R2, #hi_addr(_MP3_Example_cnt+0)
LDRSH	R0, [R2, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;MP3_main.c,228 :: 		if (MP3_Example_cnt > 599)
MOVW	R0, #599
CMP	R1, R0
IT	LE
BLE	L_doMP326
;MP3_main.c,229 :: 		MP3_Example_cnt = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_MP3_Example_cnt+0)
MOVT	R0, #hi_addr(_MP3_Example_cnt+0)
STRH	R1, [R0, #0]
L_doMP326:
;MP3_main.c,230 :: 		}
L_doMP325:
;MP3_main.c,231 :: 		}; break;
IT	AL
BAL	L_doMP320
;MP3_main.c,232 :: 		case 1 : { // stop playing
L_doMP327:
;MP3_main.c,233 :: 		}; break;                           // if mp3 is stopped, do nothing
IT	AL
BAL	L_doMP320
;MP3_main.c,234 :: 		case 2 : { // play song
L_doMP328:
;MP3_main.c,235 :: 		if (file_size > BUFFER_SIZE){     // while there is still data, send it to mp3 codec chip
MOVW	R0, #lo_addr(_file_size+0)
MOVT	R0, #hi_addr(_file_size+0)
LDR	R0, [R0, #0]
CMP	R0, #256
IT	LS
BLS	L_doMP329
;MP3_main.c,236 :: 		Fat32_Read(current_fhandle, mp3_buffer, BUFFER_SIZE);
MOVW	R0, #lo_addr(_current_fhandle+0)
MOVT	R0, #hi_addr(_current_fhandle+0)
LDRB	R0, [R0, #0]
MOVW	R2, #256
MOVW	R1, #lo_addr(_mp3_buffer+0)
MOVT	R1, #hi_addr(_mp3_buffer+0)
BL	_FAT32_Read+0
;MP3_main.c,237 :: 		for (i=0; i<BUFFER_SIZE/BYTES_2_WRITE; i++) {
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_doMP330:
; i start address is: 8 (R2)
CMP	R2, #8
IT	CS
BCS	L_doMP331
;MP3_main.c,238 :: 		MP3_SDI_Write_32(mp3_buffer + i*BYTES_2_WRITE);
LSLS	R1, R2, #5
MOVW	R0, #lo_addr(_mp3_buffer+0)
MOVT	R0, #hi_addr(_mp3_buffer+0)
ADDS	R0, R0, R1
STR	R2, [SP, #4]
BL	_MP3_SDI_Write_32+0
LDR	R2, [SP, #4]
;MP3_main.c,237 :: 		for (i=0; i<BUFFER_SIZE/BYTES_2_WRITE; i++) {
ADDS	R2, R2, #1
;MP3_main.c,239 :: 		}
; i end address is: 8 (R2)
IT	AL
BAL	L_doMP330
L_doMP331:
;MP3_main.c,240 :: 		file_size -= BUFFER_SIZE;
MOVW	R1, #lo_addr(_file_size+0)
MOVT	R1, #hi_addr(_file_size+0)
LDR	R0, [R1, #0]
SUB	R0, R0, #256
STR	R0, [R1, #0]
;MP3_main.c,241 :: 		Buffer_count ++;
MOVW	R1, #lo_addr(_Buffer_count+0)
MOVT	R1, #hi_addr(_Buffer_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;MP3_main.c,242 :: 		}
L_doMP329:
;MP3_main.c,243 :: 		UpdateProgressBar();              // update progress bar
BL	_UpdateProgressBar+0
;MP3_main.c,244 :: 		MP3_Check_Time();                 // update elapsed time
BL	_MP3_Check_Time+0
;MP3_main.c,245 :: 		if (file_size < BUFFER_SIZE){     // finish playing file
MOVW	R0, #lo_addr(_file_size+0)
MOVT	R0, #hi_addr(_file_size+0)
LDR	R0, [R0, #0]
CMP	R0, #256
IT	CS
BCS	L_doMP333
;MP3_main.c,246 :: 		Fat32_Read(current_fhandle, mp3_buffer, file_size);
MOVW	R0, #lo_addr(_file_size+0)
MOVT	R0, #hi_addr(_file_size+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_current_fhandle+0)
MOVT	R0, #hi_addr(_current_fhandle+0)
LDRB	R0, [R0, #0]
UXTH	R2, R1
MOVW	R1, #lo_addr(_mp3_buffer+0)
MOVT	R1, #hi_addr(_mp3_buffer+0)
BL	_FAT32_Read+0
;MP3_main.c,247 :: 		for (i=0; i<file_size; i++){
; i start address is: 4 (R1)
MOVS	R1, #0
; i end address is: 4 (R1)
L_doMP334:
; i start address is: 4 (R1)
MOVW	R0, #lo_addr(_file_size+0)
MOVT	R0, #hi_addr(_file_size+0)
LDR	R0, [R0, #0]
CMP	R1, R0
IT	CS
BCS	L_doMP335
;MP3_main.c,248 :: 		MP3_SDI_Write(mp3_buffer[i]);
MOVW	R0, #lo_addr(_mp3_buffer+0)
MOVT	R0, #hi_addr(_mp3_buffer+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
STR	R1, [SP, #4]
BL	_MP3_SDI_Write+0
LDR	R1, [SP, #4]
;MP3_main.c,247 :: 		for (i=0; i<file_size; i++){
ADDS	R1, R1, #1
;MP3_main.c,249 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_doMP334
L_doMP335:
;MP3_main.c,250 :: 		MP3_Example_State = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;MP3_main.c,251 :: 		Buffer_count ++;
MOVW	R1, #lo_addr(_Buffer_count+0)
MOVT	R1, #hi_addr(_Buffer_count+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;MP3_main.c,252 :: 		UpdateProgressBar();
BL	_UpdateProgressBar+0
;MP3_main.c,253 :: 		}
L_doMP333:
;MP3_main.c,255 :: 		}; break;
IT	AL
BAL	L_doMP320
;MP3_main.c,256 :: 		case 3 : { // pause playing
L_doMP337:
;MP3_main.c,257 :: 		}; break;
IT	AL
BAL	L_doMP320
;MP3_main.c,259 :: 		}
L_doMP319:
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_doMP321
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_doMP327
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_doMP328
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_doMP337
L_doMP320:
;MP3_main.c,260 :: 		}
L_end_doMP3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _doMP3
_Mp3_Init:
;MP3_main.c,269 :: 		void Mp3_Init(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MP3_main.c,271 :: 		Init_FAT();
BL	_Init_FAT+0
;MP3_main.c,272 :: 		if (MMC_Card_Detect == 1){
MOVW	R1, #lo_addr(MMC_Card_Detect+0)
MOVT	R1, #hi_addr(MMC_Card_Detect+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Mp3_Init38
;MP3_main.c,273 :: 		DrawScreen(&MP3_SD);
MOVW	R0, #lo_addr(_MP3_SD+0)
MOVT	R0, #hi_addr(_MP3_SD+0)
BL	_DrawScreen+0
;MP3_main.c,274 :: 		MP3_Example_State = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;MP3_main.c,275 :: 		return;
IT	AL
BAL	L_end_Mp3_Init
;MP3_main.c,276 :: 		}
L_Mp3_Init38:
;MP3_main.c,277 :: 		MP3_Example_State = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_MP3_Example_State+0)
MOVT	R0, #hi_addr(_MP3_Example_State+0)
STRB	R1, [R0, #0]
;MP3_main.c,278 :: 		Initialize_Scroll();
BL	_Initialize_Scroll+0
;MP3_main.c,279 :: 		MP3_Start();
BL	_MP3_Start+0
;MP3_main.c,280 :: 		}
L_end_Mp3_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Mp3_Init
_MP3_Start:
;MP3_main.c,289 :: 		void MP3_Start() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MP3_main.c,292 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_8 | _GPIO_PINMASK_10 | _GPIO_PINMASK_11, _GPIO_CFG_DIGITAL_OUTPUT);
MOVW	R2, #20
MOVT	R2, #8
MOVW	R1, #3328
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;MP3_main.c,294 :: 		GPIO_Config(&GPIOD_BASE, _GPIO_PINMASK_9, _GPIO_CFG_DIGITAL_INPUT);
MOV	R2, #66
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Config+0
;MP3_main.c,296 :: 		MP3_CS            = 1;               // Deselect MP3_CS
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(MP3_CS+0)
MOVT	R0, #hi_addr(MP3_CS+0)
STR	R2, [R0, #0]
;MP3_main.c,297 :: 		MP3_RST           = 1;               // Set MP3_RST pin
MOVW	R0, #lo_addr(MP3_RST+0)
MOVT	R0, #hi_addr(MP3_RST+0)
STR	R2, [R0, #0]
;MP3_main.c,298 :: 		BSYNC             = 0;               // Clear BSYNC
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(BSYNC+0)
MOVT	R0, #hi_addr(BSYNC+0)
STR	R1, [R0, #0]
;MP3_main.c,299 :: 		BSYNC             = 1;               // Clear BSYNC
STR	R2, [R0, #0]
;MP3_main.c,305 :: 		&_GPIO_MODULE_SPI2_PB13_14_15);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI2_PB13_14_15+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI2_PB13_14_15+0)
;MP3_main.c,304 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;MP3_main.c,302 :: 		SPI2_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #5
;MP3_main.c,305 :: 		&_GPIO_MODULE_SPI2_PB13_14_15);
BL	_SPI2_Init_Advanced+0
;MP3_main.c,307 :: 		MP3_Set_default_Mode();
BL	_MP3_Set_default_Mode+0
;MP3_main.c,313 :: 		&_GPIO_MODULE_SPI2_PB13_14_15);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI2_PB13_14_15+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI2_PB13_14_15+0)
;MP3_main.c,312 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;MP3_main.c,310 :: 		SPI2_Init_Advanced(_SPI_FPCLK_DIV4, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #1
;MP3_main.c,313 :: 		&_GPIO_MODULE_SPI2_PB13_14_15);
BL	_SPI2_Init_Advanced+0
;MP3_main.c,315 :: 		MP3_Set_Volume(100 - level, 100 - level);
MOVW	R0, #lo_addr(_level+0)
MOVT	R0, #hi_addr(_level+0)
LDRB	R0, [R0, #0]
RSB	R0, R0, #100
UXTB	R1, R0
UXTB	R0, R0
BL	_MP3_Set_Volume+0
;MP3_main.c,316 :: 		MP3_Reset_Time();
BL	_MP3_Reset_Time+0
;MP3_main.c,317 :: 		}
L_end_MP3_Start:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MP3_Start
MP3_main____?ag:
L_end_MP3_main___?ag:
BX	LR
; end of MP3_main____?ag
