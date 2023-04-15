#include "TIM_common.h"
#include "TIM2.h"
#include "TIM3.h"
#include "AFIO.h"
#include "GPIO.h"


sbit LCD_RS at GPIOD_ODR.B8;
sbit LCD_EN at GPIOD_ODR.B9;
sbit LCD_D4 at GPIOD_ODR.B10;
sbit LCD_D5 at GPIOD_ODR.B11;
sbit LCD_D6 at GPIOD_ODR.B12;
sbit LCD_D7 at GPIOD_ODR.B13;


unsigned int second_rise = 0;
unsigned int start_time = 0;
unsigned int end_time = 0;
unsigned int d = 0;
unsigned int t = 0;


void setup();
void setup_IO();
void setup_TIM2();
void setup_TIM3();


void TIM2_ISR()
iv IVT_INT_TIM2
ics ICS_AUTO
{
    if(TIM2_SRbits.CC1IF == 1)
    {
        TIM2_SRbits.CC1IF = 0;
        start_time = TIM2_CCR1;

        if(start_time > second_rise)
        {
           t = (start_time - second_rise);
        }
        else
        {
           t = (0xFFFF - start_time + second_rise);
        }
    }
    if(TIM2_SRbits.CC2IF == 1)
    {
        TIM2_SRbits.CC2IF = 0;
        end_time = TIM2_CCR2;
        
        if(start_time < end_time)
        {
            d = (end_time - start_time);
        }
        else
        {
            d = (0xFFFF - end_time + start_time);
        }
    }
    
    second_rise = start_time;
}


void main()
{
     unsigned char duty_cycle = 0;
     signed int pwm = 100;
     
     char txt[15];

     setup();

     while(1)
     {
             if(get_GPIOD_pin_state(14))
             {
                 pwm += 50;
             }
             
             if(pwm >= 3550)
             {
                pwm = 3550;
             }
             
             if(get_GPIOD_pin_state(15))
             {
                 pwm -= 50;
             }
             
             if(pwm <= 50)
             {
                pwm = 50;
             }
             
             TIM3_CCR1 = pwm;
             
             duty_cycle = (((float)d / (float)t) * 100);

             lcd_out(1, 7, "      ");
             WordToStr(t, txt);
             lcd_out(1, 7, txt);

             lcd_out(2, 7, "        ");
             WordToStr(d, txt);
             lcd_out(2, 7, txt);

             ByteToStr(duty_cycle, txt);
             lcd_out(2, 14, txt);
             
             delay_ms(600);
     };
}


void setup()
{
     setup_IO();

     setup_TIM2();
     setup_TIM3();

     Lcd_Init();
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Cmd(_LCD_CURSOR_OFF);
     lcd_out(1, 1, "P/us:");
     lcd_out(2, 1, "D/us:");
     lcd_out(1, 15, "D%");
}


void setup_IO()
{
     AFIO_enable(true);
     AFIO_remap(TIM2_not_remapped);

     enable_GPIOA(true);
     setup_GPIOA(0, digital_input);
     enable_pull_down_GPIOA(0);
     setup_GPIOA(1, digital_input);
     enable_pull_down_GPIOA(1);
     setup_GPIOA(6, (AFIO_PP_output | output_mode_high_speed));

     enable_GPIOD(true);
     setup_GPIOD(8, (GPIO_PP_output | output_mode_low_speed));
     setup_GPIOD(9, (GPIO_PP_output | output_mode_low_speed));
     setup_GPIOD(10, (GPIO_PP_output | output_mode_low_speed));
     setup_GPIOD(11, (GPIO_PP_output | output_mode_low_speed));
     setup_GPIOD(12, (GPIO_PP_output | output_mode_low_speed));
     setup_GPIOD(13, (GPIO_PP_output | output_mode_low_speed));
     
     setup_GPIOD(14, input_without_pull_resistors);
     setup_GPIOD(15, input_without_pull_resistors);
}


void setup_TIM2()
{
     enable_TIM2(true);
     enable_TIM2_counter(false);
     TIM2_ARR = 0xFFFF;
     TIM2_PSC = 71;
     set_TIM2_counting_direction(up_counting);
     set_TIM2_clock_division(clock_division_tCK_INT);
     set_TIM2_CC1_selection(CC1_input_IC1_on_TI1);
     set_TIM2_CC2_selection(CC2_input_IC2_on_TI1);
     set_TIM2_CC1_state_and_polarity(enable, rising_edge);
     set_TIM2_CC2_state_and_polarity(enable, falling_edge);
     set_TIM2_IC1_input_prescalar(0);
     set_TIM2_IC2_input_prescalar(0);
     set_TIM2_IC1_filter(0);
     set_TIM2_IC2_filter(0);
     enable_TIM2_CC1_interrupt(true);
     enable_TIM2_CC2_interrupt(true);
     NVIC_IntEnable(IVT_INT_TIM2);
     EnableInterrupts();
     enable_TIM2_counter(true);
}


void setup_TIM3()
{
     enable_TIM3(true);
     enable_TIM3_counter(false);
     set_TIM3_counting_direction(up_counting);
     TIM3_ARR = 3599;
     TIM3_PSC = 0;
     set_TIM3_OC1_compare_mode(PWM_mode_2);
     set_TIM3_CC1_state_and_polarity(enable, active_low);
     enable_TIM3_counter(true);
}