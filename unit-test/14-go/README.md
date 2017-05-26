Go
==


Test functions are prefixed by `Test`

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

//FIXME: use CamelCase notation
```

