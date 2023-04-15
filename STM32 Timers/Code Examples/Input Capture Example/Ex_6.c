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


unsigned int overflow_count = 0;
unsigned long pulse_ticks = 0;
unsigned long start_time = 0;
unsigned long end_time = 0;
float f = 0.0;


void setup();
void setup_IO();
void setup_TIM2();
void setup_TIM3();


void TIM2_ISR() 
iv IVT_INT_TIM2 
ics ICS_AUTO 
{
    if(TIM2_SRbits.UIF == 1)
    {
        TIM2_SRbits.UIF = 0;
        overflow_count++;
    }
    
    if(TIM2_SRbits.CC1IF == 1)
    {
        TIM2_SRbits.CC1IF = 0;
        end_time = TIM2_CCR1;
        pulse_ticks = ((overflow_count << 16) - start_time + end_time);
        start_time = end_time;
        overflow_count = 0;
    }
}


void main() 
{
     char txt[15];
     
     setup();
     
     while(1)
     {
             f = (float)pulse_ticks;
             f = (1000000 / f);
             lcd_out(2, 1, "               ");
             FloatToStr(f, txt);
             lcd_out(2, 1, txt);
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
     Lcd_Out(1, 1, "Frequency/Hz:");
}


void setup_IO()
{
     AFIO_enable(true);
     AFIO_remap(TIM2_not_remapped);
     AFIO_remap(TIM3_not_remapped);
     
     enable_GPIOA(true);
     setup_GPIOA(0, digital_input);
     enable_pull_down_GPIOA(0);
     setup_GPIOA(6, (AFIO_PP_output | output_mode_high_speed));
     
     enable_GPIOD(true);
     setup_GPIOD(8, (GPIO_PP_output | output_mode_low_speed));
     setup_GPIOD(9, (GPIO_PP_output | output_mode_low_speed));
     setup_GPIOD(10, (GPIO_PP_output | output_mode_low_speed));
     setup_GPIOD(11, (GPIO_PP_output | output_mode_low_speed));
     setup_GPIOD(12, (GPIO_PP_output | output_mode_low_speed));
     setup_GPIOD(13, (GPIO_PP_output | output_mode_low_speed));
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
     set_TIM2_CC1_state_and_polarity(enable, rising_edge);
     set_TIM2_IC1_input_prescalar(0);
     set_TIM2_IC1_filter(0);
     enable_TIM2_CC1_interrupt(true);
     enable_TIM2_update_interrupt(true);
     NVIC_IntEnable(IVT_INT_TIM2);
     EnableInterrupts();
     enable_TIM2_counter(true);
}


void setup_TIM3()
{
     enable_TIM3(true);
     enable_TIM3_counter(false);
     set_TIM3_counting_direction(up_counting);
     TIM3_ARR = 799;
     TIM3_PSC = 0;
     set_TIM3_OC1_compare_mode(PWM_mode_1);
     set_TIM3_CC1_state_and_polarity(enable, active_low);
     enable_TIM3_counter(true);
     TIM3_CCR1 = 400;
}