#line 1 "C:/Users/Shawon/Desktop/ARM Media/WWDG Example/WWDG_Demo.c"


void setup();
void setup_GPIO();
void setup_WWDG();


void WWDG_ISR()
iv IVT_INT_WWDG ics ICS_AUTO
{
 unsigned char cnt = 0;
 unsigned char wdt = 0;

 wdt = (WWDG_CFR & 0x7F);
 cnt = (WWDG_CR & 0x7F);

 if(cnt < wdt)
 {
 WWDG_CR |= 0x7F;
 WWDG_SR = 0x00;
 GPIOC_ODRbits.ODR9 ^= 1;
 }
}


void main()
{
 setup();

 while(1)
 {
 GPIOC_ODRbits.ODR12 ^= 1;
 delay_ms(300);
 if(GPIOA_IDRbits.IDR9 == 0)
 {
 WWDG_CR = 0x80;
 while(1);
 }
 };
}


void setup()
{
 setup_GPIO();
 setup_WWDG();
}


void setup_GPIO()
{
 GPIO_Clk_Enable(&GPIOA_BASE);
 GPIO_Clk_Enable(&GPIOC_BASE);
 GPIO_Config(&GPIOA_BASE, _GPIO_PINMASK_9, (_GPIO_CFG_MODE_INPUT | _GPIO_CFG_PULL_UP));
 GPIO_Config(&GPIOC_BASE, (_GPIO_PINMASK_9 | _GPIO_PINMASK_12), (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_OTYPE_PP | _GPIO_CFG_SPEED_2MHZ));
 GPIOC_ODRbits.ODR9 = 0;
 GPIOC_ODRbits.ODR12 = 1;
 delay_ms(1000);
}


void setup_WWDG()
{
 RCC_APB1ENRbits.WWDGEN = 1;
 WWDG_CFR = 0x3DF;
 WWDG_SR = 0x00;
 WWDG_CR = 0xFF;
 NVIC_IntEnable(IVT_INT_WWDG);
 EnableInterrupts();
}
