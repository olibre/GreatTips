Python
======
<!--.slide: data-background="#252" data-background-transition="zoom"-->


Python Unit Test
----------------

Bibliothèque [unittest](https://docs.python.org/3/library/unittest.html)
(anciennement PyUnit) dont les fonctions de test sont prefixées par `test`.

```python
import unittest

class TestLeapYear(unittest.TestCase):

  def test_A_year_is_not_a_leap_year_if_it_is_not_divisible_by_4(self):
    self.assertFalse(is_leap_year(2015))

  def test_A_year_is_a_leap_year_if_it_is_divisible_by_4_but_not_by_100(self):
    self.assertTrue(is_leap_year(2016))

  def test_A_year_is_not_a_leap_year_if_it_is_divisible_by_100_but_not_by_400(self):
    self.assertFalse(is_leap_year(1900))

  def test_A_year_is_a_leap_year_if_it_is_divisible_by_400(self):
    self.assertTrue(is_leap_year(2000))

if __name__ == '__main__':
    unittest.main()
```


Run Python Unit Test
--------------------

```bash
> python test_leap_year.py
F...
======================================================================
FAIL: test_A_year_is_a_leap_year_if_it_is_divisible_by_400 (__main__.TestLeapYear)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "test_leap_year.py", line 28, in test_A_year_is_a_leap_year_if_it_is_divisible_by_400
    self.assertTrue(is_leap_year(2000))
AssertionError: False is not true

----------------------------------------------------------------------
Ran 4 tests in 0.000s

FAILED (failures=1)

> python test_leap_year.py
....
----------------------------------------------------------------------
Ran 4 tests in 0.000s

OK
```


oktest (python)
---------------

Annotations `@test`.

```python
import unittest
from oktest import ok, test

class TestLeapYear(unittest.TestCase):

  @test("A year is not a leap year if it is not divisible by 4")
  def _(self):
    ok (is_leap_year(2015)) == False

  @test("A year is a leap year if it is divisible by 4 but not by 100")
  def _(self):
    ok (is_leap_year(2016)) == True

  @test("A year is not a leap year if it is divisible by 100 but not by 400")
  def _(self):
    ok (is_leap_year(1900)) == False

  @test("A year is a leap year if it is divisible by 400")
  def _(self):
    ok (is_leap_year(2000)) == True

if __name__ == '__main__':
    unittest.main()
```


Run oktest
----------

```bash
> sudo pip install oktest
Collecting oktest
Installing collected packages: oktest
Successfully installed oktest-0.15.2

> python test_leap_year.py
...F
======================================================================
FAIL: test_004: A year is a leap year if it is divisible by 400 (__main__.TestLeapYear)
A year is a leap year if it is divisible by 400
----------------------------------------------------------------------
Traceback (most recent call last):
  File "test_leap_year.py", line 30, in _
    ok (is_leap_year(2000)) == True
AssertionError: False == True : failed.

----------------------------------------------------------------------
Ran 4 tests in 0.001s

FAILED (failures=1)

> python test_leap_year.py
....
----------------------------------------------------------------------
Ran 4 tests in 0.000s

OK
```


picotest (python)
-----------------

Beautiful !

```python
import picotest
test = picotest.new()

with test("Leap Year"):

  @test("A year is not a leap year if it is not divisible by 4")
  def _():
    assert not is_leap_year(2015)

  @test("A year is a leap year if it is divisible by 4 but not by 100")
  def _():
    assert is_leap_year(2016)

  @test("A year is not a leap year if it is divisible by 100 but not by 400")
  def _():
    assert not is_leap_year(1900)

  @test("A year is a leap year if it is divisible by 400")
  def _():
    assert is_leap_year(2000)

if __name__ == '__main__':
    picotest.main()
```


Run picotest
------------

```bash
> sudo pip install picotest
Collecting picotest
Installing collected packages: picotest
Successfully installed picotest-0.2.0

> python test_leap_year.py
#### test_leap_year.py
* Leap Year
  - [passed] A year is not a leap year if it is not divisible by 4
  - [passed] A year is a leap year if it is divisible by 4 but not by 100
  - [passed] A year is not a leap year if it is divisible by 100 but not by 400
  - [Failed] A year is a leap year if it is divisible by 400
----------------------------------------------------------------------
[Failed] Leap Year > A year is a leap year if it is divisible by 400
  File "test_leap_year.py", line 34, in _
    assert is_leap_year(2000)
AssertionError
----------------------------------------------------------------------
## total:4, passed:3, failed:1, error:0, skipped:0, todo:0

> python test_leap_year.py
Traceback (most recent call last):
  File "test_leap_year.py", line 37, in <module>
    unittest.main()
NameError: name 'unittest' is not defined
[u:/tmp] 1 $ vim test_leap_year.py
[u:/tmp] 46s $ python test_leap_year.py
#### test_leap_year.py
* Leap Year
  - [passed] A year is not a leap year if it is not divisible by 4
  - [passed] A year is a leap year if it is divisible by 4 but not by 100
  - [passed] A year is not a leap year if it is divisible by 100 but not by 400
  - [passed] A year is a leap year if it is divisible by 400
## total:4, passed:4, failed:0, error:0, skipped:0, todo:0
```

