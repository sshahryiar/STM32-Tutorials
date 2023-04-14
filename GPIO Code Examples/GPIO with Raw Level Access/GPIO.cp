#line 1 "C:/Users/Shawon/Desktop/GPIO Code Examples/GPIO with Raw Level Access/GPIO.c"
void setup();
void bit_set(unsigned long *reg, unsigned char bit_value);
void bit_clear(unsigned long *reg, unsigned char bit_value);
unsigned long get_bits(unsigned long *reg, unsigned long mask);


void main()
{
 unsigned int dly = 600;

 setup();

 while(1)
 {
 if(get_bits(&GPIOA_IDR, 0x00000001))
 {
 dly = 200;
 }
 else
 {
 dly = 600;
 }

 bit_set(&GPIOB_ODR, 15);
 Vdelay_ms(dly);
 bit_clear(&GPIOB_ODR, 15);
 Vdelay_ms(dly);
 };

}


void setup()
{


 RCC_APB2ENR = 0x0000000C;




 GPIOA_CRL = 0x44444444;
 GPIOA_CRH = 0x44444444;
 GPIOB_CRL = 0x44444444;
 GPIOB_CRH = 0x44444444;
 GPIOC_CRL = 0x44444444;
 GPIOC_CRH = 0x44444444;
 GPIOD_CRL = 0x44444444;
 GPIOD_CRH = 0x44444444;



 GPIOA_CRL &= 0xFFFFFFF0;
 GPIOB_CRH &= 0x0FFFFFFF;



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
