Why `span<T>` is superior?
--------------------------

### Definition in English

>  **span** n  &nbsp;     Distance from end to end (*portée*)  
> &emsp; &emsp; &emsp;    Length of a bridge (*travée*)  
> &emsp; &emsp; &emsp;    Width of a hand (*écartement*)  
> &emsp; &emsp; &emsp;    [...]

### Definition in C++

From [codexpert blog: *Guidelines Support Library Review: `span<T>`*](http://codexpert.ro/blog/2016/03/07/guidelines-support-library-review-spant/) (march 2016)

> The [Guidelines Support Library](https://github.com/Microsoft/GSL) is a Microsoft implementation 
> of some of the types and functions described in the [C++ Core Guidelines](https://github.com/isocpp/CppCoreGuidelines) 
> maintained by the [Standard C++ Foundation](https://isocpp.org/). 
> Among the types provided by the GSL is `span<T>` [formerly known as `array_view<T>`](http://stackoverflow.com/a/34832827/938111). 
> 
> `span<T>` is a non-owning range of contiguous memory recommended to be used instead of 
> pointers (and size counter) or standard containers (such as `std::vector` or `std::array`).

From [meeting minutes](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0122r1.pdf) of the C++ working group *Library Evolution Working Group* (LEWG)

> ####  Changelog 
> ##### Changes from R0 
> - Changed the name of the type being proposed from `array_view` to `span` following feedback from LEWG at the Kona meeting. 

> ####  Impact on the Standard  
> This proposal is a pure library extension.
> It does not require any changes to standard classes, functions, or headers.
> It would be enhanced if could depends on the `byte` type 
> and changes to type aliasing behavior proposed in [P0257](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0257r0.html "Neil MacIntosh, “A byte type for increased type safety”, P0257, 2016").
> 
> However – if adopted – it may be useful to overload some standard library functions for this new type (an example would be `copy()`).   
>
> `span` has been implemented in standard C++ (C++11) and is being successfully
> used within a commercial static analysis tool for C++ code as well as commercial office productivity software. 
> An open source, reference implementation is available at https://github.com/Microsoft/GSL.

### Source code

Header file [`span.h`](https://github.com/Microsoft/GSL/blob/master/include/span.h) in repo GitHub/Microsoft/GSL is 2225 lines (1889 sloc) 77 KB weight as of 13rd January 2016.

* class `span` starts at about [line 1200](https://github.com/Microsoft/GSL/blob/master/include/span.h#L1180)
* 15 lines of Copyright notice
* 100 lines of specific workarounds for Visual C++ 

There is not yet any GNU or Clang implementation.
