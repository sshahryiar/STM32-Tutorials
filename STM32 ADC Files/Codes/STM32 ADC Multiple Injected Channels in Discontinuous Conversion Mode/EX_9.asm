_main:
;EX_9.c,20 :: 		void main()
SUB	SP, SP, #8
;EX_9.c,22 :: 		unsigned int channel_data[3] = {0x0000, 0x0000, 0x0000};
MOVW	R0, #0
STRH	R0, [SP, #0]
MOVW	R0, #0
STRH	R0, [SP, #2]
MOVW	R0, #0
STRH	R0, [SP, #4]
;EX_9.c,24 :: 		setup();
BL	_setup+0
;EX_9.c,26 :: 		while(1)
L_main0:
;EX_9.c,28 :: 		read_ADC1_injected(channel_data);
ADD	R0, SP, #0
BL	_read_ADC1_injected+0
;EX_9.c,29 :: 		lcd_print(1, 2, channel_data[0]);
ADD	R0, SP, #0
LDRH	R0, [R0, #0]
UXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #1
BL	_lcd_print+0
;EX_9.c,30 :: 		lcd_print(7, 2, channel_data[1]);
ADD	R0, SP, #0
ADDS	R0, R0, #2
LDRH	R0, [R0, #0]
UXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #7
BL	_lcd_print+0
;EX_9.c,31 :: 		lcd_print(13, 2, channel_data[2]);
ADD	R0, SP, #0
ADDS	R0, R0, #4
LDRH	R0, [R0, #0]
UXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #13
BL	_lcd_print+0
;EX_9.c,33 :: 		GPIOC_pin_high(13);
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;EX_9.c,34 :: 		delay_ms(10);
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
;EX_9.c,35 :: 		GPIOC_pin_low(13);
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
STR	R1, [R0, #0]
;EX_9.c,36 :: 		delay_ms(90);
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
;EX_9.c,37 :: 		};
IT	AL
BAL	L_main0
;EX_9.c,38 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;EX_9.c,41 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;EX_9.c,43 :: 		GPIO_init();
BL	_GPIO_init+0
;EX_9.c,44 :: 		ADC_init();
BL	_ADC_init+0
;EX_9.c,45 :: 		LCD_Init();
BL	_Lcd_Init+0
;EX_9.c,47 :: 		LCD_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;EX_9.c,48 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;EX_9.c,50 :: 		lcd_out(1, 1, "CH00  CH01  CH02");
MOVW	R0, #lo_addr(?lstr1_EX_9+0)
MOVT	R0, #hi_addr(?lstr1_EX_9+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;EX_9.c,51 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_init:
;EX_9.c,54 :: 		void GPIO_init()
;EX_9.c,56 :: 		enable_GPIOA(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;EX_9.c,57 :: 		enable_GPIOB(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;EX_9.c,58 :: 		enable_GPIOC(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;EX_9.c,60 :: 		setup_GPIOA(0, analog_input);
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
L_GPIO_init15:
;EX_9.c,61 :: 		setup_GPIOA(1, analog_input);
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
L_GPIO_init28:
;EX_9.c,62 :: 		setup_GPIOA(2, analog_input);
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
L_GPIO_init41:
;EX_9.c,63 :: 		setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
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
;EX_9.c,64 :: 		}
L_end_GPIO_init:
BX	LR
; end of _GPIO_init
_ADC_init:
;EX_9.c,67 :: 		void ADC_init()
;EX_9.c,69 :: 		ADC1_Enable();
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
;EX_9.c,70 :: 		clr_ADC1_settings();
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;EX_9.c,71 :: 		set_ADC_mode(independent_mode);
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
;EX_9.c,72 :: 		set_ADC1_data_alignment(right_alignment);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R0, #0]
;EX_9.c,73 :: 		set_ADC1_scan_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R2, [R0, #0]
;EX_9.c,74 :: 		set_ADC1_continuous_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R0, #0]
;EX_9.c,75 :: 		set_ADC1_injected_number_of_conversions(3);
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
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
STR	R1, [R0, #0]
;EX_9.c,76 :: 		set_ADC1_sample_time(sample_time_28_5_cycles, 0);
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
ORR	R1, R0, #3
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init74:
;EX_9.c,77 :: 		set_ADC1_sample_time(sample_time_41_5_cycles, 1);
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
LDR	R1, [R0, #0]
MVN	R0, #56
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init81:
;EX_9.c,78 :: 		set_ADC1_sample_time(sample_time_13_5_cycles, 2);
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
ORR	R1, R0, #128
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init88:
;EX_9.c,79 :: 		set_ADC1_injected_sequence(1, 0);
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
LDR	R1, [R0, #0]
MVN	R0, #31
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
;EX_9.c,80 :: 		set_ADC1_injected_sequence(2, 2);
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
LDR	R1, [R0, #0]
MVN	R0, #992
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
STR	R1, [R0, #0]
;EX_9.c,81 :: 		set_ADC1_injected_sequence(3, 1);
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
LDR	R1, [R0, #0]
MVN	R0, #31744
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
STR	R1, [R0, #0]
;EX_9.c,82 :: 		set_ADC1_number_of_discontinuous_conversions(3);
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #8191
ANDS	R1, R0
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #24576
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
;EX_9.c,83 :: 		set_ADC1_external_trigger_injected_conversion_edge(JSWSTART_trigger);
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
L_ADC_init107:
;EX_9.c,84 :: 		set_ADC1_discontinuous_conversion_mode_in_injected_mode(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;EX_9.c,85 :: 		ADC1_calibrate();
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
L_ADC_init111:
MOVW	R1, #lo_addr(ADC1_CR2bits+0)
MOVT	R1, #hi_addr(ADC1_CR2bits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ADC_init112
IT	AL
BAL	L_ADC_init111
L_ADC_init112:
;EX_9.c,86 :: 		start_ADC1();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R7, #8999
MOVT	R7, #0
NOP
NOP
L_ADC_init116:
SUBS	R7, R7, #1
BNE	L_ADC_init116
NOP
NOP
NOP
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
;EX_9.c,87 :: 		}
L_end_ADC_init:
BX	LR
; end of _ADC_init
_read_ADC1_injected:
;EX_9.c,90 :: 		void read_ADC1_injected(unsigned int temp_data[3])
; temp_data start address is: 0 (R0)
; temp_data end address is: 0 (R0)
; temp_data start address is: 0 (R0)
;EX_9.c,92 :: 		set_ADC1_injected_conversions(enable);
MOVS	R2, #1
MOVW	R1, #lo_addr(ADC1_CR2bits+0)
MOVT	R1, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R1, #0]
; temp_data end address is: 0 (R0)
;EX_9.c,93 :: 		while(ADC1_SRbits.JEOC == 0);
L_read_ADC1_injected118:
; temp_data start address is: 0 (R0)
MOVW	R2, #lo_addr(ADC1_SRbits+0)
MOVT	R2, #hi_addr(ADC1_SRbits+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_read_ADC1_injected119
IT	AL
BAL	L_read_ADC1_injected118
L_read_ADC1_injected119:
;EX_9.c,94 :: 		temp_data[0] = (ADC1_JDR3 & 0x0FFF);
MOVW	R1, #lo_addr(ADC1_JDR3+0)
MOVT	R1, #hi_addr(ADC1_JDR3+0)
LDR	R2, [R1, #0]
MOVW	R1, #4095
AND	R1, R2, R1, LSL #0
STRH	R1, [R0, #0]
;EX_9.c,95 :: 		set_ADC1_injected_conversions(enable);
MOVS	R2, #1
MOVW	R1, #lo_addr(ADC1_CR2bits+0)
MOVT	R1, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R1, #0]
; temp_data end address is: 0 (R0)
;EX_9.c,96 :: 		while(ADC1_SRbits.JEOC == 0);
L_read_ADC1_injected120:
; temp_data start address is: 0 (R0)
MOVW	R2, #lo_addr(ADC1_SRbits+0)
MOVT	R2, #hi_addr(ADC1_SRbits+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_read_ADC1_injected121
IT	AL
BAL	L_read_ADC1_injected120
L_read_ADC1_injected121:
;EX_9.c,97 :: 		temp_data[1] = (ADC1_JDR2 & 0x0FFF);
ADDS	R3, R0, #2
MOVW	R1, #lo_addr(ADC1_JDR2+0)
MOVT	R1, #hi_addr(ADC1_JDR2+0)
LDR	R2, [R1, #0]
MOVW	R1, #4095
AND	R1, R2, R1, LSL #0
STRH	R1, [R3, #0]
;EX_9.c,98 :: 		set_ADC1_injected_conversions(enable);
MOVS	R2, #1
MOVW	R1, #lo_addr(ADC1_CR2bits+0)
MOVT	R1, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R1, #0]
; temp_data end address is: 0 (R0)
;EX_9.c,99 :: 		while(ADC1_SRbits.JEOC == 0);
L_read_ADC1_injected122:
; temp_data start address is: 0 (R0)
MOVW	R2, #lo_addr(ADC1_SRbits+0)
MOVT	R2, #hi_addr(ADC1_SRbits+0)
LDR	R1, [R2, #0]
CMP	R1, #0
IT	NE
BNE	L_read_ADC1_injected123
IT	AL
BAL	L_read_ADC1_injected122
L_read_ADC1_injected123:
;EX_9.c,100 :: 		temp_data[2] = (ADC1_JDR1 & 0x0FFF);
ADDS	R3, R0, #4
; temp_data end address is: 0 (R0)
MOVW	R1, #lo_addr(ADC1_JDR1+0)
MOVT	R1, #hi_addr(ADC1_JDR1+0)
LDR	R2, [R1, #0]
MOVW	R1, #4095
AND	R1, R2, R1, LSL #0
STRH	R1, [R3, #0]
;EX_9.c,101 :: 		}
L_end_read_ADC1_injected:
BX	LR
; end of _read_ADC1_injected
_lcd_print:
;EX_9.c,104 :: 		void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
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
;EX_9.c,106 :: 		unsigned char tmp = 0;
;EX_9.c,108 :: 		tmp = (value / 1000);
MOVW	R3, #1000
UDIV	R3, R8, R3
;EX_9.c,109 :: 		lcd_chr(y_pos, x_pos, (tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
STRB	R1, [SP, #4]
UXTB	R2, R3
UXTB	R1, R0
; x_pos end address is: 0 (R0)
LDRB	R0, [SP, #4]
; y_pos end address is: 4 (R1)
BL	_Lcd_Chr+0
;EX_9.c,110 :: 		tmp = ((value / 100) % 10);
MOVS	R3, #100
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;EX_9.c,111 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_9.c,112 :: 		tmp = ((value / 10) % 10);
MOVS	R3, #10
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;EX_9.c,113 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_9.c,114 :: 		tmp = (value % 10);
MOVS	R4, #10
UDIV	R3, R8, R4
MLS	R3, R4, R3, R8
; value end address is: 32 (R8)
;EX_9.c,115 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_9.c,116 :: 		}
L_end_lcd_print:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lcd_print
