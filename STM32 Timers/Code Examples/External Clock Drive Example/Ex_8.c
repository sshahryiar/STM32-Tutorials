#include "TIM_common.h"
#include "TIM2.h"
#include "AFIO.h"
#include "GPIO.h"


void setup();
void setup_IO();
void setup_TIM2();


void TIM2_ISR()
iv IVT_INT_TIM2
ics ICS_AUTO
{
    
    TIM2_SR = 0;
    GPIOC_pin_toggle(6);
}


void main()
{
     setup();
     
     while(1);
}


void setup()
{
     setup_IO();
     setup_TIM2();
}


void setup_IO()
{
     AFIO_enable(true);
     AFIO_remap(TIM2_not_remapped);

     enable_GPIOA(true);
     setup_GPIOA(0, input_without_pull_resistors);
     
     enable_GPIOC(true);
     setup_GPIOC(6, (GPIO_PP_output | output_mode_high_speed));
     GPIOC_pin_high(6);
}


void setup_TIM2()
{
     enable_TIM2(true);
     enable_TIM2_counter(false);
     TIM2_ARR = 0x0002;
     TIM2_PSC = 0x0000;
     set_TIM2_counting_direction(up_counting);
     set_TIM2_clock_division(clock_division_tCK_INT);
     set_TIM2_CC1_selection(CC1_input_IC1_on_TI1);
     set_TIM2_CC1_state_and_polarity(enable, rising_edge);
     set_TIM2_trigger_source(TI1_edge_detector);
     set_TIM2_slave_selection(external_clock_mode_1);
     enable_TIM2_update_interrupt(true);
     NVIC_IntEnable(IVT_INT_TIM2);
     EnableInterrupts();
     enable_TIM2_counter(true);
}