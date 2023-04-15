#include "DAC.h"
#include "GPIO.h"


void setup();
void DAC_setup();
void GPIO_setup();


void main()
{
     setup();

     while(1)
     {
         set_DAC2_software_trigger(enable);
         delay_us(10);
     };
}


void setup()
{
    GPIO_setup();
    DAC_setup();
}


void DAC_setup()
{
     enable_DAC(true);
     DAC_reset();
     set_DAC2_buffer(enable);
     enable_DAC2_trigger(enable);
     select_DAC2_trigger_source(Software_trigger);
     select_DAC2_wave_type(noise_wave_generation_enabled);
     set_DAC2_LFSR_mask(0x3FF);
     enable_DAC2_channel(true);
}


void GPIO_setup()
{
     enable_GPIOA(true);
     pin_configure_low(GPIOA_CRL, 5, analog_input);
}