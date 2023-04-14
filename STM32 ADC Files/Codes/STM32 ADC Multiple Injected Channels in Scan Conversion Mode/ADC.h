/*                Definitons for ADC Module                */   


/*ADC Modes*/

#define independent_mode                                                                 0x00
#define combined_regular_simultaneous_and_injected_simultaneous_mode                     0x01
#define combined_regular_simultaneous_and_alternate_trigger_mode                         0x02
#define combined_injected_simultaneous_and_fast_interleaved_mode                         0x03
#define combined_injected_simultaneous_and_slow_interleaved_mode                         0x04
#define injected_simultaneous_mode_only                                                  0x05
#define regular_simultaneous_mode_only                                                   0x06
#define fast_interleaved_mode_only                                                       0x07
#define slow_interleaved_mode_only                                                       0x08
#define alternate_trigger_mode_only                                                      0x09
  
/*ADC1 and 2 Triggering Options for Regular Group*/
 
#define timer1_CC1_event                                                                 0x00
#define timer1_CC2_event                                                                 0x01
#define timer1_CC3_event                                                                 0x02
#define timer2_CC2_event                                                                 0x03
#define timer3_TRGO_event                                                                0x04
#define timer4_CC4_event                                                                 0x05
#define EXTI_11_trigger                                                                  0x06
#define timer8_TRGO_event_1                                                              0x06
#define SWSTART_trigger                                                                  0x07
#define EXT_disabled                                                                     0x08

/*ADC1 and 2 Triggering Options for Injected Group*/
 
#define timer1_TRGO_event                                                                0x00
#define timer1_CC4_event                                                                 0x01
#define timer2_TRGO_event                                                                0x02
#define timer2_CC1_event                                                                 0x03
#define timer3_CC4_event                                                                 0x04
#define timer4_TRGO_event                                                                0x05
#define EXTI_15_trigger                                                                  0x06
#define timer8_CC4_event_1                                                               0x06
#define JSWSTART_trigger                                                                 0x07
#define JEXT_disabled                                                                    0x08

/*ADC3 Triggering Options for Regular Group*/

#define timer3_CC1_event                                                                 0x00
#define timer2_CC3_event                                                                 0x01
#define timer1_CC3_event                                                                 0x02
#define timer8_CC1_event                                                                 0x03
#define timer8_TRGO_event_2                                                              0x04
#define timer5_CC1_event                                                                 0x05
#define timer5_CC3_event                                                                 0x06

/*ADC3 Triggering Options for Injected Group*/

#define timer1_TRGO_event                                                                0x00
#define timer1_CC4_event                                                                 0x01
#define timer4_CC3_event                                                                 0x02
#define timer8_CC2_event                                                                 0x03
#define timer8_CC4_event_2                                                               0x04
#define timer5_TRGO_event                                                                0x05
#define timer5_CC4_event                                                                 0x06

/*Sampling Times*/

#define sample_time_1_5_cycles                                                           0x00
#define sample_time_7_5_cycles                                                           0x01
#define sample_time_13_5_cycles                                                          0x02
#define sample_time_28_5_cycles                                                          0x03
#define sample_time_41_5_cycles                                                          0x04
#define sample_time_55_5_cycles                                                          0x05
#define sample_time_71_5_cycles                                                          0x06
#define sample_time_239_5_cycles                                                         0x07

/*Analogue Watchdog Selsctions */

#define none                                                                             0x00
#define all_injected_channels                                                            0x01
#define all_regular_channels                                                             0x02
#define all_regular_and_injected_channels                                                0x03
#define reserved                                                                         0x04
#define single_injected_channel                                                          0x05
#define single_regular_channel                                                           0x06
#define single_regular_or_injected_channel                                               0x07

//Miscellaneous

#define enable                                                                           0x01
#define disable                                                                          0x00

#define true                                                                             0x01
#define false                                                                            0x00

#define high                                                                             0x01
#define low                                                                              0x00

#define reset                                                                            0x00

#define left_alignment                                                                   0x01
#define right_alignment                                                                  0x00
                                                                         
