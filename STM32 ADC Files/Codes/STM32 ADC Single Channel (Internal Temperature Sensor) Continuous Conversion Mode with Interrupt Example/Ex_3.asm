_ADC_ISR:
;Ex_3.c,32 :: 		ics ICS_AUTO
;Ex_3.c,34 :: 		adc_data = (ADC1_DR & 0x0FFF);
MOVW	R0, #lo_addr(ADC1_DR+0)
MOVT	R0, #hi_addr(ADC1_DR+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(adc_data+0)
MOVT	R0, #hi_addr(adc_data+0)
STRH	R1, [R0, #0]
;Ex_3.c,35 :: 		GPIOC_pin_high(13);
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;Ex_3.c,36 :: 		}
L_end_ADC_ISR:
BX	LR
; end of _ADC_ISR
_main:
;Ex_3.c,39 :: 		void main()
SUB	SP, SP, #8
;Ex_3.c,41 :: 		register float t = 0.0;
;Ex_3.c,43 :: 		setup();
BL	_setup+0
;Ex_3.c,45 :: 		while(1)
L_main0:
;Ex_3.c,47 :: 		t = map(adc_data, 0, 4095, 0, 3300);
MOVW	R0, #16384
MOVT	R0, #17742
STR	R0, [SP, #4]
MOVW	R0, #lo_addr(adc_data+0)
MOVT	R0, #hi_addr(adc_data+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
MOV	R1, R0
LDR	R0, [SP, #4]
PUSH	(R0)
MOV	R3, #0
MOVW	R2, #61440
MOVT	R2, #17791
MOV	R0, R1
MOV	R1, #0
BL	_map+0
ADD	SP, SP, #4
STR	R0, [SP, #4]
MOVW	R0, #49152
MOVT	R0, #17586
;Ex_3.c,48 :: 		t = (((V25 - t) / 4.3) + 25);
STR	R1, [SP, #0]
LDR	R1, [SP, #4]
MOV	R2, R1
BL	__Sub_FP+0
LDR	R1, [SP, #0]
MOVW	R2, #39322
MOVT	R2, #16521
BL	__Div_FP+0
MOVW	R2, #0
MOVT	R2, #16840
BL	__Add_FP+0
;Ex_3.c,49 :: 		t -=  T_offset;
MOVW	R2, #0
MOVT	R2, #16780
BL	__Sub_FP+0
;Ex_3.c,50 :: 		t *= 100;
MOVW	R2, #0
MOVT	R2, #17096
BL	__Mul_FP+0
; t start address is: 4 (R1)
MOV	R1, R0
;Ex_3.c,52 :: 		if(t <= 0)
MOV	R2, #0
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__main71
MOVS	R0, #1
L__main71:
CMP	R0, #0
IT	EQ
BEQ	L__main67
;Ex_3.c,54 :: 		t = 0;
MOV	R1, #0
; t end address is: 4 (R1)
;Ex_3.c,55 :: 		}
IT	AL
BAL	L_main2
L__main67:
;Ex_3.c,52 :: 		if(t <= 0)
;Ex_3.c,55 :: 		}
L_main2:
;Ex_3.c,56 :: 		if(t >= 9999)
; t start address is: 4 (R1)
MOVW	R0, #15360
MOVT	R0, #17948
MOV	R2, R1
BL	__Compare_FP+0
MOVW	R0, #0
BGT	L__main72
MOVS	R0, #1
L__main72:
CMP	R0, #0
IT	EQ
BEQ	L__main68
; t end address is: 4 (R1)
;Ex_3.c,58 :: 		t = 9999;
; t start address is: 40 (R10)
MOVW	R10, #15360
MOVT	R10, #17948
; t end address is: 40 (R10)
;Ex_3.c,59 :: 		}
IT	AL
BAL	L_main3
L__main68:
;Ex_3.c,56 :: 		if(t >= 9999)
MOV	R10, R1
;Ex_3.c,59 :: 		}
L_main3:
;Ex_3.c,61 :: 		lcd_print(13, 1, adc_data, 1);
; t start address is: 40 (R10)
MOVW	R0, #lo_addr(adc_data+0)
MOVT	R0, #hi_addr(adc_data+0)
LDRH	R0, [R0, #0]
MOVS	R3, #1
UXTH	R2, R0
MOVS	R1, #1
MOVS	R0, #13
BL	_lcd_print+0
;Ex_3.c,62 :: 		lcd_print(12, 2, t, 0);
MOV	R0, R10
BL	__FloatToUnsignedIntegral+0
UXTH	R0, R0
; t end address is: 40 (R10)
MOVS	R3, #0
UXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #12
BL	_lcd_print+0
;Ex_3.c,64 :: 		GPIOC_pin_low(13);
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
STR	R1, [R0, #0]
;Ex_3.c,65 :: 		delay_ms(90);
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
;Ex_3.c,66 :: 		};
IT	AL
BAL	L_main0
;Ex_3.c,67 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_3.c,70 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_3.c,72 :: 		GPIO_init();
BL	_GPIO_init+0
;Ex_3.c,73 :: 		ADC_init();
BL	_ADC_init+0
;Ex_3.c,74 :: 		LCD_Init();
BL	_Lcd_Init+0
;Ex_3.c,76 :: 		LCD_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Ex_3.c,77 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;Ex_3.c,79 :: 		lcd_out(1, 1, "CH16:");
MOVW	R0, #lo_addr(?lstr1_Ex_3+0)
MOVT	R0, #hi_addr(?lstr1_Ex_3+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_3.c,80 :: 		lcd_out(2, 1, "T/ C:");
MOVW	R0, #lo_addr(?lstr2_Ex_3+0)
MOVT	R0, #hi_addr(?lstr2_Ex_3+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;Ex_3.c,81 :: 		CustomChar(2, 3);
MOVS	R1, #3
MOVS	R0, #2
BL	_CustomChar+0
;Ex_3.c,82 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_init:
;Ex_3.c,85 :: 		void GPIO_init()
;Ex_3.c,87 :: 		enable_GPIOB(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_3.c,88 :: 		enable_GPIOC(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_3.c,90 :: 		setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
L_GPIO_init9:
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
;Ex_3.c,91 :: 		}
L_end_GPIO_init:
BX	LR
; end of _GPIO_init
_ADC_init:
;Ex_3.c,94 :: 		void ADC_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_3.c,96 :: 		ADC1_Enable();
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
;Ex_3.c,97 :: 		clr_ADC1_settings();
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;Ex_3.c,98 :: 		set_ADC_mode(independent_mode);
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
;Ex_3.c,99 :: 		set_ADC1_data_alignment(right_alignment);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R0, #0]
;Ex_3.c,100 :: 		set_ADC1_scan_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R2, [R0, #0]
;Ex_3.c,101 :: 		set_ADC1_continuous_conversion_mode(enable);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R3, [R0, #0]
;Ex_3.c,102 :: 		set_ADC1_external_trigger_regular_conversion_edge(SWSTART_trigger);
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
L_ADC_init32:
;Ex_3.c,103 :: 		set_ADC1_regular_number_of_conversions(1);
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
;Ex_3.c,104 :: 		set_ADC1_sample_time(sample_time_13_5_cycles, 16);
L_ADC_init39:
MOVW	R0, #lo_addr(ADC1_SMPR1+0)
MOVT	R0, #hi_addr(ADC1_SMPR1+0)
LDR	R1, [R0, #0]
MVN	R0, #1835008
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_SMPR1+0)
MOVT	R0, #hi_addr(ADC1_SMPR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_SMPR1+0)
MOVT	R0, #hi_addr(ADC1_SMPR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(ADC1_SMPR1+0)
MOVT	R0, #hi_addr(ADC1_SMPR1+0)
STR	R1, [R0, #0]
;Ex_3.c,105 :: 		set_ADC1_regular_sequence(1, 16);
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
ORR	R1, R0, #16
MOVW	R0, #lo_addr(ADC1_SQR3+0)
MOVT	R0, #hi_addr(ADC1_SQR3+0)
STR	R1, [R0, #0]
L_ADC_init47:
;Ex_3.c,106 :: 		set_ADC1_reference_and_temperature_sensor(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
;Ex_3.c,107 :: 		set_ADC1_regular_end_of_conversion_interrupt(enable);
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;Ex_3.c,108 :: 		NVIC_IntEnable(IVT_INT_ADC1_2);
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;Ex_3.c,110 :: 		ADC1_calibrate();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
L_ADC_init53:
MOVW	R1, #lo_addr(ADC1_CR2bits+0)
MOVT	R1, #hi_addr(ADC1_CR2bits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ADC_init54
IT	AL
BAL	L_ADC_init53
L_ADC_init54:
;Ex_3.c,111 :: 		start_ADC1();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_ADC_init58:
SUBS	R7, R7, #1
BNE	L_ADC_init58
NOP
NOP
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
;Ex_3.c,112 :: 		}
L_end_ADC_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ADC_init
_CustomChar:
;Ex_3.c,115 :: 		void CustomChar(unsigned char y_pos, unsigned char x_pos)
; x_pos start address is: 4 (R1)
; y_pos start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTB	R3, R0
UXTB	R4, R1
; x_pos end address is: 4 (R1)
; y_pos end address is: 0 (R0)
; y_pos start address is: 12 (R3)
; x_pos start address is: 16 (R4)
;Ex_3.c,117 :: 		unsigned char i = 0;
;Ex_3.c,119 :: 		Lcd_Cmd(64);
MOVS	R0, #64
BL	_Lcd_Cmd+0
;Ex_3.c,120 :: 		for (i = 0; i < 8; i += 1)
; i start address is: 20 (R5)
MOVS	R5, #0
; y_pos end address is: 12 (R3)
; x_pos end address is: 16 (R4)
; i end address is: 20 (R5)
STRB	R4, [SP, #4]
UXTB	R4, R3
LDRB	R3, [SP, #4]
L_CustomChar60:
; i start address is: 20 (R5)
; x_pos start address is: 12 (R3)
; y_pos start address is: 16 (R4)
CMP	R5, #8
IT	CS
BCS	L_CustomChar61
;Ex_3.c,122 :: 		Lcd_Chr_CP(symbol[i]);
MOVW	R2, #lo_addr(_symbol+0)
MOVT	R2, #hi_addr(_symbol+0)
ADDS	R2, R2, R5
LDRB	R2, [R2, #0]
UXTB	R0, R2
BL	_Lcd_Chr_CP+0
;Ex_3.c,120 :: 		for (i = 0; i < 8; i += 1)
ADDS	R2, R5, #1
UXTB	R5, R2
;Ex_3.c,123 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_CustomChar60
L_CustomChar61:
;Ex_3.c,124 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
MOVS	R0, #2
BL	_Lcd_Cmd+0
;Ex_3.c,125 :: 		Lcd_Chr(y_pos, x_pos, 0);
MOVS	R2, #0
UXTB	R1, R3
; x_pos end address is: 12 (R3)
UXTB	R0, R4
; y_pos end address is: 16 (R4)
BL	_Lcd_Chr+0
;Ex_3.c,126 :: 		}
L_end_CustomChar:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _CustomChar
_lcd_print:
;Ex_3.c,129 :: 		void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value, unsigned char disp_type)
; disp_type start address is: 12 (R3)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTH	R8, R2
UXTB	R9, R3
; disp_type end address is: 12 (R3)
; value end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 0 (R0)
; y_pos start address is: 4 (R1)
; value start address is: 32 (R8)
; disp_type start address is: 36 (R9)
;Ex_3.c,131 :: 		unsigned char tmp = 0;
;Ex_3.c,133 :: 		tmp = (value / 1000);
MOVW	R4, #1000
UDIV	R4, R8, R4
;Ex_3.c,134 :: 		lcd_chr(y_pos, x_pos, (tmp + 48));
UXTB	R4, R4
ADDS	R4, #48
STRB	R1, [SP, #4]
UXTB	R2, R4
UXTB	R1, R0
; x_pos end address is: 0 (R0)
LDRB	R0, [SP, #4]
; y_pos end address is: 4 (R1)
BL	_Lcd_Chr+0
;Ex_3.c,135 :: 		tmp = ((value / 100) % 10);
MOVS	R4, #100
UDIV	R6, R8, R4
UXTH	R6, R6
MOVS	R5, #10
UDIV	R4, R6, R5
MLS	R4, R5, R4, R6
;Ex_3.c,136 :: 		lcd_chr_cp((tmp + 48));
UXTB	R4, R4
ADDS	R4, #48
UXTB	R0, R4
BL	_Lcd_Chr_CP+0
;Ex_3.c,137 :: 		switch(disp_type)
IT	AL
BAL	L_lcd_print63
; disp_type end address is: 36 (R9)
;Ex_3.c,139 :: 		case 0:
L_lcd_print65:
;Ex_3.c,141 :: 		lcd_chr_cp(46);
MOVS	R0, #46
BL	_Lcd_Chr_CP+0
;Ex_3.c,142 :: 		break;
IT	AL
BAL	L_lcd_print64
;Ex_3.c,144 :: 		case 1:
L_lcd_print66:
;Ex_3.c,146 :: 		break;
IT	AL
BAL	L_lcd_print64
;Ex_3.c,148 :: 		}
L_lcd_print63:
; disp_type start address is: 36 (R9)
CMP	R9, #0
IT	EQ
BEQ	L_lcd_print65
CMP	R9, #1
IT	EQ
BEQ	L_lcd_print66
; disp_type end address is: 36 (R9)
L_lcd_print64:
;Ex_3.c,149 :: 		tmp = ((value / 10) % 10);
MOVS	R4, #10
UDIV	R6, R8, R4
UXTH	R6, R6
MOVS	R5, #10
UDIV	R4, R6, R5
MLS	R4, R5, R4, R6
;Ex_3.c,150 :: 		lcd_chr_cp((tmp + 48));
UXTB	R4, R4
ADDS	R4, #48
UXTB	R0, R4
BL	_Lcd_Chr_CP+0
;Ex_3.c,151 :: 		tmp = (value % 10);
MOVS	R5, #10
UDIV	R4, R8, R5
MLS	R4, R5, R4, R8
; value end address is: 32 (R8)
;Ex_3.c,152 :: 		lcd_chr_cp((tmp + 48));
UXTB	R4, R4
ADDS	R4, #48
UXTB	R0, R4
BL	_Lcd_Chr_CP+0
;Ex_3.c,153 :: 		}
L_end_lcd_print:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lcd_print
_map:
;Ex_3.c,156 :: 		float map(float v, float x_min, float x_max, float y_min, float y_max)
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
;Ex_3.c,158 :: 		return (y_min + (((y_max - y_min)/(x_max - x_min)) * (v - x_min)));
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
;Ex_3.c,159 :: 		}
L_end_map:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _map
