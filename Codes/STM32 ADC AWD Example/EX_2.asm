_main:
;EX_2.c,19 :: 		void main()
SUB	SP, SP, #12
;EX_2.c,21 :: 		unsigned char s = 0;
;EX_2.c,22 :: 		register unsigned int adc_data = 0;
;EX_2.c,23 :: 		float v = 0.0;
;EX_2.c,25 :: 		setup();
BL	_setup+0
;EX_2.c,27 :: 		while(1)
L_main0:
;EX_2.c,29 :: 		for(s = 0; s < 2; s++)
MOVS	R0, #0
STRB	R0, [SP, #0]
L_main2:
LDRB	R0, [SP, #0]
CMP	R0, #2
IT	CS
BCS	L_main3
;EX_2.c,31 :: 		adc_data = adc_avg(20, s);
LDRB	R1, [SP, #0]
MOVS	R0, #20
BL	_adc_avg+0
STRH	R0, [SP, #2]
;EX_2.c,32 :: 		v = map(adc_data, 0, 4095, 0, 3300);
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
; v start address is: 36 (R9)
MOV	R9, R0
;EX_2.c,33 :: 		lcd_print(5, (s + 1), adc_data);
LDRB	R0, [SP, #0]
ADDS	R0, R0, #1
LDRH	R2, [SP, #2]
UXTB	R1, R0
MOVS	R0, #5
BL	_lcd_print+0
;EX_2.c,34 :: 		lcd_print(11, (s + 1), v);
MOV	R0, R9
BL	__FloatToUnsignedIntegral+0
UXTH	R0, R0
; v end address is: 36 (R9)
LDRB	R1, [SP, #0]
ADDS	R1, R1, #1
UXTH	R2, R0
UXTB	R1, R1
MOVS	R0, #11
BL	_lcd_print+0
;EX_2.c,29 :: 		for(s = 0; s < 2; s++)
LDRB	R0, [SP, #0]
ADDS	R0, R0, #1
STRB	R0, [SP, #0]
;EX_2.c,35 :: 		}
IT	AL
BAL	L_main2
L_main3:
;EX_2.c,37 :: 		if(ADC1_SRbits.AWD == 1)
MOVW	R1, #lo_addr(ADC1_SRbits+0)
MOVT	R1, #hi_addr(ADC1_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main5
;EX_2.c,39 :: 		GPIOC_ODRbits.ODR13 ^= 1;
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;EX_2.c,40 :: 		ADC1_SRbits.AWD = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_SRbits+0)
MOVT	R0, #hi_addr(ADC1_SRbits+0)
STR	R1, [R0, #0]
;EX_2.c,41 :: 		}
IT	AL
BAL	L_main6
L_main5:
;EX_2.c,44 :: 		GPIOC_ODRbits.ODR13 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;EX_2.c,45 :: 		}
L_main6:
;EX_2.c,46 :: 		delay_ms(400);
MOVW	R7, #15871
MOVT	R7, #73
NOP
NOP
L_main7:
SUBS	R7, R7, #1
BNE	L_main7
NOP
NOP
NOP
;EX_2.c,47 :: 		};
IT	AL
BAL	L_main0
;EX_2.c,48 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;EX_2.c,51 :: 		void setup()
SUB	SP, SP, #20
STR	LR, [SP, #0]
;EX_2.c,53 :: 		GPIO_Clk_Enable(&GPIOA_BASE);
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;EX_2.c,54 :: 		GPIO_Clk_Enable(&GPIOB_BASE);
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Clk_Enable+0
;EX_2.c,55 :: 		GPIO_Clk_Enable(&GPIOC_BASE);
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Clk_Enable+0
;EX_2.c,56 :: 		GPIO_Config(&GPIOA_BASE, (_GPIO_PINMASK_0 | _GPIO_PINMASK_1), (_GPIO_CFG_MODE_ANALOG | _GPIO_CFG_PULL_NO));
MOVS	R2, #65
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;EX_2.c,57 :: 		GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_13, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
MOVW	R2, #20
MOVT	R2, #8
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Config+0
;EX_2.c,59 :: 		ADC1_init();
BL	_ADC1_Init+0
;EX_2.c,60 :: 		ADC1_LTR = low_level;
MOVW	R1, #400
MOVW	R0, #lo_addr(ADC1_LTR+0)
MOVT	R0, #hi_addr(ADC1_LTR+0)
STR	R1, [R0, #0]
;EX_2.c,61 :: 		ADC1_HTR = high_level;
MOVW	R1, #3695
MOVW	R0, #lo_addr(ADC1_HTR+0)
MOVT	R0, #hi_addr(ADC1_HTR+0)
STR	R1, [R0, #0]
;EX_2.c,62 :: 		ADC1_CR1bits.AWDEN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR1bits+0)
MOVT	R0, #hi_addr(ADC1_CR1bits+0)
STR	R1, [R0, #0]
;EX_2.c,64 :: 		LCD_Init();
BL	_Lcd_Init+0
;EX_2.c,65 :: 		LCD_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;EX_2.c,66 :: 		LCD_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;EX_2.c,68 :: 		lcd_out(1, 1, "A0:");
MOVS	R0, #65
STRB	R0, [SP, #4]
MOVS	R0, #48
STRB	R0, [SP, #5]
MOVS	R0, #58
STRB	R0, [SP, #6]
MOVS	R0, #0
STRB	R0, [SP, #7]
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;EX_2.c,69 :: 		lcd_out(2, 1, "A1:");
MOVS	R0, #65
STRB	R0, [SP, #8]
MOVS	R0, #49
STRB	R0, [SP, #9]
MOVS	R0, #58
STRB	R0, [SP, #10]
MOVS	R0, #0
STRB	R0, [SP, #11]
ADD	R0, SP, #8
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;EX_2.c,70 :: 		lcd_out(1, 15, "mV");
MOVS	R0, #109
STRB	R0, [SP, #12]
MOVS	R0, #86
STRB	R0, [SP, #13]
MOVS	R0, #0
STRB	R0, [SP, #14]
ADD	R0, SP, #12
MOV	R2, R0
MOVS	R1, #15
MOVS	R0, #1
BL	_Lcd_Out+0
;EX_2.c,71 :: 		lcd_out(2, 15, "mV");
MOVS	R0, #109
STRB	R0, [SP, #15]
MOVS	R0, #86
STRB	R0, [SP, #16]
MOVS	R0, #0
STRB	R0, [SP, #17]
ADD	R0, SP, #15
MOV	R2, R0
MOVS	R1, #15
MOVS	R0, #2
BL	_Lcd_Out+0
;EX_2.c,72 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _setup
_adc_avg:
;EX_2.c,75 :: 		unsigned int adc_avg(unsigned char no_of_samples, unsigned char channel)
; channel start address is: 4 (R1)
; no_of_samples start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; channel end address is: 4 (R1)
; no_of_samples end address is: 0 (R0)
; no_of_samples start address is: 0 (R0)
; channel start address is: 4 (R1)
;EX_2.c,77 :: 		register unsigned long avg = 0;
; avg start address is: 36 (R9)
MOV	R9, #0
;EX_2.c,78 :: 		unsigned char samples = no_of_samples;
; samples start address is: 24 (R6)
UXTB	R6, R0
; no_of_samples end address is: 0 (R0)
; channel end address is: 4 (R1)
; avg end address is: 36 (R9)
; samples end address is: 24 (R6)
UXTB	R8, R0
UXTB	R5, R1
;EX_2.c,80 :: 		while(samples > 0)
L_adc_avg9:
; samples start address is: 24 (R6)
; channel start address is: 20 (R5)
; avg start address is: 36 (R9)
; channel start address is: 20 (R5)
; channel end address is: 20 (R5)
; no_of_samples start address is: 32 (R8)
CMP	R6, #0
IT	LS
BLS	L_adc_avg10
; channel end address is: 20 (R5)
;EX_2.c,82 :: 		avg += ADC1_Get_Sample(channel);
; channel start address is: 20 (R5)
UXTB	R0, R5
BL	_ADC1_Get_Sample+0
ADD	R9, R9, R0, LSL #0
;EX_2.c,83 :: 		samples--;
SUBS	R6, R6, #1
UXTB	R6, R6
;EX_2.c,84 :: 		}
; channel end address is: 20 (R5)
; samples end address is: 24 (R6)
IT	AL
BAL	L_adc_avg9
L_adc_avg10:
;EX_2.c,85 :: 		avg /= no_of_samples;
UDIV	R2, R9, R8
; no_of_samples end address is: 32 (R8)
; avg end address is: 36 (R9)
;EX_2.c,87 :: 		return avg;
UXTH	R0, R2
;EX_2.c,88 :: 		}
L_end_adc_avg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _adc_avg
_lcd_print:
;EX_2.c,91 :: 		void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
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
;EX_2.c,93 :: 		unsigned char tmp = 0;
;EX_2.c,95 :: 		tmp = (value / 1000);
MOVW	R3, #1000
UDIV	R3, R8, R3
;EX_2.c,96 :: 		lcd_chr(y_pos, x_pos, (tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
STRB	R1, [SP, #4]
UXTB	R2, R3
UXTB	R1, R0
; x_pos end address is: 0 (R0)
LDRB	R0, [SP, #4]
; y_pos end address is: 4 (R1)
BL	_Lcd_Chr+0
;EX_2.c,97 :: 		tmp = ((value / 100) % 10);
MOVS	R3, #100
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;EX_2.c,98 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_2.c,99 :: 		tmp = ((value / 10) % 10);
MOVS	R3, #10
UDIV	R5, R8, R3
UXTH	R5, R5
MOVS	R4, #10
UDIV	R3, R5, R4
MLS	R3, R4, R3, R5
;EX_2.c,100 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_2.c,101 :: 		tmp = (value % 10);
MOVS	R4, #10
UDIV	R3, R8, R4
MLS	R3, R4, R3, R8
; value end address is: 32 (R8)
;EX_2.c,102 :: 		lcd_chr_cp((tmp + 48));
UXTB	R3, R3
ADDS	R3, #48
UXTB	R0, R3
BL	_Lcd_Chr_CP+0
;EX_2.c,103 :: 		}
L_end_lcd_print:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lcd_print
_map:
;EX_2.c,106 :: 		float map(float v, float x_min, float x_max, float y_min, float y_max)
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
;EX_2.c,108 :: 		return (y_min + (((y_max - y_min)/(x_max - x_min)) * (v - x_min)));
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
;EX_2.c,109 :: 		}
L_end_map:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _map
