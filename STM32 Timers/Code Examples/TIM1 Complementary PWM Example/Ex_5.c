#include "TIM_common.h"
#include "TIM1.h"
#include "GPIO.h"
#include "AFIO.h"


void setup();
void setup_IO();
void setup_TIM1();


void main() 
{
     unsigned int duty = 0;

     setup();

     while(1)
     {
        while(duty < 1600)
        {
            TIM1_CCR1 = duty;
            duty++;
            delay_ms(1);
        }
        while(duty > 0)
        {
            TIM1_CCR1 = duty;
            duty--;
            delay_ms(1);
        }

     };
}


void setup()
{
     setup_IO();
     setup_TIM1();
}


void setup_IO()
{
     AFIO_enable(true);
     AFIO_remap(TIM1_not_remapped);

     enable_GPIOA(true);
     setup_GPIOA(8, (AFIO_PP_output | output_mode_high_speed));
     
     enable_GPIOB(true);
     setup_GPIOB(13, (AFIO_PP_output | output_mode_high_speed));
}


void setup_TIM1()
{
     enable_TIM1(true);
     enable_TIM1_counter(false);
     set_TIM1_counting_direction(up_counting);
     TIM1_ARR = 1599;
     TIM1_PSC = 0;
     set_TIM1_OC1_compare_mode(PWM_mode_1);
     set_TIM1_CC1_state_and_polarity(enable, active_low);
     set_TIM1_CC1_complementary_output_state_and_polarity(enable, active_low);
     set_TIM1_off_state_selection_for_run_mode(enable);
     set_TIM1_dead_time(77);
     enable_TIM1_main_output(true);
     set_TIM1_CC_preload_control(true);
     set_TIM1_auto_reload_preload_mode(true);
     enable_TIM1_counter(true);
}