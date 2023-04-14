_ADC1_2_ISR:
;Ex_13.c,28 :: 		ics ICS_AUTO
;Ex_13.c,30 :: 		if(ADC1_SRbits.EOC)
MOVW	R1, #lo_addr(ADC1_SRbits+0)
MOVT	R1, #hi_addr(ADC1_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ADC1_2_ISR0
;Ex_13.c,32 :: 		ADC1_SRbits.EOC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;Ex_13.c,33 :: 		regular_adc_data = (ADC1_DR & 0x0FFF);
MOVW	R0, #lo_addr(ADC1_DR+0)
MOVT	R0, #hi_addr(ADC1_DR+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(regular_adc_data+0)
MOVT	R0, #hi_addr(regular_adc_data+0)
STRH	R1, [R0, #0]
;Ex_13.c,34 :: 		}
L_ADC1_2_ISR0:
;Ex_13.c,35 :: 		if(ADC1_SRbits.JEOC)
MOVW	R1, #lo_addr(ADC1_SRbits+0)
MOVT	R1, #hi_addr(ADC1_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ADC1_2_ISR1
;Ex_13.c,37 :: 		ADC1_SRbits.JEOC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;Ex_13.c,38 :: 		injected_adc_data = (ADC1_JDR1 & 0x0FFF);
MOVW	R0, #lo_addr(ADC1_JDR1+0)
MOVT	R0, #hi_addr(ADC1_JDR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(injected_adc_data+0)
MOVT	R0, #hi_addr(injected_adc_data+0)
STRH	R1, [R0, #0]
;Ex_13.c,39 :: 		}
L_ADC1_2_ISR1:
;Ex_13.c,40 :: 		}
L_end_ADC1_2_ISR:
BX	LR
; end of _ADC1_2_ISR
_EXTI11_ISR:
;Ex_13.c,45 :: 		ics ICS_AUTO
;Ex_13.c,47 :: 		unsigned char s = 0;
;Ex_13.c,49 :: 		if(read_pending_reg(15) != 0)
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32768
CMP	R0, #0
IT	EQ
BEQ	L_EXTI11_ISR2
;Ex_13.c,51 :: 		for(s = 0; s < 3; s++)
; s start address is: 8 (R2)
MOVS	R2, #0
; s end address is: 8 (R2)
L_EXTI11_ISR3:
; s start address is: 8 (R2)
CMP	R2, #3
IT	CS
BCS	L_EXTI11_ISR4
;Ex_13.c,53 :: 		GPIOC_pin_high(13);
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;Ex_13.c,54 :: 		delay_ms(10);
MOVW	R7, #24463
MOVT	R7, #1
NOP
NOP
L_EXTI11_ISR6:
SUBS	R7, R7, #1
BNE	L_EXTI11_ISR6
NOP
NOP
NOP
;Ex_13.c,55 :: 		GPIOC_pin_low(13);
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
STR	R1, [R0, #0]
;Ex_13.c,56 :: 		delay_ms(10);
MOVW	R7, #24463
MOVT	R7, #1
NOP
NOP
L_EXTI11_ISR8:
SUBS	R7, R7, #1
BNE	L_EXTI11_ISR8
NOP
NOP
NOP
;Ex_13.c,51 :: 		for(s = 0; s < 3; s++)
ADDS	R2, R2, #1
UXTB	R2, R2
;Ex_13.c,57 :: 		}
; s end address is: 8 (R2)
IT	AL
BAL	L_EXTI11_ISR3
L_EXTI11_ISR4:
;Ex_13.c,58 :: 		pending_clr(15);
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Ex_13.c,59 :: 		}
L_EXTI11_ISR2:
;Ex_13.c,61 :: 		if(read_pending_reg(11) != 0)
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #2048
CMP	R0, #0
IT	EQ
BEQ	L_EXTI11_ISR10
;Ex_13.c,63 :: 		for(s = 0; s < 6; s++)
; s start address is: 8 (R2)
MOVS	R2, #0
; s end address is: 8 (R2)
L_EXTI11_ISR11:
; s start address is: 8 (R2)
CMP	R2, #6
IT	CS
BCS	L_EXTI11_ISR12
;Ex_13.c,65 :: 		GPIOC_pin_high(13);
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;Ex_13.c,66 :: 		delay_ms(90);
MOVW	R7, #23567
MOVT	R7, #12
NOP
NOP
L_EXTI11_ISR14:
SUBS	R7, R7, #1
BNE	L_EXTI11_ISR14
NOP
NOP
NOP
;Ex_13.c,67 :: 		GPIOC_pin_low(13);
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOC_BRR+0)
MOVT	R0, #hi_addr(GPIOC_BRR+0)
STR	R1, [R0, #0]
;Ex_13.c,68 :: 		delay_ms(90);
MOVW	R7, #23567
MOVT	R7, #12
NOP
NOP
L_EXTI11_ISR16:
SUBS	R7, R7, #1
BNE	L_EXTI11_ISR16
NOP
NOP
NOP
;Ex_13.c,63 :: 		for(s = 0; s < 6; s++)
ADDS	R2, R2, #1
UXTB	R2, R2
;Ex_13.c,69 :: 		}
; s end address is: 8 (R2)
IT	AL
BAL	L_EXTI11_ISR11
L_EXTI11_ISR12:
;Ex_13.c,70 :: 		pending_clr(11);
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Ex_13.c,71 :: 		}
L_EXTI11_ISR10:
;Ex_13.c,72 :: 		}
L_end_EXTI11_ISR:
BX	LR
; end of _EXTI11_ISR
_main:
;Ex_13.c,75 :: 		void main()
;Ex_13.c,77 :: 		setup();
BL	_setup+0
;Ex_13.c,79 :: 		while(1)
L_main18:
;Ex_13.c,81 :: 		lcd_print(2, 2, regular_adc_data);
MOVW	R0, #lo_addr(regular_adc_data+0)
MOVT	R0, #hi_addr(regular_adc_data+0)
LDRH	R0, [R0, #0]
UXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #2
BL	_lcd_print+0
;Ex_13.c,82 :: 		lcd_print(12, 2, injected_adc_data);
MOVW	R0, #lo_addr(injected_adc_data+0)
MOVT	R0, #hi_addr(injected_adc_data+0)
LDRH	R0, [R0, #0]
UXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #12
BL	_lcd_print+0
;Ex_13.c,83 :: 		};
IT	AL
BAL	L_main18
;Ex_13.c,84 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_13.c,87 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_13.c,89 :: 		GPIO_init();
BL	_GPIO_init+0
;Ex_13.c,90 :: 		ADC_init();
BL	_ADC_init+0
;Ex_13.c,91 :: 		exeternal_interrupt_init();
BL	_exeternal_interrupt_init+0
;Ex_13.c,92 :: 		LCD_Init();
BL	_Lcd_Init+0
;Ex_13.c,94 :: 		LCD_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Ex_13.c,95 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;Ex_13.c,97 :: 		lcd_out(1, 1, "CH00 R");
MOVW	R0, #lo_addr(?lstr1_Ex_13+0)
MOVT	R0, #hi_addr(?lstr1_Ex_13+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_13.c,98 :: 		lcd_out(1, 11, "CH01 I");
MOVW	R0, #lo_addr(?lstr2_Ex_13+0)
MOVT	R0, #hi_addr(?lstr2_Ex_13+0)
MOV	R2, R0
MOVS	R1, #11
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_13.c,99 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_init:
;Ex_13.c,102 :: 		void GPIO_init()
;Ex_13.c,104 :: 		enable_GPIOA(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_13.c,105 :: 		enable_GPIOB(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_13.c,106 :: 		enable_GPIOC(enable);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_13.c,108 :: 		setup_GPIOA(0, analog_input);
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
L_GPIO_init29:
;Ex_13.c,109 :: 		setup_GPIOA(1, analog_input);
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
L_GPIO_init42:
;Ex_13.c,110 :: 		setup_GPIOB(11, digital_input);
L_GPIO_init49:
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;Ex_13.c,111 :: 		enable_pull_up_GPIOB(11);
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Ex_13.c,112 :: 		setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
L_GPIO_init60:
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
;Ex_13.c,113 :: 		setup_GPIOC(15, digital_input);
L_GPIO_init71:
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-2147483648
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;Ex_13.c,114 :: 		enable_pull_up_GPIOC(15);
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;Ex_13.c,115 :: 		}
L_end_GPIO_init:
BX	LR
; end of _GPIO_init
_ADC_init:
;Ex_13.c,118 :: 		void ADC_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_13.c,120 :: 		ADC1_Enable();
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
;Ex_13.c,121 :: 		clr_ADC1_settings();
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR1+0)
MOVT	R0, #hi_addr(ADC1_CR1+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;Ex_13.c,122 :: 		set_ADC_mode(independent_mode);
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
;Ex_13.c,123 :: 		set_ADC1_data_alignment(right_alignment);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R0, #0]
;Ex_13.c,124 :: 		set_ADC1_scan_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R2, [R0, #0]
;Ex_13.c,125 :: 		set_ADC1_continuous_conversion_mode(disable);
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R2, [R0, #0]
;Ex_13.c,126 :: 		set_ADC1_sample_time(sample_time_239_5_cycles, 0);
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
ORR	R1, R0, #7
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init94:
;Ex_13.c,127 :: 		set_ADC1_sample_time(sample_time_239_5_cycles, 1);
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
ORR	R1, R0, #56
MOVW	R0, #lo_addr(ADC1_SMPR2+0)
MOVT	R0, #hi_addr(ADC1_SMPR2+0)
STR	R1, [R0, #0]
L_ADC_init101:
;Ex_13.c,129 :: 		set_ADC1_injected_sequence(4, 1);
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
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(ADC1_JSQR+0)
MOVT	R0, #hi_addr(ADC1_JSQR+0)
STR	R1, [R0, #0]
;Ex_13.c,130 :: 		set_ADC1_injected_number_of_conversions(1);
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
;Ex_13.c,131 :: 		set_ADC1_external_trigger_injected_conversion_edge(EXTI_15_trigger);
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
ORR	R1, R0, #24576
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
L_ADC_init114:
;Ex_13.c,132 :: 		set_ADC1_injected_end_of_conversion_interrupt(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;Ex_13.c,134 :: 		set_ADC1_regular_sequence(1, 1);
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
ORR	R1, R0, #1
MOVW	R0, #lo_addr(ADC1_SQR3+0)
MOVT	R0, #hi_addr(ADC1_SQR3+0)
STR	R1, [R0, #0]
L_ADC_init121:
;Ex_13.c,135 :: 		set_ADC1_regular_number_of_conversions(1);
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
;Ex_13.c,136 :: 		set_ADC1_external_trigger_regular_conversion_edge(EXTI_11_trigger);
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
ORR	R1, R0, #786432
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
L_ADC_init133:
;Ex_13.c,137 :: 		set_ADC1_regular_end_of_conversion_interrupt(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;Ex_13.c,139 :: 		NVIC_IntEnable(IVT_INT_ADC1_2);
MOVW	R0, #34
BL	_NVIC_IntEnable+0
;Ex_13.c,140 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ex_13.c,141 :: 		ADC1_calibrate();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
L_ADC_init137:
MOVW	R1, #lo_addr(ADC1_CR2bits+0)
MOVT	R1, #hi_addr(ADC1_CR2bits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ADC_init138
IT	AL
BAL	L_ADC_init137
L_ADC_init138:
;Ex_13.c,142 :: 		start_ADC1();
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
MOVW	R7, #8999
MOVT	R7, #0
NOP
NOP
L_ADC_init142:
SUBS	R7, R7, #1
BNE	L_ADC_init142
NOP
NOP
NOP
MOVS	R1, #1
MOVW	R0, #lo_addr(ADC1_CR2bits+0)
MOVT	R0, #hi_addr(ADC1_CR2bits+0)
STR	R1, [R0, #0]
;Ex_13.c,143 :: 		}
L_end_ADC_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ADC_init
_exeternal_interrupt_init:
;Ex_13.c,146 :: 		void exeternal_interrupt_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_13.c,148 :: 		AFIO_enable(enable);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_13.c,149 :: 		falling_edge_selector(11);
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;Ex_13.c,150 :: 		falling_edge_selector(15);
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;Ex_13.c,151 :: 		set_EXTI8_11(11, PB_pin);
MOVW	R0, #lo_addr(AFIO_EXTICR3+0)
MOVT	R0, #hi_addr(AFIO_EXTICR3+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4096
MOVW	R0, #lo_addr(AFIO_EXTICR3+0)
MOVT	R0, #hi_addr(AFIO_EXTICR3+0)
STR	R1, [R0, #0]
;Ex_13.c,152 :: 		set_EXTI12_15(15, PC_pin);
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
STR	R1, [R0, #0]
;Ex_13.c,153 :: 		interrupt_mask(11);
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Ex_13.c,154 :: 		interrupt_mask(15);
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Ex_13.c,155 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;Ex_13.c,156 :: 		}
L_end_exeternal_interrupt_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _exeternal_interrupt_init
_lcd_print:
;Ex_13.c,159 :: 		void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
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
;Ex_13.c,161 :: 		unsigned char tmp = 0;
;Ex_13.c,163 :: 		tmp = (value / 1000);
MOVW	R3, #1000
UDIV	R3, R8, R3
;Ex_13.c,164 :: 		lcd_chr(y_pos, x_pos, (tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
STRB	R1, [SP, #4]
UXTB	R2, R3
UXTB	R1, R0
; x_pos end address is: 0 (R0)
LDRB	R0, [SP, #4]
; y_pos end address is: 4 (R1)
BL	_Lcd_Chr+0
;Ex_13.c,165 :: 		tmp = ((value / 100) % 10);
MOVS	R3, #100
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;Ex_13.c,166 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_13.c,167 :: 		tmp = ((value / 10) % 10);
MOVS	R3, #10
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;Ex_13.c,168 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_13.c,169 :: 		tmp = (value % 10);
MOVS	R4, #10
UDIV	R3, R8, R4
MLS	R3, R4, R3, R8
; value end address is: 32 (R8)
;Ex_13.c,170 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;Ex_13.c,171 :: 		}
L_end_lcd_print:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lcd_print
