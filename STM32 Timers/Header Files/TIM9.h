/*      Functions for TIM9      */

#define enable_TIM9(mode)                                                                RCC_APB2ENRbits.= mode

#define set_TIM9_clock_division(value)                                                   do{TIM9_CR1 &= (~(0x3 << 8));  TIM9_CR1 |= (value << 8);}while(0)
#define set_TIM9_auto_reload_preload_mode(mode)                                          TIM9_CR1bits.ARPE = mode
#define set_TIM9_update_request_source(mode)                                             TIM9_CR1bits.URS = mode
#define disable_TIM9_update(mode)                                                        TIM9_CR1bits.UDIS = mode
#define enable_TIM9_counter(mode)                                                        TIM9_CR1bits.CEN = mode

#define enable_TIM9_CC1_interrupt(mode)                                                  TIM9_DIERbits.CC1IE = mode
#define enable_TIM9_update_interrupt(mode)                                               TIM9_DIERbits.UIE = mode

#define enable_TIM9_OC1_clear(mode)                                                      TIM9_CCMR1_Outputbits.OC1CE = mode
#define enable_TIM9_OC1_preload(mode)                                                    TIM9_CCMR1_Outputbits.OC1PE = mode
#define enable_TIM9_OC1_fast(mode)                                                       TIM9_CCMR1_Outputbits.OC1FE = mode
#define set_TIM9_OC1_compare_mode(value)                                                 do{TIM9_CCMR1_Output &= (~(0x7 << 4));  TIM9_CCMR1_Output |= (value << 4);}while(0)
#define set_TIM9_CC1_selection(value)                                                    do{TIM9_CCMR1_Output &= (~(0x3 << 0));  TIM9_CCMR1_Output |= (value << 0);}while(0)
#define set_TIM9_IC1_input_prescalar(value)                                              do{TIM9_CCMR1_Input &= (~(0x3 << 2));  TIM9_CCMR1_Input |= (value << 2);}while(0)
#define set_TIM9_IC1_filter(value)                                                       do{TIM9_CCMR1_Input &= (~(0xF << 4));  TIM9_CCMR1_Input |= (value << 4);}while(0)

#define set_TIM9_CC1_state_and_polarity(state, polarity, complementary_output)           do{TIM9_CCERbits.CC1E = state; TIM9_CCERbits.CC1P = polarity; TIM9_CCERbits.CC1NP = complementary_output;}while(0)

