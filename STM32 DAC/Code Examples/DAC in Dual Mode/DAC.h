//DAC constant value definitions

/*DAC Modes*/

//DAC channel trigger selection definitions

#define Timer_6_TRGO_event                                                               0x00
#define Timer_3_TRGO_event                                                               0x01
#define Timer_7_TRGO_event                                                               0x02
#define Timer_5_TRGO_event                                                               0x03
#define Timer_2_TRGO_event                                                               0x04
#define Timer_4_TRGO_event                                                               0x05
#define EXTI9_event                                                                      0x06
#define Software_trigger                                                                 0x07
#define Timer_8_TRGO_event                                                               Timer_3_TRGO_event

//DAC channel noise/triangle wave generation mode

#define wave_generation_disabled                                                         0x00
#define noise_wave_generation_enabled                                                    0x01
#define triangle_wave_generation_enabled                                                 0x02

//DAC channel triangle wave amplitude selector

#define Triangle_Amplitude_equal_to_1                                                    0x00
#define Triangle_Amplitude_equal_to_3                                                    0x01
#define Triangle_Amplitude_equal_to_7                                                    0x02
#define Triangle_Amplitude_equal_to_15                                                   0x03
#define Triangle_Amplitude_equal_to_31                                                   0x04
#define Triangle_Amplitude_equal_to_63                                                   0x05
#define Triangle_Amplitude_equal_to_127                                                  0x06
#define Triangle_Amplitude_equal_to_255                                                  0x07
#define Triangle_Amplitude_equal_to_511                                                  0x08
#define Triangle_Amplitude_equal_to_1023                                                 0x09
#define Triangle_Amplitude_equal_to_2047                                                 0x0A
#define Triangle_Amplitude_equal_to_4095                                                 0x0B


/*DAC Functions*/

#define enable_DAC1_channel(mode)                                                        DAC_CRbits.EN1 = mode
#define set_DAC1_buffer(mode)                                                            DAC_CRbits.BOFF1 = mode
#define enable_DAC1_trigger(mode)                                                        DAC_CRbits.TEN1 = mode
#define select_DAC1_trigger_source(value)                                                do{if(DAC_CRbits.TEN1 == enable){DAC_CR &= (~(0x7 << 3));  DAC_CR |= (value << 3);}}while(0)
#define select_DAC1_wave_type(value)                                                     do{if(DAC_CRbits.TEN1 == enable){DAC_CR &= (~(0x3 << 6));  DAC_CR |= (value << 6);}}while(0)
#define set_DAC1_LFSR_mask(value)                                                        do{DAC_CR &= (~(0xF << 8));  DAC_CR |= (value << 8);}while(0)
#define set_DAC1_triangle_waveform_amplitude(val)                                        set_DAC1_LFSR_mask(val)
#define set_DAC1_DMA(mode)                                                               DAC_CRbits.DMAEN1 = mode
#define set_DAC1_software_trigger(mode)                                                  DAC_SWTRIGRbits.SWTRIG1 = mode

#define enable_DAC2_channel(mode)                                                        DAC_CRbits.EN2 = mode
#define set_DAC2_buffer(mode)                                                            DAC_CRbits.BOFF2 = mode
#define enable_DAC2_trigger(mode)                                                        DAC_CRbits.TEN2 = mode
#define select_DAC2_trigger_source(value)                                                do{if(DAC_CRbits.TEN2 == enable){DAC_CR &= (~(0x7 << 19));  DAC_CR |= (value << 19);}}while(0)
#define select_DAC2_wave_type(value)                                                     do{if(DAC_CRbits.TEN2 == enable){DAC_CR &= (~(0x3 << 22));  DAC_CR |= (value << 22);}}while(0)
#define set_DAC2_LFSR_mask(value)                                                        do{DAC_CR &= (~(0xF << 24));  DAC_CR |= (value << 24);}while(0)
#define set_DAC2_triangle_waveform_amplitude(val)                                        set_DAC2_LFSR_mask(val)
#define set_DAC2_DMA(mode)                                                               DAC_CRbits.DMAEN2 = mode
#define set_DAC2_software_trigger(mode)                                                  DAC_SWTRIGRbits.SWTRIG2 = mode

#define enable_DAC(mode)                                                                 RCC_APB1ENRbits.DACEN = mode
#define DAC_reset()                                                                      DAC_CR = 0x00000000