_WWDG_ISR:
;WWDG_Demo.c,9 :: 		iv IVT_INT_WWDG ics ICS_AUTO        //WWDG early wakeup interrupt function
;WWDG_Demo.c,11 :: 		unsigned char cnt = 0;           //Temporary variables for counter and window values
;WWDG_Demo.c,12 :: 		unsigned char wdt = 0;
;WWDG_Demo.c,14 :: 		wdt = (WWDG_CFR & 0x7F);         //Read window value
MOVW	R0, #lo_addr(WWDG_CFR+0)
MOVT	R0, #hi_addr(WWDG_CFR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #127
;WWDG_Demo.c,15 :: 		cnt = (WWDG_CR & 0x7F);          //Read counter value
MOVW	R0, #lo_addr(WWDG_CR+0)
MOVT	R0, #hi_addr(WWDG_CR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #127
;WWDG_Demo.c,17 :: 		if(cnt < wdt)                    //If counter is less than window value
UXTB	R1, R1
UXTB	R0, R0
CMP	R0, R1
IT	CS
BCS	L_WWDG_ISR0
;WWDG_Demo.c,19 :: 		WWDG_CR |= 0x7F;             //Reload the counter
MOVW	R0, #lo_addr(WWDG_CR+0)
MOVT	R0, #hi_addr(WWDG_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #127
MOVW	R0, #lo_addr(WWDG_CR+0)
MOVT	R0, #hi_addr(WWDG_CR+0)
STR	R1, [R0, #0]
;WWDG_Demo.c,20 :: 		WWDG_SR = 0x00;              //Clear interrupt flag
MOVS	R1, #0
MOVW	R0, #lo_addr(WWDG_SR+0)
MOVT	R0, #hi_addr(WWDG_SR+0)
STR	R1, [R0, #0]
;WWDG_Demo.c,21 :: 		GPIOC_ODRbits.ODR9 ^= 1;     //Toggle WWDG LED
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;WWDG_Demo.c,22 :: 		}
L_WWDG_ISR0:
;WWDG_Demo.c,23 :: 		}
L_end_WWDG_ISR:
BX	LR
; end of _WWDG_ISR
_main:
;WWDG_Demo.c,26 :: 		void main()
;WWDG_Demo.c,28 :: 		setup();
BL	_setup+0
;WWDG_Demo.c,30 :: 		while(1)
L_main1:
;WWDG_Demo.c,32 :: 		GPIOC_ODRbits.ODR12 ^= 1;       //Toggle main LED
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;WWDG_Demo.c,33 :: 		delay_ms(300);                  //Wait for 300ms
MOVW	R7, #61055
MOVT	R7, #54
NOP
NOP
L_main3:
SUBS	R7, R7, #1
BNE	L_main3
NOP
NOP
NOP
;WWDG_Demo.c,34 :: 		if(GPIOA_IDRbits.IDR9 == 0)     //If button is pressed
MOVW	R1, #lo_addr(GPIOA_IDRbits+0)
MOVT	R1, #hi_addr(GPIOA_IDRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main5
;WWDG_Demo.c,36 :: 		WWDG_CR = 0x80;             //Force the counter to zero
MOVS	R1, #128
MOVW	R0, #lo_addr(WWDG_CR+0)
MOVT	R0, #hi_addr(WWDG_CR+0)
STR	R1, [R0, #0]
;WWDG_Demo.c,37 :: 		while(1);                   //Get stuck into an infinity loop
L_main6:
IT	AL
BAL	L_main6
;WWDG_Demo.c,38 :: 		}
L_main5:
;WWDG_Demo.c,39 :: 		};
IT	AL
BAL	L_main1
;WWDG_Demo.c,40 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;WWDG_Demo.c,43 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;WWDG_Demo.c,45 :: 		setup_GPIO();
BL	_setup_GPIO+0
;WWDG_Demo.c,46 :: 		setup_WWDG();
BL	_setup_WWDG+0
;WWDG_Demo.c,47 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_setup_GPIO:
;WWDG_Demo.c,50 :: 		void setup_GPIO()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;WWDG_Demo.c,52 :: 		GPIO_Clk_Enable(&GPIOA_BASE);           //Enable clock for GPIOA
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;WWDG_Demo.c,53 :: 		GPIO_Clk_Enable(&GPIOC_BASE);           //Enable clock for GPIOC
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Clk_Enable+0
;WWDG_Demo.c,54 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_9, (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));        //Set PA9 as a digital input with pull-up
MOVS	R2, #130
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;WWDG_Demo.c,55 :: 		GPIO_Config(&GPIOC_BASE, (_GPIO_PINMASK_9 | _GPIO_PINMASK_12), (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_2MHZ));       //Set PC9 and PC12 as digital outputs
MOVW	R2, #532
MOVW	R1, #4608
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;WWDG_Demo.c,56 :: 		GPIOC_ODRbits.ODR9 = 0;                 //Turn off WWDG LED at first
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;WWDG_Demo.c,57 :: 		GPIOC_ODRbits.ODR12 = 1;                //Turn on main LED at first
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;WWDG_Demo.c,58 :: 		delay_ms(1000);                         //Wait for a second
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_setup_GPIO8:
SUBS	R7, R7, #1
BNE	L_setup_GPIO8
NOP
NOP
NOP
;WWDG_Demo.c,59 :: 		}
L_end_setup_GPIO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_GPIO
_setup_WWDG:
;WWDG_Demo.c,62 :: 		void setup_WWDG()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;WWDG_Demo.c,64 :: 		RCC_APB1ENRbits.WWDGEN = 1;             //Enable clock for WWDG module
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R1, [R0, #0]
;WWDG_Demo.c,65 :: 		WWDG_CFR = 0x3DF;                       //Set WWDG_CFR register
MOVW	R1, #991
MOVW	R0, #lo_addr(WWDG_CFR+0)
MOVT	R0, #hi_addr(WWDG_CFR+0)
STR	R1, [R0, #0]
;WWDG_Demo.c,66 :: 		WWDG_SR = 0x00;                         //Clear interrupt flag
MOVS	R1, #0
MOVW	R0, #lo_addr(WWDG_SR+0)
MOVT	R0, #hi_addr(WWDG_SR+0)
STR	R1, [R0, #0]
;WWDG_Demo.c,67 :: 		WWDG_CR = 0xFF;                         //Turn on WWDG and load the counter
MOVS	R1, #255
MOVW	R0, #lo_addr(WWDG_CR+0)
MOVT	R0, #hi_addr(WWDG_CR+0)
STR	R1, [R0, #0]
;WWDG_Demo.c,68 :: 		NVIC_IntEnable(IVT_INT_WWDG);           //Enable NVIC for WWDG interrupt
MOVW	R0, #16
BL	_NVIC_IntEnable+0
;WWDG_Demo.c,69 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;WWDG_Demo.c,70 :: 		}
L_end_setup_WWDG:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_WWDG
