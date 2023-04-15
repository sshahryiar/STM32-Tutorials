_main:
;Ex_4.c,14 :: 		void main()
SUB	SP, SP, #4
;Ex_4.c,16 :: 		unsigned int duty = 0;
; duty start address is: 0 (R0)
MOVW	R0, #0
;Ex_4.c,18 :: 		setup();
STRH	R0, [SP, #0]
; duty end address is: 0 (R0)
BL	_setup+0
LDRH	R0, [SP, #0]
UXTH	R1, R0
;Ex_4.c,20 :: 		while(1)
L_main0:
;Ex_4.c,22 :: 		while(duty < 1600)
; duty start address is: 4 (R1)
; duty end address is: 4 (R1)
L_main2:
; duty start address is: 4 (R1)
CMP	R1, #1600
IT	CS
BCS	L_main3
;Ex_4.c,24 :: 		TIM1_CCR1 = duty;
MOVW	R0, #lo_addr(TIM1_CCR1+0)
MOVT	R0, #hi_addr(TIM1_CCR1+0)
STR	R1, [R0, #0]
;Ex_4.c,25 :: 		TIM1_CCR2 = duty;
MOVW	R0, #lo_addr(TIM1_CCR2+0)
MOVT	R0, #hi_addr(TIM1_CCR2+0)
STR	R1, [R0, #0]
;Ex_4.c,26 :: 		TIM1_CCR3 = duty;
MOVW	R0, #lo_addr(TIM1_CCR3+0)
MOVT	R0, #hi_addr(TIM1_CCR3+0)
STR	R1, [R0, #0]
;Ex_4.c,27 :: 		TIM1_CCR4 = duty;
MOVW	R0, #lo_addr(TIM1_CCR4+0)
MOVT	R0, #hi_addr(TIM1_CCR4+0)
STR	R1, [R0, #0]
;Ex_4.c,28 :: 		TIM8_CCR1 = duty;
MOVW	R0, #lo_addr(TIM8_CCR1+0)
MOVT	R0, #hi_addr(TIM8_CCR1+0)
STR	R1, [R0, #0]
;Ex_4.c,29 :: 		TIM8_CCR2 = duty;
MOVW	R0, #lo_addr(TIM8_CCR2+0)
MOVT	R0, #hi_addr(TIM8_CCR2+0)
STR	R1, [R0, #0]
;Ex_4.c,30 :: 		TIM8_CCR3 = duty;
MOVW	R0, #lo_addr(TIM8_CCR3+0)
MOVT	R0, #hi_addr(TIM8_CCR3+0)
STR	R1, [R0, #0]
;Ex_4.c,31 :: 		TIM8_CCR4 = duty;
MOVW	R0, #lo_addr(TIM8_CCR4+0)
MOVT	R0, #hi_addr(TIM8_CCR4+0)
STR	R1, [R0, #0]
;Ex_4.c,32 :: 		duty++;
ADDS	R1, R1, #1
UXTH	R1, R1
;Ex_4.c,33 :: 		delay_ms(4);
MOVW	R7, #47999
MOVT	R7, #0
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;Ex_4.c,34 :: 		}
IT	AL
BAL	L_main2
L_main3:
;Ex_4.c,35 :: 		while(duty > 0)
L_main6:
; duty end address is: 4 (R1)
; duty start address is: 4 (R1)
CMP	R1, #0
IT	LS
BLS	L_main7
;Ex_4.c,37 :: 		TIM1_CCR1 = duty;
MOVW	R0, #lo_addr(TIM1_CCR1+0)
MOVT	R0, #hi_addr(TIM1_CCR1+0)
STR	R1, [R0, #0]
;Ex_4.c,38 :: 		TIM1_CCR2 = duty;
MOVW	R0, #lo_addr(TIM1_CCR2+0)
MOVT	R0, #hi_addr(TIM1_CCR2+0)
STR	R1, [R0, #0]
;Ex_4.c,39 :: 		TIM1_CCR3 = duty;
MOVW	R0, #lo_addr(TIM1_CCR3+0)
MOVT	R0, #hi_addr(TIM1_CCR3+0)
STR	R1, [R0, #0]
;Ex_4.c,40 :: 		TIM1_CCR4 = duty;
MOVW	R0, #lo_addr(TIM1_CCR4+0)
MOVT	R0, #hi_addr(TIM1_CCR4+0)
STR	R1, [R0, #0]
;Ex_4.c,41 :: 		TIM8_CCR1 = duty;
MOVW	R0, #lo_addr(TIM8_CCR1+0)
MOVT	R0, #hi_addr(TIM8_CCR1+0)
STR	R1, [R0, #0]
;Ex_4.c,42 :: 		TIM8_CCR2 = duty;
MOVW	R0, #lo_addr(TIM8_CCR2+0)
MOVT	R0, #hi_addr(TIM8_CCR2+0)
STR	R1, [R0, #0]
;Ex_4.c,43 :: 		TIM8_CCR3 = duty;
MOVW	R0, #lo_addr(TIM8_CCR3+0)
MOVT	R0, #hi_addr(TIM8_CCR3+0)
STR	R1, [R0, #0]
;Ex_4.c,44 :: 		TIM8_CCR4 = duty;
MOVW	R0, #lo_addr(TIM8_CCR4+0)
MOVT	R0, #hi_addr(TIM8_CCR4+0)
STR	R1, [R0, #0]
;Ex_4.c,45 :: 		duty--;
SUBS	R1, R1, #1
UXTH	R1, R1
;Ex_4.c,46 :: 		delay_ms(4);
MOVW	R7, #47999
MOVT	R7, #0
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
;Ex_4.c,47 :: 		}
IT	AL
BAL	L_main6
L_main7:
;Ex_4.c,49 :: 		};
; duty end address is: 4 (R1)
IT	AL
BAL	L_main0
;Ex_4.c,50 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_4.c,53 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_4.c,55 :: 		setup_IO();
BL	_setup_IO+0
;Ex_4.c,56 :: 		setup_TIM1();
BL	_setup_TIM1+0
;Ex_4.c,57 :: 		setup_TIM8();
BL	_setup_TIM8+0
;Ex_4.c,58 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_setup_IO:
;Ex_4.c,61 :: 		void setup_IO()
;Ex_4.c,63 :: 		AFIO_enable(true);
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_4.c,64 :: 		AFIO_remap(TIM1_not_remapped);
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
STR	R1, [R0, #0]
;Ex_4.c,66 :: 		enable_GPIOA(true);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_4.c,67 :: 		setup_GPIOA(8, (AFIO_PP_output | output_mode_high_speed));
L_setup_IO13:
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;Ex_4.c,68 :: 		setup_GPIOA(9, (AFIO_PP_output | output_mode_high_speed));
L_setup_IO24:
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;Ex_4.c,69 :: 		setup_GPIOA(10, (AFIO_PP_output | output_mode_high_speed));
L_setup_IO35:
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;Ex_4.c,70 :: 		setup_GPIOA(11, (AFIO_PP_output | output_mode_high_speed));
L_setup_IO46:
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #45056
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;Ex_4.c,72 :: 		enable_GPIOC(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_4.c,73 :: 		setup_GPIOC(6, (AFIO_PP_output | output_mode_high_speed));
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
ORR	R1, R0, #184549376
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
L_setup_IO63:
;Ex_4.c,74 :: 		setup_GPIOC(7, (AFIO_PP_output | output_mode_high_speed));
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
ORR	R1, R0, #-1342177280
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
L_setup_IO76:
;Ex_4.c,75 :: 		setup_GPIOC(8, (AFIO_PP_output | output_mode_high_speed));
L_setup_IO83:
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;Ex_4.c,76 :: 		setup_GPIOC(9, (AFIO_PP_output | output_mode_high_speed));
L_setup_IO94:
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;Ex_4.c,77 :: 		}
L_end_setup_IO:
BX	LR
; end of _setup_IO
_setup_TIM1:
;Ex_4.c,80 :: 		void setup_TIM1()
;Ex_4.c,82 :: 		enable_TIM1(true);
MOVS	R3, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R3, [R0, #0]
;Ex_4.c,83 :: 		enable_TIM1_counter(false);
MOVS	R2, #0
MOVW	R0, #lo_addr(TIM1_CR1bits+0)
MOVT	R0, #hi_addr(TIM1_CR1bits+0)
STR	R2, [R0, #0]
;Ex_4.c,84 :: 		set_TIM1_counting_direction(up_counting);
MOVW	R0, #lo_addr(TIM1_CR1bits+0)
MOVT	R0, #hi_addr(TIM1_CR1bits+0)
STR	R2, [R0, #0]
;Ex_4.c,85 :: 		TIM1_ARR = 1599;
MOVW	R1, #1599
MOVW	R0, #lo_addr(TIM1_ARR+0)
MOVT	R0, #hi_addr(TIM1_ARR+0)
STR	R1, [R0, #0]
;Ex_4.c,86 :: 		TIM1_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM1_PSC+0)
MOVT	R0, #hi_addr(TIM1_PSC+0)
STR	R1, [R0, #0]
;Ex_4.c,87 :: 		set_TIM1_OC1_compare_mode(PWM_mode_1);
MOVW	R0, #lo_addr(TIM1_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #112
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM1_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM1_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #96
MOVW	R0, #lo_addr(TIM1_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Output+0)
STR	R1, [R0, #0]
;Ex_4.c,88 :: 		set_TIM1_OC2_compare_mode(PWM_mode_1);
MOVW	R0, #lo_addr(TIM1_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #28672
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM1_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM1_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #24576
MOVW	R0, #lo_addr(TIM1_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR1_Output+0)
STR	R1, [R0, #0]
;Ex_4.c,89 :: 		set_TIM1_OC3_compare_mode(PWM_mode_2);
MOVW	R0, #lo_addr(TIM1_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR2_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #112
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM1_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR2_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM1_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR2_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #112
MOVW	R0, #lo_addr(TIM1_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR2_Output+0)
STR	R1, [R0, #0]
;Ex_4.c,90 :: 		set_TIM1_OC4_compare_mode(PWM_mode_2);
MOVW	R0, #lo_addr(TIM1_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR2_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #28672
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM1_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR2_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM1_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR2_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #28672
MOVW	R0, #lo_addr(TIM1_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM1_CCMR2_Output+0)
STR	R1, [R0, #0]
;Ex_4.c,91 :: 		set_TIM1_CC1_state_and_polarity(enable, active_high);
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R3, [R0, #0]
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R2, [R0, #0]
;Ex_4.c,92 :: 		set_TIM1_CC2_state_and_polarity(enable, active_high);
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R3, [R0, #0]
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R2, [R0, #0]
;Ex_4.c,93 :: 		set_TIM1_CC3_state_and_polarity(enable, active_high);
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R3, [R0, #0]
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R2, [R0, #0]
;Ex_4.c,94 :: 		set_TIM1_CC4_state_and_polarity(enable, active_high);
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R3, [R0, #0]
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R2, [R0, #0]
;Ex_4.c,95 :: 		enable_TIM1_main_output(true);
MOVW	R0, #lo_addr(TIM1_BDTRbits+0)
MOVT	R0, #hi_addr(TIM1_BDTRbits+0)
STR	R3, [R0, #0]
;Ex_4.c,96 :: 		set_TIM1_CC_preload_control(true);
MOVW	R0, #lo_addr(TIM1_CR2bits+0)
MOVT	R0, #hi_addr(TIM1_CR2bits+0)
STR	R3, [R0, #0]
;Ex_4.c,97 :: 		set_TIM1_auto_reload_preload_mode(true);
MOVW	R0, #lo_addr(TIM1_CR1bits+0)
MOVT	R0, #hi_addr(TIM1_CR1bits+0)
STR	R3, [R0, #0]
;Ex_4.c,98 :: 		enable_TIM1_counter(true);
MOVW	R0, #lo_addr(TIM1_CR1bits+0)
MOVT	R0, #hi_addr(TIM1_CR1bits+0)
STR	R3, [R0, #0]
;Ex_4.c,99 :: 		}
L_end_setup_TIM1:
BX	LR
; end of _setup_TIM1
_setup_TIM8:
;Ex_4.c,102 :: 		void setup_TIM8()
;Ex_4.c,104 :: 		enable_TIM8(true);
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_4.c,105 :: 		enable_TIM8_counter(false);
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM8_CR1bits+0)
MOVT	R0, #hi_addr(TIM8_CR1bits+0)
STR	R1, [R0, #0]
;Ex_4.c,106 :: 		set_TIM8_counting_direction(down_counting);
MOVW	R0, #lo_addr(TIM8_CR1bits+0)
MOVT	R0, #hi_addr(TIM8_CR1bits+0)
STR	R2, [R0, #0]
;Ex_4.c,107 :: 		TIM8_ARR = 1599;
MOVW	R1, #1599
MOVW	R0, #lo_addr(TIM8_ARR+0)
MOVT	R0, #hi_addr(TIM8_ARR+0)
STR	R1, [R0, #0]
;Ex_4.c,108 :: 		TIM8_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM8_PSC+0)
MOVT	R0, #hi_addr(TIM8_PSC+0)
STR	R1, [R0, #0]
;Ex_4.c,109 :: 		set_TIM8_OC1_compare_mode(PWM_mode_1);
MOVW	R0, #lo_addr(TIM8_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR1_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #112
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM8_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR1_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM8_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR1_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #96
MOVW	R0, #lo_addr(TIM8_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR1_Output+0)
STR	R1, [R0, #0]
;Ex_4.c,110 :: 		set_TIM8_OC2_compare_mode(PWM_mode_1);
MOVW	R0, #lo_addr(TIM8_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR1_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #28672
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM8_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR1_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM8_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR1_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #24576
MOVW	R0, #lo_addr(TIM8_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR1_Output+0)
STR	R1, [R0, #0]
;Ex_4.c,111 :: 		set_TIM8_OC3_compare_mode(PWM_mode_2);
MOVW	R0, #lo_addr(TIM8_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR2_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #112
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM8_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR2_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM8_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR2_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #112
MOVW	R0, #lo_addr(TIM8_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR2_Output+0)
STR	R1, [R0, #0]
;Ex_4.c,112 :: 		set_TIM8_OC4_compare_mode(PWM_mode_2);
MOVW	R0, #lo_addr(TIM8_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR2_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #28672
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM8_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR2_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM8_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR2_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #28672
MOVW	R0, #lo_addr(TIM8_CCMR2_Output+0)
MOVT	R0, #hi_addr(TIM8_CCMR2_Output+0)
STR	R1, [R0, #0]
;Ex_4.c,113 :: 		set_TIM8_CC1_state_and_polarity(enable, active_low);
MOVW	R0, #lo_addr(TIM8_CCERbits+0)
MOVT	R0, #hi_addr(TIM8_CCERbits+0)
STR	R2, [R0, #0]
MOVW	R0, #lo_addr(TIM8_CCERbits+0)
MOVT	R0, #hi_addr(TIM8_CCERbits+0)
STR	R2, [R0, #0]
;Ex_4.c,114 :: 		set_TIM8_CC2_state_and_polarity(enable, active_low);
MOVW	R0, #lo_addr(TIM8_CCERbits+0)
MOVT	R0, #hi_addr(TIM8_CCERbits+0)
STR	R2, [R0, #0]
MOVW	R0, #lo_addr(TIM8_CCERbits+0)
MOVT	R0, #hi_addr(TIM8_CCERbits+0)
STR	R2, [R0, #0]
;Ex_4.c,115 :: 		set_TIM8_CC3_state_and_polarity(enable, active_low);
MOVW	R0, #lo_addr(TIM8_CCERbits+0)
MOVT	R0, #hi_addr(TIM8_CCERbits+0)
STR	R2, [R0, #0]
MOVW	R0, #lo_addr(TIM8_CCERbits+0)
MOVT	R0, #hi_addr(TIM8_CCERbits+0)
STR	R2, [R0, #0]
;Ex_4.c,116 :: 		set_TIM8_CC4_state_and_polarity(enable, active_low);
MOVW	R0, #lo_addr(TIM8_CCERbits+0)
MOVT	R0, #hi_addr(TIM8_CCERbits+0)
STR	R2, [R0, #0]
MOVW	R0, #lo_addr(TIM8_CCERbits+0)
MOVT	R0, #hi_addr(TIM8_CCERbits+0)
STR	R2, [R0, #0]
;Ex_4.c,117 :: 		enable_TIM8_main_output(true);
MOVW	R0, #lo_addr(TIM8_BDTRbits+0)
MOVT	R0, #hi_addr(TIM8_BDTRbits+0)
STR	R2, [R0, #0]
;Ex_4.c,118 :: 		set_TIM8_CC_preload_control(true);
MOVW	R0, #lo_addr(TIM8_CR2bits+0)
MOVT	R0, #hi_addr(TIM8_CR2bits+0)
STR	R2, [R0, #0]
;Ex_4.c,119 :: 		set_TIM8_auto_reload_preload_mode(true);
MOVW	R0, #lo_addr(TIM8_CR1bits+0)
MOVT	R0, #hi_addr(TIM8_CR1bits+0)
STR	R2, [R0, #0]
;Ex_4.c,120 :: 		enable_TIM8_counter(true);
MOVW	R0, #lo_addr(TIM8_CR1bits+0)
MOVT	R0, #hi_addr(TIM8_CR1bits+0)
STR	R2, [R0, #0]
;Ex_4.c,121 :: 		}
L_end_setup_TIM8:
BX	LR
; end of _setup_TIM8
