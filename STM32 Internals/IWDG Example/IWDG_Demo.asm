_main:
;IWDG_Demo.c,8 :: 		void main()
;IWDG_Demo.c,10 :: 		setup();
BL	_setup+0
;IWDG_Demo.c,12 :: 		while(1)
L_main0:
;IWDG_Demo.c,14 :: 		if(GPIOA_IDRbits.IDR9 == 0)  //If the switch is pressed
MOVW	R1, #lo_addr(GPIOA_IDRbits+0)
MOVT	R1, #hi_addr(GPIOA_IDRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main2
;IWDG_Demo.c,16 :: 		GPIOC_BRRbits.BR9 = 1;   //Turn off LED
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_BRRbits+0)
MOVT	R0, #hi_addr(GPIOC_BRRbits+0)
STR	R1, [R0, #0]
;IWDG_Demo.c,17 :: 		delay_ms(90);            //Wait for 90ms
MOVW	R7, #43390
MOVT	R7, #3
NOP
NOP
L_main3:
SUBS	R7, R7, #1
BNE	L_main3
NOP
NOP
NOP
;IWDG_Demo.c,18 :: 		GPIOC_BSRRbits.BS9 = 1;  //Turn on LED
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_BSRRbits+0)
MOVT	R0, #hi_addr(GPIOC_BSRRbits+0)
STR	R1, [R0, #0]
;IWDG_Demo.c,19 :: 		delay_ms(90);            //Wait for 90ms
MOVW	R7, #43390
MOVT	R7, #3
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
NOP
;IWDG_Demo.c,20 :: 		IWDG_KR = 0xAAAA;        //Reload IWDG
MOVW	R1, #43690
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;IWDG_Demo.c,21 :: 		}
L_main2:
;IWDG_Demo.c,22 :: 		};
IT	AL
BAL	L_main0
;IWDG_Demo.c,23 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;IWDG_Demo.c,26 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;IWDG_Demo.c,28 :: 		setup_GPIO();
BL	_setup_GPIO+0
;IWDG_Demo.c,29 :: 		setup_IWDG();
BL	_setup_IWDG+0
;IWDG_Demo.c,30 :: 		while(GPIOA_IDRbits.IDR9 == 1);      //Wait till the switch is pressed
L_setup7:
MOVW	R1, #lo_addr(GPIOA_IDRbits+0)
MOVT	R1, #hi_addr(GPIOA_IDRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_setup8
IT	AL
BAL	L_setup7
L_setup8:
;IWDG_Demo.c,31 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_setup_GPIO:
;IWDG_Demo.c,34 :: 		void setup_GPIO()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;IWDG_Demo.c,36 :: 		GPIO_Clk_Enable(&GPIOA_BASE);        //Enable clock for GPIOA
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;IWDG_Demo.c,37 :: 		GPIO_Clk_Enable(&GPIOC_BASE);        //Enable clock for GPIOC
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Clk_Enable+0
;IWDG_Demo.c,38 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_9, (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));                                   //Set PA9 as a digital input with pull-up
MOVS	R2, #130
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;IWDG_Demo.c,39 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_9, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_2MHZ));          //Set PC9 as a digital output
MOVW	R2, #532
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;IWDG_Demo.c,40 :: 		GPIOC_BSRRbits.BS9 = 0;              //Turn off LED
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_BSRRbits+0)
MOVT	R0, #hi_addr(GPIOC_BSRRbits+0)
STR	R1, [R0, #0]
;IWDG_Demo.c,41 :: 		}
L_end_setup_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_GPIO
_setup_IWDG:
;IWDG_Demo.c,44 :: 		void setup_IWDG()
;IWDG_Demo.c,46 :: 		IWDG_KR = 0x5555;    //Disable write protection of IWDG registers
MOVW	R1, #21845
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;IWDG_Demo.c,47 :: 		IWDG_PR = 0x06;      //Set PR value
MOVS	R1, #6
MOVW	R0, #lo_addr(IWDG_PR+0)
MOVT	R0, #hi_addr(IWDG_PR+0)
STR	R1, [R0, #0]
;IWDG_Demo.c,48 :: 		IWDG_RLR = 0xB4;     //Set RLR value
MOVS	R1, #180
MOVW	R0, #lo_addr(IWDG_RLR+0)
MOVT	R0, #hi_addr(IWDG_RLR+0)
STR	R1, [R0, #0]
;IWDG_Demo.c,49 :: 		IWDG_KR = 0xAAAA;    //Reload IWDG
MOVW	R1, #43690
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;IWDG_Demo.c,50 :: 		IWDG_KR = 0xCCCC;    //Start IWDG
MOVW	R1, #52428
MOVW	R0, #lo_addr(IWDG_KR+0)
MOVT	R0, #hi_addr(IWDG_KR+0)
STR	R1, [R0, #0]
;IWDG_Demo.c,51 :: 		}
L_end_setup_IWDG:
BX	LR
; end of _setup_IWDG
