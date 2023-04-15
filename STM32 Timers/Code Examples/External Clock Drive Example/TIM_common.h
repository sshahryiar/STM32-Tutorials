/*                Definitions for Timer Modules Modules                */


//Miscellaneous

#define enable                                                                           0x1
#define disable                                                                          0x0

#define true                                                                             0x1
#define false                                                                            0x0

#define high                                                                             0x1
#define low                                                                              0x0

#define on                                                                               0x1
#define off                                                                              0x0

/*      Definitions for TIMx Control Register 1 (TIMx_CR1)        */

//Clock Division (CKD) Constants

#define clock_division_tCK_INT                                                           0x0
#define clock_division_2_x_tCK_INT                                                       0x1
#define clock_division_4_x_tCK_INT                                                       0x2

//Centre-align Mode Selection Constants

#define edge_align_mode                                                                  0x0
#define centre_align_with_interrupts_set_on_down_counting_only                           0x1
#define centre_align_with_interrupts_set_on_up_counting_only                             0x2
#define centre_align_with_interrupts_set_on_both_up_and_down_counting                    0x3

//Counting Direction Constants

#define up_counting                                                                      0x0
#define down_counting                                                                    0x1

//One Pulse Mode Constants

#define counter_not_stopped_at_update_event                                              0x0
#define counter_stops_at_next_update_event                                               0x1

//Update Request Source Constants

#define any_source                                                                       0x0
#define overflow_or_underflow                                                            0x1


/*      Definitions for TIMx Control Register 2 (TIMx_CR2)        */

//TI1 Selection Constants

#define TIMx_CH1_pin_connected_to_TI1_input                                              0x0
#define TIMx_CH1_CH2_CH3_pins_connected_to_TI1_input_XOR_combination                     0x1

//TIM1 & 8 Capture/Compare Preloaded Control

#define CCxE_CCxNE_OCxM_not_preloaded                                                    0x0
#define CCxE_CCxNE_OCxM_preloaded                                                        0x1

//Master Mode Selection Constants

#define reset                                                                            0x0
#define enable                                                                           0x1
#define update                                                                           0x2
#define compare_pulse                                                                    0x3
#define compare_OC1REF                                                                   0x4
#define compare_OC2REF                                                                   0x5
#define compare_OC3REF                                                                   0x6
#define compare_OC4REF                                                                   0x7

//Capture/Compare DMA Selection Constants

#define CCx_DMA_request_sent_on_CCx_event                                                0x0
#define CCx_DMA_request_sent_on_update_event                                             0x1


/*      TIMx Slave Mode Control Register (TIMx_SMCR)       */

//External Trigger Polarity Constants

#define non_inverted                                                                     0x0
#define inverted                                                                         0x1

//External Trigger Prescaler Constants

#define no_prescaler                                                                     0x0
#define ETRP_div_2                                                                       0x1
#define ETRP_div_4                                                                       0x2
#define ETRP_div_8                                                                       0x3

//Master/Slave Mode Constants

#define no_action                                                                        0x0
#define action_delayed                                                                   0x1

//Trigger Selection Constants

#define ITR0                                                                             0x0
#define ITR1                                                                             0x1
#define ITR2                                                                             0x2
#define ITR3                                                                             0x3
#define TI1_edge_detector                                                                0x4
#define Filtered_Timer_Input_1                                                           0x5
#define Filtered_Timer_Input_2                                                           0x6
#define ETRF                                                                             0x7

//Slave Mode Selection Constants

#define disabled                                                                         0x0
#define encoder_mode_1                                                                   0x1
#define encoder_mode_2                                                                   0x2
#define encoder_mode_3                                                                   0x3
#define reset_mode                                                                       0x4
#define gated_mode                                                                       0x5
#define trigger_mode                                                                     0x6
#define external_clock_mode_1                                                            0x7


/*      TIMx Capture/Compare Mode Register 1 (TIMx_CCMR1) as Output      */

//Output Compare Mode Constants

#define frozen                                                                           0x0
#define set_to_active_level_on_match                                                     0x1
#define set_to_inactive_level_on_match                                                   0x2
#define toggle_on_match                                                                  0x3
#define force_inactive_level                                                             0x4
#define force_active_level                                                               0x5
#define PWM_mode_1                                                                       0x6
#define PWM_mode_2                                                                       0x7


/*      TIMx Capture/Compare Mode Register 1 (TIMx_CCMR1) as Input      */

//Input Capture Prescaler Constants

#define no_prescalar                                                                     0x0
#define capture_once_every_2_events                                                      0x1
#define capture_once_every_4_events                                                      0x2
#define capture_once_every_8_events                                                      0x3


//Definitions for CC I/O mapping and direction (common)

#define CC1_output                                                                       0x0
#define CC1_input_IC1_on_TI1                                                             0x1
#define CC1_input_IC1_on_TI2                                                             0x2
#define CC1_input_IC1_on_TRC                                                             0x3

#define CC2_output                                                                       0x0
#define CC2_input_IC2_on_TI2                                                             0x1
#define CC2_input_IC2_on_TI1                                                             0x2
#define CC2_input_IC2_on_TRC                                                             0x3

#define CC3_output                                                                       0x0
#define CC3_input_IC1_on_TI3                                                             0x1
#define CC3_input_IC1_on_TI4                                                             0x2
#define CC3_input_IC1_on_TRC                                                             0x3

#define CC4_output                                                                       0x0
#define CC4_input_IC2_on_TI4                                                             0x1
#define CC4_input_IC2_on_TI3                                                             0x2
#define CC5_input_IC2_on_TRC                                                             0x3


/*      TIMx Capture/Compare Enable Register (TIMx_CCER)      */

//Input Polarity Constants

#define rising_edge                                                                      0x0
#define falling_edge                                                                     0x1

//Output Polarity Constants

#define active_high                                                                      0x0
#define active_low                                                                       0x1


/*      TIM1&TIM8 Break and Dead-time Register (TIMx_BDTR)      */

//Lock Constants

#define lock_off                                                                         0x0
#define lock_lvl_1                                                                       0x1
#define lock_lvl_2                                                                       0x2
#define lock_lvl_3                                                                       0x3