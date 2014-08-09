_Net_Ethernet_Intern_UserTCP:
;Ethernet_main.c,43 :: 		void Net_Ethernet_Intern_UserTCP(SOCKET_Intern_Dsc *socket) {
; socket start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; socket end address is: 0 (R0)
; socket start address is: 0 (R0)
;Ethernet_main.c,47 :: 		if( (memcmp(socket->remoteIP,IpServer,4) != 0) )
MOVS	R2, #4
SXTH	R2, R2
MOVW	R1, #lo_addr(Ethernet_main_IpServer+0)
MOVT	R1, #hi_addr(Ethernet_main_IpServer+0)
; socket end address is: 0 (R0)
BL	_memcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_Net_Ethernet_Intern_UserTCP0
;Ethernet_main.c,48 :: 		return;
IT	AL
BAL	L_end_Net_Ethernet_Intern_UserTCP
L_Net_Ethernet_Intern_UserTCP0:
;Ethernet_main.c,51 :: 		for (i = 0; i < 4; i ++)
; i start address is: 12 (R3)
MOVS	R3, #0
; i end address is: 12 (R3)
L_Net_Ethernet_Intern_UserTCP1:
; i start address is: 12 (R3)
CMP	R3, #4
IT	CS
BCS	L_Net_Ethernet_Intern_UserTCP2
;Ethernet_main.c,52 :: 		buff[i] = Net_Ethernet_Intern_getByte();
MOVW	R1, #lo_addr(Ethernet_main_buff+0)
MOVT	R1, #hi_addr(Ethernet_main_buff+0)
ADDS	R1, R1, R3
STR	R1, [SP, #4]
BL	_Net_Ethernet_Intern_getByte+0
LDR	R1, [SP, #4]
STRB	R0, [R1, #0]
;Ethernet_main.c,51 :: 		for (i = 0; i < 4; i ++)
ADDS	R3, R3, #1
UXTB	R3, R3
;Ethernet_main.c,52 :: 		buff[i] = Net_Ethernet_Intern_getByte();
; i end address is: 12 (R3)
IT	AL
BAL	L_Net_Ethernet_Intern_UserTCP1
L_Net_Ethernet_Intern_UserTCP2:
;Ethernet_main.c,55 :: 		Highest(epoch) = buff[0];
MOVW	R1, #lo_addr(Ethernet_main_buff+0)
MOVT	R1, #hi_addr(Ethernet_main_buff+0)
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(Ethernet_main_epoch+3)
MOVT	R1, #hi_addr(Ethernet_main_epoch+3)
STRB	R2, [R1, #0]
;Ethernet_main.c,56 :: 		Higher(epoch)  = buff[1];
MOVW	R1, #lo_addr(Ethernet_main_buff+1)
MOVT	R1, #hi_addr(Ethernet_main_buff+1)
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(Ethernet_main_epoch+2)
MOVT	R1, #hi_addr(Ethernet_main_epoch+2)
STRB	R2, [R1, #0]
;Ethernet_main.c,57 :: 		Hi(epoch) = buff[2];
MOVW	R1, #lo_addr(Ethernet_main_buff+2)
MOVT	R1, #hi_addr(Ethernet_main_buff+2)
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(Ethernet_main_epoch+1)
MOVT	R1, #hi_addr(Ethernet_main_epoch+1)
STRB	R2, [R1, #0]
;Ethernet_main.c,58 :: 		Lo(epoch) = buff[3];
MOVW	R1, #lo_addr(Ethernet_main_buff+3)
MOVT	R1, #hi_addr(Ethernet_main_buff+3)
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(Ethernet_main_epoch+0)
MOVT	R1, #hi_addr(Ethernet_main_epoch+0)
STRB	R2, [R1, #0]
;Ethernet_main.c,60 :: 		epoch = epoch - 2208902400;          // convert from seconds passed from 1.1.1900 to UNIOX time
MOVW	R3, #lo_addr(Ethernet_main_epoch+0)
MOVT	R3, #hi_addr(Ethernet_main_epoch+0)
LDR	R2, [R3, #0]
MOVW	R1, #11520
MOVT	R1, #33705
SUB	R1, R2, R1
STR	R1, [R3, #0]
;Ethernet_main.c,61 :: 		Time_epochToDate(epoch, &my_time);
MOV	R1, R1
MOV	R0, R1
MOVW	R1, #lo_addr(_my_time+0)
MOVT	R1, #hi_addr(_my_time+0)
BL	_Time_epochToDate+0
;Ethernet_main.c,62 :: 		acquaringComplete_mark = SUCCESS;
MOVS	R2, #0
MOVW	R1, #lo_addr(Ethernet_main_acquaringComplete_mark+0)
MOVT	R1, #hi_addr(Ethernet_main_acquaringComplete_mark+0)
STRB	R2, [R1, #0]
;Ethernet_main.c,63 :: 		Time_Obtained = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(_Time_Obtained+0)
MOVT	R1, #hi_addr(_Time_Obtained+0)
STRB	R2, [R1, #0]
;Ethernet_main.c,64 :: 		}
L_end_Net_Ethernet_Intern_UserTCP:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Net_Ethernet_Intern_UserTCP
_Net_Ethernet_Intern_UserUDP:
;Ethernet_main.c,73 :: 		unsigned int    Net_Ethernet_Intern_UserUDP(UDP_Intern_Dsc *udpDsc) {
SUB	SP, SP, #4
;Ethernet_main.c,74 :: 		return 0;
MOVS	R0, #0
;Ethernet_main.c,75 :: 		}
L_end_Net_Ethernet_Intern_UserUDP:
ADD	SP, SP, #4
BX	LR
; end of _Net_Ethernet_Intern_UserUDP
_Ethernet_Message:
;Ethernet_main.c,84 :: 		void Ethernet_Message(char *text){
; text start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; text end address is: 0 (R0)
; text start address is: 0 (R0)
;Ethernet_main.c,85 :: 		strcpy(Label42_Caption, text);
MOV	R1, R0
; text end address is: 0 (R0)
MOVW	R0, #lo_addr(_Label42_Caption+0)
MOVT	R0, #hi_addr(_Label42_Caption+0)
BL	_strcpy+0
;Ethernet_main.c,86 :: 		RedrawLabel(Clock.Color, &Label42, 180, 20);
MOVW	R1, #lo_addr(_Clock+0)
MOVT	R1, #hi_addr(_Clock+0)
LDRH	R1, [R1, #0]
MOVS	R3, #20
MOVS	R2, #180
UXTH	R0, R1
MOVW	R1, #lo_addr(_Label42+0)
MOVT	R1, #hi_addr(_Label42+0)
BL	_RedrawLabel+0
;Ethernet_main.c,87 :: 		}
L_end_Ethernet_Message:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Ethernet_Message
Ethernet_main_Ethernet_Init:
;Ethernet_main.c,96 :: 		static char Ethernet_Init() {
;Ethernet_main.c,97 :: 		char result = SUCCESS;
; result start address is: 0 (R0)
MOVS	R0, #0
;Ethernet_main.c,117 :: 		return result;
; result end address is: 0 (R0)
;Ethernet_main.c,119 :: 		}
L_end_Ethernet_Init:
BX	LR
; end of Ethernet_main_Ethernet_Init
Ethernet_main_Ethernet_ReachTime:
;Ethernet_main.c,172 :: 		static void Ethernet_ReachTime() {
SUB	SP, SP, #16
STR	LR, [SP, #0]
;Ethernet_main.c,177 :: 		for(i = 0; i < 5; i++) {
MOVS	R0, #0
STRB	R0, [SP, #13]
L_Ethernet_main_Ethernet_ReachTime4:
LDRB	R0, [SP, #13]
CMP	R0, #5
IT	CS
BCS	L_Ethernet_main_Ethernet_ReachTime5
;Ethernet_main.c,179 :: 		timeout = Net_Ethernet_Intern_UserTimerSec + 5;
MOVW	R0, #lo_addr(_Net_Ethernet_Intern_userTimerSec+0)
MOVT	R0, #hi_addr(_Net_Ethernet_Intern_userTimerSec+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, #5
STR	R0, [SP, #8]
;Ethernet_main.c,180 :: 		acquaringComplete_mark = NOT_SUCCESS;
MOVS	R1, #1
MOVW	R0, #lo_addr(Ethernet_main_acquaringComplete_mark+0)
MOVT	R0, #hi_addr(Ethernet_main_acquaringComplete_mark+0)
STRB	R1, [R0, #0]
;Ethernet_main.c,181 :: 		synReqSend_mark = NOT_SUCCESS;
MOVS	R1, #1
MOVW	R0, #lo_addr(Ethernet_main_synReqSend_mark+0)
MOVT	R0, #hi_addr(Ethernet_main_synReqSend_mark+0)
STRB	R1, [R0, #0]
;Ethernet_main.c,182 :: 		connectedDetect_mark = 0;
MOVS	R0, #0
STRB	R0, [SP, #12]
;Ethernet_main.c,184 :: 		while((Net_Ethernet_Intern_UserTimerSec < timeout) && (acquaringComplete_mark == NOT_SUCCESS)){
L_Ethernet_main_Ethernet_ReachTime7:
LDR	R1, [SP, #8]
MOVW	R0, #lo_addr(_Net_Ethernet_Intern_userTimerSec+0)
MOVT	R0, #hi_addr(_Net_Ethernet_Intern_userTimerSec+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Ethernet_main_Ethernet_ReachTime30
MOVW	R0, #lo_addr(Ethernet_main_acquaringComplete_mark+0)
MOVT	R0, #hi_addr(Ethernet_main_acquaringComplete_mark+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Ethernet_main_Ethernet_ReachTime29
L_Ethernet_main_Ethernet_ReachTime26:
;Ethernet_main.c,186 :: 		Net_Ethernet_Intern_doPacket();
BL	_Net_Ethernet_Intern_doPacket+0
;Ethernet_main.c,188 :: 		if (synReqSend_mark == NOT_SUCCESS) {
MOVW	R0, #lo_addr(Ethernet_main_synReqSend_mark+0)
MOVT	R0, #hi_addr(Ethernet_main_synReqSend_mark+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Ethernet_main_Ethernet_ReachTime11
;Ethernet_main.c,189 :: 		Ethernet_Message("Connecting to Time Server");
MOVW	R0, #lo_addr(?lstr1_Ethernet_main+0)
MOVT	R0, #hi_addr(?lstr1_Ethernet_main+0)
BL	_Ethernet_Message+0
;Ethernet_main.c,190 :: 		myPort++;
MOVW	R1, #lo_addr(Ethernet_main_myPort+0)
MOVT	R1, #hi_addr(Ethernet_main_myPort+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Ethernet_main.c,192 :: 		synReqSend_mark = Net_Ethernet_Intern_connectTCP(IpServer, 37, myPort, &socketServer) ? SUCCESS : NOT_SUCCESS;
MOVW	R3, #lo_addr(Ethernet_main_socketServer+0)
MOVT	R3, #hi_addr(Ethernet_main_socketServer+0)
UXTH	R2, R0
MOVS	R1, #37
MOVW	R0, #lo_addr(Ethernet_main_IpServer+0)
MOVT	R0, #hi_addr(Ethernet_main_IpServer+0)
BL	_Net_Ethernet_Intern_connectTCP+0
CMP	R0, #0
IT	EQ
BEQ	L_Ethernet_main_Ethernet_ReachTime12
MOVW	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #4]
IT	AL
BAL	L_Ethernet_main_Ethernet_ReachTime13
L_Ethernet_main_Ethernet_ReachTime12:
MOVW	R0, #1
SXTH	R0, R0
STRH	R0, [SP, #4]
L_Ethernet_main_Ethernet_ReachTime13:
LDRSH	R1, [SP, #4]
MOVW	R0, #lo_addr(Ethernet_main_synReqSend_mark+0)
MOVT	R0, #hi_addr(Ethernet_main_synReqSend_mark+0)
STRB	R1, [R0, #0]
;Ethernet_main.c,194 :: 		if (synReqSend_mark != SUCCESS){
LDRB	R0, [SP, #4]
CMP	R0, #0
IT	EQ
BEQ	L_Ethernet_main_Ethernet_ReachTime14
;Ethernet_main.c,195 :: 		break;
IT	AL
BAL	L_Ethernet_main_Ethernet_ReachTime8
;Ethernet_main.c,196 :: 		}
L_Ethernet_main_Ethernet_ReachTime14:
;Ethernet_main.c,197 :: 		}
L_Ethernet_main_Ethernet_ReachTime11:
;Ethernet_main.c,199 :: 		if ((socketServer->state == 3)&&(connectedDetect_mark == 0)) {
MOVW	R0, #lo_addr(Ethernet_main_socketServer+0)
MOVT	R0, #hi_addr(Ethernet_main_socketServer+0)
LDR	R0, [R0, #0]
ADDS	R0, #39
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_Ethernet_main_Ethernet_ReachTime28
LDRB	R0, [SP, #12]
CMP	R0, #0
IT	NE
BNE	L_Ethernet_main_Ethernet_ReachTime27
L_Ethernet_main_Ethernet_ReachTime25:
;Ethernet_main.c,200 :: 		connectedDetect_mark = 1;
MOVS	R0, #1
STRB	R0, [SP, #12]
;Ethernet_main.c,201 :: 		Ethernet_Message("Connected");
MOVW	R0, #lo_addr(?lstr2_Ethernet_main+0)
MOVT	R0, #hi_addr(?lstr2_Ethernet_main+0)
BL	_Ethernet_Message+0
;Ethernet_main.c,199 :: 		if ((socketServer->state == 3)&&(connectedDetect_mark == 0)) {
L_Ethernet_main_Ethernet_ReachTime28:
L_Ethernet_main_Ethernet_ReachTime27:
;Ethernet_main.c,203 :: 		}
IT	AL
BAL	L_Ethernet_main_Ethernet_ReachTime7
L_Ethernet_main_Ethernet_ReachTime8:
;Ethernet_main.c,184 :: 		while((Net_Ethernet_Intern_UserTimerSec < timeout) && (acquaringComplete_mark == NOT_SUCCESS)){
L_Ethernet_main_Ethernet_ReachTime30:
L_Ethernet_main_Ethernet_ReachTime29:
;Ethernet_main.c,205 :: 		if(acquaringComplete_mark == SUCCESS) {
MOVW	R0, #lo_addr(Ethernet_main_acquaringComplete_mark+0)
MOVT	R0, #hi_addr(Ethernet_main_acquaringComplete_mark+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Ethernet_main_Ethernet_ReachTime18
;Ethernet_main.c,206 :: 		break;
IT	AL
BAL	L_Ethernet_main_Ethernet_ReachTime5
;Ethernet_main.c,207 :: 		}
L_Ethernet_main_Ethernet_ReachTime18:
;Ethernet_main.c,177 :: 		for(i = 0; i < 5; i++) {
LDRB	R0, [SP, #13]
ADDS	R0, R0, #1
STRB	R0, [SP, #13]
;Ethernet_main.c,208 :: 		}
IT	AL
BAL	L_Ethernet_main_Ethernet_ReachTime4
L_Ethernet_main_Ethernet_ReachTime5:
;Ethernet_main.c,210 :: 		if(acquaringComplete_mark == SUCCESS) {
MOVW	R0, #lo_addr(Ethernet_main_acquaringComplete_mark+0)
MOVT	R0, #hi_addr(Ethernet_main_acquaringComplete_mark+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Ethernet_main_Ethernet_ReachTime19
;Ethernet_main.c,211 :: 		Ethernet_Message("Acquaring GMT Time Success");
MOVW	R0, #lo_addr(?lstr3_Ethernet_main+0)
MOVT	R0, #hi_addr(?lstr3_Ethernet_main+0)
BL	_Ethernet_Message+0
;Ethernet_main.c,212 :: 		}
IT	AL
BAL	L_Ethernet_main_Ethernet_ReachTime20
L_Ethernet_main_Ethernet_ReachTime19:
;Ethernet_main.c,213 :: 		else if (socketServer->state == 3) {
MOVW	R0, #lo_addr(Ethernet_main_socketServer+0)
MOVT	R0, #hi_addr(Ethernet_main_socketServer+0)
LDR	R0, [R0, #0]
ADDS	R0, #39
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_Ethernet_main_Ethernet_ReachTime21
;Ethernet_main.c,214 :: 		Ethernet_Message("Failed to Acquire GMT Time");
MOVW	R0, #lo_addr(?lstr4_Ethernet_main+0)
MOVT	R0, #hi_addr(?lstr4_Ethernet_main+0)
BL	_Ethernet_Message+0
;Ethernet_main.c,215 :: 		}
IT	AL
BAL	L_Ethernet_main_Ethernet_ReachTime22
L_Ethernet_main_Ethernet_ReachTime21:
;Ethernet_main.c,217 :: 		Ethernet_Message("Failed to Connect to server");
MOVW	R0, #lo_addr(?lstr5_Ethernet_main+0)
MOVT	R0, #hi_addr(?lstr5_Ethernet_main+0)
BL	_Ethernet_Message+0
;Ethernet_main.c,218 :: 		}
L_Ethernet_main_Ethernet_ReachTime22:
L_Ethernet_main_Ethernet_ReachTime20:
;Ethernet_main.c,220 :: 		Delay_ms(2000);
MOVW	R7, #57598
MOVT	R7, #1525
NOP
NOP
L_Ethernet_main_Ethernet_ReachTime23:
SUBS	R7, R7, #1
BNE	L_Ethernet_main_Ethernet_ReachTime23
NOP
NOP
NOP
;Ethernet_main.c,221 :: 		Ethernet_Message("");
MOVW	R0, #lo_addr(?lstr6_Ethernet_main+0)
MOVT	R0, #hi_addr(?lstr6_Ethernet_main+0)
BL	_Ethernet_Message+0
;Ethernet_main.c,222 :: 		Net_Ethernet_Intern_disconnectTCP(socketServer);
MOVW	R0, #lo_addr(Ethernet_main_socketServer+0)
MOVT	R0, #hi_addr(Ethernet_main_socketServer+0)
LDR	R0, [R0, #0]
BL	_Net_Ethernet_Intern_disconnectTCP+0
;Ethernet_main.c,223 :: 		}
L_end_Ethernet_ReachTime:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of Ethernet_main_Ethernet_ReachTime
_Start_Ethernet:
;Ethernet_main.c,232 :: 		void Start_Ethernet(){
;Ethernet_main.c,244 :: 		}
L_end_Start_Ethernet:
BX	LR
; end of _Start_Ethernet
