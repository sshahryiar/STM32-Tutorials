#line 1 "C:/Users/Shawon/Desktop/ARM Media/IWDG Example/IWDG_Demo.c"


void setup();
void setup_GPIO();
void setup_IWDG();


void main()
{
 setup();

 while(1)
 {
 if(GPIOA_IDRbits.IDR9 == 0)
 {
 GPIOC_BRRbits.BR9 = 1;
 delay_ms(90);
 GPIOC_BSRRbits.BS9 = 1;
 delay_ms(90);
 IWDG_KR = 0xAAAA;
 }
 };
}


void setup()
{
 setup_GPIO();
 setup_IWDG();
 while(GPIOA_IDRbits.IDR9 == 1);
}


void setup_GPIO()
{
 GPIO_Clk_Enable(&GPIOA_BASE);
 GPIO_Clk_Enable(&GPIOC_BASE);
 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_9, (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));
 GPIO_Config(&GPIOC_BASE, _GPIO_PINMASK_9, (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_2MHZ));
 GPIOC_BSRRbits.BS9 = 0;
}


void setup_IWDG()
{
 IWDG_KR = 0x5555;
 IWDG_PR = 0x06;
 IWDG_RLR = 0xB4;
 IWDG_KR = 0xAAAA;
 IWDG_KR = 0xCCCC;
}
