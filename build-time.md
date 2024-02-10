# Build times with different options

It is measured on private project (not mine), which I can not share unfortunately. But it was not optimized in terms of build time itself (for example, some includes may have been in headers, when they should have been only in cpp and some class forward declared in header). It also did not use modules.

| compiler      | Linker | Generator | Unity build | precompiled header | ccache | first time (s) | second time (s) |  difference |
| :---          | :----: |   :----:  |   :----:    |       :----:       | :----: |     :----:     |      :----:     |    :----:   |
| clang++       |   ld   |   Make    |      -      |          -         |    -   |       84       |        81       |       -     |
| clang++       |   ld   |   Make    |      -      |          -         |    +   |       92       |         9       |  -9.5 / 89% |
| clang++       |   ld   |   Make    |      -      |          +         |    -   |       52       |        54       |     33%     |
| clang++       |   ld   |   Make    |      -      |          +         |    +   |       70       |         1       |   16 / 100% |
| clang++       |   ld   |   Make    |      +      |          -         |    -   |       27       |        28       |     67%     |
| clang++       |   ld   |   Make    |      +      |          -         |    +   |       27       |         7       |   65 / 92%  |
| clang++       |   ld   |   Make    |      +      |          +         |    -   |       24       |        24       |     71%     |
| clang++       |   ld   |   Make    |      +      |          +         |    +   |      dnf       |       dnf       |       -     |
| clang++       |   ld   |   Ninja   |      -      |          -         |    -   |       58       |        59       |     31%     |
| clang++       |   ld   |   Ninja   |      -      |          -         |    +   |       66       |         6       |   21 / 93%  |
| clang++       |   ld   |   Ninja   |      -      |          +         |    -   |       41       |        42       |     51%     |
| clang++       |   ld   |   Ninja   |      -      |          +         |    +   |       51       |         2       |   39 / 100% |
| clang++       |   ld   |   Ninja   |      +      |          -         |    -   |       21       |        19       |     75%     |
| clang++       |   ld   |   Ninja   |      +      |          -         |    +   |       22       |         5       |   75 / 94%  |
| clang++       |   ld   |   Ninja   |      +      |          +         |    -   |       19       |        18       |     77%     |
| clang++       |   ld   |   Ninja   |      +      |          +         |    +   |      dnf       |       dnf       |       -     |
| --------      |  ----  |  -------  |    -----    |       -------      |   ---  |     -----      |      -----      |    ------   |
| clang++       |   lld  |   Make    |      -      |          -         |    -   |       78       |        80       |      5%     |
| clang++       |   lld  |   Make    |      -      |          -         |    +   |       86       |         7       |   -2 / 91%  |
| clang++       |   lld  |   Make    |      -      |          +         |    -   |       53       |        55       |     36%     |
| clang++       |   lld  |   Make    |      -      |          +         |    +   |       65       |         2       |  23 / 100%  |
| clang++       |   lld  |   Make    |      +      |          -         |    -   |       24       |        25       |     71%     |
| clang++       |   lld  |   Make    |      +      |          -         |    +   |       28       |         6       |   67 / 93%  |
| clang++       |   lld  |   Make    |      +      |          +         |    -   |       24       |        23       |     71%     |
| clang++       |   lld  |   Make    |      +      |          +         |    +   |      dnf       |       dnf       |       -     |
| clang++       |   lld  |   Ninja   |      -      |          -         |    -   |       65       |        65       |     23%     |
| clang++       |   lld  |   Ninja   |      -      |          -         |    +   |       70       |         4       |   17 / 95%  |
| clang++       |   lld  |   Ninja   |      -      |          +         |    -   |       45       |        43       |     48%     |
| clang++       |   lld  |   Ninja   |      -      |          +         |    +   |       60       |         2       |  29 / 100%  |
| clang++       |   lld  |   Ninja   |      +      |          -         |    -   |       25       |        24       |     67%     |
| clang++       |   lld  |   Ninja   |      +      |          -         |    +   |       26       |         4       |   69 / 95%  |
| clang++       |   lld  |   Ninja   |      +      |          +         |    -   |       19       |        20       |     76%     |
| clang++       |   lld  |   Ninja   |      +      |          +         |    +   |      dnf       |       dnf       |       -     |
| --------      |  ----  |  -------  |    -----    |       -------      |   ---  |     -----      |      -----      |    ------   |
| gcc           |   ld   |   Make    |      -      |          -         |    -   |       89       |        83       |       -     |
| gcc           |   ld   |   Make    |      -      |          -         |    +   |       94       |         8       |  -9.5 / 89% |
| gcc           |   ld   |   Make    |      -      |          +         |    -   |       58       |        60       |     35%     |
| gcc           |   ld   |   Make    |      -      |          +         |    +   |        -       |         -       |   -- / --%  |
| gcc           |   ld   |   Make    |      +      |          -         |    -   |       30       |        31       |     67%     |
| gcc           |   ld   |   Make    |      +      |          -         |    +   |       32       |         6       |   16 / 100% |
| gcc           |   ld   |   Make    |      +      |          +         |    -   |       32       |        33       |     67%     |
| gcc           |   ld   |   Make    |      +      |          +         |    +   |        -       |        -        |     --%     |
| gcc           |   ld   |   Ninja   |      -      |          -         |    -   |       57       |        61       |     67%     |
| gcc           |   ld   |   Ninja   |      -      |          -         |    +   |       67       |         5       |   16 / 100% |
| gcc           |   ld   |   Ninja   |      -      |          +         |    -   |       46       |        45       |     47%     |
| gcc           |   ld   |   Ninja   |      -      |          +         |    +   |        -       |         -       |   -- / --%  |
| gcc           |   ld   |   Ninja   |      +      |          -         |    -   |       22       |        24       |     67%     |
| gcc           |   ld   |   Ninja   |      +      |          -         |    +   |       24       |         5       |   16 / 100% |
| gcc           |   ld   |   Ninja   |      +      |          +         |    -   |       26       |        27       |     70%     |
| gcc           |   ld   |   Ninja   |      +      |          +         |    +   |        -       |         -       |     --%     |
| --------      |  ----  |  -------  |    -----    |       -------      |   ---  |     -----      |      -----      |    ------   |
| gcc           |   lld  |   Make    |      -      |          -         |    -   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Make    |      -      |          -         |    +   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Make    |      -      |          +         |    -   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Make    |      -      |          +         |    +   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Make    |      +      |          -         |    -   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Make    |      +      |          -         |    +   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Make    |      +      |          +         |    -   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Make    |      +      |          +         |    +   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Ninja   |      -      |          -         |    -   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Ninja   |      -      |          -         |    +   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Ninja   |      -      |          +         |    -   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Ninja   |      -      |          +         |    +   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Ninja   |      +      |          -         |    -   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Ninja   |      +      |          -         |    +   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Ninja   |      +      |          +         |    -   |      dnf       |       dnf       |       -     |
| gcc           |   lld  |   Ninja   |      +      |          +         |    +   |      dnf       |       dnf       |       -     |

