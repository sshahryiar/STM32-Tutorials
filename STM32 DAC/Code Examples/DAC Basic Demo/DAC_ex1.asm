_main:
;DAC_ex1.c,13 :: 		void main()
SUB	SP, SP, #4
;DAC_ex1.c,15 :: 		signed int temp1 = 0;
;DAC_ex1.c,16 :: 		signed int temp2 = 0;
;DAC_ex1.c,17 :: 		unsigned int degree = 0;
;DAC_ex1.c,20 :: 		setup();
BL	_setup+0
;DAC_ex1.c,22 :: 		while(1)
L_main0:
;DAC_ex1.c,24 :: 		for(degree = 0; degree < 360; degree++)
MOVS	R0, #0
STRH	R0, [SP, #0]
L_main2:
LDRH	R0, [SP, #0]
CMP	R0, #360
IT	CS
BCS	L_main3
;DAC_ex1.c,26 :: 		temp1 = (2047 * cos(radian_per_degree * degree));
LDRH	R0, [SP, #0]
BL	__UnsignedIntegralToFloat+0
MOVW	R2, #64053
MOVT	R2, #15502
BL	__Mul_FP+0
BL	_cos+0
MOVW	R2, #57344
MOVT	R2, #17663
BL	__Mul_FP+0
BL	__FloatToSignedIntegral+0
SXTH	R0, R0
;DAC_ex1.c,27 :: 		temp1 = (2048 - temp1);
RSB	R0, R0, #2048
SXTH	R0, R0
;DAC_ex1.c,28 :: 		DAC_DHR12R1 = ((unsigned int)temp1);
UXTH	R1, R0
MOVW	R0, #lo_addr(DAC_DHR12R1+0)
MOVT	R0, #hi_addr(DAC_DHR12R1+0)
STR	R1, [R0, #0]
;DAC_ex1.c,29 :: 		temp2 = (2047 * sin(radian_per_degree * degree));
LDRH	R0, [SP, #0]
BL	__UnsignedIntegralToFloat+0
MOVW	R2, #64053
MOVT	R2, #15502
BL	__Mul_FP+0
BL	_sin+0
MOVW	R2, #57344
MOVT	R2, #17663
BL	__Mul_FP+0
BL	__FloatToSignedIntegral+0
SXTH	R0, R0
;DAC_ex1.c,30 :: 		temp2 = (2048 - temp2);
RSB	R0, R0, #2048
SXTH	R0, R0
;DAC_ex1.c,31 :: 		DAC_DHR12R2 = ((unsigned int)temp2);
UXTH	R1, R0
MOVW	R0, #lo_addr(DAC_DHR12R2+0)
MOVT	R0, #hi_addr(DAC_DHR12R2+0)
STR	R1, [R0, #0]
;DAC_ex1.c,32 :: 		delay_ms(6);
MOVW	R7, #6463
MOVT	R7, #1
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
NOP
;DAC_ex1.c,24 :: 		for(degree = 0; degree < 360; degree++)
LDRH	R0, [SP, #0]
ADDS	R0, R0, #1
STRH	R0, [SP, #0]
;DAC_ex1.c,33 :: 		}
IT	AL
BAL	L_main2
L_main3:
;DAC_ex1.c,34 :: 		};
IT	AL
BAL	L_main0
;DAC_ex1.c,35 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;DAC_ex1.c,38 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DAC_ex1.c,40 :: 		GPIO_setup();
BL	_GPIO_setup+0
;DAC_ex1.c,41 :: 		DAC_setup();
BL	_DAC_setup+0
;DAC_ex1.c,42 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_setup:
;DAC_ex1.c,45 :: 		void GPIO_setup()
;DAC_ex1.c,47 :: 		enable_GPIOA(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;DAC_ex1.c,48 :: 		pin_configure_low(GPIOA_CRL, 4, analog_input);
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
;DAC_ex1.c,49 :: 		pin_configure_low(GPIOA_CRL, 5, analog_input);
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
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
;DAC_ex1.c,50 :: 		}
L_end_GPIO_setup:
BX	LR
; end of _GPIO_setup
_DAC_setup:
;DAC_ex1.c,53 :: 		void DAC_setup()
;DAC_ex1.c,55 :: 		enable_DAC(true);
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;DAC_ex1.c,56 :: 		DAC_reset();
MOVS	R1, #0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex1.c,57 :: 		set_DAC1_buffer(enable);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex1.c,58 :: 		set_DAC2_buffer(enable);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex1.c,59 :: 		enable_DAC1_channel(true);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex1.c,60 :: 		enable_DAC2_channel(true);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex1.c,61 :: 		}
L_end_DAC_setup:
BX	LR
; end of _DAC_setup
