#include "DAC.h"
#include "GPIO.h"
#include "AFIO.h"
#include "Ex_Int.h"


void setup();
void GPIO_setup();
void AFIO_setup();
void DAC_setup();


void ext_int() 
iv IVT_INT_EXTI9_5 
ics ICS_AUTO
{
    if(read_pending_reg(9) != 0)
    {
        pending_clr(9);
        bit_clr(GPIOA_ODR, 6);
        delay_ms(200);
        bit_set(GPIOA_ODR, 6);
    }
}


void main()
{
     signed int value = 0;
     
     setup();

     while(1)
     {
         if(get_input(GPIOF_IDR, 13) == 0)
         {
             delay_ms(10);
             value++;
         }

         if(get_input(GPIOF_IDR, 14) == 0)
         {
             delay_ms(10);
             value--;
         }

         if(value > 2047)
         {
             value = 2047;
         }
         if(value < 0)
         {
            value = 0;
         }
         set_DAC1_software_trigger(enable);
         DAC_DHR12RD = (((unsigned int)value) | 0x00FF0000);
     };
}


void setup()
{
    GPIO_setup();
    AFIO_setup();
    DAC_setup();
}


void GPIO_setup()
{
    enable_GPIOA(true);
    pin_configure_low(GPIOA_CRL, 4, analog_input);
    pin_configure_low(GPIOA_CRL, 5, analog_input);
    pin_configure_low(GPIOA_CRL, 6, (output_mode_low_speed | GPIO_PP_output));
    
    enable_GPIOF(true);
    pin_configure_high(GPIOF_CRH, 13, digital_input);
    pin_configure_high(GPIOF_CRH, 14, digital_input);
    pull_up_enable(GPIOF_ODR, 13);
    pull_up_enable(GPIOF_ODR, 14);
    
}


void AFIO_setup()
{
    AFIO_enable(true);
    pin_configure_high(GPIOA_CRH, 9, digital_input);
    pull_up_enable(GPIOA_ODR, 9);
    bit_set(GPIOA_ODR, 6);
    set_EXTI8_11(9, PA_pin);
    falling_edge_selector(9);
    interrupt_mask(9);
    NVIC_IntEnable(IVT_INT_EXTI9_5);
    EnableInterrupts();
}


void DAC_setup()
{
    enable_DAC(true);
    DAC_reset();

    set_DAC1_buffer(enable);
    enable_DAC1_trigger(true);
    select_DAC1_trigger_source(Software_trigger);
    select_DAC1_wave_type(triangle_wave_generation_enabled);
    set_DAC1_triangle_waveform_amplitude(Triangle_Amplitude_equal_to_511);
    enable_DAC1_channel(true);

    set_DAC2_buffer(enable);
    enable_DAC2_trigger(true);
    select_DAC2_trigger_source(EXTI9_event);
    select_DAC2_wave_type(noise_wave_generation_enabled);
    set_DAC2_LFSR_mask(0x3AA);
    enable_DAC2_channel(true);

    DAC_DHR12RD = 0x00FF0000;
}