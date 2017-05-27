Go
==
<!--.slide: data-background="#226" data-background-transition="zoom"-->


Test functions: `Test*`

```go
import "testing"

func Test_a_year_is_not_a_leap_year_if_it_is_not_divisible_by_4(t *testing.T) {
    if is_leap_year(2015) { t.Error(""); }
}

func A_year_is_a_leap_year_if_it_is_divisible_by_4_but_not_by_100(t *testing.T) {
    if is_leap_year(2016) == false { t.Error(""); }
}

func Test_A_year_is_not_a_leap_year_if_it_is_divisible_by_100_but_not_by_400(t *testing.T) {
    if is_leap_year(1900) { t.Error(""); }
}

func Test_A_year_is_a_leap_year_if_it_is_divisible_by_400(t *testing.T) {
    if is_leap_year(2000) == false { t.Error(""); }
}
```


Go spirit is to use CamelCase notation

```go
import "testing"

func TestAYearIsNotALeapYearIfItIsNotDivisibleBy4(t *testing.T) {
    if isLeapYear(2015) { t.Error(""); }
}

func AYearIsALeapYearIfItIsDivisibleBy4ButNotBy100(t *testing.T) {
    if isLeapYear(2016) == false { t.Error(""); }
}

func TestAYearIsNotALeapYearIfItIsDivisibleBy100ButNotBy400(t *testing.T) {
    if isLeapYear(1900) { t.Error(""); }
}

func TestAYearIsALeapYearIfItIsDivisibleBy400(t *testing.T) {
    if isLeapYear(2000) == false { t.Error(""); }
}
```

