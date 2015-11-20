%C++ Coding Rules  
 <small>
 *Lovely rules for happy developers!*  
 Version: xxxxxxx
 </small>
%olibre <olibre@Lmap.org>
%date  

# Main goal

## Audience

This document is written by developers for developers.  
Here *We* means *We delevopers* (*Nous, les développeurs*).

## Rationale

We all hate coding rules, often written by poor programmers with weak experience with C++.
Coding rules become outdated, may not be understood by their users, and do not always provide guidance.

But a minimum of rules are required for source code consistency accross our projects.

Therefore, this document aims to provide *lovely rules for happy devs*:

* Minimum set of flexible rules for source code consistency
* Minimum set of useful coding guidelines
* Links to other C++ rules/guidelines

## Exceptions

* Generated code from third party frameworks (e.g. Qt-Creator)
* Code written in consistency with above generated code

## Continuous improvement

Please keep uptodate this current document and propose to add/remove/clarify/simplify rules.
These rules are not static and will evolve thanks to you.

Please contibute to this document. We, developers, prefer an helpful guide rather than a list of restrictions.
Please edit this MarkDown document on [GitHub project](https://github.com/olibre/CppCoding/edit/master/cpp/rules.md).



# Files

## `F.SRC` &nbsp; C++ filename is `ClassName.[hc]pp`

* Extensions are `.hpp` and `.cpp` only (No `.h` or `.cc` or `.inl`)
* Same name as the main class within the file

```cpp
class MyNewClass -> MyNewClass.hpp // C++ header
                    MyNewClass.cpp // C++ implementation
// Good
MsgProcessorV4.cpp
ISession.hpp
ISession.cpp
MyNewClass.cpp

// Bad
MsgProcessorV4.cc    // C++ source must be '*.cpp'
ISession.h           // C++ header must be '*.hpp'
isession.cpp         // Must be same as the class name
My_New_Class.cpp     // Must be same as the class name
```

## `F.RST` &nbsp; Rest in `lower_case`

Directory/File names

* lowercase `[a-z]` and digits `[0-9]`
* underscore `'_'` to delimite words
* except for C++, `Makefile`, `CMakeLists.txt` ...

```cpp
// Good
core_technology/ccg/foo_configuration.xml

// Bad
coreTechnology/Ccg/fooconfiguration.xml
```

## `F.GRD` &nbsp; Header-guard `#define FILE_HPP_`

* Every header file has a Header-guard
* Use `#ifndef`/`#define`/`#endif`
* No `pragma once` (See [StackOverflow](http://stackoverflow.com/a/26908048/938111))
* Format is `<ROOTDIR>_<SUBDIR>_<FILE_NAME>_HPP_` to guaranty uniqueness
* Underscores `'_'` can be inserted in `<FILE_NAME>` to separate words
* Automatic script can be used to append/fix header-guards
* As reminder the macro name has some constraints. Extract from [cppreference.com/Identifiers](http://en.cppreference.com/w/cpp/language/identifiers):

    > * the identifiers with a double underscore anywhere are reserved
    > * the identifiers that begin with an underscore followed by an uppercase letter are reserved

**Example for file: `ct/ccg/ISessionV4.hpp`**

```cpp
#ifndef CT_CCG_ISESSION_V4_HPP_
#define CT_CCG_ISESSION_V4_HPP_
...
...
#endif  // CT_CCG_ISESSION_V4_HPP_
```

## `F.CPR` &nbsp; Copyright every file

* Copyright every ASCII file (not only C++ files)
* Automatic script can be used to append/fix copyright banners

```cpp
/** 
* \copyright Copyright (c) 2015-2016 XXXXXXXX
*            All Rights Reserved
*            DO NOT ALTER OR REMOVE THIS COPYRIGHT NOTICE
* 
* \file <filename>
* \brief <description of file purpose>
* ...
*/
```

## `F.DXG` &nbsp; Doxygen compliance

1. Doxygen comment at the top of every C++ file  
   (brief description and [copyright](#f04---copyright-every-file))
2. Doxygen comment for class, method, and function in the header file  
   (see [doxygen.org](http://www.doxygen.org/))
3. No need to duplicate Doxygen comments in the `*.cpp` file

## `F.TDO` &nbsp; Use `FIXME TODO TOREVIEW`

* Write `FIXME`/`TODO`/`TOREVIEW` in source code when neccessary
* Format `"TODO (name@example.com): reason"`
* Follow/Complete them (in an acceptable time)

| Comment    | Flagged in Jenkins as             |
| ---------- | --------------------------------- |
| `FIXME`    | priority "high"                   |
| `TODO`     | priority "normal"                 |
| `TOREVIEW` | priority "low"                    |

Note: `TOREVIEW` means *"please review this code with special attention"*, regardless of the usual review process.


Rationale:

 * It is important to note where work needs to be done versus work that was forgotten.
 * It is equally important to note what work needs to be done, along with the contact information for the developer that is responsible for the work.
 * Ideally a limit date of completion should be provided for follow-ups.

```cpp
// Formatting
blabla; // TODO (youremail@address): What needs to be done
blabla; // TODO: Deadline MM/DD/YYYY

// Good
blabla; // TODO (johndoe@nyx.com): Update function to provide concatenation operator
blabla; // TODO: Deadline November 2012.
/**
 * TODO (janedoe@nyx.com): Remove 32-bits ID once all clients have migrated to 64-bit ID
 */

// Bad
blabla; // TODO
blabla; // todo: refactor blabla
```

## `F.IDT` &nbsp; Allman indentation style

* [Allman][] is the formatting style within the source code repositories
* Indentation is 4 spaces because this is the most adopted convetion (default settings for many IDEs)
* Allman-formating script can be used while committing code source on repository
* [Kernighan & Ritchie][K&R]/[1TBS][] styles may be used for short block (a couple of lines)

  [Allman]: https://en.wikipedia.org/wiki/Indent_style#Allman_style  "BSD / Eric Allman style"
  [K&R]:    https://en.wikipedia.org/wiki/Indent_style#K.26R_style   "Kernighan & Ritchie"
  [1TBS]:   https://en.wikipedia.org/wiki/Indent_style#Variant:_1TBS "the one true brace style"

**Hybrid Allman/1TBS using 4 spaces identation**

```cpp
#include <iostream>

int main (int argc, char *argv[])
{
    // Good: Allman style
    if (argc > 1)
    {
        std::cout << argv[1] << std::e ndl;
    }

    for (int i = 0; i < 9; ++i)
    {
        if (i == 5)  continue;  // Oneline accepted but not nice to debug

      // 1TBS accepted for tiny blocks
      if ((i % 2) != 0) {
        std::cout << i << std::endl;
      }

      // 1TBS also accepted here but block should stay tiny
      if (i > 5) {
        std::cout << 9 - i << std::endl;
      } else {
        std::cout << 2 + i << std::endl;
      }
    }

    return 0;
}
```

## `F.80C` &nbsp; Keep line length acceptable

The [80 column rule][] is still common in coding standards today (for example: [Google's Java][] and [Linux kernel][] standards).

Do not worry, there is no such limit in our coding rules.

However keeping lines short is nice:

* Code written using short lines is often easier to read/understand
* But alignment is often more important than *pseudo-cosmetic* rules
* Lines necessary short when printed for code review (prevent ugly wrapping)
* 3-way diff/merge is difficult when lines are too wide

![Image of a merge using a 3-way diff](three-way-diff.png)

  [80 column rule]: http://programmers.stackexchange.com/a/148729/81263
  [Google's Java]:         https://google-styleguide.googlecode.com/svn/trunk/javaguide.html#s4.4-column-limit
  [Linux kernel]:          https://www.kernel.org/doc/Documentation/CodingStyle


## `F.WSP` &nbsp; No trailing whitespaces

When some devs leave trailing spaces and others remove them,
the repository becomes to be polluted by these unrelevant changes.
In order to avoid this noise, we can remove trailing whitespaces before/during commit.

* No space or tabs at the line end for every ASCII file  
  (except some special meaning as for hard-break-line in Markdown)
* Automatic Git hook may fix or reject commit having trailing whitespaces
* Most of IDEs can be configured to remove trailing whitespaces on save
    - Emacs: `show-trailing-spaces` and `delete-trailing-spaces`
* Command lines (can be used to atomatically fix source code)
    - `grep '\s\+$' --color -lR src_dir` to list bad files
    - `GREP_COLORS='mt=;41' grep '\s\+$' --color -n9 file.cpp` to hightlight trailing spaces
    - `sed 's/[ \t]*$//' -i file.cpp` to remove trailing whitespaces

## `F.EOL` &nbsp; Line Feed `"\n"` (LF)

When some devs work on MS-Windows and others on Unix platforms,
ASCII files may contain both [End Of Line](https://en.wikipedia.org/wiki/Newline):
* **Good**: BSD/GNU/Linux/Mac/... use Line Feed `"\n"` (LF)
* **Bad**: MS-Windows use by default CR+LF `"\r\n"`

Rules for every ASCII file:
* Use only Line Feed `"\n"` (LF)
* No Carriage Return `"\r"` (CR)
* Automatic Git hook may fix or reject commit containing CR `"\r"`
* Configure your IDE to use Line Feed `"\n"` (LF) only
* Command lines (can be used to atomatically fix source code)
    - `grep '\r' --color -lR src_dir` to list bad files
    - `GREP_COLORS='mt=;41' grep '\r' --color -n9 file.cpp` to display bad lines
    - `dos2unix file.cpp` to convert CR+LF to LF
    - `tr -d '\r' <file.cpp >file.new && mv file.new file.cpp` if `dos2unix` is not available
    - `tr -d '\r' <file.cpp | sponge file.cpp` if you `yum install moreutils`

## `F.EOF` &nbsp; Clean end of file

When a file is cut (end of file is missing), a simple trick is to check

In order to detect a potential file corruption
(i.e. when the end of the file is missing),
we usually check the last character of the file.
File can be considered as OK when its last character is a *newline*.

Moreover final blank lines are not necessary
and some devs may clean them produising some noise
within the commit diff.

Rules:
* Every ASCII-based file ends with a Line Feed `"\n"` (LF)
* No unnecessary final blank lines
* Automatic Git hook may fix or reject commit missing final `"\n"`
* Most of IDEs already take care of the final newline character and my warn if missing
* Command lines (can be used to atomatically fix source code)
    - `echo "$(< file.cpp)" > file.new && mv file.new file.cpp` to clean unecessary final blank lines and append a final newline if missing
    - `echo "$(< file.cpp)" | sponge file.cpp` if you `yum install moreutils`

See also Clang compiler option `-Wnewline-eof`.



# Naming

Main idea:

* All in `UPPER_CASE` => Macros and Constants
* `CamelCase` (first letter UPPERCASE) => Types
* `camelCase` (first letter lowercase) and `lower_case` => Functions and Variables
* No [Hungarian notation][] as modern IDEs display underlying types

  [Hungarian notation]: https://en.wikipedia.org/wiki/Hungarian_notation#Examples


## `N.MCR` &nbsp; Macro in `UPPER_CASE`

* Prefer C++ features (i.e. `template` functions)
* Avoid macros (pre-processor) when possible
* If macros are used:
    - Name in UPPERCASE.
    - Underscore `'_'` to delemit words.

```cpp
// Good
#define FIND_ROOT(x)
#define PI_ROUNDED 3.14
#ifdef BIG_ENDIAN

// Bad
#define FINDROOT(x)
#define piRounded 3.14
#ifdef BigEndian
```

## `N.CST` &nbsp; Constant/Enum in `UPPER_CASE`

* UPPERCASE letters
* Underscore `'_'` to delemit words
* `enum class` values can use `CamelCase` notation (C++11)
  (less ambiguity due to `EnumName::` prefix)
* Avoid `#define` when possible
* Prefer `const` than `enum`
* Prefer `constexpr` than `const` (C++11)
* Consider using [unnammed-`namespace`](http://stackoverflow.com/a/4422554/938111) instead of `static`
  (see last lines below)

```cpp
// Bad
#define       max_counter   20     // Name must be UPPER_CASE
const int32_t iMaxCounter = 20;

// Correct
#define MAX_COUNTER 20

// Good
enum {               MAX_COUNTER = 20 };
const        int32_t MAX_COUNTER = 20;
static const int32_t MAX_COUNTER = 20;

// Better
constexpr int32_t MAX_COUNTER = 20;

// unnammed-namespace is better than above 'static const'
namespace
{
const        int32_t MAX_COUNTER = 20; // Link is external in C++03 and internal since C++11
static const int32_t MAX_COUNTER = 20; // Link is internal for both
}
```

See also [codeproject.com/The One Definition Rule in C++11 and C++14: Constant Expressions and Inline Functions](http://www.codeproject.com/Articles/762413/The-One-Definition-Rule-in-Cplusplus-and-Cplusplus).


## `N.TYP` &nbsp; Types in `CamelCase`

* User-defined `class`/`struct`/`union`/`enum` names in `CamelCase`
* Underscore `'_'` should not be required, but can be accepted
* But notation `lower_case` can still be used for low-level/utility/technical libs  
  (as containers or like other components provided by boost/STL)
* Suffix `*_t` can be used for nested types only   
  (in global scope: reserved for potential future C++ standard types)
* Use an *ending comment* for long declaration (automatic script may detect/fix this)

```cpp
// Good
struct Session;
class  CcgSession;

class MyNewClass
{
  // .. lots of lines

}; // end of MyNewClass

// Bad
struct session;
class ccg_session;
class myNewClass;
```

## `N.ITF` &nbsp; Interface in `ICamelCase`

* Prefix UPPERCASE `‘I’` the classes specifing an interface (pure abstract class)
  <small>(See also [corresponding question on StackExchange][])</small>.

```cpp
// Good
IReactor;
ISession;
ICcgSession;
IMsgProcessor;

// Bad
Ireactor;
isession;
I_Ccg_Session;
imsgprocessor;
```

  [corresponding question on StackExchange]: http://programmers.stackexchange.com/questions/117348

## `N.FCN` &nbsp; Function in `camelCase`

* Start with a lowercase word, a verb when possible
* Mixed case for multi-word names (`camelCase`)
* Underscore `'_'` is also accepted if consistent (`lower_case`)
* No redundancy of the class name within the method name

```cpp
// Good
class Acceptor
{
public:
  int32_t initialize();
  int32_t getValue();
  int32_t findValue();
  int32_t setValue();
};

// Bad
class Acceptor
{
public:
  int32_t initializeAcceptor();  // Redundancy name of the class
  int32_t GetValue();            // First word is not full lowercase
  int32_t find_value();          // Can be accepted if consistent with the whole
  int32_t setvalue();            // Missing Capital on second word
};
```

## `N.PRM` &nbsp; Function parameter in `camelCase`

* Start with a lowercase word
* Mixed case for multi-word names (`camelCase`)
* Underscore `'_'` can be accepted if consistent with the whole (`lower_case`)
* Unused parameter should be commented
  e.g. `int32_t half(int32_t qty, bool /*force*/) { return qty/2; }`

## `N.LCL` &nbsp; Local variable in `camelCase`

* As our functions are small, we do not need a naming trick to distinguish function parameters and local variables
* Same `camelCase/lower_case` rule as for [function parameter](#n06---function-parameter-in-camelcase)

```cpp
// Good
Session session1;
MyClass myClass;

// Bad
Session Session1; // Name must start with a lowercase letter
MyClass my_class; // Can be accepted if consistent
```

## `N.STR` &nbsp; Struct data member in `camelCase`   <a name="NamingDataStruct"></a>

* Same as above [`camelCase/lower_case` rule](#n06---function-parameter-in-camelcase)
* No redundancy of the `struct` name within the member name

```cpp
struct Limit
{
  int32_t quantity;    // Good
  double  price;       // Good
  double  limitPrice;  // Bad - Duplicated word 'limit' with struct name
  bool    isActive;
};
```

## `N.CLS` &nbsp; Class data member in `_camelCase`

* Same rule as above [`struct` member](#n08---struct-data-member-in-camelcase) but prefixed with an underscore `'_'`
* This rule may not be applied to `static` members and other special members

Rationale:

 * By convention `struct` has `public` data and provides no or few functions
 * In constrast, `class` has `private` data and provides many functions
 * This rule avoids messing the *Auto-Completion* on `class` between data (private) and functions (public)
 * This rule allows *Auto-Completion* to separate data/functions (arranged in alphabetical order)
 * Developer knows if he/she wants to see the list of data memebers or the list of functions
 * Prefix by `"_" + lowercase` is *less* reserved than prefix `"_" + UPPERCASE` or prefix `"__"`)

```cpp
class MyClass
{
public:
  double getTradingVolume() const;

private:
  int32_t _quantity;
  double  _price;
  bool    _isActive;
};

double MyClass::getTradingVolume() const
{
  return _price * _quantity;
}
```

See also related questions:

* [*Why use prefixes on member variables in C++ classes?*](http://stackoverflow.com/questions/1228161)
* [*Convention of using underscores in C++ class member names*](http://stackoverflow.com/questions/6825186/convention-of-using-underscores-in-c-class-member-names)
* [*Class members prefixed with underscore*](http://stackoverflow.com/questions/7979797)
* [*Might starting variables/members with an underscore puzzle the compiler?*](http://programmers.stackexchange.com/questions/191828)
* [*Why C# and C++ use `_name` convention?*](http://stackoverflow.com/questions/3823913)
* [*What kind of prefix do you use for member variables?*](http://stackoverflow.com/questions/111605)

## `N.GBL` &nbsp; Global variables prefixed by `//`

[ISO C++ recommandation](https://isocpp.org/wiki/faq/Coding-standards#global-vars):

> The names of global variables should start with `//`.
>
> Ideal way to use a global variable:
>
> ```cpp
> // my_global_variable;
> ^^ // The leading "//" improves this global variable
> ```
>
> It’s a joke.
>
> Sort of.
>
> The truth is that there are cases when global variables are less evil than the alternatives —
> when globals are [the lesser of the evils](https://isocpp.org/wiki/faq/big-picture#use-evil-things-sometimes).
> But they’re still evil. So wash your hands after using them. Twice.
>
> Instead of using a global variable, you should seriously consider
> if there are ways to limit the variable’s visibility and/or lifetime,
> and if multiple threads are involved, either limit the visibility
> to a single thread or do something else to protect the system against race cases.
>
> Note: if you wish to limit the visibility but neither lifetime nor thread safety,
> two of the many approaches are to either move the variable
> into a class as a `static` data member or to use an unnamed `namespace`.
>
> Here is how to move the variable into a class as a `static` data member:
>
> ```cpp
> class Foo
> {
>   // ...
>   static int g_xyz// See the Construct Members On First Use Idiom
>   // ...
> }; // class Foo
> ```
>
> Here is how to use an unnamed `namespace`:
>
> ```cpp
> namespace
> {
> int g_xyz;  // See the Construct On First Use Idiom for non-members
> }
> ```
>
> Repeat: there are three major considerations:
> visibility, lifetime, and thread safety.
> The above examples address only one of those three considerations.


## `N.NSP` &nbsp; Namespace in  `lower_case`

* All in lowercase
* Abreviations are welcome to minimize discomfort (e.g. `std::`)
* Avoid multi-words when possible
* If multi-words required, use underscore `'_'`
* Do not list nested namespaces on the same line
* No need for identation
* Terminate long namespaces with an *ending comment* (automatic script may detect/fix this)

```cpp
// Good
namespace ct {
namespace ccg
{

class Limit
{
public:
  // functions...

private:
  // data...

};// End class Limit

} // End namespace ccg
} // End namespace ct

// Bad
namespace CT { namespace CCG
  {
    class Limit
    {
    public:
      // functions...

    private:
      // data...

    };

  }
}

// Better: C++17 (already available on recent compiler versions)
namespace ct::ccg
{

class Limit
{
public:
  // functions...

private:
  // data...

};// End class Limit

} // End namespace ct::ccg
```

## `N.BDP` &nbsp; Follow *BaseDerived* pattern

* *Base* name followed by *Derived* name
* *Major* name followed by *Minor* name
* *Parent* name followed by *Child* name

```cpp
// In the following examples, "IMsg" is the Base name
class IMsg;

// Good order "Base -> Derived"
class IMsgProcessor;
class IMsgManager;
class IMsgLogon;

// Bad order "Base -> Derived"
class IProcessorMsg;
class IManagerMsg;
class ILogonMsg;
```

## `N.ABR` &nbsp; No ambiguous abbreviations

[Google recommendations](https://google-styleguide.googlecode.com/svn/trunk/cppguide.html#General_Naming_Rules):

> Give as descriptive a name as possible, within reason.
> Do not worry about saving horizontal space as it is far more important to make your code immediately understandable by a new reader.
> Do not use abbreviations that are ambiguous or unfamiliar to readers outside your project, and do not abbreviate by deleting letters within a word.

Our rules:

* Large scope names convey meaning (semantics), so they should be descriptive
* Local scope names only meaningful in their small context (lexical scope), so they may be shorter
* Abbreviation are welcome to shorten namespace names

```cpp
// Good
int price_count_reader; // No abbreviation
int num_errors;         // "num" is a widespread convention for 'numbers of'
int num_dns_connections;// Most people know what "DNS" stands for

// To be reviewed
int n;                  // May be long enough in small scopes (for-loop, tiny function...)
int nerr;               // Ambiguous abbreviation but same remark as for "int n;"

// Bad
int n_comp_conns;       // Ambiguous abbreviation
int wgc_connections;    // Only your group knows what this stands for
int pc_reader;          // Lots of things can be abbreviated "pc"
int cstmr_id;           // Deletes internal letters
```

## `N.EGL` &nbsp; All code in English

* All code is written in English (names, comments...).

```cpp
int price;   // Good
int precio;  // Bad
int prix;    // Bad
int preis;   // Bad
```







# Coding

_OK for safe code, but no performance sacrificed, we are **C++ devs**!_

## `C.SZT` &nbsp; Explicit-sized integer types

* Use explicit-sized types for integers  
  (No need to use namespace `std::` even if we have to `#include <stdint.h>` instead of `#include <cstdint>`)

        int8_t    uint8_t     int_fast8_t    uint_fast8_t
        int16_t   uint16_t    int_fast16_t   uint_fast16_t
        int32_t   uint32_t    int_fast32_t   uint_fast32_t
        int64_t   uint64_t    int_fast64_t   uint_fast64_t

* Avoid `char`, `short`, `int`, `long`, `long long` when possible
* Keep `char` for characters (string)
* Use `uint8_t` for data buffer (based on bytes, not characters)
* Use `size_t` for size
* Use `intptr_t`/`uintptr_t` for integers storing a pointer adress
  (be careful: cannot store a virtual function pointer)
* Use `diffptr_t` for pointer difference
* [Almost Always `auto`](http://herbsutter.com/2013/08/12/gotw-94-solution-aaa-style-almost-always-auto/) (C++11)

## `C.INI` &nbsp; Always initialize variables

* Always initialize variables before use

* Except when we know what we do within a performance-critical section (justification/comment required)

        float x;           // x is uninitialized
        bool ok = get(x);  // pass x by reference
        if (ok)            // if x is set, get(x) returns true
        { /* use x */ }    // use x only inside this scope (outside x may be unitilized)

* Local variables are initialized according to their use

        for (int32_t i = 10; i >= -10; --i)
        {
        }

* Global variables or variables with a large scope, which do not have a meaningful default value, should be initialized
  with values indicating an error (e.g., an invalid value), rather than "low-profile" values that facilitate silent bugs.  
  In enum types, there should be an invalid enum value to be assigned to variables which have no valid default values.

        int8_t* buffer_ptr = 0xDeadBeef; // a famous invalid pointer value (in the memory range)
        size_t  msg_count  = 0;          // a meaningful default value at start
        int64_t event_id   = MIN_INT64;  // an invalid event id, variable meaningless unless actively used

* When initializing values to zero/null
    - Use `0` for integers
    - Use `0.0` for reals
    - Use `nullptr` (C++11) or `0` or `NULL` for pointers

* C++11: Initialize data members on declaration (not neccessary on constructor) => See below example

* C++11: Use braces initialization (instead of parentheses) => See below example

* C++17: Use `not_null<T>(ptr)` to convey pointers that should never be null (already available in GSL)


```cpp
// Good
int32_t quantity = 0;
float   price    = 0.0;
char*   text     = nullptr;  // C++11

// Bad
int32_t quantity;
float   price;
char*   text;

// Initialization at declaration (C++11)
class Limit
{
public:
  Limit() { std::cout <<"Constructor Limit" "\n"; }

private:
  int32_t quantity = 0;
  double  price    = 0.0;
};
```

The following *parenthesis initialization ambiguity* is known as the [*Most vexing parse*](https://en.wikipedia.org/wiki/Most_vexing_parse). Check the compilation on [gcc.godbolt.org](http://goo.gl/CMpxhC).

```cpp
#include <stdint.h> 

// Parenthesis can also be Bad
float foo (float param)
{                           // Function declarartion
  float  ret( float(param) ); // float ret( float );
  return ret;
} 

// Use instead braces (C++11)
float bar (float param)
{
  float  ret{ float(param) }; // No ambiguity
  return ret;
} 

// C++11 uniform initialization syntax (initializers)
int32_t quantity {0};
float   price    {0.0};
char*   text     {nullptr};
```

**Note:** [Value initialization](http://en.cppreference.com/w/cpp/language/value_initialization) changed since C++11. Value initialization is when parentheses/braces are empty: `T(); T{}; new T(); new T{};` 

Build/Run below snippet on [Coliru](http://coliru.stacked-crooked.com/a/f6972398eb18d46f)

```cpp
#include <iostream>

struct A
{
  A() {} // ctor does not initialize 'i'
  int i;
};
    
struct B // implicit ctor
{
  A a;
  int i;
  void set() { a.i = i = 42; }
};
    
std::ostream& operator<< (std::ostream& os, const B& b)
{
  os <<'\t'<< b.a.i <<'\t'<< b.i;
  return os;
}
    
int main()
{
  std::cout <<"----------"<< __cplusplus <<"----------" "\n";

  B b; // used to reset memory for 'placement new'

  b.set(); std::cout <<"new(&b)B   "<< *new(&b)B   <<'\n'; // All uninitialized (in all C++ standards)

  std::cout          <<"       B() "<< B()         <<'\n'; // B::A::i uninitialized in C++03, zero-initialized in C++11
  b.set(); std::cout <<"new(&b)B() "<< *new(&b)B() <<'\n'; // B::i zero-initialized (in all C++ standards)

#if __cplusplus > 2011*100                                 // B{} is aggregate-initialization (DR1301)
  std::cout          <<"       B{} "<< B{}         <<'\n'; // => B::A::i value-initialized
  b.set(); std::cout <<"new(&b)B{} "<< *new(&b)B{} <<'\n'; // => B::i     zero-initialized
#endif
}
```

Build output & Possible run output

    > clang++ --version
    clang version 3.7.0 (tags/RELEASE_370/final 246979)
    Target: x86_64-unknown-linux-gnu
    Thread model: posix
    
    > clang++ -std=c++03 -Wall -Wextra -pedantic main.cpp && ./a.out
    ----------199711----------
    new(&b)B   	42	    42
           B() 	0	    0
    new(&b)B() 	0	    0
    
    > clang++ -std=c++11 -Wall -Wextra -pedantic main.cpp && ./a.out
    ----------201103----------
    new(&b)B   	42	    42
           B() 	0	    0
    new(&b)B() 	0	    0
           B{} 	4196348	0
    new(&b)B{} 	42	    0
    
    > clang++ -std=c++14 -Wall -Wextra -pedantic main.cpp && ./a.out
    ----------201402----------
    new(&b)B   	42	    42
           B() 	0	    0
    new(&b)B() 	0	    0
           B{} 	4196348	0
    new(&b)B{} 	42	    0

    > clang++ -std=c++1z -Wall -Wextra -pedantic main.cpp && ./a.out    
    ----------201406----------
    new(&b)B   	42	    42
           B() 	0	    0
    new(&b)B() 	0	    0
           B{} 	4196348	0
    new(&b)B{} 	42	    0





## `C.INH` &nbsp; No public multi-inheritance

* Unlimited multiple inheritance for Interface (pure abstract class)
* Private multi-inheritance accepted
* Avoid multiple inheritance for other cases when possible

## `C.OVL` &nbsp; No operator overloading

* Avoid operator overloading when possible  
  (especially inside class)
* Except for:
    - Arithmetic types as a Price class using [significand][]/[exponent][]
    - `std::ostream& operator<< (std::ostream&, const YourType&);`
        - Place `operator<<` outside YourType (and your namespace)
        - Try to avoid `friend` (all required data should be publicly accessible using functions at least)

  [significand]: https://en.wikipedia.org/wiki/Significand
  [exponent]:    https://en.wikipedia.org/wiki/Exponentiation

## `C.CST` &nbsp; Use C++ style casts

* No C style casts except where consistent with local/legacy code.
* No scalar constructor for conversion.
* Prefer `static_cast` and `dynamic_cast`
    - `static_cast` is the compile-time type-checked cast
      (used in place of legacy C style cast)
    - `dynamic_cast` is the run-time type-checked cast
* Better fixing the design instead of using `const_cast`
    - `const_cast` removes the const-ness
* Avoid `reinterpret_cast` when possible
    - `reinterpret_cast` should be used only for `void*/intptr_t` conversions (no type-check)
    - Requires review by skilled devs

```cpp
int32_t j = static_cast<int32_t>(x);  // Good
int32_t j = (int32_t)x;               // Bad
int32_t j =  int32_t(x);              // Do not abuse!
```

## `C.CLS` &nbsp; Protect code from collision

* In a project, protect your code with a namespace (e.g. from third parties) 
* Public headers in a sub-directory having same name as library name  
  Example:  `main.cpp` includes `src/foobar/include/foobar/Message.hpp`
  
        main.cpp:    #include <foobar/Message.hpp>
        compile:     gcc main.cpp -I src/foobar/include
        
* Use namespace (mandatory for shared/static/header library)
* Keep namespace name short and relevant:
    - Encapsulate the library "shmq" within the namespace "shmq" (same name)
    - In UTP base code, use "utp"
* Statement `using ns;` is sometimes used (where `ns` is a namespace)  
  In order to minimize collision:
    - In a namespace, separate public and hidden stuff (hidden stuff within a sub-namespace)
    - Limit "using ns;" in bounded scope (not in header file global scope)
* Namespace alias can also be used to avoid abusing of `using ns;`  
  e.g. `namespace gpi = ::google::protobuf::internal;`

```cpp
#include <iostream>
#include <stdint.h>

namespace n1 {
namespace internal
{
  int32_t x = 1;
}
using namespace internal;
int32_t y = 1;
int f1() { return x + y; }
} // namespace n1

namespace n2 {
namespace internal
{
  double d = 2.0;
}
using namespace internal;
double y = 2.0;
/* Errors:
double f2() { return internal::x + y; } // 'x' is not a member of 'n2::internal'
double f3() { return           x + y; } // 'x' was not declared in this scope
*/
double f4() { return           d + y; }
} //namespace n2

int main()
{
  using namespace n1;
  using namespace n2;
  using namespace std;

  cout <<"f1()            "<< f1()            << endl;
  cout <<"f4()            "<< f4()            << endl;
  cout <<"n1::y           "<< n1::y           << endl;
  cout <<"n2::y           "<< n2::y           << endl;
  cout <<"n1::internal::x "<< n1::internal::x << endl;
  cout <<"n2::internal::d "<< n2::internal::d << endl;

  /* Errors:
  cout << internal::x << endl; // the same error as in f2
  cout << y           << endl; // ambiguous n1 vs n2
  */
}
```

## `C.HCV` &nbsp; No magic/hardcoded values

* Magic numbers should not be used directly in the code
* All constant numbers are defined as 
    - `enum` (fine for set of constants)
    - `constexpr` (C++11) 
    - `static const` (C++03)
* Exceptions:
    - Integer values 0 and 1
    - Array size because the *number of elements* is retrievable using 
        - `const std::size_t sz = (sizeof(array) / sizeof(*array));`
        - `const std::size_t sz = std::size(array);` (C++17)

## `C.DTR` &nbsp; No exception in destructor

When an exception is thrown the program unwinds the stack (properly destruct the local variables).
If during this unwinding process, a destructor throws a second exception then the behaviour is undefined
as the language runtime can only propagate one single exception.

* Never throw exceptions in destructor:
    - No `throw` in destructor
    - No throwable functions in destructor
    - No `dynamic_cast<>(reference)` in destructor  
     (throws an exception when cannot cast the reference)
* `try/catch` does not prevent undefined behaviour (crash) when a second exception occurs

## `C.WRN` &nbsp; Activate compilation warnings

    -Wall          // Classic warnings
    -Wextra        // Extra amount of warnings
    -Weffc++       // Effective C++ series of books from Scott Meyers
    -pedantic      // Reject code not following ISO C++ (e.g. GNU extensions)
    -Winit-self    // Variables initialized with themselves (enabled by -Wall)
    -Wswitch-enum  // Missing case for values of switch(enum)

Consider also `-Werror` to fail compilation for any activated warning (and `-Weverything` from Clang).

See more on [GCC warning options](http://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html).

# Read/Learn more

* Excellent [*C++ modern guidelines* from Bjarne Stroustrup and Herb Sutter](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md)
* Popular but criticized [Google C++ Style Guide](https://google-styleguide.googlecode.com/svn/trunk/cppguide.html)
* [Boost Library Requirements and Guidelines](http://www.boost.org/development/requirements.html)
* [BDE Coding Standards](https://github.com/bloomberg/bde/wiki/Introduction-to-BDE-Coding-Standards)
* [Bjarne Stroustrup's C++ Style and Technique FAQ](http://www.stroustrup.com/bs_faq2.html)
* [GCC Coding Conventions](https://gcc.gnu.org/codingconventions.html)
* [The JSF air vehicle C++ coding standards](http://www.research.att.com/~bs/JSF-AV-rules.pdf)
