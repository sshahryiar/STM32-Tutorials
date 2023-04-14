_ADC1_2_ISR:
;Ex_10.c,24 :: 		ics ICS_AUTO
;Ex_10.c,26 :: 		ADC2_SRbits.JEOC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC2_SRbits+0)
MOVT	R0, #hi_addr(ADC2_SRbits+0)
STR	R1, [R0, #0]
;Ex_10.c,27 :: 		channel_data[0] = (ADC2_JDR1 & 0x0FFF);
MOVW	R0, #lo_addr(ADC2_JDR1+0)
MOVT	R0, #hi_addr(ADC2_JDR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(_channel_data+0)
MOVT	R0, #hi_addr(_channel_data+0)
STRH	R1, [R0, #0]
;Ex_10.c,28 :: 		channel_data[1] = (ADC2_JDR2 & 0x0FFF);
MOVW	R0, #lo_addr(ADC2_JDR2+0)
MOVT	R0, #hi_addr(ADC2_JDR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(_channel_data+2)
MOVT	R0, #hi_addr(_channel_data+2)
STRH	R1, [R0, #0]
;Ex_10.c,29 :: 		}
L_end_ADC1_2_ISR:
BX	LR
; end of _ADC1_2_ISR
_main:
;Ex_10.c,32 :: 		void main()
;Ex_10.c,34 :: 		setup();
BL	_setup+0
;Ex_10.c,36 :: 		while(1)
L_main0:
;Ex_10.c,38 :: 		GPIOC_pin_high(13);
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;Ex_10.c,39 :: 		set_ADC2_injected_conversions(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
;Ex_10.c,40 :: 		delay_ms(10);
MOVW	R7, #24463
MOVT	R7, #1
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;Ex_10.c,41 :: 		lcd_print(1, 2, channel_data[0]);
MOVW	R0, #lo_addr(_channel_data+0)
MOVT	R0, #hi_addr(_channel_data+0)
LDRH	R0, [R0, #0]
UXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #1
BL	_lcd_print+0
;Ex_10.c,42 :: 		lcd_print(13, 2, channel_data[1]);
MOVW	R0, #lo_addr(_channel_data+2)
MOVT	R0, #hi_addr(_channel_data+2)
LDRH	R0, [R0, #0]
UXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #13
BL	_lcd_print+0
;Ex_10.c,43 :: 		GPIOC_pin_low(13);
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
STR	R1, [R0, #0]
;Ex_10.c,44 :: 		delay_ms(90);
MOVW	R7, #23567
MOVT	R7, #12
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;Ex_10.c,45 :: 		};
IT	AL
BAL	L_main0
;Ex_10.c,46 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_10.c,49 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_10.c,51 :: 		GPIO_init();
BL	_GPIO_init+0
;Ex_10.c,52 :: 		LCD_Init();
BL	_Lcd_Init+0
;Ex_10.c,53 :: 		ADC_init();
BL	_ADC_init+0
;Ex_10.c,55 :: 		LCD_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Ex_10.c,56 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;Ex_10.c,58 :: 		lcd_out(1, 1, "CH04        CH06");
MOVW	R0, #lo_addr(?lstr1_Ex_10+0)
MOVT	R0, #hi_addr(?lstr1_Ex_10+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_10.c,59 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_init:
;Ex_10.c,62 :: 		void GPIO_init()
;Ex_10.c,64 :: 		enable_GPIOA(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_10.c,65 :: 		enable_GPIOB(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_10.c,66 :: 		enable_GPIOC(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_10.c,68 :: 		setup_GPIOA(4, analog_input);
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
L_GPIO_init15:
;Ex_10.c,69 :: 		setup_GPIOA(6, analog_input);
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
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_GPIO_init28:
;Ex_10.c,70 :: 		setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
L_GPIO_init35:
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
;Ex_10.c,71 :: 		}
L_end_GPIO_init:
BX	LR
; end of _GPIO_init
_ADC_init:
;Ex_10.c,74 :: 		void ADC_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_10.c,76 :: 		ADC2_Enable();
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
;Ex_10.c,77 :: 		clr_ADC2_settings();
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC2_CR1+0)
MOVT	R0, #hi_addr(ADC2_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC2_CR2+0)
MOVT	R0, #hi_addr(ADC2_CR2+0)
STR	R1, [R0, #0]
;Ex_10.c,78 :: 		set_ADC_mode(independent_mode);
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
;Ex_10.c,79 :: 		set_ADC2_data_alignment(right_alignment);
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R2, [R0, #0]
;Ex_10.c,80 :: 		set_ADC2_scan_conversion_mode(enable);
MOVW	R0, #lo_addr(ADC2_CR1bits+0)
MOVT	R0, #hi_addr(ADC2_CR1bits+0)
STR	R3, [R0, #0]
;Ex_10.c,81 :: 		set_ADC2_continuous_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R2, [R0, #0]
;Ex_10.c,82 :: 		set_ADC2_sample_time(sample_time_1_5_cycles, 4);
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
LDR	R1, [R0, #0]
MVN	R0, #28672
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init58:
;Ex_10.c,83 :: 		set_ADC2_sample_time(sample_time_13_5_cycles, 6);
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
LDR	R1, [R0, #0]
MVN	R0, #1835008
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(ADC2_SMPR2+0)
MOVT	R0, #hi_addr(ADC2_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init65:
;Ex_10.c,84 :: 		set_ADC2_external_trigger_injected_conversion_edge(JSWSTART_trigger);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_CR2+0)
MOVT	R0, #hi_addr(ADC2_CR2+0)
LDR	R1, [R0, #0]
MVN	R0, #28672
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_CR2+0)
MOVT	R0, #hi_addr(ADC2_CR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_CR2+0)
MOVT	R0, #hi_addr(ADC2_CR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #28672
MOVW	R0, #lo_addr(ADC2_CR2+0)
MOVT	R0, #hi_addr(ADC2_CR2+0)
STR	R1, [R0, #0]
L_ADC_init72:
;Ex_10.c,85 :: 		set_ADC2_injected_number_of_conversions(2);
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
LDR	R1, [R0, #0]
MVN	R0, #3145728
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1048576
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
STR	R1, [R0, #0]
;Ex_10.c,86 :: 		set_ADC2_injected_sequence(3, 4);
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
LDR	R1, [R0, #0]
MVN	R0, #31744
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4096
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
STR	R1, [R0, #0]
;Ex_10.c,87 :: 		set_ADC2_injected_sequence(4, 6);
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
LDR	R1, [R0, #0]
MVN	R0, #1015808
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #196608
MOVW	R0, #lo_addr(ADC2_JSQR+0)
MOVT	R0, #hi_addr(ADC2_JSQR+0)
STR	R1, [R0, #0]
;Ex_10.c,88 :: 		set_ADC2_injected_end_of_conversion_interrupt(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR1bits+0)
MOVT	R0, #hi_addr(ADC2_CR1bits+0)
STR	R1, [R0, #0]
;Ex_10.c,89 :: 		NVIC_IntEnable(IVT_INT_ADC1_2);
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;Ex_10.c,90 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ex_10.c,91 :: 		ADC2_calibrate();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
L_ADC_init85:
MOVW	R1, #lo_addr(ADC2_CR2bits+0)
MOVT	R1, #hi_addr(ADC2_CR2bits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ADC_init86
IT	AL
BAL	L_ADC_init85
L_ADC_init86:
;Ex_10.c,92 :: 		start_ADC2();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R7, #8999
MOVT	R7, #0
NOP
NOP
L_ADC_init90:
SUBS	R7, R7, #1
BNE	L_ADC_init90
NOP
NOP
NOP
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC2_CR2bits+0)
MOVT	R0, #hi_addr(ADC2_CR2bits+0)
STR	R1, [R0, #0]
;Ex_10.c,93 :: 		}
L_end_ADC_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ADC_init
_lcd_print:
;Ex_10.c,96 :: 		void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
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
;Ex_10.c,98 :: 		unsigned char tmp = 0;
;Ex_10.c,100 :: 		tmp = (value / 1000);
MOVW	R3, #1000
UDIV	R3, R8, R3
;Ex_10.c,101 :: 		lcd_chr(y_pos, x_pos, (tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
STRB	R1, [SP, #4]
UXTB	R2, R3
UXTB	R1, R0
; x_pos end address is: 0 (R0)
LDRB	R0, [SP, #4]
; y_pos end address is: 4 (R1)
BL	_Lcd_Chr+0
;Ex_10.c,102 :: 		tmp = ((value / 100) % 10);
MOVS	R3, #100
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;Ex_10.c,103 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_10.c,104 :: 		tmp = ((value / 10) % 10);
MOVS	R3, #10
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;Ex_10.c,105 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_10.c,106 :: 		tmp = (value % 10);
MOVS	R4, #10
UDIV	R3, R8, R4
MLS	R3, R4, R3, R8
; value end address is: 32 (R8)
;Ex_10.c,107 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_10.c,108 :: 		}
L_end_lcd_print:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lcd_print
