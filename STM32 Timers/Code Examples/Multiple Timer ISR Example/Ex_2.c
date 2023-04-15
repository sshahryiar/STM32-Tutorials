#include "TIM_common.h"
#include "TIM3.h"
#include "TIM8.h"
#include "GPIO.h"


void setup();
void GPIO_init();
void Timer3_init();
void Timer8_init();


void TIM3_ISR()
iv IVT_INT_TIM3
ics ICS_AUTO
{
    TIM3_SR = 0;
    GPIOC_pin_toggle(6);
}


void TIM8_ISR()
iv IVT_INT_TIM8_UP
ics ICS_AUTO
{
    TIM8_SR = 0;
    GPIOC_pin_toggle(7);
}


void main()
{
     setup();

     while(1)
     {
     };
}


void setup()
{
     GPIO_init();
     Timer3_init();
     Timer8_init();
}


void GPIO_init()
{
     enable_GPIOC(true);
     setup_GPIOC(6, (GPIO_PP_output | output_mode_medium_speed));
     setup_GPIOC(7, (GPIO_PP_output | output_mode_medium_speed));
}


void Timer3_init()
{
     enable_TIM3(true);
     enable_TIM3_counter(false);
     TIM3_PSC = 575;
     TIM3_ARR = 62499;
     set_TIM3_counting_direction(down_counting);
     NVIC_IntEnable(IVT_INT_TIM3);
     EnableInterrupts();
     enable_TIM3_update_interrupt(true);
     enable_TIM3_counter(true);
}


void Timer8_init()
{
     enable_TIM8(true);
     enable_TIM8_counter(false);
     TIM8_PSC = 575;
     TIM8_ARR = 62499;
     set_TIM8_counting_direction(up_counting);
     NVIC_IntEnable(IVT_INT_TIM8_UP);
     EnableInterrupts();
     enable_TIM8_update_interrupt(true);
     enable_TIM8_counter(true);
}