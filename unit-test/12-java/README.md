Java
====


JUnit
-----

JUnit 4: Annotation `@Test` has remplaced prefix `test`.

```java
import org.junit.Test;

public class LeapYearTest {
  @Test
  public void A_year_is_not_a_leap_year_if_it_is_not_divisible_by_4() {
    assertFalse(is_leap_year(2015));
  }
  @Test
  public void A_year_is_a_leap_year_if_it_is_divisible_by_4_but_not_by_100() {
    assertTrue(is_leap_year(2016));
  }
  @Test
  public void A_year_is_not_a_leap_year_if_it_is_divisible_by_100_but_not_by_400() {
    assertFalse(is_leap_year(1900));
  @Test
  public void A_year_is_a_leap_year_if_it_is_divisible_by_400() {
    self.assertTrue(is_leap_year(2000))
  }
}
```


JUnit using a message in assert
-------------------------------

Not really readable.

```java
import org.junit.Test;

public class LeapYearTests {

  public void test_leap_year() {
    assertFalse("A year is not a leap year if it is not divisible by 4",              is_leap_year(2015));
    assertTrue( "A year is a leap year if it is divisible by 4 but not by 100",       is_leap_year(2016));
    assertFalse("A year is not a leap year if it is divisible by 100 but not by 400", is_leap_year(1900));
    assertTrue( "A year is a leap year if it is divisible by 400",                    is_leap_year(2000));
  }
}
```


Spock
-----

TODO

* https://en.wikipedia.org/wiki/Spock_(testing_framework)
* http://spockframework.org
* https://github.com/spockframework


TestNG
------

TODO

* https://en.wikipedia.org/wiki/TestNG
* http://testng.org
* https://github.com/cbeust/testng

