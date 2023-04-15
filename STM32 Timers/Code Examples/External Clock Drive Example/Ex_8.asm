_TIM2_ISR:
;Ex_8.c,14 :: 		ics ICS_AUTO
;Ex_8.c,17 :: 		TIM2_SR = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Ex_8.c,18 :: 		GPIOC_pin_toggle(6);
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
EOR	R1, R0, #64
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;Ex_8.c,19 :: 		}
L_end_TIM2_ISR:
BX	LR
; end of _TIM2_ISR
_main:
;Ex_8.c,22 :: 		void main()
;Ex_8.c,24 :: 		setup();
BL	_setup+0
;Ex_8.c,26 :: 		while(1);
L_main0:
IT	AL
BAL	L_main0
;Ex_8.c,27 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_8.c,30 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_8.c,32 :: 		setup_IO();
BL	_setup_IO+0
;Ex_8.c,33 :: 		setup_TIM2();
BL	_setup_TIM2+0
;Ex_8.c,34 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_setup_IO:
;Ex_8.c,37 :: 		void setup_IO()
;Ex_8.c,39 :: 		AFIO_enable(true);
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_8.c,40 :: 		AFIO_remap(TIM2_not_remapped);
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
STR	R1, [R0, #0]
;Ex_8.c,42 :: 		enable_GPIOA(true);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_8.c,43 :: 		setup_GPIOA(0, input_without_pull_resistors);
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_setup_IO11:
;Ex_8.c,45 :: 		enable_GPIOC(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_8.c,46 :: 		setup_GPIOC(6, (GPIO_PP_output | output_mode_high_speed));
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
ORR	R1, R0, #50331648
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
L_setup_IO24:
;Ex_8.c,47 :: 		GPIOC_pin_high(6);
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;Ex_8.c,48 :: 		}
L_end_setup_IO:
BX	LR
; end of _setup_IO
_setup_TIM2:
;Ex_8.c,51 :: 		void setup_TIM2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_8.c,53 :: 		enable_TIM2(true);
MOVS	R3, #1
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R3, [R0, #0]
;Ex_8.c,54 :: 		enable_TIM2_counter(false);
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R2, [R0, #0]
;Ex_8.c,55 :: 		TIM2_ARR = 0x0002;
MOVS	R1, #2
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Ex_8.c,56 :: 		TIM2_PSC = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Ex_8.c,57 :: 		set_TIM2_counting_direction(up_counting);
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R2, [R0, #0]
;Ex_8.c,58 :: 		set_TIM2_clock_division(clock_division_tCK_INT);
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Ex_8.c,59 :: 		set_TIM2_CC1_selection(CC1_input_IC1_on_TI1);
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
STR	R1, [R0, #0]
;Ex_8.c,60 :: 		set_TIM2_CC1_state_and_polarity(enable, rising_edge);
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R3, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R2, [R0, #0]
;Ex_8.c,61 :: 		set_TIM2_trigger_source(TI1_edge_detector);
MOVW	R0, #lo_addr(TIM2_SMCR+0)
MOVT	R0, #hi_addr(TIM2_SMCR+0)
LDR	R1, [R0, #0]
MVN	R0, #112
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_SMCR+0)
MOVT	R0, #hi_addr(TIM2_SMCR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_SMCR+0)
MOVT	R0, #hi_addr(TIM2_SMCR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(TIM2_SMCR+0)
MOVT	R0, #hi_addr(TIM2_SMCR+0)
STR	R1, [R0, #0]
;Ex_8.c,62 :: 		set_TIM2_slave_selection(external_clock_mode_1);
MOVW	R0, #lo_addr(TIM2_SMCR+0)
MOVT	R0, #hi_addr(TIM2_SMCR+0)
LDR	R1, [R0, #0]
MVN	R0, #7
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_SMCR+0)
MOVT	R0, #hi_addr(TIM2_SMCR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_SMCR+0)
MOVT	R0, #hi_addr(TIM2_SMCR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #7
MOVW	R0, #lo_addr(TIM2_SMCR+0)
MOVT	R0, #hi_addr(TIM2_SMCR+0)
STR	R1, [R0, #0]
;Ex_8.c,63 :: 		enable_TIM2_update_interrupt(true);
MOVW	R0, #lo_addr(TIM2_DIERbits+0)
MOVT	R0, #hi_addr(TIM2_DIERbits+0)
STR	R3, [R0, #0]
;Ex_8.c,64 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Ex_8.c,65 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ex_8.c,66 :: 		enable_TIM2_counter(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R1, [R0, #0]
;Ex_8.c,67 :: 		}
L_end_setup_TIM2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_TIM2
