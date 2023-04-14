#line 1 "C:/Users/Shawon/Desktop/GPIO Code Examples/GPIO with Individual Bits/GPIO.c"
void setup();


void main()
{
 unsigned int dly = 600;

 setup();

 while(1)
 {
 if(GPIOA_IDRbits.IDR0)
 {
 dly = 200;
 }
 else
 {
 dly = 600;
 }

 GPIOB_BSRRbits.BS15 = 1;
 Vdelay_ms(dly);
 GPIOB_BRRbits.BR15 = 1;
 Vdelay_ms(dly);
 };

}


void setup()
{


 RCC_APB2ENRbits.IOPAEN = 1;
 RCC_APB2ENRbits.IOPBEN = 1;




 GPIOA_CRL = 0x44444444;
 GPIOA_CRH = 0x44444444;
 GPIOB_CRL = 0x44444444;
 GPIOB_CRH = 0x44444444;
 GPIOC_CRL = 0x44444444;
 GPIOC_CRH = 0x44444444;
 GPIOD_CRL = 0x44444444;
 GPIOD_CRH = 0x44444444;



 GPIOA_CRLbits.MODE0 = 0x0;
 GPIOA_CRLbits.CNF0 = 0x2;
 GPIOA_ODRbits.ODR0 = 0x1;



 GPIOB_CRHbits.MODE15 = 0x2;
 GPIOB_CRHbits.CNF15 = 0x0;
}
