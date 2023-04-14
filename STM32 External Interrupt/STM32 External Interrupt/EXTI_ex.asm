_external_interrupt:
;EXTI_ex.c,10 :: 		ics ICS_AUTO
;EXTI_ex.c,12 :: 		if((EXTI_PR & 0x00000800) != 0)
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #2048
CMP	R0, #0
IT	EQ
BEQ	L_external_interrupt0
;EXTI_ex.c,14 :: 		s = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
STRB	R1, [R0, #0]
;EXTI_ex.c,15 :: 		EXTI_PR |= 0x00000800;
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,16 :: 		}
L_external_interrupt0:
;EXTI_ex.c,17 :: 		if((EXTI_PR & 0x00001000) != 0)
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #4096
CMP	R0, #0
IT	EQ
BEQ	L_external_interrupt1
;EXTI_ex.c,19 :: 		s = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
STRB	R1, [R0, #0]
;EXTI_ex.c,20 :: 		EXTI_PR |= 0x00001000;
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4096
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,21 :: 		}
L_external_interrupt1:
;EXTI_ex.c,22 :: 		if((EXTI_PR & 0x00002000) != 0)
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #8192
CMP	R0, #0
IT	EQ
BEQ	L_external_interrupt2
;EXTI_ex.c,24 :: 		s = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
STRB	R1, [R0, #0]
;EXTI_ex.c,25 :: 		EXTI_PR |= 0x00002000;
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,26 :: 		}
L_external_interrupt2:
;EXTI_ex.c,27 :: 		if((EXTI_PR & 0x00004000) != 0)
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #16384
CMP	R0, #0
IT	EQ
BEQ	L_external_interrupt3
;EXTI_ex.c,29 :: 		s = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
STRB	R1, [R0, #0]
;EXTI_ex.c,30 :: 		EXTI_PR |= 0x00004000;
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16384
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,31 :: 		}
L_external_interrupt3:
;EXTI_ex.c,32 :: 		if((EXTI_PR & 0x00008000) != 0)
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32768
CMP	R0, #0
IT	EQ
BEQ	L_external_interrupt4
;EXTI_ex.c,34 :: 		s = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
STRB	R1, [R0, #0]
;EXTI_ex.c,35 :: 		EXTI_PR |= 0x00008000;
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,36 :: 		}
L_external_interrupt4:
;EXTI_ex.c,37 :: 		}
L_end_external_interrupt:
BX	LR
; end of _external_interrupt
_setup:
;EXTI_ex.c,40 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;EXTI_ex.c,42 :: 		RCC_APB2ENR = 0x00000045;
MOVS	R1, #69
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,43 :: 		GPIOA_CRL = 0x22220000;
MOVW	R1, #0
MOVT	R1, #8738
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;EXTI_ex.c,44 :: 		GPIOE_CRH = 0x88888000;
MOVW	R1, #32768
MOVT	R1, #34952
MOVW	R0, #lo_addr(GPIOE_CRH+0)
MOVT	R0, #hi_addr(GPIOE_CRH+0)
STR	R1, [R0, #0]
;EXTI_ex.c,45 :: 		GPIOE_ODR = 0x0000F800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,46 :: 		GPIOA_ODR = 0x000000F0;
MOVS	R1, #240
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,48 :: 		AFIO_EXTICR3 = 0x00004000;
MOVW	R1, #16384
MOVW	R0, #lo_addr(AFIO_EXTICR3+0)
MOVT	R0, #hi_addr(AFIO_EXTICR3+0)
STR	R1, [R0, #0]
;EXTI_ex.c,49 :: 		AFIO_EXTICR4 = 0x00004444;
MOVW	R1, #17476
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
STR	R1, [R0, #0]
;EXTI_ex.c,50 :: 		EXTI_FTSR = 0x0000F800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,51 :: 		EXTI_IMR = 0x0000F800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,53 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;EXTI_ex.c,54 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;EXTI_ex.c,55 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_main:
;EXTI_ex.c,58 :: 		void main()
;EXTI_ex.c,60 :: 		setup();
BL	_setup+0
;EXTI_ex.c,62 :: 		while(1)
L_main5:
;EXTI_ex.c,64 :: 		switch(s)
IT	AL
BAL	L_main7
;EXTI_ex.c,66 :: 		case 1:
L_main9:
;EXTI_ex.c,68 :: 		GPIOA_ODR = 0x00000010;
MOVS	R1, #16
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,69 :: 		delay_ms(dly);
MOVW	R7, #28926
MOVT	R7, #2
NOP
NOP
L_main10:
SUBS	R7, R7, #1
BNE	L_main10
NOP
NOP
NOP
;EXTI_ex.c,70 :: 		GPIOA_ODR = 0x00000000;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,71 :: 		delay_ms(dly);
MOVW	R7, #28926
MOVT	R7, #2
NOP
NOP
L_main12:
SUBS	R7, R7, #1
BNE	L_main12
NOP
NOP
NOP
;EXTI_ex.c,72 :: 		break;
IT	AL
BAL	L_main8
;EXTI_ex.c,74 :: 		case 2:
L_main14:
;EXTI_ex.c,76 :: 		GPIOA_ODR = 0x00000020;
MOVS	R1, #32
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,77 :: 		delay_ms(dly);
MOVW	R7, #28926
MOVT	R7, #2
NOP
NOP
L_main15:
SUBS	R7, R7, #1
BNE	L_main15
NOP
NOP
NOP
;EXTI_ex.c,78 :: 		GPIOA_ODR = 0x00000000;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,79 :: 		delay_ms(dly);
MOVW	R7, #28926
MOVT	R7, #2
NOP
NOP
L_main17:
SUBS	R7, R7, #1
BNE	L_main17
NOP
NOP
NOP
;EXTI_ex.c,80 :: 		break;
IT	AL
BAL	L_main8
;EXTI_ex.c,82 :: 		case 3:
L_main19:
;EXTI_ex.c,84 :: 		GPIOA_ODR = 0x00000040;
MOVS	R1, #64
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,85 :: 		delay_ms(dly);
MOVW	R7, #28926
MOVT	R7, #2
NOP
NOP
L_main20:
SUBS	R7, R7, #1
BNE	L_main20
NOP
NOP
NOP
;EXTI_ex.c,86 :: 		GPIOA_ODR = 0x00000000;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,87 :: 		delay_ms(dly);
MOVW	R7, #28926
MOVT	R7, #2
NOP
NOP
L_main22:
SUBS	R7, R7, #1
BNE	L_main22
NOP
NOP
NOP
;EXTI_ex.c,88 :: 		break;
IT	AL
BAL	L_main8
;EXTI_ex.c,90 :: 		case 4:
L_main24:
;EXTI_ex.c,92 :: 		GPIOA_ODR = 0x00000080;
MOVS	R1, #128
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,93 :: 		delay_ms(dly);
MOVW	R7, #28926
MOVT	R7, #2
NOP
NOP
L_main25:
SUBS	R7, R7, #1
BNE	L_main25
NOP
NOP
NOP
;EXTI_ex.c,94 :: 		GPIOA_ODR = 0x00000000;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,95 :: 		delay_ms(dly);
MOVW	R7, #28926
MOVT	R7, #2
NOP
NOP
L_main27:
SUBS	R7, R7, #1
BNE	L_main27
NOP
NOP
NOP
;EXTI_ex.c,96 :: 		break;
IT	AL
BAL	L_main8
;EXTI_ex.c,98 :: 		case 5:
L_main29:
;EXTI_ex.c,100 :: 		GPIOA_ODR = 0x00000050;
MOVS	R1, #80
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,101 :: 		delay_ms(dly);
MOVW	R7, #28926
MOVT	R7, #2
NOP
NOP
L_main30:
SUBS	R7, R7, #1
BNE	L_main30
NOP
NOP
NOP
;EXTI_ex.c,102 :: 		GPIOA_ODR = 0x000000A0;
MOVS	R1, #160
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;EXTI_ex.c,103 :: 		delay_ms(dly);
MOVW	R7, #28926
MOVT	R7, #2
NOP
NOP
L_main32:
SUBS	R7, R7, #1
BNE	L_main32
NOP
NOP
NOP
;EXTI_ex.c,104 :: 		break;
IT	AL
BAL	L_main8
;EXTI_ex.c,106 :: 		}
L_main7:
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_main9
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_main14
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_main19
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_main24
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
LDRB	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_main29
L_main8:
;EXTI_ex.c,107 :: 		}
IT	AL
BAL	L_main5
;EXTI_ex.c,108 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
