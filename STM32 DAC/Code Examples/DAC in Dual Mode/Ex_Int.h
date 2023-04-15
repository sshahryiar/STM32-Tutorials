//External interrupt-related functions

#define interrupt_mask(val)                           EXTI_IMR |= (1 << val)
#define event_mask(val)                               EXTI_EMR |= (1 << val)
#define rising_edge_selector(val)                     EXTI_RTSR |= (1 << val)
#define falling_edge_selector(val)                    EXTI_FTSR |= (1 << val)
#define software_interrupt_event_trigger(val)         EXTI_SWIER |= (1 << val)
#define pending_clr(val)                              EXTI_PR |= (1 << val)
#define read_pending_reg(val)                         (EXTI_PR & (1 << val))