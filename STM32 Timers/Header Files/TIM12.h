/*      Functions for TIM12      */

#define enable_TIM12(mode)                                                               RCC_APB1ENRbits.TIM12EN = mode

#define set_TIM12_clock_division(value)                                                  do{TIM12_CR1 &= (~(0x3 << 8));  TIM12_CR1 |= (value << 8);}while(0)
#define set_TIM12_auto_reload_preload_mode(mode)                                         TIM12_CR1bits.ARPE = mode
#define set_TIM12_update_request_source(mode)                                            TIM12_CR1bits.URS = mode
#define disable_TIM12_update(mode)                                                       TIM12_CR1bits.UDIS = mode
#define enable_TIM12_counter(mode)                                                       TIM12_CR1bits.CEN = mode

#define enable_TIM12_CC1_interrupt(mode)                                                 TIM12_DIERbits.CC1IE = mode
#define enable_TIM12_update_interrupt(mode)                                              TIM12_DIERbits.UIE = mode

#define enable_TIM12_OC1_clear(mode)                                                     TIM12_CCMR1_Outputbits.OC1CE = mode
#define enable_TIM12_OC1_preload(mode)                                                   TIM12_CCMR1_Outputbits.OC1PE = mode
#define enable_TIM12_OC1_fast(mode)                                                       TIM12_CCMR1_Outputbits.OC1FE = mode
#define set_TIM12_OC1_compare_mode(value)                                                do{TIM12_CCMR1_Output &= (~(0x7 << 4));  TIM12_CCMR1_Output |= (value << 4);}while(0)
#define set_TIM12_CC1_selection(value)                                                   do{TIM12_CCMR1_Output &= (~(0x3 << 0));  TIM12_CCMR1_Output |= (value << 0);}while(0)
#define set_TIM12_IC1_input_prescalar(value)                                             do{TIM12_CCMR1_Input &= (~(0x3 << 2));  TIM12_CCMR1_Input |= (value << 2);}while(0)
#define set_TIM12_IC1_filter(value)                                                      do{TIM12_CCMR1_Input &= (~(0xF << 4));  TIM12_CCMR1_Input |= (value << 4);}while(0)

#define set_TIM12_CC1_state_and_polarity(state, polarity, complementary_output)          do{TIM12_CCERbits.CC1E = state; TIM12_CCERbits.CC1P = polarity; TIM12_CCERbits.CC1NP = complementary_output;}while(0)