//ADC1 function definitions                                                               

#define set_ADC_mode(mode)                                                               do{ADC1_CR1 &= (~(0xF << 16)); ADC1_CR1 |= (mode << 16);}while(0)
#define set_ADC1_data_alignment(mode)                                                    ADC1_CR2bits.ALIGN = mode
#define set_ADC1_scan_conversion_mode(mode)                                              ADC1_CR1bits.SCAN = mode
#define set_ADC1_continuous_conversion_mode(mode)                                        ADC1_CR2bits.CONT = mode
#define set_ADC1_discontinuous_conversion_mode_in_regular_mode(mode)                     ADC1_CR1bits.DISCEN = mode
#define set_ADC1_discontinuous_conversion_mode_in_injected_mode(mode)                    ADC1_CR1bits.JDISCEN = mode
#define set_ADC1_number_of_discontinuous_conversions(value)                              do{ADC1_CR1 &= (~(0x7 << 13)); ADC1_CR1 |= (value << 13);}while(0)
#define set_ADC1_reference_and_temperature_sensor(mode)                                  ADC1_CR2bits.TSVREFE = mode
#define set_ADC1_DMA(mode)                                                               ADC1_CR2bits.DMA_ = mode
#define set_ADC1_sample_time(value, channel)                                             do{if((channel <= 9) && (channel >= 0)){ADC1_SMPR2 &= (~(0x7 << (channel * 3))); ADC1_SMPR2 |= (value << (channel * 3));} else{ADC1_SMPR1 &= (~(0x7 << ((channel - 10) * 3))); ADC1_SMPR1 |= (value << ((channel - 10) * 3));}}while(0)

#define set_ADC1_regular_conversions(mode)                                               ADC1_CR2bits.SWSTART = mode
#define set_ADC1_external_trigger_regular_conversion_edge(mode)                          do{if((mode >= 0) && (mode < 8)){ADC1_CR2bits.EXTTRIG = 1; ADC1_CR2 &= (~(0x7 << 17)); ADC1_CR2 |= (mode << 17);}else{ADC1_CR2bits.EXTTRIG = 0;}}while(0)
#define set_ADC1_regular_number_of_conversions(value)                                    do{ADC1_SQR1 &= (~(0xF << 20)); ADC1_SQR1 |= ((value - 1) << 20);}while(0)
#define set_ADC1_regular_sequence(seq, channel)                                          do{if((seq >= 1) && (seq <= 6)){ADC1_SQR3 &= (~(0x1F << ((seq - 1) * 5))); ADC1_SQR3 |= (channel << ((seq - 1) * 5));}else if((seq >= 7) && (seq <= 12)){ADC1_SQR2 &= (~(0x1F << ((seq - 7) * 5))); ADC1_SQR2 |= (channel << ((seq - 7) * 5));}else{ADC1_SQR1 &= (~(0x1F << ((seq - 13) * 5))); ADC1_SQR1 |= (channel << ((seq - 13) * 5));}}while(0)
#define set_ADC1_regular_end_of_conversion_interrupt(mode)                               ADC1_CR1bits.EOCIE = mode

#define set_ADC1_injected_conversions(mode)                                              ADC1_CR2bits.JSWSTART = mode
#define set_ADC1_auto_injection(mode)                                                    ADC1_CR1bits.JAUTO = mode
#define set_ADC1_external_trigger_injected_conversion_edge(mode)                         do{if((mode >= 0) && (mode < 8)){ADC1_CR2bits.JEXTTRIG = 1; ADC1_CR2 &= (~(0x7 << 12)); ADC1_CR2 |= (mode << 12);}else{ADC1_CR2bits.JEXTTRIG = 0;}}while(0)
#define set_ADC1_injected_number_of_conversions(value)                                   do{ADC1_JSQR &= (~(0x3 << 20)); ADC1_JSQR |= ((value - 1) << 20);}while(0)
#define set_ADC1_injected_sequence(seq, channel)                                         do{ADC1_JSQR &= (~(0x1F << ((seq - 1) * 5))); ADC1_JSQR |= (channel << ((seq - 1) * 5));}while(0)
#define set_ADC1_injected_end_of_conversion_interrupt(mode)                              ADC1_CR1bits.JEOCIE = mode
                               
