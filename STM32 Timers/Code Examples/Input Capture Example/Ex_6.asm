_TIM2_ISR:
;Ex_6.c,31 :: 		ics ICS_AUTO
;Ex_6.c,33 :: 		if(TIM2_SRbits.UIF == 1)
MOVW	R1, #lo_addr(TIM2_SRbits+0)
MOVT	R1, #hi_addr(TIM2_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_TIM2_ISR0
;Ex_6.c,35 :: 		TIM2_SRbits.UIF = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_SRbits+0)
MOVT	R0, #hi_addr(TIM2_SRbits+0)
STR	R1, [R0, #0]
;Ex_6.c,36 :: 		overflow_count++;
MOVW	R1, #lo_addr(_overflow_count+0)
MOVT	R1, #hi_addr(_overflow_count+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Ex_6.c,37 :: 		}
L_TIM2_ISR0:
;Ex_6.c,39 :: 		if(TIM2_SRbits.CC1IF == 1)
MOVW	R1, #lo_addr(TIM2_SRbits+0)
MOVT	R1, #hi_addr(TIM2_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_TIM2_ISR1
;Ex_6.c,41 :: 		TIM2_SRbits.CC1IF = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_SRbits+0)
MOVT	R0, #hi_addr(TIM2_SRbits+0)
STR	R1, [R0, #0]
;Ex_6.c,42 :: 		end_time = TIM2_CCR1;
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
MOVW	R3, #lo_addr(_end_time+0)
MOVT	R3, #hi_addr(_end_time+0)
STR	R0, [R3, #0]
;Ex_6.c,43 :: 		pulse_ticks = ((overflow_count << 16) - start_time + end_time);
MOVW	R2, #lo_addr(_start_time+0)
MOVT	R2, #hi_addr(_start_time+0)
LDR	R0, [R2, #0]
RSBS	R1, R0, #0
MOV	R0, R3
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_pulse_ticks+0)
MOVT	R0, #hi_addr(_pulse_ticks+0)
STR	R1, [R0, #0]
;Ex_6.c,44 :: 		start_time = end_time;
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R2, #0]
;Ex_6.c,45 :: 		overflow_count = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_overflow_count+0)
MOVT	R0, #hi_addr(_overflow_count+0)
STRH	R1, [R0, #0]
;Ex_6.c,46 :: 		}
L_TIM2_ISR1:
;Ex_6.c,47 :: 		}
L_end_TIM2_ISR:
BX	LR
; end of _TIM2_ISR
_main:
;Ex_6.c,50 :: 		void main()
SUB	SP, SP, #44
;Ex_6.c,54 :: 		setup();
BL	_setup+0
;Ex_6.c,56 :: 		while(1)
L_main2:
;Ex_6.c,58 :: 		f = (float)pulse_ticks;
MOVW	R0, #lo_addr(_pulse_ticks+0)
MOVT	R0, #hi_addr(_pulse_ticks+0)
LDR	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
STR	R0, [SP, #40]
MOVW	R0, #lo_addr(_f+0)
MOVT	R0, #hi_addr(_f+0)
STR	R0, [SP, #36]
STR	R1, [SP, #0]
LDR	R1, [SP, #40]
STR	R1, [R0, #0]
LDR	R1, [SP, #0]
;Ex_6.c,59 :: 		f = (1000000 / f);
MOVW	R0, #9216
MOVT	R0, #18804
STR	R1, [SP, #0]
LDR	R1, [SP, #40]
MOV	R2, R1
BL	__Div_FP+0
LDR	R1, [SP, #0]
LDR	R1, [SP, #36]
STR	R0, [R1, #0]
;Ex_6.c,60 :: 		lcd_out(2, 1, "               ");
ADD	R11, SP, #19
ADD	R10, R11, #16
MOVW	R12, #lo_addr(?ICS?lstr1_Ex_6+0)
MOVT	R12, #hi_addr(?ICS?lstr1_Ex_6+0)
BL	___CC2DW+0
ADD	R0, SP, #19
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;Ex_6.c,61 :: 		FloatToStr(f, txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_f+0)
MOVT	R0, #hi_addr(_f+0)
LDR	R0, [R0, #0]
BL	_FloatToStr+0
;Ex_6.c,62 :: 		lcd_out(2, 1, txt);
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;Ex_6.c,63 :: 		delay_ms(600);
MOVW	R7, #56575
MOVT	R7, #109
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;Ex_6.c,64 :: 		};
IT	AL
BAL	L_main2
;Ex_6.c,65 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_6.c,68 :: 		void setup()
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Ex_6.c,70 :: 		setup_IO();
BL	_setup_IO+0
;Ex_6.c,72 :: 		setup_TIM2();
BL	_setup_TIM2+0
;Ex_6.c,73 :: 		setup_TIM3();
BL	_setup_TIM3+0
;Ex_6.c,75 :: 		Lcd_Init();
BL	_Lcd_Init+0
;Ex_6.c,76 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Ex_6.c,77 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;Ex_6.c,78 :: 		Lcd_Out(1, 1, "Frequency/Hz:");
ADD	R11, SP, #4
ADD	R10, R11, #14
MOVW	R12, #lo_addr(?ICS?lstr2_Ex_6+0)
MOVT	R12, #hi_addr(?ICS?lstr2_Ex_6+0)
BL	___CC2DW+0
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_6.c,79 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _setup
_setup_IO:
;Ex_6.c,82 :: 		void setup_IO()
;Ex_6.c,84 :: 		AFIO_enable(true);
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_6.c,85 :: 		AFIO_remap(TIM2_not_remapped);
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
STR	R1, [R0, #0]
;Ex_6.c,86 :: 		AFIO_remap(TIM3_not_remapped);
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
STR	R1, [R0, #0]
;Ex_6.c,88 :: 		enable_GPIOA(true);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_6.c,89 :: 		setup_GPIOA(0, digital_input);
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
L_setup_IO15:
;Ex_6.c,90 :: 		enable_pull_down_GPIOA(0);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #254
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Ex_6.c,91 :: 		setup_GPIOA(6, (AFIO_PP_output | output_mode_high_speed));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #184549376
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_setup_IO28:
;Ex_6.c,93 :: 		enable_GPIOD(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_6.c,94 :: 		setup_GPIOD(8, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO35:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_6.c,95 :: 		setup_GPIOD(9, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO46:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_6.c,96 :: 		setup_GPIOD(10, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO57:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_6.c,97 :: 		setup_GPIOD(11, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO68:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_6.c,98 :: 		setup_GPIOD(12, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO79:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #983040
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_6.c,99 :: 		setup_GPIOD(13, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO90:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_6.c,100 :: 		}
L_end_setup_IO:
BX	LR
; end of _setup_IO
_setup_TIM2:
;Ex_6.c,103 :: 		void setup_TIM2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_6.c,105 :: 		enable_TIM2(true);
MOVS	R3, #1
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R3, [R0, #0]
;Ex_6.c,106 :: 		enable_TIM2_counter(false);
MOVS	R2, #0
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R2, [R0, #0]
;Ex_6.c,107 :: 		TIM2_ARR = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Ex_6.c,108 :: 		TIM2_PSC = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Ex_6.c,109 :: 		set_TIM2_counting_direction(up_counting);
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R2, [R0, #0]
;Ex_6.c,110 :: 		set_TIM2_clock_division(clock_division_tCK_INT);
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
;Ex_6.c,111 :: 		set_TIM2_CC1_selection(CC1_input_IC1_on_TI1);
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
;Ex_6.c,112 :: 		set_TIM2_CC1_state_and_polarity(enable, rising_edge);
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R3, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R2, [R0, #0]
;Ex_6.c,113 :: 		set_TIM2_IC1_input_prescalar(0);
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Ex_6.c,114 :: 		set_TIM2_IC1_filter(0);
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Ex_6.c,115 :: 		enable_TIM2_CC1_interrupt(true);
MOVW	R0, #lo_addr(TIM2_DIERbits+0)
MOVT	R0, #hi_addr(TIM2_DIERbits+0)
STR	R3, [R0, #0]
;Ex_6.c,116 :: 		enable_TIM2_update_interrupt(true);
MOVW	R0, #lo_addr(TIM2_DIERbits+0)
MOVT	R0, #hi_addr(TIM2_DIERbits+0)
STR	R3, [R0, #0]
;Ex_6.c,117 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Ex_6.c,118 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ex_6.c,119 :: 		enable_TIM2_counter(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R1, [R0, #0]
;Ex_6.c,120 :: 		}
L_end_setup_TIM2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_TIM2
_setup_TIM3:
;Ex_6.c,123 :: 		void setup_TIM3()
;Ex_6.c,125 :: 		enable_TIM3(true);
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;Ex_6.c,126 :: 		enable_TIM3_counter(false);
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CR1bits+0)
MOVT	R0, #hi_addr(TIM3_CR1bits+0)
STR	R1, [R0, #0]
;Ex_6.c,127 :: 		set_TIM3_counting_direction(up_counting);
MOVW	R0, #lo_addr(TIM3_CR1bits+0)
MOVT	R0, #hi_addr(TIM3_CR1bits+0)
STR	R1, [R0, #0]
;Ex_6.c,128 :: 		TIM3_ARR = 799;
MOVW	R1, #799
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Ex_6.c,129 :: 		TIM3_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Ex_6.c,130 :: 		set_TIM3_OC1_compare_mode(PWM_mode_1);
MOVW	R0, #lo_addr(TIM3_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #112
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM3_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #96
MOVW	R0, #lo_addr(TIM3_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Output+0)
STR	R1, [R0, #0]
;Ex_6.c,131 :: 		set_TIM3_CC1_state_and_polarity(enable, active_low);
MOVW	R0, #lo_addr(TIM3_CCERbits+0)
MOVT	R0, #hi_addr(TIM3_CCERbits+0)
STR	R2, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CCERbits+0)
MOVT	R0, #hi_addr(TIM3_CCERbits+0)
STR	R2, [R0, #0]
;Ex_6.c,132 :: 		enable_TIM3_counter(true);
MOVW	R0, #lo_addr(TIM3_CR1bits+0)
MOVT	R0, #hi_addr(TIM3_CR1bits+0)
STR	R2, [R0, #0]
;Ex_6.c,133 :: 		TIM3_CCR1 = 400;
MOVW	R1, #400
MOVW	R0, #lo_addr(TIM3_CCR1+0)
MOVT	R0, #hi_addr(TIM3_CCR1+0)
STR	R1, [R0, #0]
;Ex_6.c,134 :: 		}
L_end_setup_TIM3:
BX	LR
; end of _setup_TIM3
