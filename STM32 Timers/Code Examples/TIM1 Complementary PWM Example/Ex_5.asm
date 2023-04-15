_main:
;Ex_5.c,12 :: 		void main()
SUB	SP, SP, #4
;Ex_5.c,14 :: 		unsigned int duty = 0;
; duty start address is: 0 (R0)
MOVW	R0, #0
;Ex_5.c,16 :: 		setup();
STRH	R0, [SP, #0]
; duty end address is: 0 (R0)
BL	_setup+0
LDRH	R0, [SP, #0]
UXTH	R1, R0
;Ex_5.c,18 :: 		while(1)
L_main0:
;Ex_5.c,20 :: 		while(duty < 1600)
; duty start address is: 4 (R1)
; duty end address is: 4 (R1)
L_main2:
; duty start address is: 4 (R1)
CMP	R1, #1600
IT	CS
BCS	L_main3
;Ex_5.c,22 :: 		TIM1_CCR1 = duty;
MOVW	R0, #lo_addr(TIM1_CCR1+0)
MOVT	R0, #hi_addr(TIM1_CCR1+0)
STR	R1, [R0, #0]
;Ex_5.c,23 :: 		duty++;
ADDS	R1, R1, #1
UXTH	R1, R1
;Ex_5.c,24 :: 		delay_ms(1);
MOVW	R7, #11999
MOVT	R7, #0
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;Ex_5.c,25 :: 		}
IT	AL
BAL	L_main2
L_main3:
;Ex_5.c,26 :: 		while(duty > 0)
L_main6:
; duty end address is: 4 (R1)
; duty start address is: 4 (R1)
CMP	R1, #0
IT	LS
BLS	L_main7
;Ex_5.c,28 :: 		TIM1_CCR1 = duty;
MOVW	R0, #lo_addr(TIM1_CCR1+0)
MOVT	R0, #hi_addr(TIM1_CCR1+0)
STR	R1, [R0, #0]
;Ex_5.c,29 :: 		duty--;
SUBS	R1, R1, #1
UXTH	R1, R1
;Ex_5.c,30 :: 		delay_ms(1);
MOVW	R7, #11999
MOVT	R7, #0
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
;Ex_5.c,31 :: 		}
IT	AL
BAL	L_main6
L_main7:
;Ex_5.c,33 :: 		};
; duty end address is: 4 (R1)
IT	AL
BAL	L_main0
;Ex_5.c,34 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_5.c,37 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_5.c,39 :: 		setup_IO();
BL	_setup_IO+0
;Ex_5.c,40 :: 		setup_TIM1();
BL	_setup_TIM1+0
;Ex_5.c,41 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_setup_IO:
;Ex_5.c,44 :: 		void setup_IO()
;Ex_5.c,46 :: 		AFIO_enable(true);
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_5.c,47 :: 		AFIO_remap(TIM1_not_remapped);
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
STR	R1, [R0, #0]
;Ex_5.c,49 :: 		enable_GPIOA(true);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_5.c,50 :: 		setup_GPIOA(8, (AFIO_PP_output | output_mode_high_speed));
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
;Ex_5.c,52 :: 		enable_GPIOB(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_5.c,53 :: 		setup_GPIOB(13, (AFIO_PP_output | output_mode_high_speed));
L_setup_IO24:
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #11534336
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;Ex_5.c,54 :: 		}
L_end_setup_IO:
BX	LR
; end of _setup_IO
_setup_TIM1:
;Ex_5.c,57 :: 		void setup_TIM1()
;Ex_5.c,59 :: 		enable_TIM1(true);
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_5.c,60 :: 		enable_TIM1_counter(false);
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM1_CR1bits+0)
MOVT	R0, #hi_addr(TIM1_CR1bits+0)
STR	R1, [R0, #0]
;Ex_5.c,61 :: 		set_TIM1_counting_direction(up_counting);
MOVW	R0, #lo_addr(TIM1_CR1bits+0)
MOVT	R0, #hi_addr(TIM1_CR1bits+0)
STR	R1, [R0, #0]
;Ex_5.c,62 :: 		TIM1_ARR = 1599;
MOVW	R1, #1599
MOVW	R0, #lo_addr(TIM1_ARR+0)
MOVT	R0, #hi_addr(TIM1_ARR+0)
STR	R1, [R0, #0]
;Ex_5.c,63 :: 		TIM1_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM1_PSC+0)
MOVT	R0, #hi_addr(TIM1_PSC+0)
STR	R1, [R0, #0]
;Ex_5.c,64 :: 		set_TIM1_OC1_compare_mode(PWM_mode_1);
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
;Ex_5.c,65 :: 		set_TIM1_CC1_state_and_polarity(enable, active_low);
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R2, [R0, #0]
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R2, [R0, #0]
;Ex_5.c,66 :: 		set_TIM1_CC1_complementary_output_state_and_polarity(enable, active_low);
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R2, [R0, #0]
MOVW	R0, #lo_addr(TIM1_CCERbits+0)
MOVT	R0, #hi_addr(TIM1_CCERbits+0)
STR	R2, [R0, #0]
;Ex_5.c,67 :: 		set_TIM1_off_state_selection_for_run_mode(enable);
MOVW	R0, #lo_addr(TIM1_BDTRbits+0)
MOVT	R0, #hi_addr(TIM1_BDTRbits+0)
STR	R2, [R0, #0]
;Ex_5.c,68 :: 		set_TIM1_dead_time(77);
MOVW	R0, #lo_addr(TIM1_BDTR+0)
MOVT	R0, #hi_addr(TIM1_BDTR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #0
MOVW	R0, #lo_addr(TIM1_BDTR+0)
MOVT	R0, #hi_addr(TIM1_BDTR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM1_BDTR+0)
MOVT	R0, #hi_addr(TIM1_BDTR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #77
MOVW	R0, #lo_addr(TIM1_BDTR+0)
MOVT	R0, #hi_addr(TIM1_BDTR+0)
STR	R1, [R0, #0]
;Ex_5.c,69 :: 		enable_TIM1_main_output(true);
MOVW	R0, #lo_addr(TIM1_BDTRbits+0)
MOVT	R0, #hi_addr(TIM1_BDTRbits+0)
STR	R2, [R0, #0]
;Ex_5.c,70 :: 		set_TIM1_CC_preload_control(true);
MOVW	R0, #lo_addr(TIM1_CR2bits+0)
MOVT	R0, #hi_addr(TIM1_CR2bits+0)
STR	R2, [R0, #0]
;Ex_5.c,71 :: 		set_TIM1_auto_reload_preload_mode(true);
MOVW	R0, #lo_addr(TIM1_CR1bits+0)
MOVT	R0, #hi_addr(TIM1_CR1bits+0)
STR	R2, [R0, #0]
;Ex_5.c,72 :: 		enable_TIM1_counter(true);
MOVW	R0, #lo_addr(TIM1_CR1bits+0)
MOVT	R0, #hi_addr(TIM1_CR1bits+0)
STR	R2, [R0, #0]
;Ex_5.c,73 :: 		}
L_end_setup_TIM1:
BX	LR
; end of _setup_TIM1
