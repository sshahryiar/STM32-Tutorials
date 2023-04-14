_main:
;EX_5.c,21 :: 		void main()
SUB	SP, SP, #12
;EX_5.c,23 :: 		unsigned int adc_data = 0;
;EX_5.c,24 :: 		float V = 0.0;
;EX_5.c,26 :: 		setup();
BL	_setup+0
;EX_5.c,28 :: 		while(1)
L_main0:
;EX_5.c,30 :: 		GPIOC_pin_high(13);
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;EX_5.c,31 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;EX_5.c,33 :: 		adc_data = read_ADC1();
BL	_read_ADC1+0
STRH	R0, [SP, #0]
;EX_5.c,34 :: 		V = map(adc_data, 0, 4095, 0, 3300);
MOVW	R1, #16384
MOVT	R1, #17742
STR	R1, [SP, #8]
BL	__UnsignedIntegralToFloat+0
LDR	R1, [SP, #8]
PUSH	(R1)
MOV	R3, #0
MOVW	R2, #61440
MOVT	R2, #17791
MOV	R1, #0
BL	_map+0
ADD	SP, SP, #4
; V start address is: 36 (R9)
MOV	R9, R0
;EX_5.c,35 :: 		lcd_print(13, 1, adc_data);
LDRH	R2, [SP, #0]
MOVS	R1, #1
MOVS	R0, #13
BL	_lcd_print+0
;EX_5.c,36 :: 		lcd_print(13, 2, V);
MOV	R0, R9
BL	__FloatToUnsignedIntegral+0
UXTH	R0, R0
UXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #13
BL	_lcd_print+0
;EX_5.c,38 :: 		GPIOC_pin_low(13);
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
STR	R1, [R0, #0]
;EX_5.c,39 :: 		delay_ms(90);
MOVW	R7, #31423
MOVT	R7, #16
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;EX_5.c,40 :: 		};
IT	AL
BAL	L_main0
; V end address is: 36 (R9)
;EX_5.c,41 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;EX_5.c,44 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;EX_5.c,46 :: 		GPIO_init();
BL	_GPIO_init+0
;EX_5.c,47 :: 		ADC_init();
BL	_ADC_init+0
;EX_5.c,48 :: 		LCD_Init();
BL	_Lcd_Init+0
;EX_5.c,50 :: 		LCD_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;EX_5.c,51 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;EX_5.c,53 :: 		lcd_out(1, 1, "CH02:");
MOVW	R0, #lo_addr(?lstr1_EX_5+0)
MOVT	R0, #hi_addr(?lstr1_EX_5+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;EX_5.c,54 :: 		lcd_out(2, 1, "V/mV:");
MOVW	R0, #lo_addr(?lstr2_EX_5+0)
MOVT	R0, #hi_addr(?lstr2_EX_5+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;EX_5.c,55 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_init:
;EX_5.c,58 :: 		void GPIO_init()
;EX_5.c,60 :: 		enable_GPIOA(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;EX_5.c,61 :: 		enable_GPIOB(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;EX_5.c,62 :: 		enable_GPIOC(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;EX_5.c,64 :: 		setup_GPIOA(2, analog_input);
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
L_GPIO_init15:
;EX_5.c,65 :: 		setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
L_GPIO_init22:
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
;EX_5.c,66 :: 		}
L_end_GPIO_init:
BX	LR
; end of _GPIO_init
_ADC_init:
;EX_5.c,69 :: 		void ADC_init()
;EX_5.c,71 :: 		ADC1_Enable();
MOVS	R3, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R3, [R0, #0]
MOVW	R0, #lo_addr(RCC_APB2RSTRbits+0)
MOVT	R0, #hi_addr(RCC_APB2RSTRbits+0)
STR	R3, [R0, #0]
MOVS	R2, #0
MOVW	R0, #lo_addr(RCC_APB2RSTRbits+0)
MOVT	R0, #hi_addr(RCC_APB2RSTRbits+0)
STR	R2, [R0, #0]
;EX_5.c,72 :: 		clr_ADC1_settings();
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;EX_5.c,73 :: 		set_ADC_mode(independent_mode);
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
;EX_5.c,74 :: 		set_ADC1_data_alignment(right_alignment);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R0, #0]
;EX_5.c,75 :: 		set_ADC1_scan_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R2, [R0, #0]
;EX_5.c,76 :: 		set_ADC1_continuous_conversion_mode(enable);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;EX_5.c,77 :: 		set_ADC1_regular_number_of_conversions(1);
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
;EX_5.c,78 :: 		set_ADC1_sample_time(sample_time_41_5_cycles, 2);
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
LDR	R1, [R0, #0]
MVN	R0, #448
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init48:
;EX_5.c,79 :: 		set_ADC1_regular_sequence(1, 2);
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
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(ADC1_SQR3+0)
MOVT	R0, #hi_addr(ADC1_SQR3+0)
STR	R1, [R0, #0]
L_ADC_init55:
;EX_5.c,80 :: 		set_ADC1_external_trigger_regular_conversion_edge(SWSTART_trigger);
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
L_ADC_init64:
;EX_5.c,81 :: 		ADC1_calibrate();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
L_ADC_init68:
MOVW	R1, #lo_addr(ADC1_CR2bits+0)
MOVT	R1, #hi_addr(ADC1_CR2bits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ADC_init69
IT	AL
BAL	L_ADC_init68
L_ADC_init69:
;EX_5.c,82 :: 		start_ADC1();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R7, #11999
MOVT	R7, #0
NOP
NOP
L_ADC_init73:
SUBS	R7, R7, #1
BNE	L_ADC_init73
NOP
NOP
NOP
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
;EX_5.c,83 :: 		}
L_end_ADC_init:
BX	LR
; end of _ADC_init
_read_ADC1:
;EX_5.c,86 :: 		unsigned int read_ADC1()
;EX_5.c,88 :: 		while(ADC1_SRbits.EOC == 0);
L_read_ADC175:
MOVW	R1, #lo_addr(ADC1_SRbits+0)
MOVT	R1, #hi_addr(ADC1_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_read_ADC176
IT	AL
BAL	L_read_ADC175
L_read_ADC176:
;EX_5.c,89 :: 		return (ADC1_DR & 0x0FFF);
MOVW	R0, #lo_addr(ADC1_DR+0)
MOVT	R0, #hi_addr(ADC1_DR+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
AND	R0, R1, R0, LSL #0
UXTH	R0, R0
;EX_5.c,90 :: 		}
L_end_read_ADC1:
BX	LR
; end of _read_ADC1
_lcd_print:
;EX_5.c,93 :: 		void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
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
;EX_5.c,95 :: 		unsigned char tmp = 0;
;EX_5.c,97 :: 		tmp = (value / 1000);
MOVW	R3, #1000
UDIV	R3, R8, R3
;EX_5.c,98 :: 		lcd_chr(y_pos, x_pos, (tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
STRB	R1, [SP, #4]
UXTB	R2, R3
UXTB	R1, R0
; x_pos end address is: 0 (R0)
LDRB	R0, [SP, #4]
; y_pos end address is: 4 (R1)
BL	_Lcd_Chr+0
;EX_5.c,99 :: 		tmp = ((value / 100) % 10);
MOVS	R3, #100
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;EX_5.c,100 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_5.c,101 :: 		tmp = ((value / 10) % 10);
MOVS	R3, #10
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;EX_5.c,102 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_5.c,103 :: 		tmp = (value % 10);
MOVS	R4, #10
UDIV	R3, R8, R4
MLS	R3, R4, R3, R8
; value end address is: 32 (R8)
;EX_5.c,104 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_5.c,105 :: 		}
L_end_lcd_print:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lcd_print
_map:
;EX_5.c,108 :: 		float map(float v, float x_min, float x_max, float y_min, float y_max)
; y_min start address is: 12 (R3)
; x_max start address is: 8 (R2)
; x_min start address is: 4 (R1)
; v start address is: 0 (R0)
SUB	SP, SP, #16
STR	LR, [SP, #0]
MOV	R10, R0
MOV	R11, R1
MOV	R12, R2
MOV	R9, R3
; y_min end address is: 12 (R3)
; x_max end address is: 8 (R2)
; x_min end address is: 4 (R1)
; v end address is: 0 (R0)
; v start address is: 40 (R10)
; x_min start address is: 44 (R11)
; x_max start address is: 48 (R12)
; y_min start address is: 36 (R9)
; y_max start address is: 16 (R4)
LDR	R4, [SP, #16]
;EX_5.c,110 :: 		return (y_min + (((y_max - y_min)/(x_max - x_min)) * (v - x_min)));
MOV	R2, R9
MOV	R0, R4
BL	__Sub_FP+0
; y_max end address is: 16 (R4)
STR	R0, [SP, #12]
MOV	R2, R11
MOV	R0, R12
BL	__Sub_FP+0
; x_max end address is: 48 (R12)
STR	R0, [SP, #8]
LDR	R0, [SP, #12]
STR	R1, [SP, #4]
LDR	R1, [SP, #8]
MOV	R2, R1
BL	__Div_FP+0
LDR	R1, [SP, #4]
STR	R0, [SP, #8]
MOV	R2, R11
MOV	R0, R10
BL	__Sub_FP+0
; v end address is: 40 (R10)
; x_min end address is: 44 (R11)
LDR	R2, [SP, #8]
BL	__Mul_FP+0
MOV	R2, R9
BL	__Add_FP+0
; y_min end address is: 36 (R9)
;EX_5.c,111 :: 		}
L_end_map:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _map
