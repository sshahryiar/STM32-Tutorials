void setup();
void bit_set(unsigned long *reg, unsigned char bit_value);
void bit_clear(unsigned long *reg, unsigned char bit_value);
unsigned long get_bits(unsigned long *reg, unsigned long mask);


void main()
{
     unsigned int dly = 600;

     setup();                              //set registers and chip peripherals

     while(1)
     {
           if(get_bits(&GPIOA_IDR, 0x00000001))            //Button not pressed
           {
               dly = 200;
           }
           else                                                //Button pressed
           {
               dly = 600;
           }

           bit_set(&GPIOB_ODR, 15);               //Write 1 on bit 15 for GPIOB
           Vdelay_ms(dly);                        //Wait for some time
           bit_clear(&GPIOB_ODR, 15);             //Write 0 on bit 15 for GPIOB
           Vdelay_ms(dly);                        //Wait for some time
     };

}


void setup()
{
     //Enable clock only for the required peripherals

     RCC_APB2ENR = 0x0000000C;

     // All IO Control Registers are set to reset state
     // to make them floating inputs

     GPIOA_CRL = 0x44444444;
     GPIOA_CRH = 0x44444444;
     GPIOB_CRL = 0x44444444;
     GPIOB_CRH = 0x44444444;
     GPIOC_CRL = 0x44444444;
     GPIOC_CRH = 0x44444444;
     GPIOD_CRL = 0x44444444;
     GPIOD_CRH = 0x44444444;

     //Just clear the bits needed to be changed

     GPIOA_CRL &= 0xFFFFFFF0;
     GPIOB_CRH &= 0x0FFFFFFF;
     
     //Set PA0 as a pull-up input and PB15 as a push-pull output

     GPIOA_CRL |= 0x00000008;
     GPIOB_CRH |= 0x10000000;

     GPIOA_ODR |= 0x00000001;
}


void bit_set(unsigned long *reg, unsigned char bit_value)
{
    *reg |= (1 << bit_value);
}


void bit_clear(unsigned long *reg, unsigned char bit_value)
{
     *reg &= (~(1 << bit_value));
}


unsigned long get_bits(unsigned long *reg, unsigned long mask)
{
     return (*reg & mask);
}