_main:
;GPIO.c,7 :: 		void main()
;GPIO.c,9 :: 		unsigned int dly = 600;
;GPIO.c,11 :: 		setup();                              //set registers and chip peripherals
BL	_setup+0
;GPIO.c,13 :: 		while(1)
L_main0:
;GPIO.c,15 :: 		if(get_bits(&GPIOA_IDR, 0x00000001))            //Button not pressed
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_get_bits+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;GPIO.c,17 :: 		dly = 200;
; dly start address is: 0 (R0)
MOVS	R0, #200
;GPIO.c,18 :: 		}
UXTH	R4, R0
; dly end address is: 0 (R0)
IT	AL
BAL	L_main3
L_main2:
;GPIO.c,21 :: 		dly = 600;
; dly start address is: 0 (R0)
MOVW	R0, #600
; dly end address is: 0 (R0)
UXTH	R4, R0
;GPIO.c,22 :: 		}
L_main3:
;GPIO.c,24 :: 		bit_set(&GPIOB_ODR, 15);               //Write 1 on bit 15 for GPIOB
; dly start address is: 16 (R4)
MOVS	R1, #15
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
BL	_bit_set+0
;GPIO.c,25 :: 		Vdelay_ms(dly);                        //Wait for some time
UXTH	R0, R4
BL	_VDelay_ms+0
;GPIO.c,26 :: 		bit_clear(&GPIOB_ODR, 15);             //Write 0 on bit 15 for GPIOB
MOVS	R1, #15
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
BL	_bit_clear+0
;GPIO.c,27 :: 		Vdelay_ms(dly);                        //Wait for some time
UXTH	R0, R4
; dly end address is: 16 (R4)
BL	_VDelay_ms+0
;GPIO.c,28 :: 		};
IT	AL
BAL	L_main0
;GPIO.c,30 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;GPIO.c,33 :: 		void setup()
;GPIO.c,37 :: 		RCC_APB2ENR = 0x0000000C;
MOVS	R1, #12
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;GPIO.c,42 :: 		GPIOA_CRL = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;GPIO.c,43 :: 		GPIOA_CRH = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;GPIO.c,44 :: 		GPIOB_CRL = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
;GPIO.c,45 :: 		GPIOB_CRH = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;GPIO.c,46 :: 		GPIOC_CRL = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;GPIO.c,47 :: 		GPIOC_CRH = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;GPIO.c,48 :: 		GPIOD_CRL = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOD_CRL+0)
MOVT	R0, #hi_addr(GPIOD_CRL+0)
STR	R1, [R0, #0]
;GPIO.c,49 :: 		GPIOD_CRH = 0x44444444;
MOV	R1, #1145324612
MOVW	R0, #lo_addr(GPIOD_CRH+0)
MOVT	R0, #hi_addr(GPIOD_CRH+0)
STR	R1, [R0, #0]
;GPIO.c,53 :: 		GPIOA_CRL &= 0xFFFFFFF0;
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;GPIO.c,54 :: 		GPIOB_CRH &= 0x0FFFFFFF;
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;GPIO.c,58 :: 		GPIOA_CRL |= 0x00000008;
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;GPIO.c,59 :: 		GPIOB_CRH |= 0x10000000;
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #268435456
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;GPIO.c,61 :: 		GPIOA_ODR |= 0x00000001;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;GPIO.c,62 :: 		}
L_end_setup:
BX	LR
; end of _setup
_bit_set:
;GPIO.c,65 :: 		void bit_set(unsigned long *reg, unsigned char bit_value)
; bit_value start address is: 4 (R1)
; reg start address is: 0 (R0)
; bit_value end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
; bit_value start address is: 4 (R1)
;GPIO.c,67 :: 		*reg |= (1 << bit_value);
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R1
SXTH	R3, R3
; bit_value end address is: 4 (R1)
LDR	R2, [R0, #0]
ORRS	R2, R3
STR	R2, [R0, #0]
; reg end address is: 0 (R0)
;GPIO.c,68 :: 		}
L_end_bit_set:
BX	LR
; end of _bit_set
_bit_clear:
;GPIO.c,71 :: 		void bit_clear(unsigned long *reg, unsigned char bit_value)
; bit_value start address is: 4 (R1)
; reg start address is: 0 (R0)
; bit_value end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
; bit_value start address is: 4 (R1)
;GPIO.c,73 :: 		*reg &= (~(1 << bit_value));
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R1
SXTH	R2, R2
; bit_value end address is: 4 (R1)
MVN	R3, R2
SXTH	R3, R3
LDR	R2, [R0, #0]
ANDS	R2, R3
STR	R2, [R0, #0]
; reg end address is: 0 (R0)
;GPIO.c,74 :: 		}
L_end_bit_clear:
BX	LR
; end of _bit_clear
_get_bits:
;GPIO.c,77 :: 		unsigned long get_bits(unsigned long *reg, unsigned long mask)
; mask start address is: 4 (R1)
; reg start address is: 0 (R0)
; mask end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
; mask start address is: 4 (R1)
;GPIO.c,79 :: 		return (*reg & mask);
LDR	R2, [R0, #0]
; reg end address is: 0 (R0)
ANDS	R2, R1
; mask end address is: 4 (R1)
MOV	R0, R2
;GPIO.c,80 :: 		}
L_end_get_bits:
BX	LR
; end of _get_bits
