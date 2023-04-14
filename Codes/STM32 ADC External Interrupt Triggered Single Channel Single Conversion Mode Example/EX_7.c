#include "ADC.h"
#include "GPIO.h"
#include "AFIO.h"
#include "Ex_Int.h"


sbit LCD_RS at GPIOB_ODR.B1;
sbit LCD_EN at GPIOB_ODR.B2;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


register unsigned int adc_data = 0x0000;


void setup();
void GPIO_init();
void ADC_init();
void interrupts_init();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);
float map(float v, float x_min, float x_max, float y_min, float y_max);


void void EXTI11_ISR()
iv IVT_INT_EXTI15_10
ics ICS_AUTO
{
    if(read_pending_reg(11) != 0)
    {
        GPIOC_pin_high(13);
        delay_ms(10);
        GPIOC_pin_low(13);
        pending_clr(11);
    }
}


void void ADC1_ISR()
iv IVT_INT_ADC1_2
ics ICS_AUTO
{
    adc_data = (ADC1_DR & 0x0FFF);
}


void main()
{
    float v = 0;

    setup();

    while(1)
    {
        v = map(adc_data, 0, 4095, 0, 3300);
        lcd_print(13, 1, adc_data);
        lcd_print(13, 2, v);
    };
}


void setup()
{
    GPIO_init();
    ADC_init();
    LCD_Init();
    interrupts_init();

    LCD_Cmd(_LCD_CLEAR);
    LCD_Cmd(_LCD_CURSOR_OFF);

    lcd_out(1, 1, "CH01:");
    lcd_out(2, 1, "V/mV:");
}


void GPIO_init()
{
     enable_GPIOA(enable);
     enable_GPIOB(enable);
     enable_GPIOC(enable);

     setup_GPIOA(1, analog_input);
     setup_GPIOB(11, digital_input);
     enable_pull_up_GPIOB(11);
     setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
}


void ADC_init()
{
     ADC1_Enable();
     clr_ADC1_settings();
     set_ADC_mode(independent_mode);
     set_ADC1_data_alignment(right_alignment);
     set_ADC1_scan_conversion_mode(disable);
     set_ADC1_continuous_conversion_mode(disable);
     set_ADC1_sample_time(sample_time_71_5_cycles, 1);
     set_ADC1_external_trigger_regular_conversion_edge(EXTI_11_trigger);
     set_ADC1_regular_number_of_conversions(1);
     set_ADC1_regular_sequence(1, 1);
     set_ADC1_regular_end_of_conversion_interrupt(enable);
     ADC1_calibrate();
     start_ADC1();
}


void interrupts_init()
{
     AFIO_enable(enable);
     falling_edge_selector(11);
     set_EXTI8_11(11, PB_pin);
     interrupt_mask(11);
     NVIC_IntEnable(IVT_INT_EXTI15_10);
     NVIC_IntEnable(IVT_INT_ADC1_2);
     EnableInterrupts();
}


void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value)
{
     unsigned char tmp = 0;

     tmp = (value / 1000);
     lcd_chr(y_pos, x_pos, (tmp + 48));
     tmp = ((value / 100) % 10);
     lcd_chr_cp((tmp + 48));
     tmp = ((value / 10) % 10);
     lcd_chr_cp((tmp + 48));
     tmp = (value % 10);
     lcd_chr_cp((tmp + 48));
}


float map(float v, float x_min, float x_max, float y_min, float y_max)
{
    return (y_min + (((y_max - y_min)/(x_max - x_min)) * (v - x_min)));
}