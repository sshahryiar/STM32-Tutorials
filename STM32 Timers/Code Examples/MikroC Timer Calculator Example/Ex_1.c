void setup();
void GPIO_init();
void Timer6_init();


void TIM6_ISR()
iv IVT_INT_TIM6
ics ICS_AUTO
{
    TIM6_SR.UIF = 0;
    GPIOC_ODRbits.ODR7 ^= 1;
}


void main()
{
     setup();

     while(1)
     {
         GPIOC_ODRbits.ODR6 ^= 1;
         delay_ms(500);
     };
}


void setup()
{
     GPIO_init();
     Timer6_init();
}


void GPIO_init()
{
     GPIO_Clk_Enable(&GPIOC_BASE);
     GPIO_Config(&GPIOC_BASE,
            (_GPIO_PINMASK_6 | _GPIO_PINMASK_7),
            (_GPIO_CFG_MODE_OUTPUT | _GPIO_CFG_SPEED_MAX | _GPIO_CFG_OTYPE_PP));
    GPIOC_ODRbits.ODR6 = 0;
    GPIOC_ODRbits.ODR7 = 0;
}


void Timer6_init()
{
     RCC_APB1ENR.TIM6EN = 1;
     TIM6_CR1.CEN = 0;
     TIM6_PSC = 575;
     TIM6_ARR = 62499;
     NVIC_IntEnable(IVT_INT_TIM6);
     EnableInterrupts();
     TIM6_DIER.UIE = 1;
     TIM6_CR1.CEN = 1;
}