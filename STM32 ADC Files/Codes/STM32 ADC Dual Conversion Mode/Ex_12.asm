_ADC1_2_ISR:
;Ex_12.c,27 :: 		ics ICS_AUTO
;Ex_12.c,29 :: 		ADC1_SRbits.EOC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;Ex_12.c,30 :: 		ADC2_SRbits.EOC = 0;
MOVW	R0, #lo_addr(ADC2_SRbits+0)
MOVT	R0, #hi_addr(ADC2_SRbits+0)
STR	R1, [R0, #0]
;Ex_12.c,31 :: 		adc_data = adc1_dr;
MOVW	R0, #lo_addr(ADC1_DR+0)
MOVT	R0, #hi_addr(ADC1_DR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(adc_data+0)
MOVT	R0, #hi_addr(adc_data+0)
STR	R1, [R0, #0]
;Ex_12.c,32 :: 		GPIOC_pin_high(13);
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;Ex_12.c,33 :: 		}
L_end_ADC1_2_ISR:
BX	LR
; end of _ADC1_2_ISR
_main:
;Ex_12.c,36 :: 		void main()
;Ex_12.c,38 :: 		unsigned int adc1_data = 0;
;Ex_12.c,39 :: 		unsigned int adc2_data = 0;
;Ex_12.c,41 :: 		setup();
BL	_setup+0
;Ex_12.c,43 :: 		while(1)
L_main0:
;Ex_12.c,45 :: 		set_ADC1_regular_conversions(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
;Ex_12.c,47 :: 		adc1_data = (adc_data & 0x00000FFF);
MOVW	R3, #lo_addr(adc_data+0)
MOVT	R3, #hi_addr(adc_data+0)
LDR	R1, [R3, #0]
MOVW	R0, #4095
AND	R2, R1, R0, LSL #0
;Ex_12.c,48 :: 		adc2_data = ((adc_data & 0x0FFF0000) >> 16);
MOV	R0, R3
LDR	R1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #4095
AND	R0, R1, R0, LSL #0
LSRS	R0, R0, #16
; adc2_data start address is: 36 (R9)
UXTH	R9, R0
;Ex_12.c,50 :: 		lcd_print(1, 2, adc1_data);
UXTH	R2, R2
MOVS	R1, #2
MOVS	R0, #1
BL	_lcd_print+0
;Ex_12.c,51 :: 		lcd_print(13, 2, adc2_data);
UXTH	R2, R9
MOVS	R1, #2
MOVS	R0, #13
BL	_lcd_print+0
;Ex_12.c,53 :: 		GPIOC_pin_low(13);
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
STR	R1, [R0, #0]
;Ex_12.c,54 :: 		delay_ms(90);
MOVW	R7, #23567
MOVT	R7, #12
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;Ex_12.c,55 :: 		};
IT	AL
BAL	L_main0
; adc2_data end address is: 36 (R9)
;Ex_12.c,56 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_12.c,59 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_12.c,61 :: 		GPIO_init();
BL	_GPIO_init+0
;Ex_12.c,62 :: 		ADC_init();
BL	_ADC_init+0
;Ex_12.c,63 :: 		LCD_Init();
BL	_Lcd_Init+0
;Ex_12.c,65 :: 		LCD_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Ex_12.c,66 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;Ex_12.c,68 :: 		lcd_out(1, 1, "CH00        CH01");
MOVW	R0, #lo_addr(?lstr1_Ex_12+0)
MOVT	R0, #hi_addr(?lstr1_Ex_12+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_12.c,69 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_init:
;Ex_12.c,72 :: 		void GPIO_init()
;Ex_12.c,74 :: 		enable_GPIOA(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_12.c,75 :: 		enable_GPIOB(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_12.c,76 :: 		enable_GPIOC(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_12.c,77 :: 		setup_GPIOA(0, analog_input);
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
L_GPIO_init13:
;Ex_12.c,78 :: 		setup_GPIOA(1, analog_input);
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
L_GPIO_init26:
;Ex_12.c,79 :: 		setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
L_GPIO_init33:
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
;Ex_12.c,80 :: 		}
L_end_GPIO_init:
BX	LR
; end of _GPIO_init
_ADC_init:
;Ex_12.c,83 :: 		void ADC_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_12.c,85 :: 		setup_ADC1();
BL	_setup_ADC1+0
;Ex_12.c,86 :: 		setup_ADC2();
BL	_setup_ADC2+0
;Ex_12.c,87 :: 		setup_common_ADC_settings();
BL	_setup_common_ADC_settings+0
;Ex_12.c,88 :: 		}
L_end_ADC_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ADC_init
_setup_ADC1:
;Ex_12.c,91 :: 		void setup_ADC1()
;Ex_12.c,93 :: 		ADC1_Enable();
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
;Ex_12.c,94 :: 		clr_ADC1_settings();
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;Ex_12.c,95 :: 		set_ADC1_data_alignment(right_alignment);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R0, #0]
;Ex_12.c,96 :: 		set_ADC1_scan_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R2, [R0, #0]
;Ex_12.c,97 :: 		set_ADC1_continuous_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R0, #0]
;Ex_12.c,98 :: 		set_ADC1_sample_time(sample_time_41_5_cycles, 0);
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
LDR	R1, [R0, #0]
MVN	R0, #7
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
L_setup_ADC153:
;Ex_12.c,99 :: 		set_ADC1_external_trigger_regular_conversion_edge(SWSTART_trigger);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R1, [R0, #0]
MVN	R0, #917504
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #917504
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
L_setup_ADC160:
;Ex_12.c,100 :: 		set_ADC1_regular_number_of_conversions(1);
MOVW	R0, #lo_addr(ADC1_SQR1+0)
MOVT	R0, #hi_addr(ADC1_SQR1+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_SQR1+0)
MOVT	R0, #hi_addr(ADC1_SQR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_SQR1+0)
MOVT	R0, #hi_addr(ADC1_SQR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_SQR1+0)
MOVT	R0, #hi_addr(ADC1_SQR1+0)
STR	R1, [R0, #0]
;Ex_12.c,101 :: 		set_ADC1_regular_sequence(1, 0);
MOVW	R0, #lo_addr(ADC1_SQR3+0)
MOVT	R0, #hi_addr(ADC1_SQR3+0)
LDR	R1, [R0, #0]
MVN	R0, #31
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_SQR3+0)
MOVT	R0, #hi_addr(ADC1_SQR3+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_SQR3+0)
MOVT	R0, #hi_addr(ADC1_SQR3+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_SQR3+0)
MOVT	R0, #hi_addr(ADC1_SQR3+0)
STR	R1, [R0, #0]
L_setup_ADC170:
;Ex_12.c,102 :: 		set_ADC1_regular_end_of_conversion_interrupt(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;Ex_12.c,103 :: 		ADC1_calibrate();
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
L_setup_ADC176:
MOVW	R1, #lo_addr(ADC1_CR2bits+0)
MOVT	R1, #hi_addr(ADC1_CR2bits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_setup_ADC177
IT	AL
BAL	L_setup_ADC176
L_setup_ADC177:
;Ex_12.c,104 :: 		start_ADC1();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R7, #8999
MOVT	R7, #0
NOP
NOP
L_setup_ADC181:
SUBS	R7, R7, #1
BNE	L_setup_ADC181
NOP
NOP
NOP
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
;Ex_12.c,105 :: 		}
L_end_setup_ADC1:
BX	LR
; end of _setup_ADC1
_setup_ADC2:
;Ex_12.c,108 :: 		void setup_ADC2()
;Ex_12.c,110 :: 		ADC2_Enable();
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
;Ex_12.c,111 :: 		clr_ADC2_settings();
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC2_CR1+0)
MOVT	R0, #hi_addr(ADC2_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC2_CR2+0)
MOVT	R0, #hi_addr(ADC2_CR2+0)
STR	R1, [R0, #0]
;Ex_12.c,112 :: 		set_ADC2_data_alignment(right_alignment);
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R2, [R0, #0]
;Ex_12.c,113 :: 		set_ADC2_scan_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC2_CR1bits+0)
MOVT	R0, #hi_addr(ADC2_CR1bits+0)
STR	R2, [R0, #0]
;Ex_12.c,114 :: 		set_ADC2_continuous_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R2, [R0, #0]
;Ex_12.c,115 :: 		set_ADC2_sample_time(sample_time_41_5_cycles, 1);
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
ORR	R1, R0, #32
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
STR	R1, [R0, #0]
L_setup_ADC295:
;Ex_12.c,116 :: 		set_ADC2_external_trigger_regular_conversion_edge(SWSTART_trigger);
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
L_setup_ADC2102:
;Ex_12.c,117 :: 		set_ADC2_regular_number_of_conversions(1);
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
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SQR1+0)
MOVT	R0, #hi_addr(ADC2_SQR1+0)
STR	R1, [R0, #0]
;Ex_12.c,118 :: 		set_ADC2_regular_sequence(1, 1);
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
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(ADC2_SQR3+0)
MOVT	R0, #hi_addr(ADC2_SQR3+0)
STR	R1, [R0, #0]
L_setup_ADC2112:
;Ex_12.c,119 :: 		set_ADC2_regular_end_of_conversion_interrupt(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR1bits+0)
MOVT	R0, #hi_addr(ADC2_CR1bits+0)
STR	R1, [R0, #0]
;Ex_12.c,120 :: 		ADC2_calibrate();
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
L_setup_ADC2118:
MOVW	R1, #lo_addr(ADC2_CR2bits+0)
MOVT	R1, #hi_addr(ADC2_CR2bits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_setup_ADC2119
IT	AL
BAL	L_setup_ADC2118
L_setup_ADC2119:
;Ex_12.c,121 :: 		start_ADC2();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R7, #8999
MOVT	R7, #0
NOP
NOP
L_setup_ADC2123:
SUBS	R7, R7, #1
BNE	L_setup_ADC2123
NOP
NOP
NOP
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
;Ex_12.c,122 :: 		}
L_end_setup_ADC2:
BX	LR
; end of _setup_ADC2
_setup_common_ADC_settings:
;Ex_12.c,125 :: 		void setup_common_ADC_settings()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_12.c,127 :: 		set_ADC1_DMA(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
;Ex_12.c,128 :: 		set_ADC_mode(regular_simultaneous_mode_only);
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
LDR	R0, [R0, #0]
ORR	R1, R0, #393216
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
;Ex_12.c,129 :: 		NVIC_IntEnable(IVT_INT_ADC1_2);
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;Ex_12.c,130 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ex_12.c,131 :: 		}
L_end_setup_common_ADC_settings:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_common_ADC_settings
_lcd_print:
;Ex_12.c,134 :: 		void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
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
;Ex_12.c,136 :: 		unsigned char tmp = 0;
;Ex_12.c,138 :: 		tmp = (value / 1000);
MOVW	R3, #1000
UDIV	R3, R8, R3
;Ex_12.c,139 :: 		lcd_chr(y_pos, x_pos, (tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
STRB	R1, [SP, #4]
UXTB	R2, R3
UXTB	R1, R0
; x_pos end address is: 0 (R0)
LDRB	R0, [SP, #4]
; y_pos end address is: 4 (R1)
BL	_Lcd_Chr+0
;Ex_12.c,140 :: 		tmp = ((value / 100) % 10);
MOVS	R3, #100
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;Ex_12.c,141 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_12.c,142 :: 		tmp = ((value / 10) % 10);
MOVS	R3, #10
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;Ex_12.c,143 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_12.c,144 :: 		tmp = (value % 10);
MOVS	R4, #10
UDIV	R3, R8, R4
MLS	R3, R4, R3, R8
; value end address is: 32 (R8)
;Ex_12.c,145 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_12.c,146 :: 		}
L_end_lcd_print:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lcd_print
