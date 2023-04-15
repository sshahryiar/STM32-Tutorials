#include "TIM_common.h"
#include "TIM1.h"
#include "TIM8.h"
#include "GPIO.h"
#include "AFIO.h"


void setup();
void setup_IO();
void setup_TIM1();
void setup_TIM8();


void main() 
{
     unsigned int duty = 0;
     
     setup();
     
     while(1)
     {
        while(duty < 1600)
        {
            TIM1_CCR1 = duty;
            TIM1_CCR2 = duty;
            TIM1_CCR3 = duty;
            TIM1_CCR4 = duty;
            TIM8_CCR1 = duty;
            TIM8_CCR2 = duty;
            TIM8_CCR3 = duty;
            TIM8_CCR4 = duty;
            duty++;
            delay_ms(4);
        }
        while(duty > 0)
        {
            TIM1_CCR1 = duty;
            TIM1_CCR2 = duty;
            TIM1_CCR3 = duty;
            TIM1_CCR4 = duty;
            TIM8_CCR1 = duty;
            TIM8_CCR2 = duty;
            TIM8_CCR3 = duty;
            TIM8_CCR4 = duty;
            duty--;
            delay_ms(4);
        }
        
     };
}


void setup()
{
     setup_IO();
     setup_TIM1();
     setup_TIM8();
}


void setup_IO()
{
     AFIO_enable(true);
     AFIO_remap(TIM1_not_remapped);

     enable_GPIOA(true);
     setup_GPIOA(8, (AFIO_PP_output | output_mode_high_speed));
     setup_GPIOA(9, (AFIO_PP_output | output_mode_high_speed));
     setup_GPIOA(10, (AFIO_PP_output | output_mode_high_speed));
     setup_GPIOA(11, (AFIO_PP_output | output_mode_high_speed));
     
     enable_GPIOC(true);
     setup_GPIOC(6, (AFIO_PP_output | output_mode_high_speed));
     setup_GPIOC(7, (AFIO_PP_output | output_mode_high_speed));
     setup_GPIOC(8, (AFIO_PP_output | output_mode_high_speed));
     setup_GPIOC(9, (AFIO_PP_output | output_mode_high_speed));
}


void setup_TIM1()
{
     enable_TIM1(true);
     enable_TIM1_counter(false);
     set_TIM1_counting_direction(up_counting);
     TIM1_ARR = 1599;
     TIM1_PSC = 0;
     set_TIM1_OC1_compare_mode(PWM_mode_1);
     set_TIM1_OC2_compare_mode(PWM_mode_1);
     set_TIM1_OC3_compare_mode(PWM_mode_2);
     set_TIM1_OC4_compare_mode(PWM_mode_2);
     set_TIM1_CC1_state_and_polarity(enable, active_high);
     set_TIM1_CC2_state_and_polarity(enable, active_high);
     set_TIM1_CC3_state_and_polarity(enable, active_high);
     set_TIM1_CC4_state_and_polarity(enable, active_high);
     enable_TIM1_main_output(true);
     set_TIM1_CC_preload_control(true);
     set_TIM1_auto_reload_preload_mode(true);
     enable_TIM1_counter(true);
}


void setup_TIM8()
{
     enable_TIM8(true);
     enable_TIM8_counter(false);
     set_TIM8_counting_direction(down_counting);
     TIM8_ARR = 1599;
     TIM8_PSC = 0;
     set_TIM8_OC1_compare_mode(PWM_mode_1);
     set_TIM8_OC2_compare_mode(PWM_mode_1);
     set_TIM8_OC3_compare_mode(PWM_mode_2);
     set_TIM8_OC4_compare_mode(PWM_mode_2);
     set_TIM8_CC1_state_and_polarity(enable, active_low);
     set_TIM8_CC2_state_and_polarity(enable, active_low);
     set_TIM8_CC3_state_and_polarity(enable, active_low);
     set_TIM8_CC4_state_and_polarity(enable, active_low);
     enable_TIM8_main_output(true);
     set_TIM8_CC_preload_control(true);
     set_TIM8_auto_reload_preload_mode(true);
     enable_TIM8_counter(true);
}