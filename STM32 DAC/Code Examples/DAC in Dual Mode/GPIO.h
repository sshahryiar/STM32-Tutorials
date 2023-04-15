//I/O Modes

#define input_mode                                                                       0x00
#define output_mode_low_speed                                                            0x02
#define output_mode_medium_speed                                                         0x01
#define output_mode_high_speed                                                           0x03

//I/O Configurations

#define GPIO_PP_output                                                                   0x00
#define GPIO_open_drain_output                                                           0x04
#define AFIO_PP_output                                                                   0x08
#define AFIO_open_drain_output                                                           0x0C

#define analog_input                                                                     0x00
#define floating_input                                                                   0x04
#define input_without_pull_resistors                                                     0x04
#define digital_input                                                                    0x08

//Pull Resistor Configurations

#define pull_down                                                                        0x00
#define pull_up                                                                          0x01

//Miscellaneous

#define enable                                                                           0x01
#define disable                                                                          0x00

#define true                                                                             0x01
#define false                                                                            0x00

//CR Register Configuration Macro

#define pin_configure_low(reg, pin_no, io_type)                                          do{reg &= (~(0xF << (pin_no << 2))); reg |= (io_type << (pin_no << 2));}while(0)
#define pin_configure_high(reg, pin_no, io_type)                                         do{reg &= (~(0xF << ((pin_no - 8) << 2))); reg |= (io_type << ((pin_no - 8) << 2));}while(0)

//Bitwise Operations for GPIOs

#define bit_set(reg, bit_value)                                                          (reg |= (1 << bit_value))
#define bit_clr(reg, bit_value)                                                          (reg &= (~(1 << bit_value)))
#define get_bits(reg, mask)                                                              (reg & mask)
#define get_input(reg, bit_value)                                                        (reg & (1 << bit_value))

//Pull Resistor Functions

#define pull_up_enable(reg, pin_no)                                                      (reg |= (1 << pin_no))
#define pull_down_enable(reg, pin_no)                                                    (reg &= (~(1 << pin_no)))

//GPIO Enabling Functions

#define enable_GPIOA(mode)                                                               RCC_APB2ENRbits.IOPAEN = mode
#define enable_GPIOB(mode)                                                               RCC_APB2ENRbits.IOPBEN = mode
#define enable_GPIOC(mode)                                                               RCC_APB2ENRbits.IOPCEN = mode
#define enable_GPIOD(mode)                                                               RCC_APB2ENRbits.IOPDEN = mode
#define enable_GPIOE(mode)                                                               RCC_APB2ENRbits.IOPEEN = mode
#define enable_GPIOF(mode)                                                               RCC_APB2ENRbits.IOPFEN = mode
#define enable_GPIOG(mode)                                                               RCC_APB2ENRbits.IOPGEN = mode