_ext_int:
;DAC_ex5.c,15 :: 		ics ICS_AUTO
;DAC_ex5.c,17 :: 		if(read_pending_reg(9) != 0)
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #512
CMP	R0, #0
IT	EQ
BEQ	L_ext_int0
;DAC_ex5.c,19 :: 		pending_clr(9);
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,20 :: 		bit_clr(GPIOA_ODR, 6);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #64
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,21 :: 		delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_ext_int1:
SUBS	R7, R7, #1
BNE	L_ext_int1
NOP
NOP
NOP
;DAC_ex5.c,22 :: 		bit_set(GPIOA_ODR, 6);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,23 :: 		}
L_ext_int0:
;DAC_ex5.c,24 :: 		}
L_end_ext_int:
BX	LR
; end of _ext_int
_main:
;DAC_ex5.c,27 :: 		void main()
SUB	SP, SP, #4
;DAC_ex5.c,29 :: 		signed int value = 0;
; value start address is: 4 (R1)
MOVW	R1, #0
SXTH	R1, R1
;DAC_ex5.c,31 :: 		setup();
STRH	R1, [SP, #0]
; value end address is: 4 (R1)
BL	_setup+0
LDRSH	R1, [SP, #0]
;DAC_ex5.c,33 :: 		while(1)
L_main3:
;DAC_ex5.c,35 :: 		if(get_input(GPIOF_IDR, 13) == 0)
; value start address is: 4 (R1)
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #8192
CMP	R0, #0
IT	NE
BNE	L__main53
;DAC_ex5.c,37 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
;DAC_ex5.c,38 :: 		value++;
ADDS	R1, R1, #1
SXTH	R1, R1
; value end address is: 4 (R1)
;DAC_ex5.c,39 :: 		}
IT	AL
BAL	L_main5
L__main53:
;DAC_ex5.c,35 :: 		if(get_input(GPIOF_IDR, 13) == 0)
;DAC_ex5.c,39 :: 		}
L_main5:
;DAC_ex5.c,41 :: 		if(get_input(GPIOF_IDR, 14) == 0)
; value start address is: 4 (R1)
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #16384
CMP	R0, #0
IT	NE
BNE	L__main54
;DAC_ex5.c,43 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_main9:
SUBS	R7, R7, #1
BNE	L_main9
NOP
NOP
NOP
;DAC_ex5.c,44 :: 		value--;
SUBS	R1, R1, #1
SXTH	R1, R1
; value end address is: 4 (R1)
;DAC_ex5.c,45 :: 		}
IT	AL
BAL	L_main8
L__main54:
;DAC_ex5.c,41 :: 		if(get_input(GPIOF_IDR, 14) == 0)
;DAC_ex5.c,45 :: 		}
L_main8:
;DAC_ex5.c,47 :: 		if(value > 2047)
; value start address is: 4 (R1)
MOVW	R0, #2047
CMP	R1, R0
IT	LE
BLE	L__main55
; value end address is: 4 (R1)
;DAC_ex5.c,49 :: 		value = 2047;
; value start address is: 8 (R2)
MOVW	R2, #2047
SXTH	R2, R2
; value end address is: 8 (R2)
;DAC_ex5.c,50 :: 		}
IT	AL
BAL	L_main11
L__main55:
;DAC_ex5.c,47 :: 		if(value > 2047)
SXTH	R2, R1
;DAC_ex5.c,50 :: 		}
L_main11:
;DAC_ex5.c,51 :: 		if(value < 0)
; value start address is: 8 (R2)
CMP	R2, #0
IT	GE
BGE	L__main56
;DAC_ex5.c,53 :: 		value = 0;
MOVS	R2, #0
SXTH	R2, R2
; value end address is: 8 (R2)
;DAC_ex5.c,54 :: 		}
IT	AL
BAL	L_main12
L__main56:
;DAC_ex5.c,51 :: 		if(value < 0)
;DAC_ex5.c,54 :: 		}
L_main12:
;DAC_ex5.c,55 :: 		set_DAC1_software_trigger(enable);
; value start address is: 8 (R2)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(DAC_SWTRIGRbits+0)
MOVT	R0, #hi_addr(DAC_SWTRIGRbits+0)
STR	R1, [R0, #0]
;DAC_ex5.c,56 :: 		DAC_DHR12RD = (((unsigned int)value) | 0x00FF0000);
UXTH	R0, R2
ORR	R1, R0, #16711680
MOVW	R0, #lo_addr(DAC_DHR12RD+0)
MOVT	R0, #hi_addr(DAC_DHR12RD+0)
STR	R1, [R0, #0]
;DAC_ex5.c,57 :: 		};
SXTH	R1, R2
; value end address is: 8 (R2)
IT	AL
BAL	L_main3
;DAC_ex5.c,58 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;DAC_ex5.c,61 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DAC_ex5.c,63 :: 		GPIO_setup();
BL	_GPIO_setup+0
;DAC_ex5.c,64 :: 		AFIO_setup();
BL	_AFIO_setup+0
;DAC_ex5.c,65 :: 		DAC_setup();
BL	_DAC_setup+0
;DAC_ex5.c,66 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_setup:
;DAC_ex5.c,69 :: 		void GPIO_setup()
;DAC_ex5.c,71 :: 		enable_GPIOA(true);
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;DAC_ex5.c,72 :: 		pin_configure_low(GPIOA_CRL, 4, analog_input);
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #983040
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;DAC_ex5.c,73 :: 		pin_configure_low(GPIOA_CRL, 5, analog_input);
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;DAC_ex5.c,74 :: 		pin_configure_low(GPIOA_CRL, 6, (output_mode_low_speed | GPIO_PP_output));
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
ORR	R1, R0, #33554432
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;DAC_ex5.c,76 :: 		enable_GPIOF(true);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;DAC_ex5.c,77 :: 		pin_configure_high(GPIOF_CRH, 13, digital_input);
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8388608
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
STR	R1, [R0, #0]
;DAC_ex5.c,78 :: 		pin_configure_high(GPIOF_CRH, 14, digital_input);
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #134217728
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
STR	R1, [R0, #0]
;DAC_ex5.c,79 :: 		pull_up_enable(GPIOF_ODR, 13);
MOVW	R0, #lo_addr(GPIOF_ODR+0)
MOVT	R0, #hi_addr(GPIOF_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOF_ODR+0)
MOVT	R0, #hi_addr(GPIOF_ODR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,80 :: 		pull_up_enable(GPIOF_ODR, 14);
MOVW	R0, #lo_addr(GPIOF_ODR+0)
MOVT	R0, #hi_addr(GPIOF_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16384
MOVW	R0, #lo_addr(GPIOF_ODR+0)
MOVT	R0, #hi_addr(GPIOF_ODR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,82 :: 		}
L_end_GPIO_setup:
BX	LR
; end of _GPIO_setup
_AFIO_setup:
;DAC_ex5.c,85 :: 		void AFIO_setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DAC_ex5.c,87 :: 		AFIO_enable(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;DAC_ex5.c,88 :: 		pin_configure_high(GPIOA_CRH, 9, digital_input);
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
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;DAC_ex5.c,89 :: 		pull_up_enable(GPIOA_ODR, 9);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,90 :: 		bit_set(GPIOA_ODR, 6);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,91 :: 		set_EXTI8_11(9, PA_pin);
MOVW	R0, #lo_addr(AFIO_EXTICR3+0)
MOVT	R0, #hi_addr(AFIO_EXTICR3+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(AFIO_EXTICR3+0)
MOVT	R0, #hi_addr(AFIO_EXTICR3+0)
STR	R1, [R0, #0]
;DAC_ex5.c,92 :: 		falling_edge_selector(9);
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,93 :: 		interrupt_mask(9);
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,94 :: 		NVIC_IntEnable(IVT_INT_EXTI9_5);
MOVW	R0, #39
BL	_NVIC_IntEnable+0
;DAC_ex5.c,95 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;DAC_ex5.c,96 :: 		}
L_end_AFIO_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _AFIO_setup
_DAC_setup:
;DAC_ex5.c,99 :: 		void DAC_setup()
;DAC_ex5.c,101 :: 		enable_DAC(true);
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;DAC_ex5.c,102 :: 		DAC_reset();
MOVS	R1, #0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,104 :: 		set_DAC1_buffer(enable);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex5.c,105 :: 		enable_DAC1_trigger(true);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex5.c,106 :: 		select_DAC1_trigger_source(Software_trigger);
MOVW	R1, #lo_addr(DAC_CRbits+0)
MOVT	R1, #hi_addr(DAC_CRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_DAC_setup34
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #56
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #56
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
L_DAC_setup34:
;DAC_ex5.c,107 :: 		select_DAC1_wave_type(triangle_wave_generation_enabled);
MOVW	R1, #lo_addr(DAC_CRbits+0)
MOVT	R1, #hi_addr(DAC_CRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_DAC_setup38
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
L_DAC_setup38:
;DAC_ex5.c,108 :: 		set_DAC1_triangle_waveform_amplitude(Triangle_Amplitude_equal_to_511);
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,109 :: 		enable_DAC1_channel(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex5.c,111 :: 		set_DAC2_buffer(enable);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex5.c,112 :: 		enable_DAC2_trigger(true);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex5.c,113 :: 		select_DAC2_trigger_source(EXTI9_event);
MOVW	R1, #lo_addr(DAC_CRbits+0)
MOVT	R1, #hi_addr(DAC_CRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_DAC_setup45
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #3670016
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3145728
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
L_DAC_setup45:
;DAC_ex5.c,114 :: 		select_DAC2_wave_type(noise_wave_generation_enabled);
MOVW	R1, #lo_addr(DAC_CRbits+0)
MOVT	R1, #hi_addr(DAC_CRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_DAC_setup49
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4194304
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
L_DAC_setup49:
;DAC_ex5.c,115 :: 		set_DAC2_LFSR_mask(0x3AA);
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-1442840576
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex5.c,116 :: 		enable_DAC2_channel(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex5.c,118 :: 		DAC_DHR12RD = 0x00FF0000;
MOV	R1, #16711680
MOVW	R0, #lo_addr(DAC_DHR12RD+0)
MOVT	R0, #hi_addr(DAC_DHR12RD+0)
STR	R1, [R0, #0]
;DAC_ex5.c,119 :: 		}
L_end_DAC_setup:
BX	LR
; end of _DAC_setup
