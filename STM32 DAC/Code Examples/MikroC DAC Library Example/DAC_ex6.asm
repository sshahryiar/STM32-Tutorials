_main:
;DAC_ex6.c,4 :: 		void main()
SUB	SP, SP, #4
;DAC_ex6.c,6 :: 		signed int value = 2047;
; value start address is: 8 (R2)
MOVW	R2, #2047
SXTH	R2, R2
;DAC_ex6.c,8 :: 		setup();
STRH	R2, [SP, #0]
; value end address is: 8 (R2)
BL	_setup+0
LDRSH	R2, [SP, #0]
;DAC_ex6.c,10 :: 		while(1)
L_main0:
;DAC_ex6.c,12 :: 		if(GPIOF_IDRbits.IDR13 == 0)
; value start address is: 8 (R2)
MOVW	R1, #lo_addr(GPIOF_IDRbits+0)
MOVT	R1, #hi_addr(GPIOF_IDRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__main8
;DAC_ex6.c,14 :: 		value++;
ADDS	R2, R2, #1
SXTH	R2, R2
; value end address is: 8 (R2)
;DAC_ex6.c,15 :: 		}
IT	AL
BAL	L_main2
L__main8:
;DAC_ex6.c,12 :: 		if(GPIOF_IDRbits.IDR13 == 0)
;DAC_ex6.c,15 :: 		}
L_main2:
;DAC_ex6.c,16 :: 		if(GPIOF_IDRbits.IDR14 == 0)
; value start address is: 8 (R2)
MOVW	R1, #lo_addr(GPIOF_IDRbits+0)
MOVT	R1, #hi_addr(GPIOF_IDRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__main9
;DAC_ex6.c,18 :: 		value--;
SUBS	R1, R2, #1
SXTH	R1, R1
; value end address is: 8 (R2)
; value start address is: 4 (R1)
; value end address is: 4 (R1)
;DAC_ex6.c,19 :: 		}
IT	AL
BAL	L_main3
L__main9:
;DAC_ex6.c,16 :: 		if(GPIOF_IDRbits.IDR14 == 0)
SXTH	R1, R2
;DAC_ex6.c,19 :: 		}
L_main3:
;DAC_ex6.c,21 :: 		if(value >= 4095)
; value start address is: 4 (R1)
MOVW	R0, #4095
CMP	R1, R0
IT	LT
BLT	L__main10
;DAC_ex6.c,23 :: 		value = 4095;
MOVW	R1, #4095
SXTH	R1, R1
; value end address is: 4 (R1)
;DAC_ex6.c,24 :: 		}
IT	AL
BAL	L_main4
L__main10:
;DAC_ex6.c,21 :: 		if(value >= 4095)
;DAC_ex6.c,24 :: 		}
L_main4:
;DAC_ex6.c,25 :: 		if(value <= 0)
; value start address is: 4 (R1)
CMP	R1, #0
IT	GT
BGT	L__main11
; value end address is: 4 (R1)
;DAC_ex6.c,27 :: 		value = 0;
; value start address is: 24 (R6)
MOVS	R6, #0
SXTH	R6, R6
; value end address is: 24 (R6)
;DAC_ex6.c,28 :: 		}
IT	AL
BAL	L_main5
L__main11:
;DAC_ex6.c,25 :: 		if(value <= 0)
SXTH	R6, R1
;DAC_ex6.c,28 :: 		}
L_main5:
;DAC_ex6.c,30 :: 		DAC1_Ch1_Output(value);
; value start address is: 24 (R6)
SXTH	R0, R6
BL	_DAC1_Ch1_Output+0
;DAC_ex6.c,31 :: 		DAC1_Ch2_Output((4095 - value));
MOVW	R0, #4095
SXTH	R0, R0
SUB	R0, R0, R6
SXTH	R0, R0
BL	_DAC1_Ch2_Output+0
;DAC_ex6.c,33 :: 		delay_ms(1);
MOVW	R7, #11999
MOVT	R7, #0
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
;DAC_ex6.c,34 :: 		};
SXTH	R2, R6
; value end address is: 24 (R6)
IT	AL
BAL	L_main0
;DAC_ex6.c,35 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;DAC_ex6.c,38 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DAC_ex6.c,40 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;DAC_ex6.c,41 :: 		GPIO_Clk_Enable(&GPIOF_BASE);
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Clk_Enable+0
;DAC_ex6.c,43 :: 		GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_4 | _GPIO_PINMASK_5), _GPIO_CFG_MODE_ANALOG);
MOV	R2, #1
MOVS	R1, #48
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;DAC_ex6.c,44 :: 		GPIO_Config(&GPIOF_BASE, (_GPIO_PINMASK_13 | _GPIO_PINMASK_14), (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));
MOVS	R2, #130
MOVW	R1, #24576
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Config+0
;DAC_ex6.c,46 :: 		DAC1_Init(_DAC_DUAL_MODE_ENABLE);
MOVS	R0, #3
BL	_DAC1_Init+0
;DAC_ex6.c,47 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
