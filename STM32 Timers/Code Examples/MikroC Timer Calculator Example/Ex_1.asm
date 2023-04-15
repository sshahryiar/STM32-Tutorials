_TIM6_ISR:
;Ex_1.c,8 :: 		ics ICS_AUTO
;Ex_1.c,10 :: 		TIM6_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM6_SR+0)
MOVT	R0, #hi_addr(TIM6_SR+0)
STR	R1, [R0, #0]
;Ex_1.c,11 :: 		GPIOC_ODRbits.ODR7 ^= 1;
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Ex_1.c,12 :: 		}
L_end_TIM6_ISR:
BX	LR
; end of _TIM6_ISR
_main:
;Ex_1.c,15 :: 		void main()
;Ex_1.c,17 :: 		setup();
BL	_setup+0
;Ex_1.c,19 :: 		while(1)
L_main0:
;Ex_1.c,21 :: 		GPIOC_ODRbits.ODR6 ^= 1;
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Ex_1.c,22 :: 		delay_ms(500);
MOVW	R7, #36223
MOVT	R7, #91
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;Ex_1.c,23 :: 		};
IT	AL
BAL	L_main0
;Ex_1.c,24 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_1.c,27 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_1.c,29 :: 		GPIO_init();
BL	_GPIO_init+0
;Ex_1.c,30 :: 		Timer6_init();
BL	_Timer6_init+0
;Ex_1.c,31 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_init:
;Ex_1.c,34 :: 		void GPIO_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_1.c,36 :: 		GPIO_Clk_Enable(&GPIOC_BASE);
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Clk_Enable+0
;Ex_1.c,39 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
;Ex_1.c,38 :: 		(_GPIO_PINMASK_6 | _GPIO_PINMASK_7),
MOVS	R1, #192
;Ex_1.c,37 :: 		GPIO_Config(&GPIOC_BASE,
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;Ex_1.c,39 :: 		(_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
BL	_GPIO_Config+0
;Ex_1.c,40 :: 		GPIOC_ODRbits.ODR6 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Ex_1.c,41 :: 		GPIOC_ODRbits.ODR7 = 0;
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Ex_1.c,42 :: 		}
L_end_GPIO_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _GPIO_init
_Timer6_init:
;Ex_1.c,45 :: 		void Timer6_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_1.c,47 :: 		RCC_APB1ENR.TIM6EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Ex_1.c,48 :: 		TIM6_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM6_CR1+0)
MOVT	R0, #hi_addr(TIM6_CR1+0)
STR	R1, [R0, #0]
;Ex_1.c,49 :: 		TIM6_PSC = 575;
MOVW	R1, #575
MOVW	R0, #lo_addr(TIM6_PSC+0)
MOVT	R0, #hi_addr(TIM6_PSC+0)
STR	R1, [R0, #0]
;Ex_1.c,50 :: 		TIM6_ARR = 62499;
MOVW	R1, #62499
MOVW	R0, #lo_addr(TIM6_ARR+0)
MOVT	R0, #hi_addr(TIM6_ARR+0)
STR	R1, [R0, #0]
;Ex_1.c,51 :: 		NVIC_IntEnable(IVT_INT_TIM6);
MOVW	R0, #70
BL	_NVIC_IntEnable+0
;Ex_1.c,52 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ex_1.c,53 :: 		TIM6_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM6_DIER+0)
MOVT	R0, #hi_addr(TIM6_DIER+0)
STR	R1, [R0, #0]
;Ex_1.c,54 :: 		TIM6_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM6_CR1+0)
MOVT	R0, #hi_addr(TIM6_CR1+0)
STR	R1, [R0, #0]
;Ex_1.c,55 :: 		}
L_end_Timer6_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer6_init
