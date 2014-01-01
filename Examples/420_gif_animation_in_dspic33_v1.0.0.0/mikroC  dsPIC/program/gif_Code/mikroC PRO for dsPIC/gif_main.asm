
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;gif_main.c,21 :: 		void main() {
;gif_main.c,23 :: 		Start_TP();
	CALL	_Start_TP
;gif_main.c,25 :: 		while (1) {
L_main0:
;gif_main.c,28 :: 		}
	GOTO	L_main0
;gif_main.c,30 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
