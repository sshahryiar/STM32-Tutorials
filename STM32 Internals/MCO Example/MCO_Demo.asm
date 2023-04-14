_main:
;MCO_Demo.c,1 :: 		void main()
;MCO_Demo.c,3 :: 		GPIO_Clk_Enable(&GPIOA_BASE);           //Enable clock for  GPIOA
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Clk_Enable+0
;MCO_Demo.c,4 :: 		GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_8, (_GPIO_CFG_MODE_ALT_FUNCTION | _GPIO_CFG_SPEED_50MHZ | _GPIO_CFG_OTYPE_PP));  //Set PA8 as a high speed digital output
MOVW	R2, #2072
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Config+0
;MCO_Demo.c,5 :: 		while(1)
L_main0:
;MCO_Demo.c,8 :: 		};
IT	AL
BAL	L_main0
;MCO_Demo.c,9 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
