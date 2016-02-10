#---OPTIONS---
#
set( MARCH "corei7"  CACHE STRING "Control flag -march" )
# Default produce -march=corei7
# To override use for example:    cmake .. -DMARCH=native (if native => convert to real cpu-type)
# To disable provide empty value: cmake .. -DMARCH=
#
set( OPTIM "default" CACHE STRING "Control flags -Ox" )
# Default: -Ofast for Release, -Og for Debug/Coverage
# To override use for example:    -DOPTIM=-O2
# To disable provide empty value: -DOPTIM=
#
set( BUILDDIR "full" CACHE STRING "Build dir prefix = compiler name & version" )
# Default (full):   ./build/GNU5.2.1_Release/
# If different:     ./build/GNU_Release/
# If empty:         ./build/Release/

set( NIGHT_TEST OFF CACHE BOOL "Run night test or not" )
if( NIGHT_TEST )
    set( GTEST_FILTER "*" )
    add_definitions(-DNIGHT_TEST=1)
    message(STATUS "** Detected option NIGHT_TEST => Enable long time-consuming tests.")
else()
    set( GTEST_FILTER "*:-*Night*" )
endif()

set( GTEST_REPEAT_COUNT 2 )
# Number of times google unit tests will be repeated

#---CMAKE_BUILD_TYPE---
# Release  = Debug info g2 + disable assert/TRACE + Optim (-Ofast)
# Debug    = Debug info g3 + enable  assert/TRACE + Step-by-Step (-Og)
# Coverage = Debug info g3 + enable  assert/TRACE + Step-by-Step (-Og) + Coverage
# ---Default = Debug
if( NOT CMAKE_BUILD_TYPE )
    message(STATUS "** Setting build type to 'Debug' as none was specified.")
    set( CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build." FORCE )
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "Coverage") # For 'cmake -i' and 'cmake-gui'
endif()

#if ( CMAKE_BUILD_TYPE STREQUAL "Debug" )
#  add_definitions( -D_GLIBCXX_DEBUG_PEDANTIC )
#endif()
# TODO(olibre) : _GLIBCXX_PROFILE

# Set -march and --coverage (check tools gcov/...) depending on CMAKE_BUILD_TYPE
if( CMAKE_BUILD_TYPE STREQUAL "Coverage" )
    if( NOT CMAKE_COMPILER_IS_GNUCXX AND NOT CMAKE_CXX_COMPILER_ID STREQUAL "Clang" )
        message(SEND_ERROR "Coverage only supported by GCC and Clang")
    endif()
    find_program( path_gcov    gcov    )
    find_program( path_lcov    lcov    )
    find_program( path_genhtml genhtml )
    find_program( path_gcovr   gcovr   )
    if( NOT path_gcov )
        message(SEND_ERROR "Cannot find gcov => Exit")
    endif()
    if( NOT path_lcov )
        message(SEND_ERROR "Cannot find lcov => Exit")
    endif()
    if( NOT path_gcovr )
        message(SEND_ERROR "Cannot find gcovr => Exit")
    endif()
    if( NOT path_genhtml )
        message(WARNING "Cannot find genhtml => Cannot generate HTML")
    endif()
    add_compile_options( --coverage )
    link_libraries(      --coverage )
    add_definitions( -DNDEBUG )  # Disable assert to avoid code coverage bias
else()
    if( MARCH STREQUAL "native" )
        if( CMAKE_COMPILER_IS_GNUCXX )
            EXECUTE_PROCESS( COMMAND ${CMAKE_CXX_COMPILER} -march=native -Q --help=target COMMAND awk "/-march=/{ printf $2}" OUTPUT_VARIABLE march_native )
            message(STATUS "** MARCH is native and compiler is GNU => Detected processor '${march_native}' => -march=${march_native}")
            add_compile_options( -march=${march_native} )
        else()
            message(STATUS "** MARCH is native and compiler is *not* GNU => -march=native")
            add_compile_options( -march=native )
        endif()
    elseif( MARCH )
        message(STATUS "** MARCH is not native => -march=${MARCH}")
        add_compile_options( -march=${MARCH} )
    else()
        message(STATUS "** MARCH is empty => Disable flag -march")
    endif()
endif()