First time is the total build time from scratch for the first time.
Second time is the total build time from scratch for the second time.

Generator = Make means `Unix Makefile`

difference is calculated as:
base_time = build time with ${compiler}, linker = ld, Generator = Make, Unity = false, pch = false, ccache = false
difference = (base_time - current_time) / base_time * 100%

Regarding the precompiled headers: only qt headers were added. This also should improve incremental build time.

There are two differences when ccache is used: relative to first and second time.

In this case, the entire build folder was deleted, but cmake --build --target clean or cmake --build --clean-first was not run. To clear ccache you need to call ccache --clear (or -C). The --cleanup (or -c) option can also be useful, which cleans out old files.

Experiment is not scientifically correct!

## Conclusion

Generally, clang is slightly faster then g++.
Ninja is faster generator.
Precompiled headers significantly improves build time (but this is highly project dependent: the same header must be used several times).
Unit builds improves build time even more but probably should not be used with incremental builds.
ccache makes clean build slower the first time, but improves all subsequent ones.
lld demonstrated worse performance then ld. Some other linkers can be tested (for example, gold, mold).

## Miscellaneous

### How to find most used headers

Preferred method:
With clang one can add '-ftime-trace' option and analyze its output using ClangBuildAnalyzer (see [link](https://github.com/aras-p/ClangBuildAnalyzer)).
Example of use (ClangBuildAnalyzer.ini is in directory where ClangBuildAnalyzer is called from)

```bash
mkdir build-trace
ClangBuildAnalyzer --start ./build-trace
# assuming -ftime-trace is specified in cmake itself
cmake -S./ -B./build-trace -DCMAKE_C_COMPILER:FILEPATH=/usr/bin/clang-13 -DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/clang++-13
cmake --build ./build-trace
ClangBuildAnalyzer --stop ./build-trace ./build-trace/build-analysis
ClangBuildAnalyzer --analyze ./build-trace/build-analysis > ./build-trace/build-analysis.txt
```

It will contain 'Expensive headers' with information about the total time spent parsing expensive headers and how many times it was included (as well as some other useful information).

Other solutions:
To find all used qt headers:

```bash
find . -type f \( -name "*.cpp" -or -name "*.h" \) -exec grep -Hn '^#include <Q' {} + | cut -d ':' -f 3 | sort | uniq
```

or one can use find-includes.py script which will print most directly used headers and used count as well as files where they were included from.

### A few words about precompiled headers

* Any macros defined before the precompiled header is included must either be defined in the same way as when the precompiled header was generated, or must not affect the precompiled header, which usually means that they don’t appear in the precompiled header at all.

But I think that qt automatically added macros are affecting precompiled header. At least our gcc generates warning when used from other target.

For more info see [link](https://gcc.gnu.org/onlinedocs/gcc/Precompiled-Headers.html).

### tips and useful info

#### cmake

Assuming project structure:

```
project
│   CMakeLists.txt    
│
└───your_project_lib1
│   │   CMakeLists.txt
│   │
│   └───include
│       └───your_project_lib1
│       │   your_public_header.h
│   
└───your_project_lib2
│   │   CMakeLists.txt
```

example of usage:

```cmake
target_precompile_headers(FIRST_TARGET 
    PRIVATE
        <some_lib_header>
        <other_lib_header.h>

        your_private_header.h

        [["lib_header.h"]] # include directory must be explicitly available for the compiler to find them!!!
        # e.g. should be in target_include_directories 
    PUBLIC
        <some_lib_header_2>

        # assuming target_include_directories(FIRST_TARGET PUBLIC include) was called
        [["your_project_lib1/your_public_header.h"]] # this way both your lib
                        # and dependent libs will be able to find this header
)

# other target
target_precompile_headers(${TARGET} REUSE_FROM FIRST_TARGET)
```

But be aware that automoc/ smth from qt add compile definition => precompiled headers from targets that are using it can not be reused in other targets.

#### other technics to increase build speed

* use extern templates
* use forward declaration
* use pimpl idiom

Also see [link](https://www.reddit.com/r/cpp/comments/hj66pd/c_is_too_slow_to_compile_can_you_share_all_your/?rdt=53563)

#### other

One also can use ninjatracing [link](https://github.com/nico/ninjatracing) to examine build time.

## TODO

benchmark c++ modules
benchmark on public project
use latest compilers and specify their versions

