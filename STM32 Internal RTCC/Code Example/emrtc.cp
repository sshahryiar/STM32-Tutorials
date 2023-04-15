#line 1 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Code Example/emrtc.c"
#line 1 "c:/users/shawon & nipa/desktop/arm media/code example/rtc.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/code example/gpio.h"
#line 1 "c:/users/shawon & nipa/desktop/arm media/code example/backup.h"
#line 13 "C:/Users/Shawon & Nipa/Desktop/ARM Media/Code Example/emrtc.c"
sbit LCD_RS at GPIOB_ODR.B10;
sbit LCD_EN at GPIOB_ODR.B11;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;


const unsigned char month_table[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

unsigned char cal_hour = 0;
unsigned char cal_date = 1;
unsigned char cal_month = 1;
unsigned char cal_minute = 0;
unsigned char cal_second = 0;

unsigned int cal_year = 1970;

bit update_time;


void setup_mcu();
void setup_GPIOs();
unsigned char RTC_init();
void get_RTC();
void set_RTC(unsigned int year, unsigned char month, unsigned char date, unsigned char hour, unsigned char minute, unsigned char second);
unsigned char check_for_leap_year(unsigned int year);
void show_value(unsigned char x_pos, unsigned char y_pos, unsigned char value);
void show_year(unsigned char x_pos, unsigned char y_pos, unsigned int value);
unsigned int change_value(unsigned char x_pos, unsigned char y_pos, signed int value, signed int value_min, signed int value_max, unsigned char value_type);
void settings();


void RTC_ISR()
iv IVT_INT_RTC
ics ICS_AUTO
{
 if( (RTC_CRL & (1 << 0))  ==  0x01 )
 {
 update_time = 1;
  RTC_CRL &= (~(1 << 0)) ;
 }

  RTC_CRL &= (~(1 << 2)) ;
 while( (RTC_CRL & (1 << 5))  ==  0x00 );
}


void main()
{
 setup_mcu();

 lcd_out(1, 7, ":  :");
 lcd_out(2, 6, "/  /");

 while(1)
 {
 settings();

 if(update_time)
 {
 get_RTC();
 show_value(5, 1, cal_hour);
 show_value(8, 1, cal_minute);
 show_value(11, 1, cal_second);
 show_value(4, 2, cal_date);
 show_value(7, 2, cal_month);
 show_year(10, 2, cal_year);
 update_time = 0;
 }
 };
}


void setup_mcu()
{
 unsigned char i = 0;

 setup_GPIOs();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1, 4, "STM32 RTC.");
 i = RTC_init();

 switch(i)
 {
 case 1:
 {
 lcd_out(2, 1, "RTC init. failed");
 while(1);
 }
 default:
 {
 lcd_out(2, 1, "RTC init success");
 delay_ms(2000);
 break;
 }
 }

 Lcd_Cmd(_LCD_CLEAR);
}


