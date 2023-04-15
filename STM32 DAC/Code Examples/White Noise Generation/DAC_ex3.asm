_main:
;DAC_ex3.c,10 :: 		void main()
;DAC_ex3.c,12 :: 		setup();
BL	_setup+0
;DAC_ex3.c,14 :: 		while(1)
L_main0:
;DAC_ex3.c,16 :: 		set_DAC2_software_trigger(enable);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(DAC_SWTRIGRbits+0)
MOVT	R0, #hi_addr(DAC_SWTRIGRbits+0)
STR	R1, [R0, #0]
;DAC_ex3.c,17 :: 		delay_us(10);
MOVW	R7, #119
MOVT	R7, #0
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;DAC_ex3.c,18 :: 		};
IT	AL
BAL	L_main0
;DAC_ex3.c,19 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;DAC_ex3.c,22 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DAC_ex3.c,24 :: 		GPIO_setup();
BL	_GPIO_setup+0
;DAC_ex3.c,25 :: 		DAC_setup();
BL	_DAC_setup+0
;DAC_ex3.c,26 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_DAC_setup:
;DAC_ex3.c,29 :: 		void DAC_setup()
;DAC_ex3.c,31 :: 		enable_DAC(true);
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;DAC_ex3.c,32 :: 		DAC_reset();
MOVS	R1, #0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex3.c,33 :: 		set_DAC2_buffer(enable);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex3.c,34 :: 		enable_DAC2_trigger(enable);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex3.c,35 :: 		select_DAC2_trigger_source(Software_trigger);
MOVW	R1, #lo_addr(DAC_CRbits+0)
MOVT	R1, #hi_addr(DAC_CRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_DAC_setup7
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #3670016
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #3670016
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
L_DAC_setup7:
;DAC_ex3.c,36 :: 		select_DAC2_wave_type(noise_wave_generation_enabled);
MOVW	R1, #lo_addr(DAC_CRbits+0)
MOVT	R1, #hi_addr(DAC_CRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_DAC_setup11
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #12582912
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4194304
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
L_DAC_setup11:
;DAC_ex3.c,37 :: 		set_DAC2_LFSR_mask(0x3FF);
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #-16777216
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex3.c,38 :: 		enable_DAC2_channel(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex3.c,39 :: 		}
L_end_DAC_setup:
BX	LR
; end of _DAC_setup
_GPIO_setup:
;DAC_ex3.c,42 :: 		void GPIO_setup()
;DAC_ex3.c,44 :: 		enable_GPIOA(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;DAC_ex3.c,45 :: 		pin_configure_low(GPIOA_CRL, 5, analog_input);
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
;DAC_ex3.c,46 :: 		}
L_end_GPIO_setup:
BX	LR
; end of _GPIO_setup