#define select_ADC1_AWD_channel_mode(mode)                                               do{ADC1_CR1bits.AWDSGL = ((mode & 0x04) >> 2); ADC1_CR1bits.AWDEN = ((mode & 0x02) >> 1); ADC1_CR1bits.JAWDEN = (mode & 0x01);}while(0)
#define set_ADC1_AWD_channel(channel)                                                    do{ADC1_CR1 &= 0xFFFFFFE0; ADC1_CR1 |= (0x0000001F & channel);}while(0)
#define set_ADC1_analog_watchdog_interrupt(mode)                                         ADC1_CR1bits.AWDIE = mode                        
                                                                                                             
#define ADC1_Enable()                                                                    do{RCC_APB2ENRbits.ADC1EN = 1; RCC_APB2RSTRbits.ADC1RST = 1; RCC_APB2RSTRbits.ADC1RST = 0;}while(0)
#define clr_ADC1_settings()                                                              do{ADC1_CR1 = 0; ADC1_CR2 = 0;}while(0)
#define ADC1_calibrate()                                                                 do{ADC1_CR2bits.RSTCAL = 1; ADC1_CR2bits.CAL = 1; while(ADC1_CR2bits.CAL == 1);}while(0)
#define start_ADC1()                                                                     do{ADC1_CR2bits.ADON = 1; delay_ms(1); ADC1_CR2bits.ADON = 1;}while(0)       

//ADC2 function definitions

#define set_ADC2_data_alignment(mode)                                                    ADC2_CR2bits.ALIGN = mode
#define set_ADC2_scan_conversion_mode(mode)                                              ADC2_CR1bits.SCAN = mode
#define set_ADC2_continuous_conversion_mode(mode)                                        ADC2_CR2bits.CONT = mode
#define set_ADC2_discontinuous_conversion_mode_in_regular_mode(mode)                     ADC2_CR1bits.DISCEN = mode
#define set_ADC2_discontinuous_conversion_mode_in_injected_mode(mode)                    ADC2_CR1bits.JDISCEN = mode
#define set_ADC2_number_of_discontinuous_conversions(value)                              do{ADC2_CR1 &= (~(0x7 << 13)); ADC2_CR1 |= (value << 13);}while(0)
#define set_ADC2_sample_time(value, channel)                                             do{if((channel <= 9) && (channel >= 0)){ADC2_SMPR2 &= (~(0x7 << (channel * 3))); ADC2_SMPR2 |= (value << (channel * 3));} else{ADC2_SMPR1 &= (~(0x7 << ((channel - 10) * 3))); ADC2_SMPR1 |= (value << ((channel - 10) * 3));}}while(0)

#define set_ADC2_regular_conversions(mode)                                               ADC2_CR2bits.SWSTART = mode
#define set_ADC2_external_trigger_regular_conversion_edge(mode)                          do{if((mode >= 0) && (mode < 8)){ADC2_CR2bits.EXTTRIG = 1; ADC2_CR2 &= (~(0x7 << 17)); ADC2_CR2 |= (mode << 17);}else{ADC2_CR2bits.EXTTRIG = 0;}}while(0)
#define set_ADC2_regular_number_of_conversions(value)                                    do{ADC2_SQR1 &= (~(0xF << 20)); ADC2_SQR1 |= ((value - 1) << 20);}while(0)
#define set_ADC2_regular_sequence(seq, channel)                                          do{if((seq >= 1) && (seq <= 6)){ADC2_SQR3 &= (~(0x1F << ((seq - 1) * 5))); ADC2_SQR3 |= (channel << ((seq - 1) * 5));}else if((seq >= 7) && (seq <= 12)){ADC2_SQR2 &= (~(0x1F << ((seq - 7) * 5))); ADC2_SQR2 |= (channel << ((seq - 7) * 5));}else{ADC2_SQR1 &= (~(0x1F << ((seq - 13) * 5))); ADC2_SQR1 |= (channel << ((seq - 13) * 5));}}while(0)
#define set_ADC2_regular_end_of_conversion_interrupt(mode)                               ADC2_CR1bits.EOCIE = mode

