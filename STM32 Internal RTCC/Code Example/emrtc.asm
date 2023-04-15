_RTC_ISR:
;emrtc.c,48 :: 		ics ICS_AUTO
SUB	SP, SP, #4
;emrtc.c,50 :: 		if(get_RTC_second_flag_state() == true)
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #1
IT	NE
BNE	L_RTC_ISR0
;emrtc.c,52 :: 		update_time = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_update_time+0)
MOVT	R0, #hi_addr(_update_time+0)
STR	R1, [R0, #0]
;emrtc.c,53 :: 		clear_RTC_second_flag();
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
STR	R1, [R0, #0]
;emrtc.c,54 :: 		}
L_RTC_ISR0:
;emrtc.c,56 :: 		clear_RTC_overflow_flag();
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #4
ANDS	R1, R0
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
STR	R1, [R0, #0]
;emrtc.c,57 :: 		while(get_RTC_operation_state() == false);
L_RTC_ISR1:
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32
CMP	R0, #0
IT	NE
BNE	L_RTC_ISR2
IT	AL
BAL	L_RTC_ISR1
L_RTC_ISR2:
;emrtc.c,58 :: 		}
L_end_RTC_ISR:
ADD	SP, SP, #4
BX	LR
; end of _RTC_ISR
_main:
;emrtc.c,61 :: 		void main()
SUB	SP, SP, #16
;emrtc.c,63 :: 		setup_mcu();
BL	_setup_mcu+0
;emrtc.c,65 :: 		lcd_out(1, 7, ":  :");
MOVS	R0, #58
STRB	R0, [SP, #4]
MOVS	R0, #32
STRB	R0, [SP, #5]
MOVS	R0, #32
STRB	R0, [SP, #6]
MOVS	R0, #58
STRB	R0, [SP, #7]
MOVS	R0, #0
STRB	R0, [SP, #8]
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #7
MOVS	R0, #1
BL	_Lcd_Out+0
;emrtc.c,66 :: 		lcd_out(2, 6, "/  /");
MOVS	R0, #47
STRB	R0, [SP, #9]
MOVS	R0, #32
STRB	R0, [SP, #10]
MOVS	R0, #32
STRB	R0, [SP, #11]
MOVS	R0, #47
STRB	R0, [SP, #12]
MOVS	R0, #0
STRB	R0, [SP, #13]
ADD	R0, SP, #9
MOV	R2, R0
MOVS	R1, #6
MOVS	R0, #2
BL	_Lcd_Out+0
;emrtc.c,68 :: 		while(1)
L_main3:
;emrtc.c,70 :: 		settings();
BL	_settings+0
;emrtc.c,72 :: 		if(update_time)
MOVW	R1, #lo_addr(_update_time+0)
MOVT	R1, #hi_addr(_update_time+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main5
;emrtc.c,74 :: 		get_RTC();
BL	_get_RTC+0
;emrtc.c,75 :: 		show_value(5, 1, cal_hour);
MOVW	R0, #lo_addr(_cal_hour+0)
MOVT	R0, #hi_addr(_cal_hour+0)
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVS	R1, #1
MOVS	R0, #5
BL	_show_value+0
;emrtc.c,76 :: 		show_value(8, 1, cal_minute);
MOVW	R0, #lo_addr(_cal_minute+0)
MOVT	R0, #hi_addr(_cal_minute+0)
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVS	R1, #1
MOVS	R0, #8
BL	_show_value+0
;emrtc.c,77 :: 		show_value(11, 1, cal_second);
MOVW	R0, #lo_addr(_cal_second+0)
MOVT	R0, #hi_addr(_cal_second+0)
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVS	R1, #1
MOVS	R0, #11
BL	_show_value+0
;emrtc.c,78 :: 		show_value(4, 2, cal_date);
MOVW	R0, #lo_addr(_cal_date+0)
MOVT	R0, #hi_addr(_cal_date+0)
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVS	R1, #2
MOVS	R0, #4
BL	_show_value+0
;emrtc.c,79 :: 		show_value(7, 2, cal_month);
MOVW	R0, #lo_addr(_cal_month+0)
MOVT	R0, #hi_addr(_cal_month+0)
LDRB	R0, [R0, #0]
UXTB	R2, R0
MOVS	R1, #2
MOVS	R0, #7
BL	_show_value+0
;emrtc.c,80 :: 		show_year(10, 2, cal_year);
MOVW	R0, #lo_addr(_cal_year+0)
MOVT	R0, #hi_addr(_cal_year+0)
LDRH	R0, [R0, #0]
UXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #10
BL	_show_year+0
;emrtc.c,81 :: 		update_time = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_update_time+0)
MOVT	R0, #hi_addr(_update_time+0)
STR	R1, [R0, #0]
;emrtc.c,82 :: 		}
L_main5:
;emrtc.c,83 :: 		};
IT	AL
BAL	L_main3
;emrtc.c,84 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_setup_mcu:
;emrtc.c,87 :: 		void setup_mcu()
SUB	SP, SP, #52
STR	LR, [SP, #0]
;emrtc.c,89 :: 		unsigned char i = 0;
;emrtc.c,91 :: 		setup_GPIOs();
BL	_setup_GPIOs+0
;emrtc.c,93 :: 		Lcd_Init();
BL	_Lcd_Init+0
;emrtc.c,94 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;emrtc.c,95 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;emrtc.c,97 :: 		Lcd_Out(1, 4, "STM32 RTC.");
ADD	R11, SP, #4
ADD	R10, R11, #11
MOVW	R12, #lo_addr(?ICS?lstr3_emrtc+0)
MOVT	R12, #hi_addr(?ICS?lstr3_emrtc+0)
BL	___CC2DW+0
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #4
MOVS	R0, #1
BL	_Lcd_Out+0
;emrtc.c,98 :: 		i = RTC_init();
BL	_RTC_init+0
; i start address is: 0 (R0)
;emrtc.c,100 :: 		switch(i)
IT	AL
BAL	L_setup_mcu6
; i end address is: 0 (R0)
;emrtc.c,102 :: 		case 1:
L_setup_mcu8:
;emrtc.c,104 :: 		lcd_out(2, 1, "RTC init. failed");
ADD	R11, SP, #15
ADD	R10, R11, #17
MOVW	R12, #lo_addr(?ICS?lstr4_emrtc+0)
MOVT	R12, #hi_addr(?ICS?lstr4_emrtc+0)
BL	___CC2DW+0
ADD	R0, SP, #15
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;emrtc.c,105 :: 		while(1);
L_setup_mcu9:
IT	AL
BAL	L_setup_mcu9
;emrtc.c,107 :: 		default:
L_setup_mcu11:
;emrtc.c,109 :: 		lcd_out(2, 1, "RTC init success");
ADD	R11, SP, #32
ADD	R10, R11, #17
MOVW	R12, #lo_addr(?ICS?lstr5_emrtc+0)
MOVT	R12, #hi_addr(?ICS?lstr5_emrtc+0)
BL	___CC2DW+0
ADD	R0, SP, #32
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;emrtc.c,110 :: 		delay_ms(2000);
MOVW	R7, #13823
MOVT	R7, #366
NOP
NOP
L_setup_mcu12:
SUBS	R7, R7, #1
BNE	L_setup_mcu12
NOP
NOP
NOP
;emrtc.c,111 :: 		break;
IT	AL
BAL	L_setup_mcu7
;emrtc.c,113 :: 		}
L_setup_mcu6:
; i start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_setup_mcu8
; i end address is: 0 (R0)
IT	AL
BAL	L_setup_mcu11
L_setup_mcu7:
;emrtc.c,115 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;emrtc.c,116 :: 		}
L_end_setup_mcu:
LDR	LR, [SP, #0]
ADD	SP, SP, #52
BX	LR
; end of _setup_mcu
_setup_GPIOs:
;emrtc.c,119 :: 		void setup_GPIOs()
SUB	SP, SP, #4
;emrtc.c,121 :: 		enable_GPIOA(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;emrtc.c,122 :: 		setup_GPIOA(set_button_pin, digital_input);
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
L_setup_GPIOs23:
;emrtc.c,123 :: 		enable_pull_up_GPIOA(set_button_pin);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;emrtc.c,125 :: 		setup_GPIOA(inc_button_pin, digital_input);
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
L_setup_GPIOs36:
;emrtc.c,126 :: 		enable_pull_up_GPIOA(inc_button_pin);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;emrtc.c,128 :: 		setup_GPIOA(dec_button_pin, digital_input);
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
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_setup_GPIOs49:
;emrtc.c,129 :: 		enable_pull_up_GPIOA(dec_button_pin);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;emrtc.c,131 :: 		setup_GPIOA(esc_button_pin, digital_input);
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #4095
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32768
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
L_setup_GPIOs62:
;emrtc.c,132 :: 		enable_pull_up_GPIOA(esc_button_pin);
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;emrtc.c,134 :: 		enable_GPIOB(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R1, [R0, #0]
;emrtc.c,135 :: 		setup_GPIOB(10, (GPIO_PP_output | output_mode_medium_speed));
L_setup_GPIOs69:
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;emrtc.c,136 :: 		setup_GPIOB(11, (GPIO_PP_output | output_mode_medium_speed));
L_setup_GPIOs80:
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
ORR	R1, R0, #4096
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;emrtc.c,137 :: 		setup_GPIOB(12, (GPIO_PP_output | output_mode_medium_speed));
L_setup_GPIOs91:
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #983040
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #65536
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;emrtc.c,138 :: 		setup_GPIOB(13, (GPIO_PP_output | output_mode_medium_speed));
L_setup_GPIOs102:
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1048576
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;emrtc.c,139 :: 		setup_GPIOB(14, (GPIO_PP_output | output_mode_medium_speed));
L_setup_GPIOs113:
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #251658240
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16777216
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;emrtc.c,140 :: 		setup_GPIOB(15, (GPIO_PP_output | output_mode_medium_speed));
L_setup_GPIOs124:
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #-268435456
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #268435456
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;emrtc.c,141 :: 		}
L_end_setup_GPIOs:
ADD	SP, SP, #4
BX	LR
; end of _setup_GPIOs
_RTC_init:
;emrtc.c,144 :: 		unsigned char RTC_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;emrtc.c,146 :: 		unsigned char timeout = 0;
; timeout start address is: 12 (R3)
MOVS	R3, #0
;emrtc.c,148 :: 		if(BKP_DR1 != rtc_access_code)
MOVW	R0, #lo_addr(BKP_DR1+0)
MOVT	R0, #hi_addr(BKP_DR1+0)
LDR	R1, [R0, #0]
MOVW	R0, #39321
CMP	R1, R0
IT	EQ
BEQ	L_RTC_init132
;emrtc.c,150 :: 		enable_power_control_module(true);
MOVS	R2, #1
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;emrtc.c,151 :: 		enable_backup_module(true);
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;emrtc.c,153 :: 		disable_backup_domain_write_protection(true);
MOVW	R0, #lo_addr(PWR_CRbits+0)
MOVT	R0, #hi_addr(PWR_CRbits+0)
STR	R2, [R0, #0]
;emrtc.c,154 :: 		set_backup_domain_software_reset(true);
MOVW	R0, #lo_addr(RCC_BDCRbits+0)
MOVT	R0, #hi_addr(RCC_BDCRbits+0)
STR	R2, [R0, #0]
;emrtc.c,155 :: 		set_backup_domain_software_reset(false);
MOVS	R1, #0
MOVW	R0, #lo_addr(RCC_BDCRbits+0)
MOVT	R0, #hi_addr(RCC_BDCRbits+0)
STR	R1, [R0, #0]
;emrtc.c,157 :: 		bypass_LSE_with_external_clock(false);
MOVW	R0, #lo_addr(RCC_BDCRbits+0)
MOVT	R0, #hi_addr(RCC_BDCRbits+0)
STR	R1, [R0, #0]
;emrtc.c,158 :: 		enable_LSE(true);
MOVW	R0, #lo_addr(RCC_BDCRbits+0)
MOVT	R0, #hi_addr(RCC_BDCRbits+0)
STR	R2, [R0, #0]
; timeout end address is: 12 (R3)
UXTB	R1, R3
;emrtc.c,159 :: 		while((LSE_ready() == false) && (timeout < 250))
L_RTC_init133:
; timeout start address is: 4 (R1)
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #2
CMP	R0, #0
IT	NE
BNE	L__RTC_init229
CMP	R1, #250
IT	CS
BCS	L__RTC_init228
L__RTC_init227:
;emrtc.c,161 :: 		timeout++;
ADDS	R1, R1, #1
UXTB	R1, R1
;emrtc.c,162 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_RTC_init137:
SUBS	R7, R7, #1
BNE	L_RTC_init137
NOP
NOP
NOP
;emrtc.c,163 :: 		};
IT	AL
BAL	L_RTC_init133
;emrtc.c,159 :: 		while((LSE_ready() == false) && (timeout < 250))
L__RTC_init229:
L__RTC_init228:
;emrtc.c,165 :: 		if(timeout > 250)
CMP	R1, #250
IT	LS
BLS	L_RTC_init139
; timeout end address is: 4 (R1)
;emrtc.c,167 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_RTC_init
;emrtc.c,168 :: 		}
L_RTC_init139:
;emrtc.c,170 :: 		select_RTC_clock_source(LSE_clock);
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #256
MOVW	R0, #lo_addr(RCC_BDCR+0)
MOVT	R0, #hi_addr(RCC_BDCR+0)
STR	R1, [R0, #0]
;emrtc.c,171 :: 		enable_RTC_clock(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RCC_BDCRbits+0)
MOVT	R0, #hi_addr(RCC_BDCRbits+0)
STR	R1, [R0, #0]
;emrtc.c,173 :: 		while(get_RTC_operation_state() == false);
L_RTC_init143:
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32
CMP	R0, #0
IT	NE
BNE	L_RTC_init144
IT	AL
BAL	L_RTC_init143
L_RTC_init144:
;emrtc.c,174 :: 		while(get_RTC_register_sync_state() == false);
L_RTC_init145:
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
LDR	R0, [R0, #0]
AND	R0, R0, #8
CMP	R0, #0
IT	NE
BNE	L_RTC_init146
IT	AL
BAL	L_RTC_init145
L_RTC_init146:
;emrtc.c,175 :: 		enable_RTC_second_interrupt(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RTC_CRHbits+0)
MOVT	R0, #hi_addr(RTC_CRHbits+0)
STR	R1, [R0, #0]
;emrtc.c,176 :: 		while(get_RTC_operation_state() == false);
L_RTC_init147:
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32
CMP	R0, #0
IT	NE
BNE	L_RTC_init148
IT	AL
BAL	L_RTC_init147
L_RTC_init148:
;emrtc.c,178 :: 		set_RTC_configuration_flag(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RTC_CRLbits+0)
MOVT	R0, #hi_addr(RTC_CRLbits+0)
STR	R1, [R0, #0]
;emrtc.c,179 :: 		set_RTC_prescalar(32767);
MOVS	R1, #0
MOVW	R0, #lo_addr(RTC_PRLL+0)
MOVT	R0, #hi_addr(RTC_PRLL+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(RTC_PRLH+0)
MOVT	R0, #hi_addr(RTC_PRLH+0)
STR	R1, [R0, #0]
MOVW	R1, #32767
MOVW	R0, #lo_addr(RTC_PRLL+0)
MOVT	R0, #hi_addr(RTC_PRLL+0)
STR	R1, [R0, #0]
MOVS	R1, #0
MOVW	R0, #lo_addr(RTC_PRLH+0)
MOVT	R0, #hi_addr(RTC_PRLH+0)
STR	R1, [R0, #0]
;emrtc.c,180 :: 		set_RTC_configuration_flag(false);
MOVS	R1, #0
MOVW	R0, #lo_addr(RTC_CRLbits+0)
MOVT	R0, #hi_addr(RTC_CRLbits+0)
STR	R1, [R0, #0]
;emrtc.c,182 :: 		while(get_RTC_operation_state() == false);
L_RTC_init152:
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32
CMP	R0, #0
IT	NE
BNE	L_RTC_init153
IT	AL
BAL	L_RTC_init152
L_RTC_init153:
;emrtc.c,183 :: 		BKP_DR1 = rtc_access_code;
MOVW	R1, #39321
MOVW	R0, #lo_addr(BKP_DR1+0)
MOVT	R0, #hi_addr(BKP_DR1+0)
STR	R1, [R0, #0]
;emrtc.c,184 :: 		disable_backup_domain_write_protection(false);
MOVS	R1, #0
MOVW	R0, #lo_addr(PWR_CRbits+0)
MOVT	R0, #hi_addr(PWR_CRbits+0)
STR	R1, [R0, #0]
;emrtc.c,186 :: 		set_RTC(cal_year, cal_month, cal_date, cal_hour, cal_minute, cal_second);
MOVW	R0, #lo_addr(_cal_second+0)
MOVT	R0, #hi_addr(_cal_second+0)
LDRB	R5, [R0, #0]
MOVW	R0, #lo_addr(_cal_minute+0)
MOVT	R0, #hi_addr(_cal_minute+0)
LDRB	R4, [R0, #0]
MOVW	R0, #lo_addr(_cal_hour+0)
MOVT	R0, #hi_addr(_cal_hour+0)
LDRB	R3, [R0, #0]
MOVW	R0, #lo_addr(_cal_date+0)
MOVT	R0, #hi_addr(_cal_date+0)
LDRB	R2, [R0, #0]
MOVW	R0, #lo_addr(_cal_month+0)
MOVT	R0, #hi_addr(_cal_month+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_cal_year+0)
MOVT	R0, #hi_addr(_cal_year+0)
LDRH	R0, [R0, #0]
PUSH	(R5)
PUSH	(R4)
BL	_set_RTC+0
ADD	SP, SP, #8
;emrtc.c,187 :: 		}
IT	AL
BAL	L_RTC_init154
L_RTC_init132:
;emrtc.c,191 :: 		while(get_RTC_register_sync_state() == false);
L_RTC_init155:
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
LDR	R0, [R0, #0]
AND	R0, R0, #8
CMP	R0, #0
IT	NE
BNE	L_RTC_init156
IT	AL
BAL	L_RTC_init155
L_RTC_init156:
;emrtc.c,192 :: 		enable_RTC_second_interrupt(true);
MOVS	R1, #1
MOVW	R0, #lo_addr(RTC_CRHbits+0)
MOVT	R0, #hi_addr(RTC_CRHbits+0)
STR	R1, [R0, #0]
;emrtc.c,193 :: 		while(get_RTC_operation_state() == false);
L_RTC_init157:
MOVW	R0, #lo_addr(RTC_CRL+0)
MOVT	R0, #hi_addr(RTC_CRL+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32
CMP	R0, #0
IT	NE
BNE	L_RTC_init158
IT	AL
BAL	L_RTC_init157
L_RTC_init158:
;emrtc.c,194 :: 		}
L_RTC_init154:
;emrtc.c,196 :: 		NVIC_IntEnable(IVT_INT_RTC);
MOVW	R0, #19
BL	_NVIC_IntEnable+0
;emrtc.c,198 :: 		return 0;
MOVS	R0, #0
;emrtc.c,199 :: 		}
L_end_RTC_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RTC_init
_get_RTC:
;emrtc.c,202 :: 		void get_RTC()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;emrtc.c,204 :: 		unsigned int temp1 = 0;
;emrtc.c,207 :: 		unsigned long temp = 0;
;emrtc.c,208 :: 		unsigned long counts = 0;
;emrtc.c,210 :: 		counts = RTC_CNTH;
MOVW	R0, #lo_addr(RTC_CNTH+0)
MOVT	R0, #hi_addr(RTC_CNTH+0)
; counts start address is: 0 (R0)
LDR	R0, [R0, #0]
;emrtc.c,211 :: 		counts <<= 16;
LSLS	R1, R0, #16
; counts end address is: 0 (R0)
;emrtc.c,212 :: 		counts += RTC_CNTL;
MOVW	R0, #lo_addr(RTC_CNTL+0)
MOVT	R0, #hi_addr(RTC_CNTL+0)
LDR	R0, [R0, #0]
ADDS	R1, R1, R0
; counts start address is: 16 (R4)
MOV	R4, R1
;emrtc.c,214 :: 		temp = (counts / 86400);
MOVW	R0, #20864
MOVT	R0, #1
UDIV	R1, R1, R0
; temp start address is: 8 (R2)
MOV	R2, R1
;emrtc.c,216 :: 		if(day_count != temp)
MOVW	R0, #lo_addr(get_RTC_day_count_L0+0)
MOVT	R0, #hi_addr(get_RTC_day_count_L0+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__get_RTC233
;emrtc.c,218 :: 		day_count = temp;
MOVW	R0, #lo_addr(get_RTC_day_count_L0+0)
MOVT	R0, #hi_addr(get_RTC_day_count_L0+0)
STRH	R2, [R0, #0]
;emrtc.c,219 :: 		temp1 = 1970;
; temp1 start address is: 12 (R3)
MOVW	R3, #1970
; temp end address is: 8 (R2)
; counts end address is: 16 (R4)
; temp1 end address is: 12 (R3)
MOV	R5, R2
;emrtc.c,221 :: 		while(temp >= 365)
L_get_RTC160:
; temp1 start address is: 12 (R3)
; temp start address is: 20 (R5)
; counts start address is: 16 (R4)
MOVW	R0, #365
CMP	R5, R0
IT	CC
BCC	L_get_RTC161
;emrtc.c,223 :: 		if(check_for_leap_year(temp1) == 1)
UXTH	R0, R3
BL	_check_for_leap_year+0
CMP	R0, #1
IT	NE
BNE	L_get_RTC162
;emrtc.c,225 :: 		if(temp >= 366)
CMP	R5, #366
IT	CC
BCC	L_get_RTC163
;emrtc.c,227 :: 		temp -= 366;
SUB	R5, R5, #366
;emrtc.c,228 :: 		}
IT	AL
BAL	L_get_RTC164
L_get_RTC163:
;emrtc.c,232 :: 		break;
IT	AL
BAL	L_get_RTC161
;emrtc.c,233 :: 		}
L_get_RTC164:
;emrtc.c,234 :: 		}
IT	AL
BAL	L_get_RTC165
L_get_RTC162:
;emrtc.c,238 :: 		temp -= 365;
SUBW	R0, R5, #365
; temp end address is: 20 (R5)
; temp start address is: 4 (R1)
MOV	R1, R0
; temp end address is: 4 (R1)
MOV	R5, R1
;emrtc.c,239 :: 		}
L_get_RTC165:
;emrtc.c,241 :: 		temp1++;
; temp start address is: 20 (R5)
ADDS	R3, R3, #1
UXTH	R3, R3
;emrtc.c,242 :: 		};
IT	AL
BAL	L_get_RTC160
L_get_RTC161:
;emrtc.c,244 :: 		cal_year = temp1;
MOVW	R0, #lo_addr(_cal_year+0)
MOVT	R0, #hi_addr(_cal_year+0)
STRH	R3, [R0, #0]
; temp1 end address is: 12 (R3)
;emrtc.c,246 :: 		temp1 = 0;
; temp1 start address is: 0 (R0)
MOVS	R0, #0
; counts end address is: 16 (R4)
; temp1 end address is: 0 (R0)
; temp end address is: 20 (R5)
MOV	R3, R4
UXTH	R4, R0
;emrtc.c,247 :: 		while(temp >= 28)
L_get_RTC166:
; temp1 start address is: 16 (R4)
; counts start address is: 12 (R3)
; temp start address is: 20 (R5)
CMP	R5, #28
IT	CC
BCC	L_get_RTC167
;emrtc.c,249 :: 		if((temp1 == 1) && (check_for_leap_year(cal_year) == 1))
CMP	R4, #1
IT	NE
BNE	L__get_RTC232
MOVW	R0, #lo_addr(_cal_year+0)
MOVT	R0, #hi_addr(_cal_year+0)
LDRH	R0, [R0, #0]
BL	_check_for_leap_year+0
CMP	R0, #1
IT	NE
BNE	L__get_RTC231
L__get_RTC230:
;emrtc.c,251 :: 		if(temp >= 29)
CMP	R5, #29
IT	CC
BCC	L_get_RTC171
;emrtc.c,253 :: 		temp -= 29;
SUBS	R5, #29
;emrtc.c,254 :: 		}
IT	AL
BAL	L_get_RTC172
L_get_RTC171:
;emrtc.c,258 :: 		break;
IT	AL
BAL	L_get_RTC167
;emrtc.c,259 :: 		}
L_get_RTC172:
;emrtc.c,260 :: 		}
IT	AL
BAL	L_get_RTC173
;emrtc.c,249 :: 		if((temp1 == 1) && (check_for_leap_year(cal_year) == 1))
L__get_RTC232:
L__get_RTC231:
;emrtc.c,264 :: 		if(temp >= month_table[temp1])
MOVW	R0, #lo_addr(_month_table+0)
MOVT	R0, #hi_addr(_month_table+0)
ADDS	R0, R0, R4
LDRB	R0, [R0, #0]
CMP	R5, R0
IT	CC
BCC	L_get_RTC174
;emrtc.c,266 :: 		temp -= ((unsigned long)month_table[temp1]);
MOVW	R0, #lo_addr(_month_table+0)
MOVT	R0, #hi_addr(_month_table+0)
ADDS	R0, R0, R4
LDRB	R0, [R0, #0]
SUB	R5, R5, R0
;emrtc.c,267 :: 		}
IT	AL
BAL	L_get_RTC175
L_get_RTC174:
;emrtc.c,271 :: 		break;
IT	AL
BAL	L_get_RTC167
;emrtc.c,272 :: 		}
L_get_RTC175:
;emrtc.c,273 :: 		}
L_get_RTC173:
; temp end address is: 20 (R5)
;emrtc.c,275 :: 		temp1++;
; temp start address is: 20 (R5)
ADDS	R4, R4, #1
UXTH	R4, R4
;emrtc.c,276 :: 		};
IT	AL
BAL	L_get_RTC166
L_get_RTC167:
;emrtc.c,278 :: 		cal_month = (temp1 + 1);
ADDS	R1, R4, #1
; temp1 end address is: 16 (R4)
MOVW	R0, #lo_addr(_cal_month+0)
MOVT	R0, #hi_addr(_cal_month+0)
STRB	R1, [R0, #0]
;emrtc.c,279 :: 		cal_date = (temp + 1);
ADDS	R1, R5, #1
; temp end address is: 20 (R5)
MOVW	R0, #lo_addr(_cal_date+0)
MOVT	R0, #hi_addr(_cal_date+0)
STRB	R1, [R0, #0]
; counts end address is: 12 (R3)
MOV	R1, R3
;emrtc.c,280 :: 		}
IT	AL
BAL	L_get_RTC159
L__get_RTC233:
;emrtc.c,216 :: 		if(day_count != temp)
MOV	R1, R4
;emrtc.c,280 :: 		}
L_get_RTC159:
;emrtc.c,282 :: 		temp = (counts % 86400);
; counts start address is: 4 (R1)
MOVW	R0, #20864
MOVT	R0, #1
UDIV	R3, R1, R0
MLS	R3, R0, R3, R1
; counts end address is: 4 (R1)
;emrtc.c,284 :: 		cal_hour = (temp / 3600);
MOVW	R0, #3600
UDIV	R1, R3, R0
MOVW	R0, #lo_addr(_cal_hour+0)
MOVT	R0, #hi_addr(_cal_hour+0)
STRB	R1, [R0, #0]
;emrtc.c,285 :: 		cal_minute = ((temp % 3600) / 60);
MOVW	R0, #3600
UDIV	R2, R3, R0
MLS	R2, R0, R2, R3
MOVS	R0, #60
UDIV	R1, R2, R0
MOVW	R0, #lo_addr(_cal_minute+0)
MOVT	R0, #hi_addr(_cal_minute+0)
STRB	R1, [R0, #0]
;emrtc.c,286 :: 		cal_second = ((temp % 3600) % 60);
MOVS	R0, #60
UDIV	R1, R2, R0
MLS	R1, R0, R1, R2
MOVW	R0, #lo_addr(_cal_second+0)
MOVT	R0, #hi_addr(_cal_second+0)
STRB	R1, [R0, #0]
;emrtc.c,287 :: 		}
L_end_get_RTC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _get_RTC
_set_RTC:
;emrtc.c,290 :: 		void set_RTC(unsigned int year, unsigned char month, unsigned char date, unsigned char hour, unsigned char minute, unsigned char second)
; hour start address is: 12 (R3)
; date start address is: 8 (R2)
; month start address is: 4 (R1)
; year start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTH	R7, R0
; hour end address is: 12 (R3)
; date end address is: 8 (R2)
; month end address is: 4 (R1)
; year end address is: 0 (R0)
; year start address is: 28 (R7)
; month start address is: 4 (R1)
; date start address is: 8 (R2)
; hour start address is: 12 (R3)
; minute start address is: 0 (R0)
LDRB	R0, [SP, #4]
; second start address is: 20 (R5)
LDRB	R5, [SP, #8]
;emrtc.c,292 :: 		unsigned int i = 0;
;emrtc.c,293 :: 		unsigned long counts = 0;
; counts start address is: 24 (R6)
MOV	R6, #0
;emrtc.c,295 :: 		if(year > 2099)
MOVW	R4, #2099
CMP	R7, R4
IT	LS
BLS	L__set_RTC224
; year end address is: 28 (R7)
;emrtc.c,297 :: 		year = 2099;
; year start address is: 16 (R4)
MOVW	R4, #2099
; year end address is: 16 (R4)
UXTH	R7, R4
;emrtc.c,298 :: 		}
IT	AL
BAL	L_set_RTC176
L__set_RTC224:
;emrtc.c,295 :: 		if(year > 2099)
;emrtc.c,298 :: 		}
L_set_RTC176:
;emrtc.c,300 :: 		if(year < 1970)
; year start address is: 28 (R7)
MOVW	R4, #1970
CMP	R7, R4
IT	CS
BCS	L__set_RTC225
; year end address is: 28 (R7)
;emrtc.c,302 :: 		year = 1970;
; year start address is: 16 (R4)
MOVW	R4, #1970
; year end address is: 16 (R4)
;emrtc.c,303 :: 		}
IT	AL
BAL	L_set_RTC177
L__set_RTC225:
;emrtc.c,300 :: 		if(year < 1970)
UXTH	R4, R7
;emrtc.c,303 :: 		}
L_set_RTC177:
;emrtc.c,305 :: 		for(i = 1970; i < year; i++)
; year start address is: 16 (R4)
; i start address is: 40 (R10)
MOVW	R10, #1970
; month end address is: 4 (R1)
; date end address is: 8 (R2)
; minute end address is: 0 (R0)
; second end address is: 20 (R5)
; counts end address is: 24 (R6)
; year end address is: 16 (R4)
; i end address is: 40 (R10)
; hour end address is: 12 (R3)
UXTB	R9, R1
UXTB	R8, R5
UXTB	R5, R2
UXTB	R7, R0
MOV	R11, R6
UXTH	R6, R4
L_set_RTC178:
; i start address is: 40 (R10)
; year start address is: 24 (R6)
; counts start address is: 44 (R11)
; second start address is: 32 (R8)
; minute start address is: 28 (R7)
; hour start address is: 12 (R3)
; date start address is: 20 (R5)
; month start address is: 36 (R9)
CMP	R10, R6
IT	CS
BCS	L_set_RTC179
;emrtc.c,307 :: 		if(check_for_leap_year(i) == 1)
UXTH	R0, R10
BL	_check_for_leap_year+0
CMP	R0, #1
IT	NE
BNE	L_set_RTC181
;emrtc.c,309 :: 		counts += 31622400;
MOVW	R4, #34048
MOVT	R4, #482
ADD	R11, R11, R4, LSL #0
;emrtc.c,310 :: 		}
IT	AL
BAL	L_set_RTC182
L_set_RTC181:
;emrtc.c,314 :: 		counts += 31536000;
MOVW	R4, #13184
MOVT	R4, #481
ADD	R0, R11, R4, LSL #0
; counts end address is: 44 (R11)
; counts start address is: 0 (R0)
; counts end address is: 0 (R0)
MOV	R11, R0
;emrtc.c,315 :: 		}
L_set_RTC182:
;emrtc.c,305 :: 		for(i = 1970; i < year; i++)
; counts start address is: 44 (R11)
ADD	R10, R10, #1
UXTH	R10, R10
;emrtc.c,316 :: 		}
; year end address is: 24 (R6)
; i end address is: 40 (R10)
IT	AL
BAL	L_set_RTC178
L_set_RTC179:
;emrtc.c,318 :: 		month -= 1;
SUB	R4, R9, #1
; month end address is: 36 (R9)
; month start address is: 0 (R0)
UXTB	R0, R4
;emrtc.c,320 :: 		for(i = 0; i < month; i++)
; i start address is: 4 (R1)
MOVS	R1, #0
; date end address is: 20 (R5)
; counts end address is: 44 (R11)
; month end address is: 0 (R0)
; hour end address is: 12 (R3)
; minute end address is: 28 (R7)
; second end address is: 32 (R8)
; i end address is: 4 (R1)
MOV	R9, R11
UXTB	R6, R5
L_set_RTC183:
; i start address is: 4 (R1)
; month start address is: 0 (R0)
; date start address is: 24 (R6)
; hour start address is: 12 (R3)
; minute start address is: 28 (R7)
; second start address is: 32 (R8)
; counts start address is: 36 (R9)
CMP	R1, R0
IT	CS
BCS	L_set_RTC184
;emrtc.c,322 :: 		counts += (((unsigned long)month_table[i]) * 86400);
MOVW	R4, #lo_addr(_month_table+0)
MOVT	R4, #hi_addr(_month_table+0)
ADDS	R4, R4, R1
LDRB	R4, [R4, #0]
UXTB	R5, R4
MOVW	R4, #20864
MOVT	R4, #1
MULS	R4, R5, R4
ADD	R9, R9, R4, LSL #0
;emrtc.c,320 :: 		for(i = 0; i < month; i++)
ADDS	R1, R1, #1
UXTH	R1, R1
;emrtc.c,323 :: 		}
; month end address is: 0 (R0)
; i end address is: 4 (R1)
IT	AL
BAL	L_set_RTC183
L_set_RTC184:
;emrtc.c,325 :: 		if(check_for_leap_year(cal_year) == 1)
MOVW	R4, #lo_addr(_cal_year+0)
MOVT	R4, #hi_addr(_cal_year+0)
LDRH	R4, [R4, #0]
UXTH	R0, R4
BL	_check_for_leap_year+0
CMP	R0, #1
IT	NE
BNE	L__set_RTC226
;emrtc.c,327 :: 		counts += 86400;
MOVW	R4, #20864
MOVT	R4, #1
ADD	R0, R9, R4, LSL #0
; counts end address is: 36 (R9)
; counts start address is: 0 (R0)
; counts end address is: 0 (R0)
;emrtc.c,328 :: 		}
IT	AL
BAL	L_set_RTC186
L__set_RTC226:
;emrtc.c,325 :: 		if(check_for_leap_year(cal_year) == 1)
MOV	R0, R9
;emrtc.c,328 :: 		}
L_set_RTC186:
;emrtc.c,330 :: 		counts += ((unsigned long)(date - 1) * 86400);
; counts start address is: 0 (R0)
SUBS	R4, R6, #1
SXTH	R4, R4
; date end address is: 24 (R6)
SXTH	R5, R4
MOVW	R4, #20864
MOVT	R4, #1
MULS	R4, R5, R4
ADDS	R6, R0, R4
; counts end address is: 0 (R0)
;emrtc.c,331 :: 		counts += ((unsigned long)hour * 3600);
UXTB	R5, R3
; hour end address is: 12 (R3)
MOVW	R4, #3600
MULS	R4, R5, R4
ADDS	R6, R6, R4
;emrtc.c,332 :: 		counts += ((unsigned long)minute * 60);
UXTB	R5, R7
; minute end address is: 28 (R7)
MOVS	R4, #60
MULS	R4, R5, R4
ADDS	R4, R6, R4
;emrtc.c,333 :: 		counts += second;
ADD	R6, R4, R8, LSL #0
; second end address is: 32 (R8)
;emrtc.c,335 :: 		enable_power_control_module(true);
MOVS	R5, #1
MOVW	R4, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R4, #hi_addr(RCC_APB1ENRbits+0)
STR	R5, [R4, #0]
;emrtc.c,336 :: 		enable_backup_module(true);
MOVW	R4, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R4, #hi_addr(RCC_APB1ENRbits+0)
STR	R5, [R4, #0]
;emrtc.c,338 :: 		disable_backup_domain_write_protection(true);
MOVW	R4, #lo_addr(PWR_CRbits+0)
MOVT	R4, #hi_addr(PWR_CRbits+0)
STR	R5, [R4, #0]
;emrtc.c,340 :: 		set_RTC_configuration_flag(true);
MOVW	R4, #lo_addr(RTC_CRLbits+0)
MOVT	R4, #hi_addr(RTC_CRLbits+0)
STR	R5, [R4, #0]
;emrtc.c,341 :: 		set_RTC_counter(counts);
MOVS	R5, #0
MOVW	R4, #lo_addr(RTC_CNTL+0)
MOVT	R4, #hi_addr(RTC_CNTL+0)
STR	R5, [R4, #0]
MOVS	R5, #0
MOVW	R4, #lo_addr(RTC_CNTH+0)
MOVT	R4, #hi_addr(RTC_CNTH+0)
STR	R5, [R4, #0]
MOVW	R4, #65535
AND	R5, R4, R6, LSL #0
MOVW	R4, #lo_addr(RTC_CNTL+0)
MOVT	R4, #hi_addr(RTC_CNTL+0)
STR	R5, [R4, #0]
LSRS	R5, R6, #16
MOVW	R4, #lo_addr(RTC_CNTH+0)
MOVT	R4, #hi_addr(RTC_CNTH+0)
STR	R5, [R4, #0]
;emrtc.c,342 :: 		set_RTC_configuration_flag(false);
MOVS	R5, #0
MOVW	R4, #lo_addr(RTC_CRLbits+0)
MOVT	R4, #hi_addr(RTC_CRLbits+0)
STR	R5, [R4, #0]
;emrtc.c,344 :: 		while(get_RTC_operation_state() == false);
L_set_RTC190:
MOVW	R4, #lo_addr(RTC_CRL+0)
MOVT	R4, #hi_addr(RTC_CRL+0)
LDR	R4, [R4, #0]
AND	R4, R4, #32
CMP	R4, #0
IT	NE
BNE	L_set_RTC191
IT	AL
BAL	L_set_RTC190
L_set_RTC191:
;emrtc.c,346 :: 		disable_backup_domain_write_protection(false);
MOVS	R5, #0
MOVW	R4, #lo_addr(PWR_CRbits+0)
MOVT	R4, #hi_addr(PWR_CRbits+0)
STR	R5, [R4, #0]
;emrtc.c,347 :: 		}
L_end_set_RTC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _set_RTC
_check_for_leap_year:
;emrtc.c,350 :: 		unsigned char check_for_leap_year(unsigned int year)
; year start address is: 0 (R0)
SUB	SP, SP, #4
; year end address is: 0 (R0)
; year start address is: 0 (R0)
;emrtc.c,352 :: 		if(year % 4 == 0)
AND	R1, R0, #3
UXTH	R1, R1
CMP	R1, #0
IT	NE
BNE	L_check_for_leap_year192
;emrtc.c,354 :: 		if(year % 100 == 0)
MOVS	R2, #100
UDIV	R1, R0, R2
MLS	R1, R2, R1, R0
UXTH	R1, R1
CMP	R1, #0
IT	NE
BNE	L_check_for_leap_year193
;emrtc.c,356 :: 		if(year % 400 == 0)
MOVW	R2, #400
UDIV	R1, R0, R2
MLS	R1, R2, R1, R0
UXTH	R1, R1
; year end address is: 0 (R0)
CMP	R1, #0
IT	NE
BNE	L_check_for_leap_year194
;emrtc.c,358 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_check_for_leap_year
;emrtc.c,359 :: 		}
L_check_for_leap_year194:
;emrtc.c,363 :: 		return 0;
MOVS	R0, #0
IT	AL
BAL	L_end_check_for_leap_year
;emrtc.c,365 :: 		}
L_check_for_leap_year193:
;emrtc.c,369 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_check_for_leap_year
;emrtc.c,371 :: 		}
L_check_for_leap_year192:
;emrtc.c,375 :: 		return 0;
MOVS	R0, #0
;emrtc.c,377 :: 		}
L_end_check_for_leap_year:
ADD	SP, SP, #4
BX	LR
; end of _check_for_leap_year
_show_value:
;emrtc.c,380 :: 		void show_value(unsigned char x_pos, unsigned char y_pos, unsigned char value)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R8, R0
UXTB	R9, R1
UXTB	R10, R2
; value end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 32 (R8)
; y_pos start address is: 36 (R9)
; value start address is: 40 (R10)
;emrtc.c,382 :: 		unsigned char ch = 0;
;emrtc.c,384 :: 		ch = (value / 10);
MOVS	R3, #10
UDIV	R3, R10, R3
UXTB	R3, R3
;emrtc.c,385 :: 		lcd_chr(y_pos, x_pos, (ch + 0x30));
ADDS	R3, #48
UXTB	R2, R3
UXTB	R1, R8
UXTB	R0, R9
BL	_Lcd_Chr+0
;emrtc.c,386 :: 		ch = (value % 10);
MOVS	R4, #10
UDIV	R3, R10, R4
MLS	R3, R4, R3, R10
UXTB	R3, R3
; value end address is: 40 (R10)
;emrtc.c,387 :: 		lcd_chr(y_pos, (x_pos + 1), (ch + 0x30));
ADDW	R4, R3, #48
ADD	R3, R8, #1
; x_pos end address is: 32 (R8)
UXTB	R2, R4
UXTB	R1, R3
UXTB	R0, R9
; y_pos end address is: 36 (R9)
BL	_Lcd_Chr+0
;emrtc.c,388 :: 		}
L_end_show_value:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _show_value
_show_year:
;emrtc.c,391 :: 		void show_year(unsigned char x_pos, unsigned char y_pos, unsigned int value)
; value start address is: 8 (R2)
; y_pos start address is: 4 (R1)
; x_pos start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTB	R11, R0
UXTH	R0, R2
UXTB	R12, R1
; value end address is: 8 (R2)
; y_pos end address is: 4 (R1)
; x_pos end address is: 0 (R0)
; x_pos start address is: 44 (R11)
; y_pos start address is: 48 (R12)
; value start address is: 0 (R0)
;emrtc.c,393 :: 		unsigned char temp = 0;
;emrtc.c,395 :: 		temp = (value / 100);
MOVS	R3, #100
UDIV	R3, R0, R3
;emrtc.c,396 :: 		show_value(x_pos, y_pos, temp);
STRH	R0, [SP, #4]
UXTB	R2, R3
UXTB	R1, R12
UXTB	R0, R11
BL	_show_value+0
LDRH	R0, [SP, #4]
;emrtc.c,397 :: 		temp = (value % 100);
MOVS	R3, #100
UDIV	R4, R0, R3
MLS	R4, R3, R4, R0
; value end address is: 0 (R0)
;emrtc.c,398 :: 		show_value((x_pos + 2), y_pos, temp);
ADD	R3, R11, #2
; x_pos end address is: 44 (R11)
UXTB	R2, R4
UXTB	R1, R12
; y_pos end address is: 48 (R12)
UXTB	R0, R3
BL	_show_value+0
;emrtc.c,399 :: 		}
L_end_show_year:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _show_year
_change_value:
;emrtc.c,402 :: 		unsigned int change_value(unsigned char x_pos, unsigned char y_pos, signed int value, signed int value_min, signed int value_max, unsigned char value_type)
SUB	SP, SP, #28
STR	LR, [SP, #0]
STRB	R0, [SP, #12]
STRB	R1, [SP, #16]
STRH	R2, [SP, #20]
STRH	R3, [SP, #24]
LDRSH	R4, [SP, #28]
STRH	R4, [SP, #28]
LDRB	R4, [SP, #32]
STRB	R4, [SP, #32]
;emrtc.c,404 :: 		while(1)
L_change_value198:
;emrtc.c,406 :: 		switch(value_type)
IT	AL
BAL	L_change_value200
;emrtc.c,408 :: 		case 1:
L_change_value202:
;emrtc.c,410 :: 		lcd_out(y_pos, x_pos, "    ");
MOVS	R4, #32
STRB	R4, [SP, #4]
MOVS	R4, #32
STRB	R4, [SP, #5]
MOVS	R4, #32
STRB	R4, [SP, #6]
MOVS	R4, #32
STRB	R4, [SP, #7]
MOVS	R4, #0
STRB	R4, [SP, #8]
ADD	R4, SP, #4
MOV	R2, R4
LDRB	R1, [SP, #12]
LDRB	R0, [SP, #16]
BL	_Lcd_Out+0
;emrtc.c,411 :: 		break;
IT	AL
BAL	L_change_value201
;emrtc.c,413 :: 		default:
L_change_value203:
;emrtc.c,415 :: 		lcd_out(y_pos, x_pos, "  ");
MOVS	R4, #32
STRB	R4, [SP, #9]
MOVS	R4, #32
STRB	R4, [SP, #10]
MOVS	R4, #0
STRB	R4, [SP, #11]
ADD	R4, SP, #9
MOV	R2, R4
LDRB	R1, [SP, #12]
LDRB	R0, [SP, #16]
BL	_Lcd_Out+0
;emrtc.c,416 :: 		break;
IT	AL
BAL	L_change_value201
;emrtc.c,418 :: 		}
L_change_value200:
LDRB	R4, [SP, #32]
CMP	R4, #1
IT	EQ
BEQ	L_change_value202
IT	AL
BAL	L_change_value203
L_change_value201:
;emrtc.c,419 :: 		delay_ms(60);
MOVW	R7, #64639
MOVT	R7, #10
NOP
NOP
L_change_value204:
SUBS	R7, R7, #1
BNE	L_change_value204
NOP
NOP
NOP
;emrtc.c,421 :: 		if(get_GPIOA_pin_state(inc_button_pin) == low)
MOVW	R4, #lo_addr(GPIOA_IDR+0)
MOVT	R4, #hi_addr(GPIOA_IDR+0)
LDR	R4, [R4, #0]
AND	R4, R4, #2
CMP	R4, #0
IT	NE
BNE	L_change_value206
;emrtc.c,423 :: 		value++;
LDRSH	R4, [SP, #20]
ADDS	R4, R4, #1
STRH	R4, [SP, #20]
;emrtc.c,424 :: 		}
L_change_value206:
;emrtc.c,426 :: 		if(value > value_max)
LDRSH	R5, [SP, #28]
LDRSH	R4, [SP, #20]
CMP	R4, R5
IT	LE
BLE	L_change_value207
;emrtc.c,428 :: 		value = value_min;
LDRSH	R4, [SP, #24]
STRH	R4, [SP, #20]
;emrtc.c,429 :: 		}
L_change_value207:
;emrtc.c,431 :: 		if(get_GPIOA_pin_state(dec_button_pin) == low)
MOVW	R4, #lo_addr(GPIOA_IDR+0)
MOVT	R4, #hi_addr(GPIOA_IDR+0)
LDR	R4, [R4, #0]
AND	R4, R4, #4
CMP	R4, #0
IT	NE
BNE	L_change_value208
;emrtc.c,433 :: 		value--;
LDRSH	R4, [SP, #20]
SUBS	R4, R4, #1
STRH	R4, [SP, #20]
;emrtc.c,434 :: 		}
L_change_value208:
;emrtc.c,436 :: 		if(value < value_min)
LDRSH	R5, [SP, #24]
LDRSH	R4, [SP, #20]
CMP	R4, R5
IT	GE
BGE	L_change_value209
;emrtc.c,438 :: 		value = value_max;
LDRSH	R4, [SP, #28]
STRH	R4, [SP, #20]
;emrtc.c,439 :: 		}
L_change_value209:
;emrtc.c,441 :: 		switch(value_type)
IT	AL
BAL	L_change_value210
;emrtc.c,443 :: 		case 1:
L_change_value212:
;emrtc.c,445 :: 		show_year(x_pos, y_pos, ((unsigned int)value));
LDRH	R2, [SP, #20]
LDRB	R1, [SP, #16]
LDRB	R0, [SP, #12]
BL	_show_year+0
;emrtc.c,446 :: 		break;
IT	AL
BAL	L_change_value211
;emrtc.c,448 :: 		default:
L_change_value213:
;emrtc.c,450 :: 		show_value(x_pos, y_pos, ((unsigned char)value));
LDRB	R2, [SP, #20]
LDRB	R1, [SP, #16]
LDRB	R0, [SP, #12]
BL	_show_value+0
;emrtc.c,451 :: 		break;
IT	AL
BAL	L_change_value211
;emrtc.c,453 :: 		}
L_change_value210:
LDRB	R4, [SP, #32]
CMP	R4, #1
IT	EQ
BEQ	L_change_value212
IT	AL
BAL	L_change_value213
L_change_value211:
;emrtc.c,454 :: 		delay_ms(90);
MOVW	R7, #31423
MOVT	R7, #16
NOP
NOP
L_change_value214:
SUBS	R7, R7, #1
BNE	L_change_value214
NOP
NOP
NOP
;emrtc.c,456 :: 		if(get_GPIOA_pin_state(esc_button_pin) == low)
MOVW	R4, #lo_addr(GPIOA_IDR+0)
MOVT	R4, #hi_addr(GPIOA_IDR+0)
LDR	R4, [R4, #0]
AND	R4, R4, #8
CMP	R4, #0
IT	NE
BNE	L_change_value216
;emrtc.c,458 :: 		while(get_GPIOA_pin_state(esc_button_pin) == low);
L_change_value217:
MOVW	R4, #lo_addr(GPIOA_IDR+0)
MOVT	R4, #hi_addr(GPIOA_IDR+0)
LDR	R4, [R4, #0]
AND	R4, R4, #8
CMP	R4, #0
IT	NE
BNE	L_change_value218
IT	AL
BAL	L_change_value217
L_change_value218:
;emrtc.c,459 :: 		delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_change_value219:
SUBS	R7, R7, #1
BNE	L_change_value219
NOP
NOP
NOP
;emrtc.c,460 :: 		return value;
LDRSH	R0, [SP, #20]
IT	AL
BAL	L_end_change_value
;emrtc.c,461 :: 		}
L_change_value216:
;emrtc.c,462 :: 		};
IT	AL
BAL	L_change_value198
;emrtc.c,463 :: 		}
L_end_change_value:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _change_value
_settings:
;emrtc.c,466 :: 		void settings()
SUB	SP, SP, #24
STR	LR, [SP, #0]
;emrtc.c,468 :: 		if(get_GPIOA_pin_state(set_button_pin) == low)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	NE
BNE	L_settings221
;emrtc.c,470 :: 		while(get_GPIOA_pin_state(set_button_pin) == low);
L_settings222:
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	NE
BNE	L_settings223
IT	AL
BAL	L_settings222
L_settings223:
;emrtc.c,471 :: 		NVIC_IntDisable(IVT_INT_RTC);
MOVW	R0, #19
BL	_NVIC_IntDisable+0
;emrtc.c,472 :: 		update_time = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_update_time+0)
MOVT	R0, #hi_addr(_update_time+0)
STR	R1, [R0, #0]
;emrtc.c,474 :: 		cal_hour = change_value(5, 1, cal_hour, 0, 23, 0);
MOVS	R2, #0
MOVS	R1, #23
SXTH	R1, R1
MOVW	R0, #lo_addr(_cal_hour+0)
MOVT	R0, #hi_addr(_cal_hour+0)
STR	R0, [SP, #20]
LDRB	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
SXTH	R3, R3
SXTH	R2, R0
MOVS	R1, #1
MOVS	R0, #5
BL	_change_value+0
ADD	SP, SP, #8
MOVW	R1, #lo_addr(_cal_hour+0)
MOVT	R1, #hi_addr(_cal_hour+0)
STRB	R0, [R1, #0]
;emrtc.c,475 :: 		cal_minute = change_value(8, 1, cal_minute, 0, 59, 0);
MOVS	R2, #0
MOVS	R1, #59
SXTH	R1, R1
MOVW	R0, #lo_addr(_cal_minute+0)
MOVT	R0, #hi_addr(_cal_minute+0)
STR	R0, [SP, #16]
LDRB	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
SXTH	R3, R3
SXTH	R2, R0
MOVS	R1, #1
MOVS	R0, #8
BL	_change_value+0
ADD	SP, SP, #8
MOVW	R1, #lo_addr(_cal_minute+0)
MOVT	R1, #hi_addr(_cal_minute+0)
STRB	R0, [R1, #0]
;emrtc.c,476 :: 		cal_second = change_value(11, 1, cal_second, 0, 59, 0);
MOVS	R2, #0
MOVS	R1, #59
SXTH	R1, R1
MOVW	R0, #lo_addr(_cal_second+0)
MOVT	R0, #hi_addr(_cal_second+0)
STR	R0, [SP, #12]
LDRB	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #0
SXTH	R3, R3
SXTH	R2, R0
MOVS	R1, #1
MOVS	R0, #11
BL	_change_value+0
ADD	SP, SP, #8
MOVW	R1, #lo_addr(_cal_second+0)
MOVT	R1, #hi_addr(_cal_second+0)
STRB	R0, [R1, #0]
;emrtc.c,477 :: 		cal_date = change_value(4, 2, cal_date, 1, 31, 0);
MOVS	R2, #0
MOVS	R1, #31
SXTH	R1, R1
MOVW	R0, #lo_addr(_cal_date+0)
MOVT	R0, #hi_addr(_cal_date+0)
STR	R0, [SP, #8]
LDRB	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #1
SXTH	R3, R3
SXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #4
BL	_change_value+0
ADD	SP, SP, #8
MOVW	R1, #lo_addr(_cal_date+0)
MOVT	R1, #hi_addr(_cal_date+0)
STRB	R0, [R1, #0]
;emrtc.c,478 :: 		cal_month = change_value(7, 2, cal_month, 1, 12, 0);
MOVS	R2, #0
MOVS	R1, #12
SXTH	R1, R1
MOVW	R0, #lo_addr(_cal_month+0)
MOVT	R0, #hi_addr(_cal_month+0)
STR	R0, [SP, #4]
LDRB	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVS	R3, #1
SXTH	R3, R3
SXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #7
BL	_change_value+0
ADD	SP, SP, #8
MOVW	R1, #lo_addr(_cal_month+0)
MOVT	R1, #hi_addr(_cal_month+0)
STRB	R0, [R1, #0]
;emrtc.c,479 :: 		cal_year = change_value(10, 2, cal_year, 1970, 2099, 1);
MOVS	R2, #1
MOVW	R1, #2099
SXTH	R1, R1
MOVW	R0, #lo_addr(_cal_year+0)
MOVT	R0, #hi_addr(_cal_year+0)
LDRH	R0, [R0, #0]
PUSH	(R2)
PUSH	(R1)
MOVW	R3, #1970
SXTH	R3, R3
SXTH	R2, R0
MOVS	R1, #2
MOVS	R0, #10
BL	_change_value+0
ADD	SP, SP, #8
MOVW	R1, #lo_addr(_cal_year+0)
MOVT	R1, #hi_addr(_cal_year+0)
STRH	R0, [R1, #0]
;emrtc.c,481 :: 		set_RTC(cal_year, cal_month, cal_date, cal_hour, cal_minute, cal_second);
LDR	R1, [SP, #12]
LDRB	R5, [R1, #0]
LDR	R1, [SP, #16]
LDRB	R4, [R1, #0]
LDR	R1, [SP, #20]
LDRB	R3, [R1, #0]
LDR	R1, [SP, #8]
LDRB	R2, [R1, #0]
LDR	R1, [SP, #4]
LDRB	R1, [R1, #0]
PUSH	(R5)
PUSH	(R4)
BL	_set_RTC+0
ADD	SP, SP, #8
;emrtc.c,482 :: 		NVIC_IntEnable(IVT_INT_RTC);
MOVW	R0, #19
BL	_NVIC_IntEnable+0
;emrtc.c,483 :: 		}
L_settings221:
;emrtc.c,484 :: 		}
L_end_settings:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _settings
