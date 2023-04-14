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


register unsigned int regular_adc_data = 0x0000;
register unsigned int injected_adc_data = 0x0000;


void setup();
void GPIO_init();
void ADC_init();
void exeternal_interrupt_init();
void lcd_print(unsigned char x_pos, unsigned char y_pos, unsigned int value);


void ADC1_2_ISR() 
iv IVT_INT_ADC1_2 
ics ICS_AUTO 
{
    if(ADC1_SRbits.EOC)
    {
        ADC1_SRbits.EOC = 0;
        regular_adc_data = (ADC1_DR & 0x0FFF);
    }
    if(ADC1_SRbits.JEOC)
    {
        ADC1_SRbits.JEOC = 0;
        injected_adc_data = (ADC1_JDR1 & 0x0FFF);
    }
}


void void EXTI11_ISR()
iv IVT_INT_EXTI15_10
ics ICS_AUTO
{
    unsigned char s = 0;
    
    if(read_pending_reg(15) != 0)
    {
        for(s = 0; s < 3; s++)
        {
            GPIOC_pin_high(13);
            delay_ms(10);
            GPIOC_pin_low(13);
            delay_ms(10);
        }
        pending_clr(15);
    }
    
    if(read_pending_reg(11) != 0)
    {
        for(s = 0; s < 6; s++)
        {
            GPIOC_pin_high(13);
            delay_ms(90);
            GPIOC_pin_low(13);
            delay_ms(90);
        }
        pending_clr(11);
    }
}


void main()
{
    setup();

    while(1)
    {
        lcd_print(2, 2, regular_adc_data);
        lcd_print(12, 2, injected_adc_data);
    };
}


void setup()
{
    GPIO_init();
    ADC_init();
    exeternal_interrupt_init();
    LCD_Init();

    LCD_Cmd(_LCD_CLEAR);
    LCD_Cmd(_LCD_CURSOR_OFF);

    lcd_out(1, 1, "CH00 R");
    lcd_out(1, 11, "CH01 I");
}


void GPIO_init()
{
     enable_GPIOA(enable);
     enable_GPIOB(enable);
     enable_GPIOC(enable);
     
     setup_GPIOA(0, analog_input);
     setup_GPIOA(1, analog_input);
     setup_GPIOB(11, digital_input);
     enable_pull_up_GPIOB(11);
     setup_GPIOC(13, (GPIO_PP_output | output_mode_low_speed));
     setup_GPIOC(15, digital_input);
     enable_pull_up_GPIOC(15);
}


void ADC_init()
{
     ADC1_Enable();
     clr_ADC1_settings();
     set_ADC_mode(independent_mode);
     set_ADC1_data_alignment(right_alignment);
     set_ADC1_scan_conversion_mode(disable);
     set_ADC1_continuous_conversion_mode(disable);
     set_ADC1_sample_time(sample_time_239_5_cycles, 0);
     set_ADC1_sample_time(sample_time_239_5_cycles, 1);
     
     set_ADC1_injected_sequence(4, 1);
     set_ADC1_injected_number_of_conversions(1);
     set_ADC1_external_trigger_injected_conversion_edge(EXTI_15_trigger);
     set_ADC1_injected_end_of_conversion_interrupt(enable);
     
     set_ADC1_regular_sequence(1, 1);
     set_ADC1_regular_number_of_conversions(1);
     set_ADC1_external_trigger_regular_conversion_edge(EXTI_11_trigger);
     set_ADC1_regular_end_of_conversion_interrupt(enable);
     
     NVIC_IntEnable(IVT_INT_ADC1_2);
     EnableInterrupts();
     ADC1_calibrate();
     start_ADC1();
}


void exeternal_interrupt_init()
{
     AFIO_enable(enable);
     falling_edge_selector(11);
     falling_edge_selector(15);
     set_EXTI8_11(11, PB_pin);
     set_EXTI12_15(15, PC_pin);
     interrupt_mask(11);
     interrupt_mask(15);
     NVIC_IntEnable(IVT_INT_EXTI15_10);
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