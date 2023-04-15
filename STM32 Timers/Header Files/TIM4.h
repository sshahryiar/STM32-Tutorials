/*      Functions for TIM4      */

#define enable_TIM4(mode)                                                                RCC_APB1ENRbits.TIM4EN = mode

#define set_TIM4_clock_division(value)                                                   do{TIM4_CR1 &= (~(0x3 << 8));  TIM4_CR1 |= (value << 8);}while(0)
#define set_TIM4_auto_reload_preload_mode(mode)                                          TIM4_CR1bits.ARPE = mode
#define set_TIM4_centre_align_mode_selection(value)                                      do{TIM4_CR1 &= (~(0x3 << 5));  TIM4_CR1 |= (value << 5);}while(0)
#define set_TIM4_counting_direction(mode)                                                TIM4_CR1bits.DIR_ = mode
#define set_TIM4_one_pulse_mode(mode)                                                    TIM4_CR1bits.OPM = mode
#define set_TIM4_update_request_source(mode)                                             TIM4_CR1bits.URS = mode
#define disable_TIM4_update(mode)                                                        TIM4_CR1bits.UDIS = mode
#define enable_TIM4_counter(mode)                                                        TIM4_CR1bits.CEN = mode

#define set_TIM4_TI1_selection(value)                                                    TIM4_CR2bits.TI1S = value
#define set_TIM4_master_mode_selection(value)                                            do{TIM4_CR2 &= (~(0x7 << 4));  TIM4_CR2 |= (value << 4);}while(0)
#define set_TIM4_CC_DMA_request(value)                                                   TIM4_CR2bits.CCDS = value

#define set_TIM4_external_trigger_polarity(mode)                                         TIM4_SMCRbits.ETP = mode
#define set_TIM4_external_clock(mode)                                                    TIM4_SMCRbits.ECE = mode
#define set_TIM4_external_trigger_prescaler(value)                                       do{TIM4_SMCR &= (~(0x3 << 12));  TIM4_SMCR |= (value << 12);}while(0)
#define set_TIM4_external_trigger_filter(value)                                          do{TIM4_SMCR &= (~(0xF << 8));  TIM4_SMCR |= (value << 8);}while(0)
#define set_TIM4_master_slave_mode(mode)                                                 TIM4_SMCRbits.MSM = mode
#define set_TIM4_trigger_source(value)                                                   do{TIM4_SMCR &= (~(0x7 << 4));  TIM4_SMCR |= (value << 4);}while(0)
#define set_TIM4_slave_selection(value)                                                  do{TIM4_SMCR &= (~(0x7 << 0));  TIM4_SMCR |= (value << 0);}while(0)

#define enable_TIM4_DMA_request_trigger(mode)                                            TIM4_DIERbits.TDE = mode
#define enable_TIM4_CC4_DMA_request(mode)                                                TIM4_DIERbits.CC4DE = mode
#define enable_TIM4_CC3_DMA_request(mode)                                                TIM4_DIERbits.CC3DE = mode
#define enable_TIM4_CC2_DMA_request(mode)                                                TIM4_DIERbits.CC2DE = mode
#define enable_TIM4_CC1_DMA_request(mode)                                                TIM4_DIERbits.CC1DE = mode
#define enable_TIM4_update_DMA_request(mode)                                             TIM4_DIERbits.UDE = mode
#define enable_TIM4_trigger_interrupt(mode)                                              TIM4_DIERbits.TIE = mode
#define enable_TIM4_CC4_interrupt(mode)                                                  TIM4_DIERbits.CC4IE = mode
#define enable_TIM4_CC3_interrupt(mode)                                                  TIM4_DIERbits.CC3IE = mode
#define enable_TIM4_CC2_interrupt(mode)                                                  TIM4_DIERbits.CC2IE = mode
#define enable_TIM4_CC1_interrupt(mode)                                                  TIM4_DIERbits.CC1IE = mode
#define enable_TIM4_update_interrupt(mode)                                               TIM4_DIERbits.UIE = mode

#define enable_TIM4_OC1_clear(mode)                                                      TIM4_CCMR1_Outputbits.OC1CE = mode
#define enable_TIM4_OC2_clear(mode)                                                      TIM4_CCMR1_Outputbits.OC2CE = mode
#define enable_TIM4_OC3_clear(mode)                                                      TIM4_CCMR2_Outputbits.OC3CE = mode
#define enable_TIM4_OC4_clear(mode)                                                      TIM4_CCMR2_Outputbits.O24CE = mode

#define enable_TIM4_OC1_preload(mode)                                                    TIM4_CCMR1_Outputbits.OC1PE = mode
#define enable_TIM4_OC2_preload(mode)                                                    TIM4_CCMR1_Outputbits.OC2PE = mode
#define enable_TIM4_OC3_preload(mode)                                                    TIM4_CCMR2_Outputbits.OC3PE = mode
#define enable_TIM4_OC4_preload(mode)                                                    TIM4_CCMR2_Outputbits.OC4PE = mode

