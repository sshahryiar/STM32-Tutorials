_main:
;GPIO.c,4 :: 		void main()
;GPIO.c,6 :: 		unsigned int dly = 600;
;GPIO.c,8 :: 		setup();                              //set registers and chip peripherals
BL	_setup+0
;GPIO.c,10 :: 		while(1)
L_main0:
;GPIO.c,12 :: 		if(GPIOA_IDRbits.IDR0)                          //Button not pressed
MOVW	R1, #lo_addr(GPIOA_IDRbits+0)
MOVT	R1, #hi_addr(GPIOA_IDRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main2
;GPIO.c,14 :: 		dly = 200;
; dly start address is: 12 (R3)
MOVS	R3, #200
;GPIO.c,15 :: 		}
; dly end address is: 12 (R3)
IT	AL
BAL	L_main3
L_main2:
;GPIO.c,18 :: 		dly = 600;
; dly start address is: 12 (R3)
MOVW	R3, #600
; dly end address is: 12 (R3)
;GPIO.c,19 :: 		}
L_main3:
;GPIO.c,21 :: 		GPIOB_BSRRbits.BS15 = 1;                 //Turn on LED
; dly start address is: 12 (R3)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_BSRRbits+0)
MOVT	R0, #hi_addr(GPIOB_BSRRbits+0)
STR	R1, [R0, #0]
;GPIO.c,22 :: 		Vdelay_ms(dly);                          //Wait for some time
UXTH	R0, R3
BL	_VDelay_ms+0
;GPIO.c,23 :: 		GPIOB_BRRbits.BR15 = 1;                  //Turn off LED
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_BRRbits+0)
MOVT	R0, #hi_addr(GPIOB_BRRbits+0)
STR	R1, [R0, #0]
;GPIO.c,24 :: 		Vdelay_ms(dly);                          //Wait for some time
UXTH	R0, R3
; dly end address is: 12 (R3)
BL	_VDelay_ms+0
;GPIO.c,25 :: 		};
IT	AL
BAL	L_main0
;GPIO.c,27 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;GPIO.c,30 :: 		void setup()
;GPIO.c,34 :: 		RCC_APB2ENRbits.IOPAEN = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R3, [R0, #0]
;GPIO.c,35 :: 		RCC_APB2ENRbits.IOPBEN = 1;
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R3, [R0, #0]
;GPIO.c,40 :: 		GPIOA_CRL = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;GPIO.c,41 :: 		GPIOA_CRH = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;GPIO.c,42 :: 		GPIOB_CRL = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
;GPIO.c,43 :: 		GPIOB_CRH = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;GPIO.c,44 :: 		GPIOC_CRL = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;GPIO.c,45 :: 		GPIOC_CRH = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;GPIO.c,46 :: 		GPIOD_CRL = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOD_CRL+0)
MOVT	R0, #hi_addr(GPIOD_CRL+0)
STR	R1, [R0, #0]
;GPIO.c,47 :: 		GPIOD_CRH = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;GPIO.c,51 :: 		GPIOA_CRLbits.MODE0 = 0x0;
MOVS	R2, #0
MOVW	R1, #lo_addr(GPIOA_CRLbits+0)
MOVT	R1, #hi_addr(GPIOA_CRLbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #0, #2
STRB	R0, [R1, #0]
;GPIO.c,52 :: 		GPIOA_CRLbits.CNF0 = 0x2;
MOVS	R2, #2
MOVW	R1, #lo_addr(GPIOA_CRLbits+0)
MOVT	R1, #hi_addr(GPIOA_CRLbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #2, #2
STRB	R0, [R1, #0]
;GPIO.c,53 :: 		GPIOA_ODRbits.ODR0 = 0x1;
MOVW	R0, #lo_addr(GPIOA_ODRbits+0)
MOVT	R0, #hi_addr(GPIOA_ODRbits+0)
STR	R3, [R0, #0]
;GPIO.c,57 :: 		GPIOB_CRHbits.MODE15 = 0x2;
MOVS	R2, #2
MOVW	R1, #lo_addr(GPIOB_CRHbits+0)
MOVT	R1, #hi_addr(GPIOB_CRHbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #28, #2
STR	R0, [R1, #0]
;GPIO.c,58 :: 		GPIOB_CRHbits.CNF15 = 0x0;
MOVS	R2, #0
MOVW	R1, #lo_addr(GPIOB_CRHbits+0)
MOVT	R1, #hi_addr(GPIOB_CRHbits+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #30, #2
STR	R0, [R1, #0]
;GPIO.c,59 :: 		}
L_end_setup:
BX	LR
; end of _setup
