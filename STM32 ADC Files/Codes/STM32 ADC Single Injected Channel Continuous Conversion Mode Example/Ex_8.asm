_main:
;Ex_8.c,21 :: 		void main()
SUB	SP, SP, #12
;Ex_8.c,23 :: 		unsigned int adc_data = 0;
;Ex_8.c,24 :: 		float V = 0.0;
;Ex_8.c,26 :: 		setup();
BL	_setup+0
;Ex_8.c,28 :: 		while(1)
L_main0:
;Ex_8.c,30 :: 		GPIOC_pin_high(13);
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;Ex_8.c,31 :: 		delay_ms(10);
MOVW	R7, #26665
MOVT	R7, #0
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
;Ex_8.c,33 :: 		adc_data = read_ADC1();
BL	_read_ADC1+0
STRH	R0, [SP, #0]
;Ex_8.c,34 :: 		V = map(adc_data, 0, 4095, 0, 3300);
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
;Ex_8.c,35 :: 		lcd_print(13, 1, adc_data);
LDRH	R2, [SP, #0]
MOVS	R1, #1
MOVS	R0, #13
BL	_lcd_print+0
;Ex_8.c,36 :: 		lcd_print(13, 2, V);
MOV	R0, R9
BL	__FloatToUnsignedIntegral+0
UXTH	R0, R0
UXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #13
BL	_lcd_print+0
;Ex_8.c,38 :: 		GPIOC_pin_low(13);
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
STR	R1, [R0, #0]
;Ex_8.c,39 :: 		delay_ms(90);
MOVW	R7, #43390
MOVT	R7, #3
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;Ex_8.c,40 :: 		};
IT	AL
BAL	L_main0
; V end address is: 36 (R9)
;Ex_8.c,41 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_8.c,44 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_8.c,46 :: 		GPIO_init();
BL	_GPIO_init+0
;Ex_8.c,47 :: 		ADC_init();
BL	_ADC_init+0
;Ex_8.c,48 :: 		LCD_Init();
BL	_Lcd_Init+0
;Ex_8.c,50 :: 		LCD_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Ex_8.c,51 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;Ex_8.c,53 :: 		lcd_out(1, 1, "CH03:");
MOVW	R0, #lo_addr(?lstr1_Ex_8+0)
MOVT	R0, #hi_addr(?lstr1_Ex_8+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_8.c,54 :: 		lcd_out(2, 1, "V/mV:");
MOVW	R0, #lo_addr(?lstr2_Ex_8+0)
MOVT	R0, #hi_addr(?lstr2_Ex_8+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;Ex_8.c,55 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_init:
;Ex_8.c,58 :: 		void GPIO_init()
;Ex_8.c,60 :: 		enable_GPIOA(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_8.c,61 :: 		enable_GPIOB(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_8.c,62 :: 		enable_GPIOC(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_8.c,64 :: 		setup_GPIOA(3, analog_input);
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
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
;Ex_8.c,65 :: 		setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
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
;Ex_8.c,66 :: 		}
L_end_GPIO_init:
BX	LR
; end of _GPIO_init
_ADC_init:
;Ex_8.c,69 :: 		void ADC_init()
;Ex_8.c,71 :: 		ADC1_Enable();
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
;Ex_8.c,72 :: 		clr_ADC1_settings();
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;Ex_8.c,73 :: 		set_ADC_mode(independent_mode);
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
;Ex_8.c,74 :: 		set_ADC1_data_alignment(right_alignment);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R0, #0]
;Ex_8.c,75 :: 		set_ADC1_scan_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R2, [R0, #0]
;Ex_8.c,76 :: 		set_ADC1_continuous_conversion_mode(enable);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;Ex_8.c,77 :: 		set_ADC1_sample_time(sample_time_239_5_cycles, 3);
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
LDR	R1, [R0, #0]
MVN	R0, #3584
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3584
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init45:
;Ex_8.c,78 :: 		set_ADC1_injected_number_of_conversions(1);
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
STR	R1, [R0, #0]
;Ex_8.c,79 :: 		set_ADC1_injected_sequence(4, 3);
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
LDR	R1, [R0, #0]
MVN	R0, #1015808
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #98304
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
STR	R1, [R0, #0]
;Ex_8.c,80 :: 		set_ADC1_external_trigger_injected_conversion_edge(JSWSTART_trigger);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R1, [R0, #0]
MVN	R0, #28672
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #28672
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
L_ADC_init58:
;Ex_8.c,81 :: 		ADC1_calibrate();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
L_ADC_init62:
MOVW	R1, #lo_addr(ADC1_CR2bits+0)
MOVT	R1, #hi_addr(ADC1_CR2bits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ADC_init63
IT	AL
BAL	L_ADC_init62
L_ADC_init63:
;Ex_8.c,82 :: 		start_ADC1();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_ADC_init67:
SUBS	R7, R7, #1
BNE	L_ADC_init67
NOP
NOP
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
;Ex_8.c,83 :: 		}
L_end_ADC_init:
BX	LR
; end of _ADC_init
_read_ADC1:
;Ex_8.c,86 :: 		unsigned int read_ADC1()
;Ex_8.c,88 :: 		set_ADC1_injected_conversions(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
;Ex_8.c,89 :: 		while(ADC1_SRbits.JEOC == 0);
L_read_ADC169:
MOVW	R1, #lo_addr(ADC1_SRbits+0)
MOVT	R1, #hi_addr(ADC1_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_read_ADC170
IT	AL
BAL	L_read_ADC169
L_read_ADC170:
;Ex_8.c,90 :: 		ADC1_SRbits.JEOC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;Ex_8.c,91 :: 		return (ADC1_JDR1 & 0x0FFF);
MOVW	R0, #lo_addr(ADC1_JDR1+0)
MOVT	R0, #hi_addr(ADC1_JDR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
AND	R0, R1, R0, LSL #0
UXTH	R0, R0
;Ex_8.c,92 :: 		}
L_end_read_ADC1:
BX	LR
; end of _read_ADC1
_lcd_print:
;Ex_8.c,95 :: 		void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
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
;Ex_8.c,97 :: 		unsigned char tmp = 0;
;Ex_8.c,99 :: 		tmp = (value / 1000);
MOVW	R3, #1000
UDIV	R3, R8, R3
;Ex_8.c,100 :: 		lcd_chr(y_pos, x_pos, (tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
STRB	R1, [SP, #4]
UXTB	R2, R3
UXTB	R1, R0
; x_pos end address is: 0 (R0)
LDRB	R0, [SP, #4]
; y_pos end address is: 4 (R1)
BL	_Lcd_Chr+0
;Ex_8.c,101 :: 		tmp = ((value / 100) % 10);
MOVS	R3, #100
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;Ex_8.c,102 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_8.c,103 :: 		tmp = ((value / 10) % 10);
MOVS	R3, #10
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;Ex_8.c,104 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_8.c,105 :: 		tmp = (value % 10);
MOVS	R4, #10
UDIV	R3, R8, R4
MLS	R3, R4, R3, R8
; value end address is: 32 (R8)
;Ex_8.c,106 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_8.c,107 :: 		}
L_end_lcd_print:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lcd_print
_map:
;Ex_8.c,110 :: 		float map(float v, float x_min, float x_max, float y_min, float y_max)
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
;Ex_8.c,112 :: 		return (y_min + (((y_max - y_min)/(x_max - x_min)) * (v - x_min)));
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
;Ex_8.c,113 :: 		}
L_end_map:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _map
