// Copyright (c) 2016 Kevlin Henney

#include "is_leap_year.hpp"
#include <gtest/gtest.h>
#include <limits>
#include <stdexcept>

using namespace ::testing;

TEST(A_year_is_not_a_leap_year, if_it_is_not_divisible_by_4)
{
    ASSERT_FALSE(is_leap_year(2015));
}

TEST(A_year_is_a_leap_year, if_it_is_divisible_by_4_but_not_by_100)
{
    ASSERT_TRUE(is_leap_year(2016));
}

TEST(A_year_is_not_a_leap_year, if_it_is_divisible_by_100_but_not_by_400)
{
    ASSERT_FALSE(is_leap_year(1900));
}

TEST(A_year_is_a_leap_year, if_it_is_divisible_by_400)
{
    ASSERT_TRUE(is_leap_year(2000));
}

TEST(A_year_is_not_in_the_valid_domain, if_it_is_0)
{
    ASSERT_THROW(is_leap_year(0), std::invalid_argument);
}

TEST(A_year_is_not_in_the_valid_domain, if_it_is_negative)
{
    ASSERT_THROW(is_leap_year(-1), std::invalid_argument);
}

TEST(A_year_is_in_the_valid_domain, if_it_is_the_maximum_integer_value)
{
    ASSERT_NO_THROW(is_leap_year(std::numeric_limits<int>::max()));
}
