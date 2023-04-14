_main:
;GPIOlib.c,4 :: 		void main()
;GPIOlib.c,6 :: 		unsigned int dly = 600;
;GPIOlib.c,8 :: 		setup();                              //set registers and chip peripherals
BL	_setup+0
;GPIOlib.c,10 :: 		while(1)
L_main0:
;GPIOlib.c,12 :: 		if(GPIOA_IDRbits.IDR0 == 1)            //Button not pressed
MOVW	R1, #lo_addr(GPIOA_IDRbits+0)
MOVT	R1, #hi_addr(GPIOA_IDRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main2
;GPIOlib.c,14 :: 		dly = 200;
; dly start address is: 12 (R3)
MOVS	R3, #200
;GPIOlib.c,15 :: 		}
; dly end address is: 12 (R3)
IT	AL
BAL	L_main3
L_main2:
;GPIOlib.c,18 :: 		dly = 600;
; dly start address is: 12 (R3)
MOVW	R3, #600
; dly end address is: 12 (R3)
;GPIOlib.c,19 :: 		}
L_main3:
;GPIOlib.c,21 :: 		GPIOB_BSRRbits.BR15 = 1;               //Write 1 on bit 15 for GPIOB
; dly start address is: 12 (R3)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_BSRRbits+0)
MOVT	R0, #hi_addr(GPIOB_BSRRbits+0)
STR	R1, [R0, #0]
;GPIOlib.c,22 :: 		Vdelay_ms(dly);                        //Wait for some time
UXTH	R0, R3
BL	_VDelay_ms+0
;GPIOlib.c,23 :: 		GPIOB_BSRRbits.BR15 = 0;               //Write 0 on bit 15 for GPIOB
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_BSRRbits+0)
MOVT	R0, #hi_addr(GPIOB_BSRRbits+0)
STR	R1, [R0, #0]
;GPIOlib.c,24 :: 		Vdelay_ms(dly);                        //Wait for some time
UXTH	R0, R3
; dly end address is: 12 (R3)
BL	_VDelay_ms+0
;GPIOlib.c,25 :: 		};
IT	AL
BAL	L_main0
;GPIOlib.c,26 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;GPIOlib.c,29 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;GPIOlib.c,33 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;GPIOlib.c,34 :: 		GPIO_Clk_Enable(&GPIOB_BASE);
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Clk_Enable+0
;GPIOlib.c,38 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_0, (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));
MOVS	R2, #130
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;GPIOlib.c,42 :: 		GPIO_Config(&GPIOB_BASE, _GPIO_PINMASK_15, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_2MHZ | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #532
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Config+0
;GPIOlib.c,43 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
