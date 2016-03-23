#ifndef ILY_INCLUDED
#define ILY_INCLUDED

#include <stdexcept>

// Requirements specification from https://en.wikipedia.org/wiki/Leap_year#Algorithm
// Gregorian calendar (and in the proleptic Gregorian calendar before 1582).
//     if (year is not divisible by 4) then (it is a common year)
//     else if (year is not divisible by 100) then (it is a leap year)
//     else if (year is not divisible by 400) then (it is a common year)
//     else (it is a leap year)

// First working version
bool is_leap_year_stupid(int year)
{
    if (year < 1)
    {
        throw std::out_of_range("Out of range");
    }

    bool common_year = year % 4;
    if (common_year) return false;

    bool leap_year = year % 100;
    if (leap_year) return true;

    common_year = year % 400;
    if (common_year) return false;

    return true;
}

// Possible optimization found by Kevlin
bool is_leap_year_optimized(int year)
{
    if (year <= 0)
        throw std::invalid_argument("year must be positive");

    return !(year % 4) - !(year % 100) + !(year % 400);
}

bool is_leap_year(int year)
{
    return is_leap_year(year);
}

#endif
