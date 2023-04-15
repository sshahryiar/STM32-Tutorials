_main:
;DAC_ex2.c,10 :: 		void main()
SUB	SP, SP, #8
;DAC_ex2.c,14 :: 		unsigned long peak = Triangle_Amplitude_equal_to_4095;
; peak start address is: 8 (R2)
MOV	R2, #11
;DAC_ex2.c,16 :: 		setup();
STR	R2, [SP, #0]
; peak end address is: 8 (R2)
BL	_setup+0
LDR	R2, [SP, #0]
;DAC_ex2.c,18 :: 		while(1)
L_main0:
;DAC_ex2.c,20 :: 		set_DAC1_software_trigger(enable);
; peak start address is: 8 (R2)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(DAC_SWTRIGRbits+0)
MOVT	R0, #hi_addr(DAC_SWTRIGRbits+0)
STR	R1, [R0, #0]
;DAC_ex2.c,21 :: 		set_DAC2_software_trigger(enable);
MOVW	R0, #lo_addr(DAC_SWTRIGRbits+0)
MOVT	R0, #hi_addr(DAC_SWTRIGRbits+0)
STR	R1, [R0, #0]
;DAC_ex2.c,23 :: 		if(get_input(GPIOF_IDR, 14) == 0)
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #16384
CMP	R0, #0
IT	NE
BNE	L__main58
; peak end address is: 8 (R2)
MOV	R1, R2
;DAC_ex2.c,25 :: 		while(get_input(GPIOF_IDR, 14) == 0);
L_main3:
; peak start address is: 4 (R1)
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #16384
CMP	R0, #0
IT	NE
BNE	L_main4
IT	AL
BAL	L_main3
L_main4:
;DAC_ex2.c,27 :: 		peak++;
ADDS	R0, R1, #1
; peak end address is: 4 (R1)
; peak start address is: 8 (R2)
MOV	R2, R0
;DAC_ex2.c,29 :: 		if(peak > Triangle_Amplitude_equal_to_4095)
CMP	R0, #11
IT	LS
BLS	L__main57
;DAC_ex2.c,31 :: 		peak = Triangle_Amplitude_equal_to_1;
MOVS	R2, #0
; peak end address is: 8 (R2)
;DAC_ex2.c,32 :: 		}
IT	AL
BAL	L_main5
L__main57:
;DAC_ex2.c,29 :: 		if(peak > Triangle_Amplitude_equal_to_4095)
;DAC_ex2.c,32 :: 		}
L_main5:
;DAC_ex2.c,34 :: 		enable_DAC1_channel(false);
; peak start address is: 8 (R2)
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex2.c,35 :: 		enable_DAC2_channel(false);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex2.c,37 :: 		set_DAC1_triangle_waveform_amplitude(peak);
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
LSLS	R1, R2, #8
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex2.c,38 :: 		set_DAC2_triangle_waveform_amplitude(peak);
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
LSLS	R1, R2, #24
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex2.c,40 :: 		enable_DAC1_channel(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex2.c,41 :: 		enable_DAC2_channel(true);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
; peak end address is: 8 (R2)
;DAC_ex2.c,42 :: 		}
IT	AL
BAL	L_main2
L__main58:
;DAC_ex2.c,23 :: 		if(get_input(GPIOF_IDR, 14) == 0)
;DAC_ex2.c,42 :: 		}
L_main2:
;DAC_ex2.c,44 :: 		if(get_input(GPIOF_IDR, 13) == 0)
; peak start address is: 8 (R2)
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #8192
CMP	R0, #0
IT	NE
BNE	L__main59
; peak end address is: 8 (R2)
;DAC_ex2.c,46 :: 		while(get_input(GPIOF_IDR, 13) == 0);
L_main13:
; peak start address is: 8 (R2)
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #8192
CMP	R0, #0
IT	NE
BNE	L_main14
IT	AL
BAL	L_main13
L_main14:
;DAC_ex2.c,47 :: 		time = ~time;
LDRB	R0, [SP, #4]
UBFX	R0, R0, #0, #1
EOR	R1, R0, #1
LDRB	R0, [SP, #4]
BFI	R0, R1, #0, #1
STRB	R0, [SP, #4]
; peak end address is: 8 (R2)
;DAC_ex2.c,48 :: 		}
IT	AL
BAL	L_main12
L__main59:
;DAC_ex2.c,44 :: 		if(get_input(GPIOF_IDR, 13) == 0)
;DAC_ex2.c,48 :: 		}
L_main12:
;DAC_ex2.c,50 :: 		switch(time)
; peak start address is: 8 (R2)
IT	AL
BAL	L_main15
;DAC_ex2.c,52 :: 		case 1:
L_main17:
;DAC_ex2.c,54 :: 		delay_us(600);
MOVW	R7, #7199
MOVT	R7, #0
NOP
NOP
L_main18:
SUBS	R7, R7, #1
BNE	L_main18
NOP
NOP
NOP
;DAC_ex2.c,55 :: 		break;
IT	AL
BAL	L_main16
;DAC_ex2.c,57 :: 		default:
L_main20:
;DAC_ex2.c,59 :: 		delay_us(60);
MOVW	R7, #719
MOVT	R7, #0
NOP
NOP
L_main21:
SUBS	R7, R7, #1
BNE	L_main21
NOP
NOP
NOP
;DAC_ex2.c,60 :: 		break;
IT	AL
BAL	L_main16
;DAC_ex2.c,62 :: 		}
L_main15:
LDRB	R0, [SP, #4]
UBFX	R0, R0, #0, #1
CMP	R0, #0
IT	NE
BNE	L_main17
IT	AL
BAL	L_main20
L_main16:
;DAC_ex2.c,63 :: 		};
; peak end address is: 8 (R2)
IT	AL
BAL	L_main0
;DAC_ex2.c,64 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;DAC_ex2.c,67 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DAC_ex2.c,69 :: 		GPIO_setup();
BL	_GPIO_setup+0
;DAC_ex2.c,70 :: 		DAC_setup();
BL	_DAC_setup+0
;DAC_ex2.c,71 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_DAC_setup:
;DAC_ex2.c,74 :: 		void DAC_setup()
;DAC_ex2.c,76 :: 		enable_DAC(true);
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;DAC_ex2.c,77 :: 		DAC_reset();
MOVS	R1, #0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex2.c,79 :: 		set_DAC1_buffer(enable);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex2.c,80 :: 		enable_DAC1_trigger(true);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex2.c,81 :: 		select_DAC1_trigger_source(Software_trigger);
MOVW	R1, #lo_addr(DAC_CRbits+0)
MOVT	R1, #hi_addr(DAC_CRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_DAC_setup26
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #56
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #56
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
L_DAC_setup26:
;DAC_ex2.c,82 :: 		select_DAC1_wave_type(triangle_wave_generation_enabled);
MOVW	R1, #lo_addr(DAC_CRbits+0)
MOVT	R1, #hi_addr(DAC_CRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_DAC_setup30
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #63
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #128
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
L_DAC_setup30:
;DAC_ex2.c,83 :: 		set_DAC1_triangle_waveform_amplitude(Triangle_Amplitude_equal_to_4095);
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2816
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex2.c,84 :: 		enable_DAC1_channel(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex2.c,86 :: 		set_DAC2_buffer(enable);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex2.c,87 :: 		enable_DAC2_trigger(true);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex2.c,88 :: 		select_DAC2_trigger_source(Software_trigger);
MOVW	R1, #lo_addr(DAC_CRbits+0)
MOVT	R1, #hi_addr(DAC_CRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_DAC_setup37
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
L_DAC_setup37:
;DAC_ex2.c,89 :: 		select_DAC2_wave_type(triangle_wave_generation_enabled);
MOVW	R1, #lo_addr(DAC_CRbits+0)
MOVT	R1, #hi_addr(DAC_CRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_DAC_setup41
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
ORR	R1, R0, #8388608
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
L_DAC_setup41:
;DAC_ex2.c,90 :: 		set_DAC2_triangle_waveform_amplitude(Triangle_Amplitude_equal_to_4095);
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
ORR	R1, R0, #184549376
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex2.c,91 :: 		enable_DAC2_channel(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R1, [R0, #0]
;DAC_ex2.c,92 :: 		}
L_end_DAC_setup:
BX	LR
; end of _DAC_setup
_GPIO_setup:
;DAC_ex2.c,95 :: 		void GPIO_setup()
;DAC_ex2.c,97 :: 		enable_GPIOA(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;DAC_ex2.c,98 :: 		enable_GPIOF(true);
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;DAC_ex2.c,100 :: 		pin_configure_low(GPIOA_CRL, 4, analog_input);
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
;DAC_ex2.c,101 :: 		pin_configure_low(GPIOA_CRL, 5, analog_input);
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
;DAC_ex2.c,103 :: 		pin_configure_high(GPIOF_CRH, 13, digital_input);
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8388608
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
STR	R1, [R0, #0]
;DAC_ex2.c,104 :: 		pin_configure_high(GPIOF_CRH, 14, digital_input);
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #134217728
MOVW	R0, #lo_addr(GPIOF_CRH+0)
MOVT	R0, #hi_addr(GPIOF_CRH+0)
STR	R1, [R0, #0]
;DAC_ex2.c,106 :: 		pull_up_enable(GPIOF_ODR, 13);
MOVW	R0, #lo_addr(GPIOF_ODR+0)
MOVT	R0, #hi_addr(GPIOF_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(GPIOF_ODR+0)
MOVT	R0, #hi_addr(GPIOF_ODR+0)
STR	R1, [R0, #0]
;DAC_ex2.c,107 :: 		pull_up_enable(GPIOF_ODR, 14);
MOVW	R0, #lo_addr(GPIOF_ODR+0)
MOVT	R0, #hi_addr(GPIOF_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16384
MOVW	R0, #lo_addr(GPIOF_ODR+0)
MOVT	R0, #hi_addr(GPIOF_ODR+0)
STR	R1, [R0, #0]
;DAC_ex2.c,108 :: 		}
L_end_GPIO_setup:
BX	LR
; end of _GPIO_setup
