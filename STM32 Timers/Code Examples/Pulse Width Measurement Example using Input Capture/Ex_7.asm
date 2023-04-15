_TIM2_ISR:
;Ex_7.c,31 :: 		ics ICS_AUTO
;Ex_7.c,33 :: 		if(TIM2_SRbits.CC1IF == 1)
MOVW	R1, #lo_addr(TIM2_SRbits+0)
MOVT	R1, #hi_addr(TIM2_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_TIM2_ISR0
;Ex_7.c,35 :: 		TIM2_SRbits.CC1IF = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_SRbits+0)
MOVT	R0, #hi_addr(TIM2_SRbits+0)
STR	R1, [R0, #0]
;Ex_7.c,36 :: 		start_time = TIM2_CCR1;
MOVW	R0, #lo_addr(TIM2_CCR1+0)
MOVT	R0, #hi_addr(TIM2_CCR1+0)
LDR	R0, [R0, #0]
MOVW	R2, #lo_addr(_start_time+0)
MOVT	R2, #hi_addr(_start_time+0)
STRH	R0, [R2, #0]
;Ex_7.c,38 :: 		if(start_time > second_rise)
MOVW	R0, #lo_addr(_second_rise+0)
MOVT	R0, #hi_addr(_second_rise+0)
LDRH	R1, [R0, #0]
MOV	R0, R2
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	LS
BLS	L_TIM2_ISR1
;Ex_7.c,40 :: 		t = (start_time - second_rise);
MOVW	R0, #lo_addr(_second_rise+0)
MOVT	R0, #hi_addr(_second_rise+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_time+0)
MOVT	R0, #hi_addr(_start_time+0)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_t+0)
MOVT	R0, #hi_addr(_t+0)
STRH	R1, [R0, #0]
;Ex_7.c,41 :: 		}
IT	AL
BAL	L_TIM2_ISR2
L_TIM2_ISR1:
;Ex_7.c,44 :: 		t = (0xFFFF - start_time + second_rise);
MOVW	R0, #lo_addr(_start_time+0)
MOVT	R0, #hi_addr(_start_time+0)
LDRH	R1, [R0, #0]
MOVW	R0, #65535
SUB	R1, R0, R1
UXTH	R1, R1
MOVW	R0, #lo_addr(_second_rise+0)
MOVT	R0, #hi_addr(_second_rise+0)
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_t+0)
MOVT	R0, #hi_addr(_t+0)
STRH	R1, [R0, #0]
;Ex_7.c,45 :: 		}
L_TIM2_ISR2:
;Ex_7.c,46 :: 		}
L_TIM2_ISR0:
;Ex_7.c,47 :: 		if(TIM2_SRbits.CC2IF == 1)
MOVW	R1, #lo_addr(TIM2_SRbits+0)
MOVT	R1, #hi_addr(TIM2_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_TIM2_ISR3
;Ex_7.c,49 :: 		TIM2_SRbits.CC2IF = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_SRbits+0)
MOVT	R0, #hi_addr(TIM2_SRbits+0)
STR	R1, [R0, #0]
;Ex_7.c,50 :: 		end_time = TIM2_CCR2;
MOVW	R0, #lo_addr(TIM2_CCR2+0)
MOVT	R0, #hi_addr(TIM2_CCR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_end_time+0)
MOVT	R0, #hi_addr(_end_time+0)
STRH	R1, [R0, #0]
;Ex_7.c,52 :: 		if(start_time < end_time)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_start_time+0)
MOVT	R0, #hi_addr(_start_time+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_TIM2_ISR4
;Ex_7.c,54 :: 		d = (end_time - start_time);
MOVW	R0, #lo_addr(_start_time+0)
MOVT	R0, #hi_addr(_start_time+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_end_time+0)
MOVT	R0, #hi_addr(_end_time+0)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_d+0)
MOVT	R0, #hi_addr(_d+0)
STRH	R1, [R0, #0]
;Ex_7.c,55 :: 		}
IT	AL
BAL	L_TIM2_ISR5
L_TIM2_ISR4:
;Ex_7.c,58 :: 		d = (0xFFFF - end_time + start_time);
MOVW	R0, #lo_addr(_end_time+0)
MOVT	R0, #hi_addr(_end_time+0)
LDRH	R1, [R0, #0]
MOVW	R0, #65535
SUB	R1, R0, R1
UXTH	R1, R1
MOVW	R0, #lo_addr(_start_time+0)
MOVT	R0, #hi_addr(_start_time+0)
LDRH	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_d+0)
MOVT	R0, #hi_addr(_d+0)
STRH	R1, [R0, #0]
;Ex_7.c,59 :: 		}
L_TIM2_ISR5:
;Ex_7.c,60 :: 		}
L_TIM2_ISR3:
;Ex_7.c,62 :: 		second_rise = start_time;
MOVW	R0, #lo_addr(_start_time+0)
MOVT	R0, #hi_addr(_start_time+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_second_rise+0)
MOVT	R0, #hi_addr(_second_rise+0)
STRH	R1, [R0, #0]
;Ex_7.c,63 :: 		}
L_end_TIM2_ISR:
BX	LR
; end of _TIM2_ISR
_main:
;Ex_7.c,66 :: 		void main()
SUB	SP, SP, #44
;Ex_7.c,68 :: 		unsigned char duty_cycle = 0;
;Ex_7.c,69 :: 		signed int pwm = 100;
; pwm start address is: 4 (R1)
MOVW	R1, #100
SXTH	R1, R1
;Ex_7.c,73 :: 		setup();
STRH	R1, [SP, #0]
; pwm end address is: 4 (R1)
BL	_setup+0
LDRSH	R1, [SP, #0]
;Ex_7.c,75 :: 		while(1)
L_main6:
;Ex_7.c,77 :: 		if(get_GPIOD_pin_state(14))
; pwm start address is: 4 (R1)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #16384
CMP	R0, #0
IT	EQ
BEQ	L__main174
;Ex_7.c,79 :: 		pwm += 50;
ADDS	R1, #50
SXTH	R1, R1
; pwm end address is: 4 (R1)
;Ex_7.c,80 :: 		}
IT	AL
BAL	L_main8
L__main174:
;Ex_7.c,77 :: 		if(get_GPIOD_pin_state(14))
;Ex_7.c,80 :: 		}
L_main8:
;Ex_7.c,82 :: 		if(pwm >= 3550)
; pwm start address is: 4 (R1)
MOVW	R0, #3550
CMP	R1, R0
IT	LT
BLT	L__main175
;Ex_7.c,84 :: 		pwm = 3550;
MOVW	R1, #3550
SXTH	R1, R1
; pwm end address is: 4 (R1)
;Ex_7.c,85 :: 		}
IT	AL
BAL	L_main9
L__main175:
;Ex_7.c,82 :: 		if(pwm >= 3550)
;Ex_7.c,85 :: 		}
L_main9:
;Ex_7.c,87 :: 		if(get_GPIOD_pin_state(15))
; pwm start address is: 4 (R1)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32768
CMP	R0, #0
IT	EQ
BEQ	L__main176
;Ex_7.c,89 :: 		pwm -= 50;
SUB	R8, R1, #50
SXTH	R8, R8
; pwm end address is: 4 (R1)
; pwm start address is: 32 (R8)
; pwm end address is: 32 (R8)
;Ex_7.c,90 :: 		}
IT	AL
BAL	L_main10
L__main176:
;Ex_7.c,87 :: 		if(get_GPIOD_pin_state(15))
SXTH	R8, R1
;Ex_7.c,90 :: 		}
L_main10:
;Ex_7.c,92 :: 		if(pwm <= 50)
; pwm start address is: 32 (R8)
CMP	R8, #50
IT	GT
BGT	L__main177
;Ex_7.c,94 :: 		pwm = 50;
MOVW	R8, #50
SXTH	R8, R8
; pwm end address is: 32 (R8)
;Ex_7.c,95 :: 		}
IT	AL
BAL	L_main11
L__main177:
;Ex_7.c,92 :: 		if(pwm <= 50)
;Ex_7.c,95 :: 		}
L_main11:
;Ex_7.c,97 :: 		TIM3_CCR1 = pwm;
; pwm start address is: 32 (R8)
MOVW	R0, #lo_addr(TIM3_CCR1+0)
MOVT	R0, #hi_addr(TIM3_CCR1+0)
STR	R8, [R0, #0]
;Ex_7.c,99 :: 		duty_cycle = (((float)d / (float)t) * 100);
MOVW	R0, #lo_addr(_d+0)
MOVT	R0, #hi_addr(_d+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
STR	R0, [SP, #40]
MOVW	R0, #lo_addr(_t+0)
MOVT	R0, #hi_addr(_t+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
STR	R0, [SP, #36]
LDR	R0, [SP, #40]
STR	R1, [SP, #0]
LDR	R1, [SP, #36]
MOV	R2, R1
BL	__Div_FP+0
LDR	R1, [SP, #0]
MOVW	R2, #0
MOVT	R2, #17096
BL	__Mul_FP+0
BL	__FloatToUnsignedIntegral+0
UXTB	R0, R0
; duty_cycle start address is: 24 (R6)
UXTB	R6, R0
;Ex_7.c,101 :: 		lcd_out(1, 7, "      ");
MOVS	R0, #32
STRB	R0, [SP, #19]
MOVS	R0, #32
STRB	R0, [SP, #20]
MOVS	R0, #32
STRB	R0, [SP, #21]
MOVS	R0, #32
STRB	R0, [SP, #22]
MOVS	R0, #32
STRB	R0, [SP, #23]
MOVS	R0, #32
STRB	R0, [SP, #24]
MOVS	R0, #0
STRB	R0, [SP, #25]
ADD	R0, SP, #19
MOV	R2, R0
MOVS	R1, #7
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_7.c,102 :: 		WordToStr(t, txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_t+0)
MOVT	R0, #hi_addr(_t+0)
LDRH	R0, [R0, #0]
BL	_WordToStr+0
;Ex_7.c,103 :: 		lcd_out(1, 7, txt);
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #7
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_7.c,105 :: 		lcd_out(2, 7, "        ");
ADD	R11, SP, #26
ADD	R10, R11, #9
MOVW	R12, #lo_addr(?ICS?lstr2_Ex_7+0)
MOVT	R12, #hi_addr(?ICS?lstr2_Ex_7+0)
BL	___CC2DW+0
ADD	R0, SP, #26
MOV	R2, R0
MOVS	R1, #7
MOVS	R0, #2
BL	_Lcd_Out+0
;Ex_7.c,106 :: 		WordToStr(d, txt);
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_d+0)
MOVT	R0, #hi_addr(_d+0)
LDRH	R0, [R0, #0]
BL	_WordToStr+0
;Ex_7.c,107 :: 		lcd_out(2, 7, txt);
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #7
MOVS	R0, #2
BL	_Lcd_Out+0
;Ex_7.c,109 :: 		ByteToStr(duty_cycle, txt);
ADD	R0, SP, #4
MOV	R1, R0
UXTB	R0, R6
; duty_cycle end address is: 24 (R6)
BL	_ByteToStr+0
;Ex_7.c,110 :: 		lcd_out(2, 14, txt);
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #14
MOVS	R0, #2
BL	_Lcd_Out+0
;Ex_7.c,112 :: 		delay_ms(600);
MOVW	R7, #56575
MOVT	R7, #109
NOP
NOP
L_main12:
SUBS	R7, R7, #1
BNE	L_main12
NOP
NOP
NOP
;Ex_7.c,113 :: 		};
SXTH	R1, R8
; pwm end address is: 32 (R8)
IT	AL
BAL	L_main6
;Ex_7.c,114 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_7.c,117 :: 		void setup()
SUB	SP, SP, #20
STR	LR, [SP, #0]
;Ex_7.c,119 :: 		setup_IO();
BL	_setup_IO+0
;Ex_7.c,121 :: 		setup_TIM2();
BL	_setup_TIM2+0
;Ex_7.c,122 :: 		setup_TIM3();
BL	_setup_TIM3+0
;Ex_7.c,124 :: 		Lcd_Init();
BL	_Lcd_Init+0
;Ex_7.c,125 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Ex_7.c,126 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;Ex_7.c,127 :: 		lcd_out(1, 1, "P/us:");
MOVS	R0, #80
STRB	R0, [SP, #4]
MOVS	R0, #47
STRB	R0, [SP, #5]
MOVS	R0, #117
STRB	R0, [SP, #6]
MOVS	R0, #115
STRB	R0, [SP, #7]
MOVS	R0, #58
STRB	R0, [SP, #8]
MOVS	R0, #0
STRB	R0, [SP, #9]
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_7.c,128 :: 		lcd_out(2, 1, "D/us:");
MOVS	R0, #68
STRB	R0, [SP, #10]
MOVS	R0, #47
STRB	R0, [SP, #11]
MOVS	R0, #117
STRB	R0, [SP, #12]
MOVS	R0, #115
STRB	R0, [SP, #13]
MOVS	R0, #58
STRB	R0, [SP, #14]
MOVS	R0, #0
STRB	R0, [SP, #15]
ADD	R0, SP, #10
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;Ex_7.c,129 :: 		lcd_out(1, 15, "D%");
MOVS	R0, #68
STRB	R0, [SP, #16]
MOVS	R0, #37
STRB	R0, [SP, #17]
MOVS	R0, #0
STRB	R0, [SP, #18]
ADD	R0, SP, #16
MOV	R2, R0
MOVS	R1, #15
MOVS	R0, #1
BL	_Lcd_Out+0
;Ex_7.c,130 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _setup
_setup_IO:
;Ex_7.c,133 :: 		void setup_IO()
;Ex_7.c,135 :: 		AFIO_enable(true);
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_7.c,136 :: 		AFIO_remap(TIM2_not_remapped);
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
STR	R1, [R0, #0]
;Ex_7.c,138 :: 		enable_GPIOA(true);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Ex_7.c,139 :: 		setup_GPIOA(0, digital_input);
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
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_setup_IO23:
;Ex_7.c,140 :: 		enable_pull_down_GPIOA(0);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #254
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Ex_7.c,141 :: 		setup_GPIOA(1, digital_input);
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_setup_IO36:
;Ex_7.c,142 :: 		enable_pull_down_GPIOA(1);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #2
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Ex_7.c,143 :: 		setup_GPIOA(6, (AFIO_PP_output | output_mode_high_speed));
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
LDR	R0, [R0, #0]
ORR	R1, R0, #184549376
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_setup_IO49:
;Ex_7.c,145 :: 		enable_GPIOD(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;Ex_7.c,146 :: 		setup_GPIOD(8, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO56:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_7.c,147 :: 		setup_GPIOD(9, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO67:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_7.c,148 :: 		setup_GPIOD(10, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO78:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_7.c,149 :: 		setup_GPIOD(11, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO89:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_7.c,150 :: 		setup_GPIOD(12, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO100:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #983040
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #131072
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_7.c,151 :: 		setup_GPIOD(13, (GPIO_PP_output | output_mode_low_speed));
L_setup_IO111:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_7.c,153 :: 		setup_GPIOD(14, input_without_pull_resistors);
L_setup_IO122:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #67108864
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_7.c,154 :: 		setup_GPIOD(15, input_without_pull_resistors);
L_setup_IO133:
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1073741824
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;Ex_7.c,155 :: 		}
L_end_setup_IO:
BX	LR
; end of _setup_IO
_setup_TIM2:
;Ex_7.c,158 :: 		void setup_TIM2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_7.c,160 :: 		enable_TIM2(true);
MOVS	R3, #1
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R3, [R0, #0]
;Ex_7.c,161 :: 		enable_TIM2_counter(false);
MOVS	R2, #0
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R2, [R0, #0]
;Ex_7.c,162 :: 		TIM2_ARR = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Ex_7.c,163 :: 		TIM2_PSC = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Ex_7.c,164 :: 		set_TIM2_counting_direction(up_counting);
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R2, [R0, #0]
;Ex_7.c,165 :: 		set_TIM2_clock_division(clock_division_tCK_INT);
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Ex_7.c,166 :: 		set_TIM2_CC1_selection(CC1_input_IC1_on_TI1);
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #3
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
STR	R1, [R0, #0]
;Ex_7.c,167 :: 		set_TIM2_CC2_selection(CC2_input_IC2_on_TI1);
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(TIM2_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Output+0)
STR	R1, [R0, #0]
;Ex_7.c,168 :: 		set_TIM2_CC1_state_and_polarity(enable, rising_edge);
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R3, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R2, [R0, #0]
;Ex_7.c,169 :: 		set_TIM2_CC2_state_and_polarity(enable, falling_edge);
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R3, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCERbits+0)
MOVT	R0, #hi_addr(TIM2_CCERbits+0)
STR	R3, [R0, #0]
;Ex_7.c,170 :: 		set_TIM2_IC1_input_prescalar(0);
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R1, [R0, #0]
MVN	R0, #12
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Ex_7.c,171 :: 		set_TIM2_IC2_input_prescalar(0);
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R1, [R0, #0]
MVN	R0, #3072
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Ex_7.c,172 :: 		set_TIM2_IC1_filter(0);
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Ex_7.c,173 :: 		set_TIM2_IC2_filter(0);
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM2_CCMR1_Input+0)
MOVT	R0, #hi_addr(TIM2_CCMR1_Input+0)
STR	R1, [R0, #0]
;Ex_7.c,174 :: 		enable_TIM2_CC1_interrupt(true);
MOVW	R0, #lo_addr(TIM2_DIERbits+0)
MOVT	R0, #hi_addr(TIM2_DIERbits+0)
STR	R3, [R0, #0]
;Ex_7.c,175 :: 		enable_TIM2_CC2_interrupt(true);
MOVW	R0, #lo_addr(TIM2_DIERbits+0)
MOVT	R0, #hi_addr(TIM2_DIERbits+0)
STR	R3, [R0, #0]
;Ex_7.c,176 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Ex_7.c,177 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Ex_7.c,178 :: 		enable_TIM2_counter(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM2_CR1bits+0)
MOVT	R0, #hi_addr(TIM2_CR1bits+0)
STR	R1, [R0, #0]
;Ex_7.c,179 :: 		}
L_end_setup_TIM2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_TIM2
_setup_TIM3:
;Ex_7.c,182 :: 		void setup_TIM3()
;Ex_7.c,184 :: 		enable_TIM3(true);
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;Ex_7.c,185 :: 		enable_TIM3_counter(false);
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CR1bits+0)
MOVT	R0, #hi_addr(TIM3_CR1bits+0)
STR	R1, [R0, #0]
;Ex_7.c,186 :: 		set_TIM3_counting_direction(up_counting);
MOVW	R0, #lo_addr(TIM3_CR1bits+0)
MOVT	R0, #hi_addr(TIM3_CR1bits+0)
STR	R1, [R0, #0]
;Ex_7.c,187 :: 		TIM3_ARR = 3599;
MOVW	R1, #3599
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Ex_7.c,188 :: 		TIM3_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Ex_7.c,189 :: 		set_TIM3_OC1_compare_mode(PWM_mode_2);
MOVW	R0, #lo_addr(TIM3_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Output+0)
LDR	R1, [R0, #0]
MVN	R0, #112
ANDS	R1, R0
MOVW	R0, #lo_addr(TIM3_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Output+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Output+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #112
MOVW	R0, #lo_addr(TIM3_CCMR1_Output+0)
MOVT	R0, #hi_addr(TIM3_CCMR1_Output+0)
STR	R1, [R0, #0]
;Ex_7.c,190 :: 		set_TIM3_CC1_state_and_polarity(enable, active_low);
MOVW	R0, #lo_addr(TIM3_CCERbits+0)
MOVT	R0, #hi_addr(TIM3_CCERbits+0)
STR	R2, [R0, #0]
MOVW	R0, #lo_addr(TIM3_CCERbits+0)
MOVT	R0, #hi_addr(TIM3_CCERbits+0)
STR	R2, [R0, #0]
;Ex_7.c,191 :: 		enable_TIM3_counter(true);
MOVW	R0, #lo_addr(TIM3_CR1bits+0)
MOVT	R0, #hi_addr(TIM3_CR1bits+0)
STR	R2, [R0, #0]
;Ex_7.c,192 :: 		}
L_end_setup_TIM3:
BX	LR
; end of _setup_TIM3
