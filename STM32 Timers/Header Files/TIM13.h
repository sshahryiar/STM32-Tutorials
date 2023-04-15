/*      Functions for TIM13      */

#define enable_TIM13(mode)                                                               RCC_APB1ENRbits.TIM13EN = mode

#define set_TIM13_clock_division(value)                                                  do{TIM13_CR1 &= (~(0x3 << 8));  TIM13_CR1 |= (value << 8);}while(0)
#define set_TIM13_auto_reload_preload_mode(mode)                                         TIM13_CR1bits.ARPE = mode
#define set_TIM13_update_request_source(mode)                                            TIM13_CR1bits.URS = mode
#define disable_TIM13_update(mode)                                                       TIM13_CR1bits.UDIS = mode
#define enable_TIM13_counter(mode)                                                       TIM13_CR1bits.CEN = mode

#define enable_TIM13_CC1_interrupt(mode)                                                 TIM13_DIERbits.CC1IE = mode
#define enable_TIM13_update_interrupt(mode)                                              TIM13_DIERbits.UIE = mode

#define enable_TIM13_OC1_clear(mode)                                                     TIM13_CCMR1_Outputbits.OC1CE = mode
#define enable_TIM13_OC1_preload(mode)                                                   TIM13_CCMR1_Outputbits.OC1PE = mode
#define enable_TIM13_OC1_fast(mode)                                                      TIM13_CCMR1_Outputbits.OC1FE = mode
#define set_TIM13_OC1_compare_mode(value)                                                do{TIM13_CCMR1_Output &= (~(0x7 << 4));  TIM13_CCMR1_Output |= (value << 4);}while(0)
#define set_TIM13_CC1_selection(value)                                                   do{TIM13_CCMR1_Output &= (~(0x3 << 0));  TIM13_CCMR1_Output |= (value << 0);}while(0)
#define set_TIM13_IC1_input_prescalar(value)                                             do{TIM13_CCMR1_Input &= (~(0x3 << 2));  TIM13_CCMR1_Input |= (value << 2);}while(0)
#define set_TIM13_IC1_filter(value)                                                      do{TIM13_CCMR1_Input &= (~(0xF << 4));  TIM13_CCMR1_Input |= (value << 4);}while(0)

#define set_TIM13_CC1_state_and_polarity(state, polarity, complementary_output)          do{TIM13_CCERbits.CC1E = state; TIM13_CCERbits.CC1P = polarity; TIM13_CCERbits.CC1NP = complementary_output;}while(0)