#define enable_TIM4_OC1_fast(mode)                                                       TIM4_CCMR1_Outputbits.OC1FE = mode
#define enable_TIM4_OC2_fast(mode)                                                       TIM4_CCMR1_Outputbits.OC2FE = mode
#define enable_TIM4_OC3_fast(mode)                                                       TIM4_CCMR2_Outputbits.OC3FE = mode
#define enable_TIM4_OC4_fast(mode)                                                       TIM4_CCMR2_Outputbits.OC4FE = mode

#define set_TIM4_OC1_compare_mode(value)                                                 do{TIM4_CCMR1_Output &= (~(0x7 << 4));  TIM4_CCMR1_Output |= (value << 4);}while(0)
#define set_TIM4_OC2_compare_mode(value)                                                 do{TIM4_CCMR1_Output &= (~(0x7 << 12));  TIM4_CCMR1_Output |= (value << 12);}while(0)
#define set_TIM4_OC3_compare_mode(value)                                                 do{TIM4_CCMR2_Output &= (~(0x7 << 4));  TIM4_CCMR2_Output |= (value << 4);}while(0)
#define set_TIM4_OC4_compare_mode(value)                                                 do{TIM4_CCMR2_Output &= (~(0x7 << 12));  TIM4_CCMR2_Output |= (value << 12);}while(0)

#define set_TIM4_CC1_selection(value)                                                    do{TIM4_CCMR1_Output &= (~(0x3 << 0));  TIM4_CCMR1_Output |= (value << 0);}while(0)
#define set_TIM4_CC2_selection(value)                                                    do{TIM4_CCMR1_Output &= (~(0x3 << 8));  TIM4_CCMR1_Output |= (value << 8);}while(0)
#define set_TIM4_CC3_selection(value)                                                    do{TIM4_CCMR2_Output &= (~(0x3 << 0));  TIM4_CCMR2_Output |= (value << 0);}while(0)
#define set_TIM4_CC4_selection(value)                                                    do{TIM4_CCMR2_Output &= (~(0x3 << 8));  TIM4_CCMR2_Output |= (value << 8);}while(0)

#define set_TIM4_IC1_input_prescalar(value)                                              do{TIM4_CCMR1_Input &= (~(0x3 << 2));  TIM4_CCMR1_Input |= (value << 2);}while(0)
#define set_TIM4_IC2_input_prescalar(value)                                              do{TIM4_CCMR1_Input &= (~(0x3 << 10));  TIM4_CCMR1_Input |= (value << 10);}while(0)
#define set_TIM4_IC3_input_prescalar(value)                                              do{TIM4_CCMR2_Input &= (~(0x3 << 2));  TIM4_CCMR2_Input |= (value << 2);}while(0)
#define set_TIM4_IC4_input_prescalar(value)                                              do{TIM4_CCMR2_Input &= (~(0x3 << 10));  TIM4_CCMR2_Input |= (value << 10);}while(0)

#define set_TIM4_IC1_filter(value)                                                       do{TIM4_CCMR1_Input &= (~(0xF << 4));  TIM4_CCMR1_Input |= (value << 4);}while(0)
#define set_TIM4_IC2_filter(value)                                                       do{TIM4_CCMR1_Input &= (~(0xF << 12));  TIM4_CCMR1_Input |= (value << 12);}while(0)
#define set_TIM4_IC3_filter(value)                                                       do{TIM4_CCMR2_Input &= (~(0xF << 4));  TIM4_CCMR2_Input |= (value << 4);}while(0)
#define set_TIM4_IC4_filter(value)                                                       do{TIM4_CCMR2_Input &= (~(0xF << 12));  TIM4_CCMR2_Input |= (value << 12);}while(0)

#define set_TIM4_CC1_state_and_polarity(state, polarity)                                 do{TIM4_CCERbits.CC1E = state; TIM4_CCERbits.CC1P = polarity;}while(0)
#define set_TIM4_CC2_state_and_polarity(state, polarity)                                 do{TIM4_CCERbits.CC2E = state; TIM4_CCERbits.CC2P = polarity;}while(0)
#define set_TIM4_CC3_state_and_polarity(state, polarity)                                 do{TIM4_CCERbits.CC3E = state; TIM4_CCERbits.CC3P = polarity;}while(0)
#define set_TIM4_CC4_state_and_polarity(state, polarity)                                 do{TIM4_CCERbits.CC4E = state; TIM4_CCERbits.CC4P = polarity;}while(0)

#define set_TIM4_DMA_burst_length(value)                                                 do{TIM4_DCR &= (~(0x1F << 8));  TIM4_DCR |= (value << 8);}while(0)
#define set_TIM4_DMA_base_address(value)                                                 do{TIM4_DCR &= (~(0x1F << 0));  TIM4_DCR |= (value << 0);}while(0)
