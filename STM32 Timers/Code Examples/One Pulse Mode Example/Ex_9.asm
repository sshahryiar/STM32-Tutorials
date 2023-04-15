_main:
;Ex_9.c,12 :: 		void main()
;Ex_9.c,14 :: 		setup();
BL	_setup+0
;Ex_9.c,16 :: 		while(1)
L_main0:
;Ex_9.c,18 :: 		};
IT	AL
BAL	L_main0
;Ex_9.c,19 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_9.c,22 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_9.c,24 :: 		setup_IO();
BL	_setup_IO+0
;Ex_9.c,25 :: 		setup_TIM2();
BL	_setup_TIM2+0
;Ex_9.c,26 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_setup_IO:
;Ex_9.c,29 :: 		void setup_IO()
;Ex_9.c,31 :: 		AFIO_enable(true);
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_9.c,32 :: 		AFIO_remap(TIM2_not_remapped);
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
STR	R1, [R0, #0]
;Ex_9.c,34 :: 		enable_GPIOA(true);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_9.c,35 :: 		setup_GPIOA(0, digital_input);
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
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_setup_IO11:
;Ex_9.c,36 :: 		enable_pull_down_GPIOA(0);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #254
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Ex_9.c,37 :: 		setup_GPIOA(1, (AFIO_PP_output | output_mode_high_speed));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_setup_IO24:
;Ex_9.c,38 :: 		}
L_end_setup_IO:
BX	LR
; end of _setup_IO
_setup_TIM2:
;Ex_9.c,41 :: 		void setup_TIM2()
;Ex_9.c,43 :: 		enable_TIM2(true);
MOVS	R3, #1
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R3, [R0, #0]
;Ex_9.c,44 :: 		enable_TIM2_counter(false);
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R2, [R0, #0]
;Ex_9.c,45 :: 		set_TIM2_counting_direction(up_counting);
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R2, [R0, #0]
;Ex_9.c,46 :: 		set_TIM2_clock_division(clock_division_tCK_INT);
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
;Ex_9.c,47 :: 		set_TIM2_CC1_selection(CC1_input_IC1_on_TI1);
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
;Ex_9.c,48 :: 		set_TIM2_CC1_state_and_polarity(enable, rising_edge);
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R3, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R2, [R0, #0]
;Ex_9.c,49 :: 		set_TIM2_CC2_selection(CC2_output);
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
STR	R1, [R0, #0]
;Ex_9.c,50 :: 		set_TIM2_CC2_state_and_polarity(enable, active_high);
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R3, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R2, [R0, #0]
;Ex_9.c,51 :: 		set_TIM2_OC2_compare_mode(PWM_mode_2);
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #28672
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #28672
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
STR	R1, [R0, #0]
;Ex_9.c,52 :: 		set_TIM2_trigger_source(Filtered_Timer_Input_1);
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
ORR	R1, R0, #80
MOVW	R0, #lo_addr(TIM2_SMCR+0)
MOVT	R0, #hi_addr(TIM2_SMCR+0)
STR	R1, [R0, #0]
;Ex_9.c,53 :: 		set_TIM2_slave_selection(trigger_mode);
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
ORR	R1, R0, #6
MOVW	R0, #lo_addr(TIM2_SMCR+0)
MOVT	R0, #hi_addr(TIM2_SMCR+0)
STR	R1, [R0, #0]
;Ex_9.c,54 :: 		TIM2_ARR = 60000;
MOVW	R1, #60000
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Ex_9.c,55 :: 		TIM2_PSC = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Ex_9.c,56 :: 		TIM2_CCR2 = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(TIM2_CCR2+0)
MOVT	R0, #hi_addr(TIM2_CCR2+0)
STR	R1, [R0, #0]
;Ex_9.c,57 :: 		enable_TIM2_counter(true);
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R3, [R0, #0]
;Ex_9.c,58 :: 		}
L_end_setup_TIM2:
BX	LR
; end of _setup_TIM2