#define set_ADC2_injected_conversions(mode)                                              ADC2_CR2bits.JSWSTART = mode
#define set_ADC2_auto_injection(mode)                                                    ADC2_CR1bits.JAUTO = mode
#define set_ADC2_external_trigger_injected_conversion_edge(mode)                         do{if((mode >= 0) && (mode < 8)){ADC2_CR2bits.JEXTTRIG = 1; ADC2_CR2 &= (~(0x7 << 12)); ADC2_CR2 |= (mode << 12);}else{ADC2_CR2bits.JEXTTRIG = 0;}}while(0)
#define set_ADC2_injected_number_of_conversions(value)                                   do{ADC2_JSQR &= (~(0x3 << 20)); ADC2_JSQR |= ((value - 1) << 20);}while(0)
#define set_ADC2_injected_sequence(seq, channel)                                         do{ADC2_JSQR &= (~(0x1F << ((seq - 1) * 5))); ADC2_JSQR |= (channel << ((seq - 1) * 5));}while(0)
#define set_ADC2_injected_end_of_conversion_interrupt(mode)                              ADC2_CR1bits.JEOCIE = mode

#define select_ADC2_AWD_channel_mode(mode)                                               do{ADC2_CR1bits.AWDSGL = ((mode & 0x04) >> 2); ADC2_CR1bits.AWDEN = ((mode & 0x02) >> 1); ADC2_CR1bits.JAWDEN = (mode & 0x01);}while(0)
#define set_ADC2_AWD_channel(channel)                                                    do{ADC2_CR1 &= 0xFFFFFFE0; ADC2_CR1 |= (0x0000001F & channel);}while(0)
#define set_ADC2_analog_watchdog_interrupt(mode)                                         ADC2_CR1bits.AWDIE = mode

#define ADC2_Enable()                                                                    do{RCC_APB2ENRbits.ADC2EN = 1; RCC_APB2RSTRbits.ADC2RST = 1; RCC_APB2RSTRbits.ADC2RST = 0;}while(0)
#define clr_ADC2_settings()                                                              do{ADC2_CR1 = 0; ADC2_CR2 = 0;}while(0)
#define ADC2_calibrate()                                                                 do{ADC2_CR2bits.RSTCAL = 1; ADC2_CR2bits.CAL = 1; while(ADC2_CR2bits.CAL == 1);}while(0)
#define start_ADC2()                                                                     do{ADC2_CR2bits.ADON = 1; delay_ms(1); ADC2_CR2bits.ADON = 1;}while(0)

//ADC3 function definitions

#define set_ADC3_data_alignment(mode)                                                    ADC3_CR2bits.ALIGN = mode
#define set_ADC3_scan_conversion_mode(mode)                                              ADC3_CR1bits.SCAN = mode
#define set_ADC3_continuous_conversion_mode(mode)                                        ADC3_CR2bits.CONT = mode
#define set_ADC3_discontinuous_conversion_mode_in_regular_mode(mode)                     ADC3_CR1bits.DISCEN = mode
#define set_ADC3_discontinuous_conversion_mode_in_injected_mode(mode)                    ADC3_CR1bits.JDISCEN = mode
#define set_ADC3_number_of_discontinuous_conversions(value)                              do{ADC3_CR1 &= (~(0x7 << 13)); ADC3_CR1 |= (value << 13);}while(0)
#define set_ADC3_DMA(mode)                                                               ADC3_CR2bits.DMA_ = mode
#define set_ADC3_sample_time(value, channel)                                             do{if((channel <= 9) && (channel >= 0)){ADC3_SMPR2 &= (~(0x7 << (channel * 3))); ADC3_SMPR2 |= (value << (channel * 3));} else{ADC3_SMPR1 &= (~(0x7 << ((channel - 10) * 3))); ADC3_SMPR1 |= (value << ((channel - 10) * 3))};}while(0)

