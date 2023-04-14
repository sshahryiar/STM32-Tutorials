_main:
;EX_6.c,20 :: 		void main()
;EX_6.c,22 :: 		unsigned int ch_a = 0;
;EX_6.c,23 :: 		unsigned int ch_b = 0;
;EX_6.c,24 :: 		unsigned int ch_c = 0;
;EX_6.c,26 :: 		setup();
BL	_setup+0
;EX_6.c,28 :: 		while(1)
L_main0:
;EX_6.c,30 :: 		ch_a = read_ADC1(1, sample_time_239_5_cycles);
MOVS	R1, #7
MOVS	R0, #1
BL	_read_ADC1+0
; ch_a start address is: 36 (R9)
UXTH	R9, R0
;EX_6.c,31 :: 		ch_b = read_ADC1(3, sample_time_1_5_cycles);
MOVS	R1, #0
MOVS	R0, #3
BL	_read_ADC1+0
; ch_b start address is: 40 (R10)
UXTH	R10, R0
;EX_6.c,32 :: 		ch_c = read_ADC1(2, sample_time_28_5_cycles);
MOVS	R1, #3
MOVS	R0, #2
BL	_read_ADC1+0
; ch_c start address is: 44 (R11)
UXTH	R11, R0
;EX_6.c,34 :: 		lcd_print(1, 2, ch_a);
UXTH	R2, R9
MOVS	R1, #2
MOVS	R0, #1
BL	_lcd_print+0
;EX_6.c,35 :: 		lcd_print(7, 2, ch_b);
UXTH	R2, R10
MOVS	R1, #2
MOVS	R0, #7
BL	_lcd_print+0
;EX_6.c,36 :: 		lcd_print(13, 2, ch_c);
UXTH	R2, R11
MOVS	R1, #2
MOVS	R0, #13
BL	_lcd_print+0
;EX_6.c,38 :: 		GPIOC_pin_high(13);
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;EX_6.c,39 :: 		delay_ms(10);
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
;EX_6.c,40 :: 		GPIOC_pin_low(13);
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
STR	R1, [R0, #0]
;EX_6.c,41 :: 		delay_ms(90);
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
;EX_6.c,42 :: 		};
IT	AL
BAL	L_main0
; ch_a end address is: 36 (R9)
; ch_b end address is: 40 (R10)
; ch_c end address is: 44 (R11)
;EX_6.c,43 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;EX_6.c,46 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;EX_6.c,48 :: 		GPIO_init();
BL	_GPIO_init+0
;EX_6.c,49 :: 		ADC_init();
BL	_ADC_init+0
;EX_6.c,50 :: 		LCD_Init();
BL	_Lcd_Init+0
;EX_6.c,52 :: 		LCD_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;EX_6.c,53 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;EX_6.c,55 :: 		lcd_out(1, 1, "CH01  CH03  CH02");
MOVW	R0, #lo_addr(?lstr1_EX_6+0)
MOVT	R0, #hi_addr(?lstr1_EX_6+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;EX_6.c,56 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_init:
;EX_6.c,59 :: 		void GPIO_init()
;EX_6.c,61 :: 		enable_GPIOA(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;EX_6.c,62 :: 		enable_GPIOB(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;EX_6.c,63 :: 		enable_GPIOC(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;EX_6.c,65 :: 		setup_GPIOA(1, analog_input);
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
L_GPIO_init15:
;EX_6.c,66 :: 		setup_GPIOA(2, analog_input);
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
L_GPIO_init28:
;EX_6.c,67 :: 		setup_GPIOA(3, analog_input);
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
L_GPIO_init41:
;EX_6.c,68 :: 		setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
L_GPIO_init48:
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
;EX_6.c,69 :: 		}
L_end_GPIO_init:
BX	LR
; end of _GPIO_init
_ADC_init:
;EX_6.c,72 :: 		void ADC_init()
;EX_6.c,74 :: 		ADC1_Enable();
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
;EX_6.c,75 :: 		clr_ADC1_settings();
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;EX_6.c,76 :: 		set_ADC_mode(independent_mode);
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
;EX_6.c,77 :: 		set_ADC1_data_alignment(right_alignment);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R0, #0]
;EX_6.c,78 :: 		set_ADC1_continuous_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R0, #0]
;EX_6.c,79 :: 		set_ADC1_regular_number_of_conversions(1);
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
;EX_6.c,80 :: 		set_ADC1_external_trigger_regular_conversion_edge(SWSTART_trigger);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
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
L_ADC_init74:
;EX_6.c,81 :: 		ADC1_calibrate();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
L_ADC_init78:
MOVW	R1, #lo_addr(ADC1_CR2bits+0)
MOVT	R1, #hi_addr(ADC1_CR2bits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ADC_init79
IT	AL
BAL	L_ADC_init78
L_ADC_init79:
;EX_6.c,82 :: 		start_ADC1();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R7, #11999
MOVT	R7, #0
NOP
NOP
L_ADC_init83:
SUBS	R7, R7, #1
BNE	L_ADC_init83
NOP
NOP
NOP
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
;EX_6.c,83 :: 		}
L_end_ADC_init:
BX	LR
; end of _ADC_init
_read_ADC1:
;EX_6.c,86 :: 		unsigned int read_ADC1(unsigned char channel, unsigned char sample_time)
; sample_time start address is: 4 (R1)
; channel start address is: 0 (R0)
; sample_time end address is: 4 (R1)
; channel end address is: 0 (R0)
; channel start address is: 0 (R0)
; sample_time start address is: 4 (R1)
;EX_6.c,88 :: 		ADC1_JSQR = 0x00000000;
MOVS	R3, #0
MOVW	R2, #lo_addr(ADC1_JSQR+0)
MOVT	R2, #hi_addr(ADC1_JSQR+0)
STR	R3, [R2, #0]
;EX_6.c,89 :: 		ADC1_SQR1 = 0x00000000;
MOVS	R3, #0
MOVW	R2, #lo_addr(ADC1_SQR1+0)
MOVT	R2, #hi_addr(ADC1_SQR1+0)
STR	R3, [R2, #0]
;EX_6.c,90 :: 		ADC1_SQR2 = 0x00000000;
MOVS	R3, #0
MOVW	R2, #lo_addr(ADC1_SQR2+0)
MOVT	R2, #hi_addr(ADC1_SQR2+0)
STR	R3, [R2, #0]
;EX_6.c,91 :: 		ADC1_SQR3 = 0x00000000;
MOVS	R3, #0
MOVW	R2, #lo_addr(ADC1_SQR3+0)
MOVT	R2, #hi_addr(ADC1_SQR3+0)
STR	R3, [R2, #0]
;EX_6.c,92 :: 		ADC1_SMPR1 = 0x00000000;
MOVS	R3, #0
MOVW	R2, #lo_addr(ADC1_SMPR1+0)
MOVT	R2, #hi_addr(ADC1_SMPR1+0)
STR	R3, [R2, #0]
;EX_6.c,93 :: 		ADC1_SMPR2 = 0x00000000;
MOVS	R3, #0
MOVW	R2, #lo_addr(ADC1_SMPR2+0)
MOVT	R2, #hi_addr(ADC1_SMPR2+0)
STR	R3, [R2, #0]
;EX_6.c,94 :: 		set_ADC1_regular_sequence(1, channel);
MOVW	R2, #lo_addr(ADC1_SQR3+0)
MOVT	R2, #hi_addr(ADC1_SQR3+0)
LDR	R3, [R2, #0]
MVN	R2, #31
ANDS	R3, R2
MOVW	R2, #lo_addr(ADC1_SQR3+0)
MOVT	R2, #hi_addr(ADC1_SQR3+0)
STR	R3, [R2, #0]
UXTB	R3, R0
MOVW	R2, #lo_addr(ADC1_SQR3+0)
MOVT	R2, #hi_addr(ADC1_SQR3+0)
LDR	R2, [R2, #0]
ORR	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(ADC1_SQR3+0)
MOVT	R2, #hi_addr(ADC1_SQR3+0)
STR	R3, [R2, #0]
L_read_ADC191:
;EX_6.c,95 :: 		set_ADC1_sample_time(sample_time, channel);
CMP	R0, #9
IT	HI
BHI	L__read_ADC1105
CMP	R0, #0
IT	CC
BCC	L__read_ADC1104
L__read_ADC1103:
MOVS	R2, #3
SXTH	R2, R2
MUL	R4, R0, R2
SXTH	R4, R4
; channel end address is: 0 (R0)
MOVS	R2, #7
SXTH	R2, R2
LSLS	R2, R4
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
MOVW	R2, #lo_addr(ADC1_SMPR2+0)
MOVT	R2, #hi_addr(ADC1_SMPR2+0)
LDR	R2, [R2, #0]
AND	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(ADC1_SMPR2+0)
MOVT	R2, #hi_addr(ADC1_SMPR2+0)
STR	R3, [R2, #0]
LSL	R3, R1, R4
UXTH	R3, R3
; sample_time end address is: 4 (R1)
MOVW	R2, #lo_addr(ADC1_SMPR2+0)
MOVT	R2, #hi_addr(ADC1_SMPR2+0)
LDR	R2, [R2, #0]
ORR	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(ADC1_SMPR2+0)
MOVT	R2, #hi_addr(ADC1_SMPR2+0)
STR	R3, [R2, #0]
IT	AL
BAL	L_read_ADC1100
L__read_ADC1105:
; sample_time start address is: 4 (R1)
; channel start address is: 0 (R0)
L__read_ADC1104:
SUBW	R3, R0, #10
SXTH	R3, R3
; channel end address is: 0 (R0)
MOVS	R2, #3
SXTH	R2, R2
MUL	R4, R3, R2
SXTH	R4, R4
MOVS	R2, #7
SXTH	R2, R2
LSLS	R2, R4
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
MOVW	R2, #lo_addr(ADC1_SMPR1+0)
MOVT	R2, #hi_addr(ADC1_SMPR1+0)
LDR	R2, [R2, #0]
AND	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(ADC1_SMPR1+0)
MOVT	R2, #hi_addr(ADC1_SMPR1+0)
STR	R3, [R2, #0]
LSL	R3, R1, R4
UXTH	R3, R3
; sample_time end address is: 4 (R1)
MOVW	R2, #lo_addr(ADC1_SMPR1+0)
MOVT	R2, #hi_addr(ADC1_SMPR1+0)
LDR	R2, [R2, #0]
ORR	R3, R2, R3, LSL #0
MOVW	R2, #lo_addr(ADC1_SMPR1+0)
MOVT	R2, #hi_addr(ADC1_SMPR1+0)
STR	R3, [R2, #0]
L_read_ADC1100:
;EX_6.c,96 :: 		set_ADC1_regular_conversions(enable);
MOVS	R3, #1
MOVW	R2, #lo_addr(ADC1_CR2bits+0)
MOVT	R2, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R2, #0]
;EX_6.c,97 :: 		while(ADC1_SRbits.EOC == reset);
L_read_ADC1101:
MOVW	R3, #lo_addr(ADC1_SRbits+0)
MOVT	R3, #hi_addr(ADC1_SRbits+0)
LDR	R2, [R3, #0]
CMP	R2, #0
IT	NE
BNE	L_read_ADC1102
IT	AL
BAL	L_read_ADC1101
L_read_ADC1102:
;EX_6.c,98 :: 		return (0x0FFF & ADC1_DR);
MOVW	R2, #lo_addr(ADC1_DR+0)
MOVT	R2, #hi_addr(ADC1_DR+0)
LDR	R3, [R2, #0]
MOVW	R2, #4095
ANDS	R2, R3
UXTH	R0, R2
;EX_6.c,99 :: 		}
L_end_read_ADC1:
BX	LR
; end of _read_ADC1
_lcd_print:
;EX_6.c,102 :: 		void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
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
;EX_6.c,104 :: 		unsigned char tmp = 0;
;EX_6.c,106 :: 		tmp = (value / 1000);
MOVW	R3, #1000
UDIV	R3, R8, R3
;EX_6.c,107 :: 		lcd_chr(y_pos, x_pos, (tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
STRB	R1, [SP, #4]
UXTB	R2, R3
UXTB	R1, R0
; x_pos end address is: 0 (R0)
LDRB	R0, [SP, #4]
; y_pos end address is: 4 (R1)
BL	_Lcd_Chr+0
;EX_6.c,108 :: 		tmp = ((value / 100) % 10);
MOVS	R3, #100
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;EX_6.c,109 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_6.c,110 :: 		tmp = ((value / 10) % 10);
MOVS	R3, #10
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;EX_6.c,111 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_6.c,112 :: 		tmp = (value % 10);
MOVS	R4, #10
UDIV	R3, R8, R4
MLS	R3, R4, R3, R8
; value end address is: 32 (R8)
;EX_6.c,113 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_6.c,114 :: 		}
L_end_lcd_print:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lcd_print
