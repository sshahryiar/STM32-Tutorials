_ADC1_2_ISR:
;Ex_11.c,25 :: 		ics ICS_AUTO
;Ex_11.c,27 :: 		ADC2_SRbits.EOC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC2_SRbits+0)
MOVT	R0, #hi_addr(ADC2_SRbits+0)
STR	R1, [R0, #0]
;Ex_11.c,28 :: 		ch_data[channel_no] = (ADC2_DR & 0x0FFF);
MOVW	R3, #lo_addr(_channel_no+0)
MOVT	R3, #hi_addr(_channel_no+0)
LDRB	R0, [R3, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_ch_data+0)
MOVT	R0, #hi_addr(_ch_data+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(ADC2_DR+0)
MOVT	R0, #hi_addr(ADC2_DR+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
AND	R0, R1, R0, LSL #0
STRH	R0, [R2, #0]
;Ex_11.c,29 :: 		channel_no++;
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R3, #0]
;Ex_11.c,30 :: 		}
L_end_ADC1_2_ISR:
BX	LR
; end of _ADC1_2_ISR
_main:
;Ex_11.c,33 :: 		void main()
;Ex_11.c,35 :: 		unsigned char s = 0;
;Ex_11.c,37 :: 		setup();
BL	_setup+0
;Ex_11.c,39 :: 		while(1)
L_main0:
;Ex_11.c,41 :: 		GPIOC_pin_high(13);
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;Ex_11.c,42 :: 		set_ADC2_regular_conversions(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
;Ex_11.c,43 :: 		while(channel_no < 3);
L_main2:
MOVW	R0, #lo_addr(_channel_no+0)
MOVT	R0, #hi_addr(_channel_no+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	CS
BCS	L_main3
IT	AL
BAL	L_main2
L_main3:
;Ex_11.c,44 :: 		channel_no = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_channel_no+0)
MOVT	R0, #hi_addr(_channel_no+0)
STRB	R1, [R0, #0]
;Ex_11.c,45 :: 		for(s = 0 ; s < 3; s++)
; s start address is: 36 (R9)
MOVW	R9, #0
; s end address is: 36 (R9)
L_main4:
; s start address is: 36 (R9)
CMP	R9, #3
IT	CS
BCS	L_main5
;Ex_11.c,47 :: 		lcd_print(((s * 6) + 1), 2, ch_data[s]);
LSL	R1, R9, #1
MOVW	R0, #lo_addr(_ch_data+0)
MOVT	R0, #hi_addr(_ch_data+0)
ADDS	R0, R0, R1
LDRH	R0, [R0, #0]
UXTH	R1, R0
MOVS	R0, #6
SXTH	R0, R0
MUL	R0, R9, R0
SXTH	R0, R0
ADDS	R0, R0, #1
UXTH	R2, R1
MOVS	R1, #2
UXTB	R0, R0
BL	_lcd_print+0
;Ex_11.c,45 :: 		for(s = 0 ; s < 3; s++)
ADD	R9, R9, #1
UXTB	R9, R9
;Ex_11.c,48 :: 		}
; s end address is: 36 (R9)
IT	AL
BAL	L_main4
L_main5:
;Ex_11.c,49 :: 		GPIOC_pin_low(13);
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
STR	R1, [R0, #0]
;Ex_11.c,50 :: 		};
IT	AL
BAL	L_main0
;Ex_11.c,51 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_11.c,54 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_11.c,56 :: 		GPIO_init();
BL	_GPIO_init+0
;Ex_11.c,57 :: 		ADC_init();
BL	_ADC_init+0
;Ex_11.c,58 :: 		LCD_Init();
BL	_Lcd_Init+0
;Ex_11.c,60 :: 		LCD_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Ex_11.c,61 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;Ex_11.c,63 :: 		lcd_out(1, 1, "CH02  CH00  CH01");
MOVW	R0, #lo_addr(?lstr1_Ex_11+0)
MOVT	R0, #hi_addr(?lstr1_Ex_11+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_11.c,64 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_init:
;Ex_11.c,67 :: 		void GPIO_init()
;Ex_11.c,69 :: 		enable_GPIOA(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_11.c,70 :: 		enable_GPIOB(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_11.c,71 :: 		enable_GPIOC(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_11.c,72 :: 		setup_GPIOA(0, analog_input);
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
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_GPIO_init16:
;Ex_11.c,73 :: 		setup_GPIOA(1, analog_input);
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_GPIO_init29:
;Ex_11.c,74 :: 		setup_GPIOA(2, analog_input);
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
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
L_GPIO_init42:
;Ex_11.c,75 :: 		setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
L_GPIO_init49:
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;Ex_11.c,76 :: 		}
L_end_GPIO_init:
BX	LR
; end of _GPIO_init
_ADC_init:
;Ex_11.c,79 :: 		void ADC_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_11.c,81 :: 		ADC2_Enable();
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(RCC_APB2RSTRbits+0)
MOVT	R0, #hi_addr(RCC_APB2RSTRbits+0)
STR	R1, [R0, #0]
MOVS	R2, #0
MOVW	R0, #lo_addr(RCC_APB2RSTRbits+0)
MOVT	R0, #hi_addr(RCC_APB2RSTRbits+0)
STR	R2, [R0, #0]
;Ex_11.c,82 :: 		clr_ADC2_settings();
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC2_CR1+0)
MOVT	R0, #hi_addr(ADC2_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC2_CR2+0)
MOVT	R0, #hi_addr(ADC2_CR2+0)
STR	R1, [R0, #0]
;Ex_11.c,83 :: 		set_ADC_mode(independent_mode);
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #983040
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
;Ex_11.c,84 :: 		set_ADC2_data_alignment(right_alignment);
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R2, [R0, #0]
;Ex_11.c,85 :: 		set_ADC2_scan_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC2_CR1bits+0)
MOVT	R0, #hi_addr(ADC2_CR1bits+0)
STR	R2, [R0, #0]
;Ex_11.c,86 :: 		set_ADC2_continuous_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R2, [R0, #0]
;Ex_11.c,87 :: 		set_ADC2_regular_number_of_conversions(3);
MOVW	R0, #lo_addr(ADC2_SQR1+0)
MOVT	R0, #hi_addr(ADC2_SQR1+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_SQR1+0)
MOVT	R0, #hi_addr(ADC2_SQR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SQR1+0)
MOVT	R0, #hi_addr(ADC2_SQR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(ADC2_SQR1+0)
MOVT	R0, #hi_addr(ADC2_SQR1+0)
STR	R1, [R0, #0]
;Ex_11.c,88 :: 		set_ADC2_number_of_discontinuous_conversions(3);
MOVW	R0, #lo_addr(ADC2_CR1+0)
MOVT	R0, #hi_addr(ADC2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #8191
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_CR1+0)
MOVT	R0, #hi_addr(ADC2_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_CR1+0)
MOVT	R0, #hi_addr(ADC2_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #24576
MOVW	R0, #lo_addr(ADC2_CR1+0)
MOVT	R0, #hi_addr(ADC2_CR1+0)
STR	R1, [R0, #0]
;Ex_11.c,89 :: 		set_ADC2_sample_time(sample_time_41_5_cycles, 0);
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
LDR	R1, [R0, #0]
MVN	R0, #8388608
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init78:
;Ex_11.c,90 :: 		set_ADC2_sample_time(sample_time_13_5_cycles, 1);
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
LDR	R1, [R0, #0]
MVN	R0, #4194304
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init85:
;Ex_11.c,91 :: 		set_ADC2_sample_time(sample_time_28_5_cycles, 2);
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
LDR	R1, [R0, #0]
MVN	R0, #6291456
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #192
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init92:
;Ex_11.c,92 :: 		set_ADC2_regular_sequence(1, 0);
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
LDR	R1, [R0, #0]
MVN	R0, #31
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
STR	R1, [R0, #0]
L_ADC_init99:
;Ex_11.c,93 :: 		set_ADC2_regular_sequence(2, 1);
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
LDR	R1, [R0, #0]
MVN	R0, #992
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
STR	R1, [R0, #0]
L_ADC_init108:
;Ex_11.c,94 :: 		set_ADC2_regular_sequence(3, 2);
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
LDR	R1, [R0, #0]
MVN	R0, #31744
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
STR	R1, [R0, #0]
L_ADC_init117:
;Ex_11.c,95 :: 		set_ADC2_external_trigger_regular_conversion_edge(SWSTART_trigger);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_CR2+0)
MOVT	R0, #hi_addr(ADC2_CR2+0)
LDR	R1, [R0, #0]
MVN	R0, #917504
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_CR2+0)
MOVT	R0, #hi_addr(ADC2_CR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_CR2+0)
MOVT	R0, #hi_addr(ADC2_CR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #917504
MOVW	R0, #lo_addr(ADC2_CR2+0)
MOVT	R0, #hi_addr(ADC2_CR2+0)
STR	R1, [R0, #0]
L_ADC_init126:
;Ex_11.c,96 :: 		set_ADC2_discontinuous_conversion_mode_in_regular_mode(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR1bits+0)
MOVT	R0, #hi_addr(ADC2_CR1bits+0)
STR	R1, [R0, #0]
;Ex_11.c,97 :: 		set_ADC2_regular_end_of_conversion_interrupt(enable);
MOVW	R0, #lo_addr(ADC2_CR1bits+0)
MOVT	R0, #hi_addr(ADC2_CR1bits+0)
STR	R1, [R0, #0]
;Ex_11.c,98 :: 		NVIC_IntEnable(IVT_INT_ADC1_2);
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;Ex_11.c,99 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ex_11.c,100 :: 		ADC2_calibrate();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
L_ADC_init130:
MOVW	R1, #lo_addr(ADC2_CR2bits+0)
MOVT	R1, #hi_addr(ADC2_CR2bits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ADC_init131
IT	AL
BAL	L_ADC_init130
L_ADC_init131:
;Ex_11.c,101 :: 		start_ADC2();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R7, #8999
MOVT	R7, #0
NOP
NOP
L_ADC_init135:
SUBS	R7, R7, #1
BNE	L_ADC_init135
NOP
NOP
NOP
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
;Ex_11.c,102 :: 		}
L_end_ADC_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ADC_init
_lcd_print:
;Ex_11.c,105 :: 		void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTH	R8, R2
; value end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; value start address is: 32 (R8)
;Ex_11.c,107 :: 		unsigned char tmp = 0;
;Ex_11.c,109 :: 		tmp = (value / 1000);
MOVW	R3, #1000
UDIV	R3, R8, R3
;Ex_11.c,110 :: 		lcd_chr(y_pos, x_pos, (tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
STRB	R1, [SP, #4]
UXTB	R2, R3
UXTB	R1, R0
; x_pos end address is: 0 (R0)
LDRB	R0, [SP, #4]
; y_pos end address is: 4 (R1)
BL	_Lcd_Chr+0
;Ex_11.c,111 :: 		tmp = ((value / 100) % 10);
MOVS	R3, #100
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;Ex_11.c,112 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_11.c,113 :: 		tmp = ((value / 10) % 10);
MOVS	R3, #10
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;Ex_11.c,114 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_11.c,115 :: 		tmp = (value % 10);
MOVS	R4, #10
UDIV	R3, R8, R4
MLS	R3, R4, R3, R8
; value end address is: 32 (R8)
;Ex_11.c,116 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_11.c,117 :: 		}
L_end_lcd_print:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lcd_print