void setup_GPIOs()
{
  RCC_APB2ENRbits.IOPAEN = 0x01 ;
  do{if(( 0  >= 0) && ( 0  < 8)){ do{GPIOA_CRL &= (~(0xF << (0 << 2))); GPIOA_CRL |= (0x8 << (0 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((0 - 8) << 2))); GPIOA_CRH |= (0x8 << ((0 - 8) << 2));}while(0) ;}}while(0) ;
  GPIOA_ODR |= (1 << 0) ;

  do{if(( 1  >= 0) && ( 1  < 8)){ do{GPIOA_CRL &= (~(0xF << (1 << 2))); GPIOA_CRL |= (0x8 << (1 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((1 - 8) << 2))); GPIOA_CRH |= (0x8 << ((1 - 8) << 2));}while(0) ;}}while(0) ;
  GPIOA_ODR |= (1 << 1) ;

  do{if(( 2  >= 0) && ( 2  < 8)){ do{GPIOA_CRL &= (~(0xF << (2 << 2))); GPIOA_CRL |= (0x8 << (2 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((2 - 8) << 2))); GPIOA_CRH |= (0x8 << ((2 - 8) << 2));}while(0) ;}}while(0) ;
  GPIOA_ODR |= (1 << 2) ;

  do{if(( 3  >= 0) && ( 3  < 8)){ do{GPIOA_CRL &= (~(0xF << (3 << 2))); GPIOA_CRL |= (0x8 << (3 << 2));}while(0) ;}else{ do{GPIOA_CRH &= (~(0xF << ((3 - 8) << 2))); GPIOA_CRH |= (0x8 << ((3 - 8) << 2));}while(0) ;}}while(0) ;
  GPIOA_ODR |= (1 << 3) ;

  RCC_APB2ENRbits.IOPBEN = 0x01 ;
  do{if((10 >= 0) && (10 < 8)){ do{GPIOB_CRL &= (~(0xF << (10 << 2))); GPIOB_CRL |= ((0x0 | 0x1) << (10 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((10 - 8) << 2))); GPIOB_CRH |= ((0x0 | 0x1) << ((10 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((11 >= 0) && (11 < 8)){ do{GPIOB_CRL &= (~(0xF << (11 << 2))); GPIOB_CRL |= ((0x0 | 0x1) << (11 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((11 - 8) << 2))); GPIOB_CRH |= ((0x0 | 0x1) << ((11 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((12 >= 0) && (12 < 8)){ do{GPIOB_CRL &= (~(0xF << (12 << 2))); GPIOB_CRL |= ((0x0 | 0x1) << (12 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((12 - 8) << 2))); GPIOB_CRH |= ((0x0 | 0x1) << ((12 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((13 >= 0) && (13 < 8)){ do{GPIOB_CRL &= (~(0xF << (13 << 2))); GPIOB_CRL |= ((0x0 | 0x1) << (13 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((13 - 8) << 2))); GPIOB_CRH |= ((0x0 | 0x1) << ((13 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((14 >= 0) && (14 < 8)){ do{GPIOB_CRL &= (~(0xF << (14 << 2))); GPIOB_CRL |= ((0x0 | 0x1) << (14 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((14 - 8) << 2))); GPIOB_CRH |= ((0x0 | 0x1) << ((14 - 8) << 2));}while(0) ;}}while(0) ;
  do{if((15 >= 0) && (15 < 8)){ do{GPIOB_CRL &= (~(0xF << (15 << 2))); GPIOB_CRL |= ((0x0 | 0x1) << (15 << 2));}while(0) ;}else{ do{GPIOB_CRH &= (~(0xF << ((15 - 8) << 2))); GPIOB_CRH |= ((0x0 | 0x1) << ((15 - 8) << 2));}while(0) ;}}while(0) ;
}


unsigned char RTC_init()
{
 unsigned char timeout = 0;

 if(BKP_DR1 !=  0x9999 )
 {
  RCC_APB1ENRbits.PWREN = 0x01 ;
  RCC_APB1ENRbits.BKPEN = 0x01 ;

  PWR_CRbits.DBP = 0x01 ;
  RCC_BDCRbits.BDRST = 0x01 ;
  RCC_BDCRbits.BDRST = 0x00 ;

  RCC_BDCRbits.LSEBYP = 0x00 ;
  RCC_BDCRbits.LSEON = 0x01 ;
 while(( (RCC_BDCR & (1 << 1))  ==  0x00 ) && (timeout < 250))
 {
 timeout++;
 delay_ms(10);
 };

 if(timeout > 250)
 {
 return 1;
 }

  do{RCC_BDCR &= (~(0x3 << 8)); RCC_BDCR |= ( 0x01  << 8);}while(0) ;
  RCC_BDCRbits.RTCEN = 0x01 ;

 while( (RTC_CRL & (1 << 5))  ==  0x00 );
 while( (RTC_CRL & (1 << 3))  ==  0x00 );
  RTC_CRHbits.SECIE = 0x01 ;
 while( (RTC_CRL & (1 << 5))  ==  0x00 );

  RTC_CRLbits.CNF = 0x01 ;
  do{RTC_PRLL = 0; RTC_PRLH = 0; RTC_PRLL = (0xFFFF & 32767); RTC_PRLH = (32767 >> 16); }while(0) ;
  RTC_CRLbits.CNF = 0x00 ;

 while( (RTC_CRL & (1 << 5))  ==  0x00 );
 BKP_DR1 =  0x9999 ;
  PWR_CRbits.DBP = 0x00 ;

 set_RTC(cal_year, cal_month, cal_date, cal_hour, cal_minute, cal_second);
 }

 else
 {
 while( (RTC_CRL & (1 << 3))  ==  0x00 );
  RTC_CRHbits.SECIE = 0x01 ;
 while( (RTC_CRL & (1 << 5))  ==  0x00 );
 }

 NVIC_IntEnable(IVT_INT_RTC);

 return 0;
}


void get_RTC()
{
 unsigned int temp1 = 0;
 static unsigned int day_count;

 unsigned long temp = 0;
 unsigned long counts = 0;

 counts = RTC_CNTH;
 counts <<= 16;
 counts += RTC_CNTL;

 temp = (counts / 86400);

 if(day_count != temp)
 {
 day_count = temp;
 temp1 = 1970;

 while(temp >= 365)
 {
 if(check_for_leap_year(temp1) == 1)
 {
 if(temp >= 366)
 {
 temp -= 366;
 }

 else
 {
 break;
 }
 }

 else
 {
 temp -= 365;
 }

 temp1++;
 };

 cal_year = temp1;

 temp1 = 0;
 while(temp >= 28)
 {
 if((temp1 == 1) && (check_for_leap_year(cal_year) == 1))
 {
 if(temp >= 29)
 {
 temp -= 29;
 }

 else
 {
 break;
 }
 }

 else
 {
 if(temp >= month_table[temp1])
 {
 temp -= ((unsigned long)month_table[temp1]);
 }

 else
 {
 break;
 }
 }

 temp1++;
 };

 cal_month = (temp1 + 1);
 cal_date = (temp + 1);
 }

 temp = (counts % 86400);

 cal_hour = (temp / 3600);
 cal_minute = ((temp % 3600) / 60);
 cal_second = ((temp % 3600) % 60);
}


void set_RTC(unsigned int year, unsigned char month, unsigned char date, unsigned char hour, unsigned char minute, unsigned char second)
{
 unsigned int i = 0;
 unsigned long counts = 0;

 if(year > 2099)
 {
 year = 2099;
 }

 if(year < 1970)
 {
 year = 1970;
 }

 for(i = 1970; i < year; i++)
 {
 if(check_for_leap_year(i) == 1)
 {
 counts += 31622400;
 }

 else
 {
 counts += 31536000;
 }
 }

 month -= 1;

 for(i = 0; i < month; i++)
 {
 counts += (((unsigned long)month_table[i]) * 86400);
 }

 if(check_for_leap_year(cal_year) == 1)
 {
 counts += 86400;
 }

 counts += ((unsigned long)(date - 1) * 86400);
 counts += ((unsigned long)hour * 3600);
 counts += ((unsigned long)minute * 60);
 counts += second;

  RCC_APB1ENRbits.PWREN = 0x01 ;
  RCC_APB1ENRbits.BKPEN = 0x01 ;

  PWR_CRbits.DBP = 0x01 ;

  RTC_CRLbits.CNF = 0x01 ;
  do{RTC_CNTL = 0; RTC_CNTH = 0; RTC_CNTL = (0xFFFF & counts); RTC_CNTH = (counts >> 16); }while(0) ;
  RTC_CRLbits.CNF = 0x00 ;

 while( (RTC_CRL & (1 << 5))  ==  0x00 );

  PWR_CRbits.DBP = 0x00 ;
}


unsigned char check_for_leap_year(unsigned int year)
{
 if(year % 4 == 0)
 {
 if(year % 100 == 0)
 {
 if(year % 400 == 0)
 {
 return 1;
 }

 else
 {
 return 0;
 }
 }

 else
 {
 return 1;
 }
 }

 else
 {
 return 0;
 }
}


void show_value(unsigned char x_pos, unsigned char y_pos, unsigned char value)
{
 unsigned char ch = 0;

 ch = (value / 10);
 lcd_chr(y_pos, x_pos, (ch + 0x30));
 ch = (value % 10);
 lcd_chr(y_pos, (x_pos + 1), (ch + 0x30));
}


void show_year(unsigned char x_pos, unsigned char y_pos, unsigned int value)
{
 unsigned char temp = 0;

 temp = (value / 100);
 show_value(x_pos, y_pos, temp);
 temp = (value % 100);
 show_value((x_pos + 2), y_pos, temp);
}


unsigned int change_value(unsigned char x_pos, unsigned char y_pos, signed int value, signed int value_min, signed int value_max, unsigned char value_type)
{
 while(1)
 {
 switch(value_type)
 {
 case 1:
 {
 lcd_out(y_pos, x_pos, "    ");
 break;
 }
 default:
 {
 lcd_out(y_pos, x_pos, "  ");
 break;
 }
 }
 delay_ms(60);

 if( (GPIOA_IDR & (1 << 1))  ==  0x00 )
 {
 value++;
 }

 if(value > value_max)
 {
 value = value_min;
 }

 if( (GPIOA_IDR & (1 << 2))  ==  0x00 )
 {
 value--;
 }

 if(value < value_min)
 {
 value = value_max;
 }

 switch(value_type)
 {
 case 1:
 {
 show_year(x_pos, y_pos, ((unsigned int)value));
 break;
 }
 default:
 {
 show_value(x_pos, y_pos, ((unsigned char)value));
 break;
 }
 }
 delay_ms(90);

 if( (GPIOA_IDR & (1 << 3))  ==  0x00 )
 {
 while( (GPIOA_IDR & (1 << 3))  ==  0x00 );
 delay_ms(200);
 return value;
 }
 };
}


void settings()
{
 if( (GPIOA_IDR & (1 << 0))  ==  0x00 )
 {
 while( (GPIOA_IDR & (1 << 0))  ==  0x00 );
 NVIC_IntDisable(IVT_INT_RTC);
 update_time = 0;

 cal_hour = change_value(5, 1, cal_hour, 0, 23, 0);
 cal_minute = change_value(8, 1, cal_minute, 0, 59, 0);
 cal_second = change_value(11, 1, cal_second, 0, 59, 0);
 cal_date = change_value(4, 2, cal_date, 1, 31, 0);
 cal_month = change_value(7, 2, cal_month, 1, 12, 0);
 cal_year = change_value(10, 2, cal_year, 1970, 2099, 1);

 set_RTC(cal_year, cal_month, cal_date, cal_hour, cal_minute, cal_second);
 NVIC_IntEnable(IVT_INT_RTC);
 }
}
