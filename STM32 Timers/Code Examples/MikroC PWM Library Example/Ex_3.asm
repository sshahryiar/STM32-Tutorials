_main:
;Ex_3.c,7 :: 		void main()
;Ex_3.c,9 :: 		unsigned int i = 0;
;Ex_3.c,11 :: 		setup();
BL	_setup+0
;Ex_3.c,13 :: 		while(1)
L_main0:
;Ex_3.c,15 :: 		for(i = 0; i <= pwm_val; i++)
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
L_main2:
; i start address is: 24 (R6)
MOVW	R0, #lo_addr(_pwm_val+0)
MOVT	R0, #hi_addr(_pwm_val+0)
LDRH	R0, [R0, #0]
CMP	R6, R0
IT	HI
BHI	L_main3
;Ex_3.c,17 :: 		PWM_TIM4_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #1
UXTH	R0, R6
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,18 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVS	R2, #1
MOVS	R1, #0
UXTH	R0, R6
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,19 :: 		delay_us(200);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
NOP
;Ex_3.c,15 :: 		for(i = 0; i <= pwm_val; i++)
ADDS	R6, R6, #1
UXTH	R6, R6
;Ex_3.c,20 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_main2
L_main3:
;Ex_3.c,21 :: 		for(i = 0; i <= pwm_val; i++)
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
L_main7:
; i start address is: 24 (R6)
MOVW	R0, #lo_addr(_pwm_val+0)
MOVT	R0, #hi_addr(_pwm_val+0)
LDRH	R0, [R0, #0]
CMP	R6, R0
IT	HI
BHI	L_main8
;Ex_3.c,23 :: 		PWM_TIM4_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL2);
MOVS	R2, #1
MOVS	R1, #1
UXTH	R0, R6
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,24 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
UXTH	R0, R6
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,25 :: 		delay_us(200);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_main10:
SUBS	R7, R7, #1
BNE	L_main10
NOP
NOP
NOP
;Ex_3.c,21 :: 		for(i = 0; i <= pwm_val; i++)
ADDS	R6, R6, #1
UXTH	R6, R6
;Ex_3.c,26 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_main7
L_main8:
;Ex_3.c,27 :: 		for(i = 0; i <= pwm_val; i++)
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
L_main12:
; i start address is: 24 (R6)
MOVW	R0, #lo_addr(_pwm_val+0)
MOVT	R0, #hi_addr(_pwm_val+0)
LDRH	R0, [R0, #0]
CMP	R6, R0
IT	HI
BHI	L_main13
;Ex_3.c,29 :: 		PWM_TIM4_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #1
UXTH	R0, R6
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,30 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #0
UXTH	R0, R6
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,31 :: 		delay_us(200);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_main15:
SUBS	R7, R7, #1
BNE	L_main15
NOP
NOP
NOP
;Ex_3.c,27 :: 		for(i = 0; i <= pwm_val; i++)
ADDS	R6, R6, #1
UXTH	R6, R6
;Ex_3.c,32 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_main12
L_main13:
;Ex_3.c,33 :: 		for(i = 0; i <= pwm_val; i++)
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
L_main17:
; i start address is: 24 (R6)
MOVW	R0, #lo_addr(_pwm_val+0)
MOVT	R0, #hi_addr(_pwm_val+0)
LDRH	R0, [R0, #0]
CMP	R6, R0
IT	HI
BHI	L_main18
;Ex_3.c,35 :: 		PWM_TIM4_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #1
UXTH	R0, R6
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,36 :: 		PWM_TIM3_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
UXTH	R0, R6
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,37 :: 		delay_us(200);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_main20:
SUBS	R7, R7, #1
BNE	L_main20
NOP
NOP
NOP
;Ex_3.c,33 :: 		for(i = 0; i <= pwm_val; i++)
ADDS	R6, R6, #1
UXTH	R6, R6
;Ex_3.c,38 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_main17
L_main18:
;Ex_3.c,39 :: 		for(i = 0; i <= pwm_val; i++)
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
L_main22:
; i start address is: 24 (R6)
MOVW	R0, #lo_addr(_pwm_val+0)
MOVT	R0, #hi_addr(_pwm_val+0)
LDRH	R0, [R0, #0]
CMP	R6, R0
IT	HI
BHI	L_main23
;Ex_3.c,41 :: 		PWM_TIM3_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #1
UXTH	R0, R6
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,42 :: 		PWM_TIM3_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVS	R2, #1
MOVS	R1, #0
UXTH	R0, R6
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,43 :: 		delay_us(200);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_main25:
SUBS	R7, R7, #1
BNE	L_main25
NOP
NOP
NOP
;Ex_3.c,39 :: 		for(i = 0; i <= pwm_val; i++)
ADDS	R6, R6, #1
UXTH	R6, R6
;Ex_3.c,44 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_main22
L_main23:
;Ex_3.c,45 :: 		for(i = 0; i <= pwm_val; i++)
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
L_main27:
; i start address is: 24 (R6)
MOVW	R0, #lo_addr(_pwm_val+0)
MOVT	R0, #hi_addr(_pwm_val+0)
LDRH	R0, [R0, #0]
CMP	R6, R0
IT	HI
BHI	L_main28
;Ex_3.c,47 :: 		PWM_TIM3_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL2);
MOVS	R2, #1
MOVS	R1, #1
UXTH	R0, R6
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,48 :: 		PWM_TIM3_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
UXTH	R0, R6
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,49 :: 		delay_us(200);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_main30:
SUBS	R7, R7, #1
BNE	L_main30
NOP
NOP
NOP
;Ex_3.c,45 :: 		for(i = 0; i <= pwm_val; i++)
ADDS	R6, R6, #1
UXTH	R6, R6
;Ex_3.c,50 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_main27
L_main28:
;Ex_3.c,51 :: 		for(i = 0; i <= pwm_val; i++)
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
L_main32:
; i start address is: 24 (R6)
MOVW	R0, #lo_addr(_pwm_val+0)
MOVT	R0, #hi_addr(_pwm_val+0)
LDRH	R0, [R0, #0]
CMP	R6, R0
IT	HI
BHI	L_main33
;Ex_3.c,53 :: 		PWM_TIM3_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #1
UXTH	R0, R6
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,54 :: 		PWM_TIM3_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #0
UXTH	R0, R6
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,55 :: 		delay_us(200);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_main35:
SUBS	R7, R7, #1
BNE	L_main35
NOP
NOP
NOP
;Ex_3.c,51 :: 		for(i = 0; i <= pwm_val; i++)
ADDS	R6, R6, #1
UXTH	R6, R6
;Ex_3.c,56 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_main32
L_main33:
;Ex_3.c,57 :: 		for(i = 0; i <= pwm_val; i++)
; i start address is: 24 (R6)
MOVS	R6, #0
; i end address is: 24 (R6)
L_main37:
; i start address is: 24 (R6)
MOVW	R0, #lo_addr(_pwm_val+0)
MOVT	R0, #hi_addr(_pwm_val+0)
LDRH	R0, [R0, #0]
CMP	R6, R0
IT	HI
BHI	L_main38
;Ex_3.c,59 :: 		PWM_TIM3_Set_Duty(i, _PWM_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #1
UXTH	R0, R6
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,60 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
UXTH	R0, R6
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,61 :: 		delay_us(200);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_main40:
SUBS	R7, R7, #1
BNE	L_main40
NOP
NOP
NOP
;Ex_3.c,57 :: 		for(i = 0; i <= pwm_val; i++)
ADDS	R6, R6, #1
UXTH	R6, R6
;Ex_3.c,62 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_main37
L_main38:
;Ex_3.c,63 :: 		};
IT	AL
BAL	L_main0
;Ex_3.c,64 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup:
;Ex_3.c,67 :: 		void setup()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ex_3.c,69 :: 		setup_PWMs();
BL	_setup_PWMs+0
;Ex_3.c,70 :: 		}
L_end_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup
_setup_PWMs:
;Ex_3.c,73 :: 		void setup_PWMs()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Ex_3.c,75 :: 		unsigned int temp1 = 0;
;Ex_3.c,76 :: 		unsigned int temp2 = 0;
;Ex_3.c,78 :: 		temp1 = PWM_TIM3_Init(6000);
MOVW	R0, #6000
BL	_PWM_TIM3_Init+0
STRH	R0, [SP, #4]
;Ex_3.c,80 :: 		PWM_TIM3_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,81 :: 		PWM_TIM3_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,82 :: 		PWM_TIM3_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,83 :: 		PWM_TIM3_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM3_Set_Duty+0
;Ex_3.c,85 :: 		PWM_TIM3_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM3_CH1_PC6);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM3_CH1_PC6+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM3_CH1_PC6+0)
MOVS	R0, #0
BL	_PWM_TIM3_Start+0
;Ex_3.c,86 :: 		PWM_TIM3_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM3_CH2_PC7);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM3_CH2_PC7+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM3_CH2_PC7+0)
MOVS	R0, #1
BL	_PWM_TIM3_Start+0
;Ex_3.c,87 :: 		PWM_TIM3_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM3_CH3_PC8);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM3_CH3_PC8+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM3_CH3_PC8+0)
MOVS	R0, #2
BL	_PWM_TIM3_Start+0
;Ex_3.c,88 :: 		PWM_TIM3_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM3_CH4_PC9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM3_CH4_PC9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM3_CH4_PC9+0)
MOVS	R0, #3
BL	_PWM_TIM3_Start+0
;Ex_3.c,90 :: 		temp2 = PWM_TIM4_Init(6000);
MOVW	R0, #6000
BL	_PWM_TIM4_Init+0
STRH	R0, [SP, #6]
;Ex_3.c,92 :: 		PWM_TIM4_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,93 :: 		PWM_TIM4_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,94 :: 		PWM_TIM4_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,95 :: 		PWM_TIM4_Set_Duty(0, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #0
MOVS	R0, #0
BL	_PWM_TIM4_Set_Duty+0
;Ex_3.c,97 :: 		PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;Ex_3.c,98 :: 		PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PB7);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH2_PB7+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH2_PB7+0)
MOVS	R0, #1
BL	_PWM_TIM4_Start+0
;Ex_3.c,99 :: 		PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PB8);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH3_PB8+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH3_PB8+0)
MOVS	R0, #2
BL	_PWM_TIM4_Start+0
;Ex_3.c,100 :: 		PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PB9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH4_PB9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH4_PB9+0)
MOVS	R0, #3
BL	_PWM_TIM4_Start+0
;Ex_3.c,102 :: 		if(temp2 >= temp1)
LDRH	R1, [SP, #4]
LDRH	R0, [SP, #6]
CMP	R0, R1
IT	CC
BCC	L_setup_PWMs42
;Ex_3.c,104 :: 		pwm_val = temp2;
LDRH	R1, [SP, #6]
MOVW	R0, #lo_addr(_pwm_val+0)
MOVT	R0, #hi_addr(_pwm_val+0)
STRH	R1, [R0, #0]
;Ex_3.c,105 :: 		}
IT	AL
BAL	L_setup_PWMs43
L_setup_PWMs42:
;Ex_3.c,108 :: 		pwm_val = temp1;
LDRH	R1, [SP, #4]
MOVW	R0, #lo_addr(_pwm_val+0)
MOVT	R0, #hi_addr(_pwm_val+0)
STRH	R1, [R0, #0]
;Ex_3.c,109 :: 		}
L_setup_PWMs43:
;Ex_3.c,110 :: 		}
L_end_setup_PWMs:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _setup_PWMs
