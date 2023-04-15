_TIM3_ISR:
;Ex_2.c,15 :: 		ics ICS_AUTO
;Ex_2.c,17 :: 		TIM3_SR = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;Ex_2.c,18 :: 		GPIOC_pin_toggle(6);
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
EOR	R1, R0, #64
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;Ex_2.c,19 :: 		}
L_end_TIM3_ISR:
BX	LR
; end of _TIM3_ISR
_TIM8_ISR:
;Ex_2.c,24 :: 		ics ICS_AUTO
;Ex_2.c,26 :: 		TIM8_SR = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM8_SR+0)
MOVT	R0, #hi_addr(TIM8_SR+0)
STR	R1, [R0, #0]
;Ex_2.c,27 :: 		GPIOC_pin_toggle(7);
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
EOR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;Ex_2.c,28 :: 		}
L_end_TIM8_ISR:
BX	LR
; end of _TIM8_ISR
_main:
;Ex_2.c,31 :: 		void main()
;Ex_2.c,33 :: 		setup();
BL	_setup+0
;Ex_2.c,35 :: 		while(1)
L_main0:
;Ex_2.c,37 :: 		};
IT	AL
BAL	L_main0
;Ex_2.c,38 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_2.c,41 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_2.c,43 :: 		GPIO_init();
BL	_GPIO_init+0
;Ex_2.c,44 :: 		Timer3_init();
BL	_Timer3_init+0
;Ex_2.c,45 :: 		Timer8_init();
BL	_Timer8_init+0
;Ex_2.c,46 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_init:
;Ex_2.c,49 :: 		void GPIO_init()
;Ex_2.c,51 :: 		enable_GPIOC(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_2.c,52 :: 		setup_GPIOC(6, (GPIO_PP_output | output_mode_medium_speed));
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16777216
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
L_GPIO_init11:
;Ex_2.c,53 :: 		setup_GPIOC(7, (GPIO_PP_output | output_mode_medium_speed));
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #268435456
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
L_GPIO_init24:
;Ex_2.c,54 :: 		}
L_end_GPIO_init:
BX	LR
; end of _GPIO_init
_Timer3_init:
;Ex_2.c,57 :: 		void Timer3_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_2.c,59 :: 		enable_TIM3(true);
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;Ex_2.c,60 :: 		enable_TIM3_counter(false);
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1bits+0)
MOVT	R0, #hi_addr(TIM3_CR1bits+0)
STR	R1, [R0, #0]
;Ex_2.c,61 :: 		TIM3_PSC = 575;
MOVW	R1, #575
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Ex_2.c,62 :: 		TIM3_ARR = 62499;
MOVW	R1, #62499
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Ex_2.c,63 :: 		set_TIM3_counting_direction(down_counting);
MOVW	R0, #lo_addr(TIM3_CR1bits+0)
MOVT	R0, #hi_addr(TIM3_CR1bits+0)
STR	R2, [R0, #0]
;Ex_2.c,64 :: 		NVIC_IntEnable(IVT_INT_TIM3);
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;Ex_2.c,65 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ex_2.c,66 :: 		enable_TIM3_update_interrupt(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM3_DIERbits+0)
MOVT	R0, #hi_addr(TIM3_DIERbits+0)
STR	R1, [R0, #0]
;Ex_2.c,67 :: 		enable_TIM3_counter(true);
MOVW	R0, #lo_addr(TIM3_CR1bits+0)
MOVT	R0, #hi_addr(TIM3_CR1bits+0)
STR	R1, [R0, #0]
;Ex_2.c,68 :: 		}
L_end_Timer3_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer3_init
_Timer8_init:
;Ex_2.c,71 :: 		void Timer8_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_2.c,73 :: 		enable_TIM8(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_2.c,74 :: 		enable_TIM8_counter(false);
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM8_CR1bits+0)
MOVT	R0, #hi_addr(TIM8_CR1bits+0)
STR	R2, [R0, #0]
;Ex_2.c,75 :: 		TIM8_PSC = 575;
MOVW	R1, #575
MOVW	R0, #lo_addr(TIM8_PSC+0)
MOVT	R0, #hi_addr(TIM8_PSC+0)
STR	R1, [R0, #0]
;Ex_2.c,76 :: 		TIM8_ARR = 62499;
MOVW	R1, #62499
MOVW	R0, #lo_addr(TIM8_ARR+0)
MOVT	R0, #hi_addr(TIM8_ARR+0)
STR	R1, [R0, #0]
;Ex_2.c,77 :: 		set_TIM8_counting_direction(up_counting);
MOVW	R0, #lo_addr(TIM8_CR1bits+0)
MOVT	R0, #hi_addr(TIM8_CR1bits+0)
STR	R2, [R0, #0]
;Ex_2.c,78 :: 		NVIC_IntEnable(IVT_INT_TIM8_UP);
MOVW	R0, #60
BL	_NVIC_IntEnable+0
;Ex_2.c,79 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ex_2.c,80 :: 		enable_TIM8_update_interrupt(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM8_DIERbits+0)
MOVT	R0, #hi_addr(TIM8_DIERbits+0)
STR	R1, [R0, #0]
;Ex_2.c,81 :: 		enable_TIM8_counter(true);
MOVW	R0, #lo_addr(TIM8_CR1bits+0)
MOVT	R0, #hi_addr(TIM8_CR1bits+0)
STR	R1, [R0, #0]
;Ex_2.c,82 :: 		}
L_end_Timer8_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer8_init
