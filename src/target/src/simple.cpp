#include <target/driver.hpp>
#include <utility/config.hpp>
#if COMPILER() == COMPILER_VC()
#   define _Bool bool
    struct INT128 { std::int64_t _[2]; }; 
    struct UINT128 { std::uint64_t _[2]; }; 
#else
#   include <stdbool.h>
#   define INT128 __int128 
#   define UINT128 unsigned __int128 
#endif
#include <stddef.h>

static_assert(sizeof(bool) == 1, "sizeof(bool) != 1");

static_assert(sizeof(char) == 1, "sizeof(char) != 1");
static_assert(sizeof(short) == 2, "sizeof(short) != 2");
static_assert(sizeof(int) == 4, "sizeof(int) != 4");
static_assert(sizeof(long) == 4 || sizeof(long) == 8, "sizeof(long) != 4 && sizeof(long) != 8");

static_assert(sizeof(unsigned char) == 1, "sizeof(unsigned char) != 1");
static_assert(sizeof(unsigned short) == 2, "sizeof(unsigned short) != 2");
static_assert(sizeof(unsigned int) == 4, "sizeof(unsigned int) != 4");
static_assert(sizeof(unsigned long) == 4 || sizeof(unsigned long) == 8, "sizeof(unsigned long) != 4 && sizeof(unsigned long) != 8");

static_assert(sizeof(float) == 4, "sizeof(float) != 4");
static_assert(sizeof(double) == 8, "sizeof(double) != 8");


extern "C" {


char __VERIFIER_nondet_char(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    char n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, com::data_type::SINT8, medium()));
    return n;
}

unsigned char __VERIFIER_nondet_uchar(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    unsigned char n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, com::data_type::UINT8, medium()));
    return n;
}

_Bool __VERIFIER_nondet_bool(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    char n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, com::data_type::BOOLEAN, medium()));
    if (n != 0) {
        return true;
    }
    return false;
}

short __VERIFIER_nondet_short(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    short n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, com::data_type::SINT16, medium()));
    return n;
}

unsigned short __VERIFIER_nondet_ushort(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    unsigned short n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, com::data_type::UINT16, medium()));
    return n;
}

int __VERIFIER_nondet_int(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    int n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, com::data_type::SINT32, medium()));
    return n;
}

unsigned int __VERIFIER_nondet_uint(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    unsigned int n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, com::data_type::UINT32, medium()));
    return n;
}

long __VERIFIER_nondet_long(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    long n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, sizeof(n) == 4 ? com::data_type::SINT32 : com::data_type::SINT64, medium()));
    return n;
}

unsigned long __VERIFIER_nondet_ulong(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    unsigned long n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, sizeof(n) == 4 ? com::data_type::UINT32 : com::data_type::UINT64, medium()));
    return n;
}

long long int __VERIFIER_nondet_longlong(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    long long int n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, sizeof(n) == 4 ? com::data_type::SINT32 : com::data_type::SINT64, medium()));
    return n;
}

unsigned long long int __VERIFIER_nondet_ulonglong(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    unsigned long long int n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, sizeof(n) == 4 ? com::data_type::UINT32 : com::data_type::UINT64, medium()));
    return n;
}

std::size_t __VERIFIER_nondet_size_t(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    std::size_t n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, sizeof(n) == 4 ? com::data_type::UINT32 : com::data_type::UINT64, medium()));
    return n;
}

#if CPU_TYPE() == CPU64()
    INT128 __VERIFIER_nondet_int128(void)
    {
        std::lock_guard<std::mutex> const lock(mutex());
        INT128 n;
        check(io_simple().on_bytes_requested((natural_8_bit*) &n, com::data_type::SINT64, medium()));
        check(io_simple().on_bytes_requested(((natural_8_bit*) &n) + 8, com::data_type::SINT64, medium()));
        return n;
    }

    UINT128 __VERIFIER_nondet_uint128(void)
    {
        std::lock_guard<std::mutex> const lock(mutex());
        UINT128 n;
        check(io_simple().on_bytes_requested((natural_8_bit*) &n, com::data_type::UINT64, medium()));
        check(io_simple().on_bytes_requested(((natural_8_bit*) &n) + 8, com::data_type::UINT64, medium()));
        return n;
    }
#endif

float __VERIFIER_nondet_float(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    float n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, com::data_type::FLOAT32, medium()));
    return n;
}

double __VERIFIER_nondet_double(void)
{
    std::lock_guard<std::mutex> const lock(mutex());
    double n;
    check(io_simple().on_bytes_requested((natural_8_bit*) &n, com::data_type::FLOAT64, medium()));
    return n;
}

// aliases --------------

unsigned char __VERIFIER_nondet_u8(void) { return __VERIFIER_nondet_uchar(); }
unsigned char __VERIFIER_nondet_unsigned_char(void) { return __VERIFIER_nondet_uchar(); }

unsigned short __VERIFIER_nondet_u16(void) { return __VERIFIER_nondet_ushort(); }
unsigned short __VERIFIER_nondet_unsigned_short(void) { return __VERIFIER_nondet_ushort(); }

unsigned int __VERIFIER_nondet_u32(void) { return __VERIFIER_nondet_uint(); }
unsigned int __VERIFIER_nondet_unsigned_int(void) { return __VERIFIER_nondet_uint(); }


}
