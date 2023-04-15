_main:
;DAC_ex4.c,10 :: 		void main()
;DAC_ex4.c,12 :: 		signed int temp = 0;
;DAC_ex4.c,14 :: 		setup();
BL	_setup+0
;DAC_ex4.c,16 :: 		while(1)
L_main0:
;DAC_ex4.c,18 :: 		for(temp = 0; temp < 4096; temp++)
; temp start address is: 4 (R1)
MOVS	R1, #0
SXTH	R1, R1
; temp end address is: 4 (R1)
L_main2:
; temp start address is: 4 (R1)
CMP	R1, #4096
IT	GE
BGE	L_main3
;DAC_ex4.c,20 :: 		DAC_DHR12R1 = temp;
MOVW	R0, #lo_addr(DAC_DHR12R1+0)
MOVT	R0, #hi_addr(DAC_DHR12R1+0)
STR	R1, [R0, #0]
;DAC_ex4.c,21 :: 		if((temp > 0) && (temp < 256))
CMP	R1, #0
IT	LE
BLE	L__main27
CMP	R1, #256
IT	GE
BGE	L__main26
L__main25:
;DAC_ex4.c,23 :: 		DAC_DHR8R2 = temp;
MOVW	R0, #lo_addr(DAC_DHR8R2+0)
MOVT	R0, #hi_addr(DAC_DHR8R2+0)
STR	R1, [R0, #0]
;DAC_ex4.c,21 :: 		if((temp > 0) && (temp < 256))
L__main27:
L__main26:
;DAC_ex4.c,25 :: 		delay_us(90);
MOVW	R7, #1079
MOVT	R7, #0
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
;DAC_ex4.c,18 :: 		for(temp = 0; temp < 4096; temp++)
ADDS	R1, R1, #1
SXTH	R1, R1
;DAC_ex4.c,26 :: 		}
; temp end address is: 4 (R1)
IT	AL
BAL	L_main2
L_main3:
;DAC_ex4.c,28 :: 		for(temp = 4095; temp > -1; temp--)
; temp start address is: 4 (R1)
MOVW	R1, #4095
SXTH	R1, R1
; temp end address is: 4 (R1)
L_main10:
; temp start address is: 4 (R1)
CMP	R1, #-1
IT	LE
BLE	L_main11
;DAC_ex4.c,30 :: 		DAC_DHR12R1 = temp;
MOVW	R0, #lo_addr(DAC_DHR12R1+0)
MOVT	R0, #hi_addr(DAC_DHR12R1+0)
STR	R1, [R0, #0]
;DAC_ex4.c,31 :: 		if((temp > 0) && (temp < 256))
CMP	R1, #0
IT	LE
BLE	L__main29
CMP	R1, #256
IT	GE
BGE	L__main28
L__main24:
;DAC_ex4.c,33 :: 		DAC_DHR8R2 = temp;
MOVW	R0, #lo_addr(DAC_DHR8R2+0)
MOVT	R0, #hi_addr(DAC_DHR8R2+0)
STR	R1, [R0, #0]
;DAC_ex4.c,31 :: 		if((temp > 0) && (temp < 256))
L__main29:
L__main28:
;DAC_ex4.c,35 :: 		delay_us(90);
MOVW	R7, #1079
MOVT	R7, #0
NOP
NOP
L_main16:
SUBS	R7, R7, #1
BNE	L_main16
NOP
NOP
NOP
;DAC_ex4.c,28 :: 		for(temp = 4095; temp > -1; temp--)
SUBS	R1, R1, #1
SXTH	R1, R1
;DAC_ex4.c,36 :: 		}
; temp end address is: 4 (R1)
IT	AL
BAL	L_main10
L_main11:
;DAC_ex4.c,37 :: 		};
IT	AL
BAL	L_main0
;DAC_ex4.c,38 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;DAC_ex4.c,41 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;DAC_ex4.c,43 :: 		GPIO_setup();
BL	_GPIO_setup+0
;DAC_ex4.c,44 :: 		DAC_setup();
BL	_DAC_setup+0
;DAC_ex4.c,45 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_GPIO_setup:
;DAC_ex4.c,48 :: 		void GPIO_setup()
;DAC_ex4.c,50 :: 		enable_GPIOA(true);
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;DAC_ex4.c,51 :: 		pin_configure_low(GPIOA_CRL, 4, analog_input);
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
;DAC_ex4.c,52 :: 		pin_configure_low(GPIOA_CRL, 5, analog_input);
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
;DAC_ex4.c,53 :: 		}
L_end_GPIO_setup:
BX	LR
; end of _GPIO_setup
_DAC_setup:
;DAC_ex4.c,56 :: 		void DAC_setup()
;DAC_ex4.c,58 :: 		enable_DAC(true);
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;DAC_ex4.c,59 :: 		DAC_reset();
MOVS	R1, #0
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;DAC_ex4.c,60 :: 		set_DAC1_buffer(enable);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex4.c,61 :: 		set_DAC2_buffer(enable);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex4.c,62 :: 		enable_DAC1_channel(true);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex4.c,63 :: 		enable_DAC2_channel(true);
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;DAC_ex4.c,64 :: 		}
L_end_DAC_setup:
BX	LR
; end of _DAC_setup