#define set_ADC3_regular_conversions(mode)                                               ADC3_CR2bits.SWSTART = mode
#define set_ADC3_external_trigger_regular_conversion_edge(mode)                          do{if((mode >= 0) && (mode < 8)){ADC3_CR2bits.EXTTRIG = 1; ADC3_CR2 &= (~(0x7 << 17)); ADC3_CR2 |= (mode << 17);}else{ADC3_CR2bits.EXTTRIG = 0;}}while(0)
#define set_ADC3_regular_number_of_conversions(value)                                    do{ADC3_SQR1 &= (~(0xF << 20)); ADC3_SQR1 |= ((value - 1) << 20);}while(0)
#define set_ADC3_regular_sequence(seq, channel)                                          do{if((seq >= 1) && (seq <= 6)){ADC3_SQR3 &= (~(0x1F << ((seq - 1) * 5))); ADC3_SQR3 |= (channel << ((seq - 1) * 5));}else if((seq >= 7) && (seq <= 12)){ADC3_SQR2 &= (~(0x1F << ((seq - 7) * 5))); ADC3_SQR2 |= (channel << ((seq - 7) * 5));}else{ADC3_SQR1 &= (~(0x1F << ((seq - 13) * 5))); ADC3_SQR1 |= (channel << ((seq - 13) * 5));}}while(0)
#define set_ADC3_regular_end_of_conversion_interrupt(mode)                               ADC3_CR1bits.EOCIE = mode
                                                                                                                                           
#define set_ADC3_injected_conversions(mode)                                              ADC3_CR2bits.JSWSTART = mode
#define set_ADC3_auto_injection(mode)                                                    ADC3_CR1bits.JAUTO = mode
#define set_ADC3_external_trigger_injected_conversion_edge(mode)                         do{if((mode >= 0) && (mode < 8)){ADC3_CR2bits.JEXTTRIG = 1; ADC3_CR2 &= (~(0x7 << 12)); ADC3_CR2 |= (mode << 12);}else{ADC3_CR2bits.JEXTTRIG = 0;}}while(0)
#define set_ADC3_injected_number_of_conversions(value)                                   do{ADC3_JSQR &= (~(0x3 << 20)); ADC3_JSQR |= ((value - 1) << 20);}while(0)
#define set_ADC3_injected_sequence(seq, channel)                                         do{ADC3_JSQR &= (~(0x1F << ((seq - 1) * 5))); ADC3_JSQR |= (channel << ((seq - 1) * 5));}while(0)
#define set_ADC3_injected_end_of_conversion_interrupt(mode)                              ADC3_CR1bits.JEOCIE = mode

#define select_ADC3_AWD_channel_mode(mode)                                               do{ADC3_CR1bits.AWDSGL = ((mode & 0x04) >> 2); ADC3_CR1bits.AWDEN = ((mode & 0x02) >> 1); ADC3_CR1bits.JAWDEN = (mode & 0x01);}while(0)
#define set_ADC3_AWD_channel(channel)                                                    do{ADC3_CR1 &= 0xFFFFFFE0; ADC3_CR1 |= (0x0000001F & channel);}while(0)
#define set_ADC3_analog_watchdog_interrupt(mode)                                         ADC3_CR1bits.AWDIE = mode

#define ADC3_Enable()                                                                    do{RCC_APB2ENRbits.ADC3EN = 1; RCC_APB2RSTRbits.ADC3RST = 1; RCC_APB2RSTRbits.ADC3RST = 0;}while(0)
#define clr_ADC3_settings()                                                              do{ADC3_CR1 = 0; ADC3_CR2 = 0;}while(0)
#define ADC3_calibrate()                                                                 do{ADC3_CR2bits.RSTCAL = 1; ADC3_CR2bits.CAL = 1; while(ADC3_CR2bits.CAL == 1);}while(0)
#define start_ADC3()                                                                     do{ADC3_CR2bits.ADON = 1; delay_ms(1); ADC3_CR2bits.ADON = 1;}while(0)