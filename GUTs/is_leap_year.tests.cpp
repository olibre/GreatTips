#include "is_leap_year.hpp"
#include <gtest/gtest.h>

using namespace ::testing;

// Requirements specification from https://en.wikipedia.org/wiki/Leap_year#Algorithm
// Gregorian calendar (and in the proleptic Gregorian calendar before 1582).
//     if (year is not divisible by 4) then (it is a common year)
//     else if (year is not divisible by 100) then (it is a leap year)
//     else if (year is not divisible by 400) then (it is a common year)
//     else (it is a leap year)

TEST(is_leap_year, years_not_divisible_by_4_are_not_leap_years)
{
    ASSERT_FALSE( is_leap_year( 7) );
    ASSERT_FALSE( is_leap_year(17) );
    ASSERT_FALSE( is_leap_year(27) );
    ASSERT_FALSE( is_leap_year(37) );
    ASSERT_FALSE( is_leap_year(77) );

    ASSERT_FALSE( is_leap_year(1997) );
    ASSERT_FALSE( is_leap_year(1998) );
    ASSERT_FALSE( is_leap_year(1999) );
    ASSERT_FALSE( is_leap_year(2001) );
    ASSERT_FALSE( is_leap_year(2002) );
    ASSERT_FALSE( is_leap_year(2003) );
}


TEST(is_leap_year, years_divisible_by_4_but_not_by_100_are_leap_years)
{
    ASSERT_TRUE( is_leap_year(1704) );
    ASSERT_TRUE( is_leap_year(1808) );
    ASSERT_TRUE( is_leap_year(1916) );
    ASSERT_TRUE( is_leap_year(2004) );
    ASSERT_TRUE( is_leap_year(2008) );
    ASSERT_TRUE( is_leap_year(2012) );
    ASSERT_TRUE( is_leap_year(2016) );
}

TEST(is_leap_year, years_divisible_by_100_but_not_by_400_are_not_leap_years)
{
    ASSERT_FALSE( is_leap_year(1700) );
    ASSERT_FALSE( is_leap_year(1800) );
    ASSERT_FALSE( is_leap_year(1900) );
    ASSERT_FALSE( is_leap_year(2100) );
    ASSERT_FALSE( is_leap_year(2200) );
    ASSERT_FALSE( is_leap_year(2300) );
    ASSERT_FALSE( is_leap_year(2500) );
}

// Valid years are greater or equal to 1
// Function must throw exception is year is invalid
TEST(is_leap_year, years_less_than_one_are_invalid)
{
    ASSERT_ANY_THROW(is_leap_year(-1));
    ASSERT_ANY_THROW(is_leap_year(0));
    ASSERT_NO_THROW(is_leap_year(1));
}

