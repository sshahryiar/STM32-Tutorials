#include "TIM_common.h"
#include "TIM2.h"
#include "AFIO.h"
#include "GPIO.h"


void setup();
void setup_IO();
void setup_TIM2();


void main()
{
     setup();

     while(1)
     {
     };
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
     setup_GPIOA(0, digital_input);
     enable_pull_down_GPIOA(0);
     setup_GPIOA(1, (AFIO_PP_output | output_mode_high_speed));
}


void setup_TIM2()
{
     enable_TIM2(true);
     enable_TIM2_counter(false);
     set_TIM2_counting_direction(up_counting);
     set_TIM2_clock_division(clock_division_tCK_INT);
     set_TIM2_CC1_selection(CC1_input_IC1_on_TI1);
     set_TIM2_CC1_state_and_polarity(enable, rising_edge);
     set_TIM2_CC2_selection(CC2_output);
     set_TIM2_CC2_state_and_polarity(enable, active_high);
     set_TIM2_OC2_compare_mode(PWM_mode_2);
     set_TIM2_trigger_source(Filtered_Timer_Input_1);
     set_TIM2_slave_selection(trigger_mode);
     TIM2_ARR = 60000;
     TIM2_PSC = 0x0000;
     TIM2_CCR2 = 20;
     enable_TIM2_counter(true);
}