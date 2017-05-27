Un peu de pratique
==================
<!--.slide: data-background="#007" data-background-transition="zoom"-->

*Sortez vos claviers &emsp; ;-)*


Put theory into practice
------------------------

### Une année est [**bissextile**](http://fr.wikipedia.org/wiki/Année_bissextile#Règle_actuelle) :

* si l'année est divisible par 4  
  et non divisible par 100
* ou si l'année est divisible par 400

        bool is_leap_year(int year);

-------------------

Exercice : **Coder**


Par où commencer ?
------------------

**Écrire les tests unitaires** <!--.element: class="fragment"-->


Test the function `is_leap_year()`
---------------------------------

Is this test a good idea?

```cpp
test()
{
  // Test all years until 10'000
  for (int y=1; y<10*1000; ++y)
  {
    bool leap;
    if (y % 4)
      leap = false;
    else
      leap = y % 100 ? true : y % 400;

    // Check if same result
    actual = is_leap_year(y);
    ASSERT_EQUAL(leap, actual);
  }
}
```


Implement `is_leap_year()`
-------------------------

```cpp
bool is_leap_year (int year)
{
  bool leap; // value to return

  if (year % 4) leap = false;
  else leap = year % 100 ? true : year % 400;

  return leap;
}
```

* The feature uses the same implementation as the test!
* Finally, what is the added value of the test?


Just test some cases
--------------------

```cpp
test()
{
  ASSERT_FALSE( is_leap_year(   7) );
  ASSERT_FALSE( is_leap_year(  17) );
  ASSERT_FALSE( is_leap_year(2002) );
  ASSERT_FALSE( is_leap_year(2003) );
  ASSERT_FALSE( is_leap_year(1700) );
  ASSERT_FALSE( is_leap_year(1800) );
  ASSERT_FALSE( is_leap_year(1900) );
  ASSERT_FALSE( is_leap_year(2100) );
  ASSERT_TRUE(  is_leap_year(1704) );
  ASSERT_TRUE(  is_leap_year(1916) );
  ASSERT_TRUE(  is_leap_year(2012) );
  ASSERT_TRUE(  is_leap_year(2016) );
}
```

* Is this a good way of testing?
* What can be improved?


With comments
-------------

```cpp
test()
{
  // Not Divisible by 4
  ASSERT_FALSE( is_leap_year(   7) );
  ASSERT_FALSE( is_leap_year(  17) );
  ASSERT_FALSE( is_leap_year(2002) );
  ASSERT_FALSE( is_leap_year(2003) );

  // Multiple of 100 except 400
  ASSERT_FALSE( is_leap_year(1700) );
  ASSERT_FALSE( is_leap_year(1800) );
  ASSERT_FALSE( is_leap_year(1900) );
  ASSERT_FALSE( is_leap_year(2100) );

  // Rest
  ASSERT_TRUE(  is_leap_year(1704) );
  ASSERT_TRUE(  is_leap_year(1916) );
  ASSERT_TRUE(  is_leap_year(2012) );
  ASSERT_TRUE(  is_leap_year(2016) );
}
```


One unit test = One expectation
-------------------------------

[Roy Osherove](http://programmers.stackexchange.com/questions/7823) (2010)

> **Unit tests should fail for exactly one reason.**  
> That’s why you should use one assert per unit test.

[He has also added](http://www.owenpellegrin.com/blog/testing/how-do-you-solve-multiple-asserts/ "How do you solve multiple asserts?") (2010)

> Test one logical CONCEPT per test.  
> You can have multiple asserts on the same object.  
> They will usually be the same concept being tested.

|        | Unit Test                             | Feature
|--------|---------------------------------------|------------------
|**Bad** | `big_test()`                          |-> `is_leap_year()`
|**Good**| `test1()`<br> `test2()`<br> `test3()` |-> `is_leap_year()`


One feature = multiple test cases
---------------------------------

### Original idea

Unit Tests|    Code
----------|---------------
`test1()` | -> `feature1()`
`test2()` | -> `feature2()`
`test3()` | -> `feature3()`

### Idea *One unit test = One expectation*

Unit Tests                                                 |   Code
-----------------------------------------------------------|---------------
`test11()`<br>`test12()`<br>`test13()`<br>`test14()`<br>...| -> `feature1()`
`test21()`<br>`test22()`<br>`test23()`<br>`test24()`<br>...| -> `feature2()`
`test31()`<br>`test32()`<br>`test33()`<br>`test34()`<br>...| -> `feature3()`


Split big test function
-----------------------

```cpp
test_not_divisible_by_4_is_not_leap()
{
  ASSERT_FALSE( is_leap_year(   7) );
  ASSERT_FALSE( is_leap_year(  17) );
  ASSERT_FALSE( is_leap_year(2002) );
  ASSERT_FALSE( is_leap_year(2003) );
}

test_multiple_of_100_except_400_is_not_leap()
{
  ASSERT_FALSE( is_leap_year(1700) );
  ASSERT_FALSE( is_leap_year(1800) );
  ASSERT_FALSE( is_leap_year(1900) );
  ASSERT_FALSE( is_leap_year(2100) );
}

test_rest_is_leap()
{
  ASSERT_TRUE(  is_leap_year(1704) );
  ASSERT_TRUE(  is_leap_year(1916) );
  ASSERT_TRUE(  is_leap_year(2012) );
  ASSERT_TRUE(  is_leap_year(2016) );
}
```