# Set -O0/-Og/-O1/-O2/-O3/-Ofast and -g2/-g3 depending on CMAKE_BUILD_TYPE
if( OPTIM STREQUAL "default" )
    if( CMAKE_BUILD_TYPE STREQUAL "Release" )
        add_compile_options( -Ofast )
    else()
        if( CMAKE_COMPILER_IS_GNUCXX )
            add_compile_options( -O0 -fno-inline )
        else()
            add_compile_options( -O1 -fno-inline )   # Clang does not support -Og
        endif()
    endif()
elseif( OPTIM )
    add_compile_options( ${OPTIM} )
endif()

# Full debug info for all CMAKE_BUILD_TYPE
add_compile_options( -g3 -ggdb3 )    # -g3 -> include also the MACRO definitions

#add_compile_options( -Wall -Wextra -Wswitch-enum -Wno-ignored-qualifiers) #-pedantic -Weffc++
add_compile_options( -Wall -Wextra -Wno-ignored-qualifiers) #remove -Wswitch-enum else libPE does not compile

# Temporarily (unitl Tredzone lib binary is ABIC++11 compliant) force old ABI format
add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)


## Speed up build using pipes (rather than temporary files) for communication between the various GCC stages
add_compile_options( -pipe )
link_libraries(      -pipe )

# Speed up build if ccache installed
find_program( path_ccache ccache )
if( path_ccache )
    message(STATUS "** Command 'ccache' detected => Will use 'ccache' to speed up compilation and link" )
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK    ccache)
    # TODO(Oliver): Use "CMAKE_{C,CXX}_COMPILER_LAUNCHER=ccmake" with cmake-v3.4
endif()

# Output directories
if( BUILDDIR STREQUAL "full" )
    set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/dist/${CMAKE_C_COMPILER_ID}${CMAKE_C_COMPILER_VERSION}_${CMAKE_BUILD_TYPE}/bin)
    set(LIBRARY_OUTPUT_PATH    ${PROJECT_SOURCE_DIR}/dist/${CMAKE_C_COMPILER_ID}${CMAKE_C_COMPILER_VERSION}_${CMAKE_BUILD_TYPE}/lib)
    set(PLUGIN_OUTPUT_PATH     ${PROJECT_SOURCE_DIR}/dist/${CMAKE_C_COMPILER_ID}${CMAKE_C_COMPILER_VERSION}_${CMAKE_BUILD_TYPE}/plugin)
    set(TEST_OUTPUT_PATH       ${PROJECT_SOURCE_DIR}/test_results/gtest/${CMAKE_C_COMPILER_ID}${CMAKE_C_COMPILER_VERSION}_${CMAKE_BUILD_TYPE})
elseif( BUILDDIR )
    set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/dist/${CMAKE_C_COMPILER_ID}_${CMAKE_BUILD_TYPE}/bin)
    set(LIBRARY_OUTPUT_PATH    ${PROJECT_SOURCE_DIR}/dist/${CMAKE_C_COMPILER_ID}_${CMAKE_BUILD_TYPE}/lib)
    set(PLUGIN_OUTPUT_PATH     ${PROJECT_SOURCE_DIR}/dist/${CMAKE_C_COMPILER_ID}_${CMAKE_BUILD_TYPE}/plugin)
    set(TEST_OUTPUT_PATH       ${PROJECT_SOURCE_DIR}/test_results/gtest/${CMAKE_C_COMPILER_ID}_${CMAKE_BUILD_TYPE})
else()
    set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/dist/${CMAKE_BUILD_TYPE}/bin)
    set(LIBRARY_OUTPUT_PATH    ${PROJECT_SOURCE_DIR}/dist/${CMAKE_BUILD_TYPE}/lib)
    set(PLUGIN_OUTPUT_PATH     ${PROJECT_SOURCE_DIR}/dist/${CMAKE_BUILD_TYPE}/plugin)
    set(TEST_OUTPUT_PATH       ${PROJECT_SOURCE_DIR}/test_results/gtest/${CMAKE_BUILD_TYPE})
endif()
message(STATUS "** EXECUTABLE_OUTPUT_PATH=${EXECUTABLE_OUTPUT_PATH}")
message(STATUS "** LIBRARY_OUTPUT_PATH   =${LIBRARY_OUTPUT_PATH}"   )
message(STATUS "** PLUGIN_OUTPUT_PATH    =${PLUGIN_OUTPUT_PATH}"   )
set(rdkafka_include_dir ${PROJECT_SOURCE_DIR}/pe/librdkafka-master/src)


# For clang-check
set(CMAKE_EXPORT_COMPILE_COMMANDS "on")
