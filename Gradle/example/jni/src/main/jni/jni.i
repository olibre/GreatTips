%module jni

%{
 #include <mymodule1/MyClass1.h>
 #include <mymodule2/MyClass2.h>
%}

%include <stdint.i>
%include <typemaps.i>
%include <cpointer.i>
%include <arrays_java.i>
%include "aaa.i"
%include "bbb.i"
%include "ccc.i"
%include "enumsimple.swg"
# "enumsimple.swg" is provided by project 'swig'

%template(MyClass3) std::vector<mymodule1::MyClass1>;
%apply  int32_t *OUTPUT {mymodule9::MyClass91 *state};
%apply  int32_t *OUTPUT {mymodule9::MyClass92 *state};
%apply uint16_t *OUTPUT {mymodule9::MyClass93 *status_word};

%include "mymodule9/MyClass9.h"
