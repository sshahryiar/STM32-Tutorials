#ifndef __stdint_h
#define __stdint_h

#ifdef ME_TYPE_SIZE
// Exact-width signed integer types
typedef signed char        int8_t;
typedef signed int         int16_t;
typedef signed long int    int32_t;
typedef signed long long   int64_t;

// Exact-width unsigned integer types
typedef unsigned char      uint8_t;
typedef unsigned int       uint16_t;
typedef unsigned long int  uint32_t;
typedef unsigned long long uint64_t;

// Minimum-width signed integer types
typedef signed char        int_least8_t;
typedef signed int         int_least16_t;
typedef signed long int    int_least32_t;
typedef signed long long   int_least64_t;

// Minimum-width unsigned integer types
typedef unsigned char      uint_least8_t;
typedef unsigned int       uint_least16_t;
typedef unsigned long int  uint_least32_t;
typedef unsigned long long uint_least64_t;


// Fastest minimum-width signed integer types
typedef signed long int    int_fast8_t;
typedef signed long int    int_fast16_t;
typedef signed long int    int_fast32_t;
typedef signed long long   int_fast64_t;

// Fastest minimum-width unsigned integer types
typedef unsigned long int  uint_fast8_t;
typedef unsigned long int  uint_fast16_t;
typedef unsigned long int  uint_fast32_t;
typedef unsigned long long uint_fast64_t;

// Integer types capable of holding object pointers
typedef signed   long int  intptr_t;
typedef unsigned long int  uintptr_t;

// Greatest-width integer types
typedef signed   long long intmax_t;
typedef unsigned long long uintmax_t;
#else
// Exact-width signed integer types
typedef signed char        int8_t;
typedef signed short       int16_t;
typedef signed int         int32_t;
typedef signed long long   int64_t;

// Exact-width unsigned integer types
typedef unsigned char      uint8_t;
typedef unsigned short     uint16_t;
typedef unsigned int       uint32_t;
typedef unsigned long long uint64_t;

// Minimum-width signed integer types
typedef signed char        int_least8_t;
typedef signed short       int_least16_t;
typedef signed int         int_least32_t;
typedef signed long long   int_least64_t;

// Minimum-width unsigned integer types
typedef unsigned char      uint_least8_t;
typedef unsigned short     uint_least16_t;
typedef unsigned int       uint_least32_t;
typedef unsigned long long uint_least64_t;


// Fastest minimum-width signed integer types
typedef signed  int        int_fast8_t;
typedef signed  int        int_fast16_t;
typedef signed  int        int_fast32_t;
typedef signed long long   int_fast64_t;

// Fastest minimum-width unsigned integer types
typedef unsigned  int      uint_fast8_t;
typedef unsigned  int      uint_fast16_t;
typedef unsigned  int      uint_fast32_t;
typedef unsigned long long uint_fast64_t;

// Integer types capable of holding object pointers
typedef signed    int  intptr_t;
typedef unsigned  int  uintptr_t;

// Greatest-width integer types
typedef signed   long long intmax_t;
typedef unsigned long long uintmax_t;

#endif



// Minimum values of exact-width signed integer types
#define INT8_MIN                   -128
#define INT16_MIN                -32768
#define INT32_MIN          (~0x7fffffff)     // -2147483648 is unsigned
#define INT64_MIN  (~0x7fffffffffffffffll)  // -9223372036854775808 is unsigned

// Maximum values of exact-width signed integer types
#define INT8_MAX                    127
#define INT16_MAX                 32767
#define INT32_MAX            2147483647
#define INT64_MAX  (9223372036854775807ll)

// Maximum values of exact-width unsigned integer types
#define UINT8_MAX                   255
#define UINT16_MAX                65535
#define UINT32_MAX           4294967295u
#define UINT64_MAX (18446744073709551615ull)

// Minimum values of minimum-width signed integer types
#define INT_LEAST8_MIN                   -128
#define INT_LEAST16_MIN                -32768
#define INT_LEAST32_MIN          (~0x7fffffff)
#define INT_LEAST64_MIN  (~0x7fffffffffffffffll)

// Maximum values of minimum-width signed integer types
#define INT_LEAST8_MAX                    127
#define INT_LEAST16_MAX                 32767
#define INT_LEAST32_MAX            2147483647
#define INT_LEAST64_MAX  (9223372036854775807ll)

// Maximum values of minimum-width unsigned integer types
#define UINT_LEAST8_MAX                   255
#define UINT_LEAST16_MAX                65535
#define UINT_LEAST32_MAX           4294967295u
#define UINT_LEAST64_MAX (18446744073709551615ull)

// Minimum values of fastest minimum-width signed integer types
#define INT_FAST8_MIN           (~0x7fffffff)
#define INT_FAST16_MIN          (~0x7fffffff)
#define INT_FAST32_MIN          (~0x7fffffff)
#define INT_FAST64_MIN  (~0x7fffffffffffffffll)

// Maximum values of fastest minimum-width signed integer types
#define INT_FAST8_MAX             2147483647
#define INT_FAST16_MAX            2147483647
#define INT_FAST32_MAX            2147483647
#define INT_FAST64_MAX  (9223372036854775807ll)

// Maximum values of fastest minimum-width unsigned integer types
#define UINT_FAST8_MAX            4294967295u
#define UINT_FAST16_MAX           4294967295u
#define UINT_FAST32_MAX           4294967295u
#define UINT_FAST64_MAX (18446744073709551615ull)

// Minimum value of pointer-holding signed integer type
#define INTPTR_MIN (~0x7fffffff)

// Maximum value of pointer-holding signed integer type
#define INTPTR_MAX   2147483647

// Maximum value of pointer-holding unsigned integer type
#define UINTPTR_MAX  4294967295u

// Minimum value of greatest-width signed integer type
#define INTMAX_MIN  (~0x7fffffffffffffffll)

// Maximum value of greatest-width signed integer type
#define INTMAX_MAX  (9223372036854775807ll)

// Maximum value of greatest-width unsigned integer type
#define UINTMAX_MAX (18446744073709551615ull)


// limits of ptrdiff_t
#define PTRDIFF_MIN (~0x7fffffff)
#define PTRDIFF_MAX   2147483647

// limits of sig_atomic_t
#define SIG_ATOMIC_MIN (~0x7fffffff)
#define SIG_ATOMIC_MAX   2147483647

// limit of size_t
#define SIZE_MAX 4294967295u

// limits of wchar_t
#define WCHAR_MIN   0
#define WCHAR_MAX   65535

// Limits of wint_t
#define WINT_MIN (~0x7fffffff)
#define WINT_MAX 2147483647

// Macros for minimum-width integer constants
#define INT8_C(x)   (x)
#define INT16_C(x)  (x)
#define INT32_C(x)  (x ## l)
#define INT64_C(x)  (x ## ll)

#define UINT8_C(x)  (x ## u)
#define UINT16_C(x) (x ## u)
#define UINT32_C(x) (x ## ul)
#define UINT64_C(x) (x ## ull)

// Macros for greatest-width integer constants
#define INTMAX_C(x)  (x ## ll)
#define UINTMAX_C(x) (x ## ull)

#endif 
// end of stdint.h