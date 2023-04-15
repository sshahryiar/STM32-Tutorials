/*      Functions for TIM6      */

#define enable_TIM6(mode)                                                                RCC_APB1ENRbits.TIM6EN = mode

#define set_TIM6_clock_division(value)                                                   do{TIM6_CR1 &= (~(0x3 << 8));  TIM6_CR1 |= (value << 8);}while(0)
#define set_TIM6_auto_reload_preload_mode(mode)                                          TIM6_CR1bits.ARPE = mode
#define set_TIM6_one_pulse_mode(mode)                                                    TIM6_CR1bits.OPM = mode
#define set_TIM6_update_request_source(mode)                                             TIM6_CR1bits.URS = mode
#define disable_TIM6_update(mode)                                                        TIM6_CR1bits.UDIS = mode
#define enable_TIM6_counter(mode)                                                        TIM6_CR1bits.CEN = mode

#define set_TIM6_master_mode_selection(value)                                            do{TIM6_CR2 &= (~(0x7 << 4));  TIM6_CR2 |= (value << 4);}while(0)

#define enable_TIM6_update_DMA_request(mode)                                             TIM6_DIERbits.UDE = mode
#define enable_TIM6_update_interrupt(mode)                                               TIM6_DIERbits.UIE = mode