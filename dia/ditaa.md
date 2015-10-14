
## Diagram presenting the `mddia` process

### Source code

    ~~~~ {.ditaa .no-separation}
    +-----------------+       +--------+           +--------------------+
    | markdown source |------>| mddia  |------*--->| processed markdown |
    +-----------------+       +--------+      |    +--------------------+
                                  |           \--->| image files        |
                        +------------------+       +--------------------+
                        | diagram creation |
                        +------------------+
                        | ditaa/dot/rdfdot |
                        +------------------+
    Copyright Jakob Voß (nichtich) 2012 (any free viral open source license)
    ~~~~

### Rendering

~~~~ {.ditaa .no-separation}
+-----------------+       +--------+           +--------------------+
| markdown source |------>| mddia  |------*--->| processed markdown |
+-----------------+       +--------+      |    +--------------------+
                              |           \--->| image files        |
                    +------------------+       +--------------------+
                    | diagram creation |
                    +------------------+
                    | ditaa/dot/rdfdot |
                    +------------------+
Copyright Jakob Voß (nichtich) 2012 (any free viral open source license)
~~~~

## Diagram presenting the `ditaa` process

### Source code

    ~~~~ {.ditaa}
        +--------+   +-------+    +-------+
        |        | --+ ditaa +--> |       |
        |  Text  |   +-------+    |diagram|
        |Document|   |!magic!|    |       |
        |     {d}|   |       |    |       |
        +---+----+   +-------+    +-------+
            :                         ^
            |       Lots of work      |
            +-------------------------+
    Copyright Stathis Sideris 2004-2009 GNU-GPL-v2
    ~~~~

### Rendering

~~~~ {.ditaa}
    +--------+   +-------+    +-------+
    |        | --+ ditaa +--> |       |
    |  Text  |   +-------+    |diagram|
    |Document|   |!magic!|    |       |
    |     {d}|   |       |    |       |
    +---+----+   +-------+    +-------+
        :                         ^
        |       Lots of work      |
        +-------------------------+
Copyright Stathis Sideris 2004-2009 GNU-GPL-v2
~~~~

## Diagram presenting various `ditaa` samples

### Source code

    ~~~ {.ditaa}
    +---------+
    | cBLU    |
    |         |
    +-+  /----+
      |  |cPNK|
      |  |    |
      +--+----+
    /----\ /----\
    |c33F| |cC02|
    |    | |    |
    \----+ +----/
    /----+ +----\
    |c1FF| |c1AB|
    |    | |    |
    \----/ \----/

    Color codes
    /-------------+-------------\
    |cRED RED     |cBLU BLU     |
    +-------------+-------------+
    |cGRE GRE     |cPNK PNK     |
    +-------------+-------------+
    |cBLK BLK     |cYEL YEL     |
    \-------------+-------------/

    +-----+       +-----+        +-----+
    |{d}  |       |{s}  |        |{io} |
    +-----+       +-----+        +-----+
    |{d}  |       |{s}  |        |{io} |
    |     |       |     |        |     |
    +-----+       +-----+        +-----+
    Document      Storage       Input/Output

    +-----+       +-----+        +-----+
    |{d}  |       |{s}  |        |{io} |
    |     |       |     |        |     |
    |     |       |     |        |     |
    +-----+       +-----+        +-----+
    
    Copyright Stathis Sideris 2004-2009 GNU-GPL-v2
    ~~~

### Rendering by default (not using `--no-separation`)

~~~ {.ditaa}
+---------+
| cBLU    |
|         |
+-+  /----+
  |  |cPNK|
  |  |    |
  +--+----+
/----\ /----\
|c33F| |cC02|
|    | |    |
\----+ +----/
/----+ +----\
|c1FF| |c1AB|
|    | |    |
\----/ \----/

Color codes
/-------------+-------------\
|cRED RED     |cBLU BLU     |
+-------------+-------------+
|cGRE GRE     |cPNK PNK     |
+-------------+-------------+
|cBLK BLK     |cYEL YEL     |
\-------------+-------------/

+-----+       +-----+        +-----+
|{d}  |       |{s}  |        |{io} |
+-----+       +-----+        +-----+
|{d}  |       |{s}  |        |{io} |
|     |       |     |        |     |
+-----+       +-----+        +-----+
Document      Storage       Input/Output
+-----+       +-----+        +-----+
|{d}  |       |{s}  |        |{io} |
|     |       |     |        |     |
|     |       |     |        |     |
+-----+       +-----+        +-----+

Copyright Stathis Sideris 2004-2009 GNU-GPL-v2
~~~

### Rendering using `--no-separation`

~~~ {.ditaa .no-separation}
+---------+
| cBLU    |
|         |
+-+  /----+
  |  |cPNK|
  |  |    |
  +--+----+
/----\ /----\
|c33F| |cC02|
|    | |    |
\----+ +----/
/----+ +----\
|c1FF| |c1AB|
|    | |    |
\----/ \----/

Color codes
/-------------+-------------\
|cRED RED     |cBLU BLU     |
+-------------+-------------+
|cGRE GRE     |cPNK PNK     |
+-------------+-------------+
|cBLK BLK     |cYEL YEL     |
\-------------+-------------/

+-----+       +-----+        +-----+
|{d}  |       |{s}  |        |{io} |
+-----+       +-----+        +-----+
|{d}  |       |{s}  |        |{io} |
|     |       |     |        |     |
+-----+       +-----+        +-----+
Document      Storage       Input/Output
+-----+       +-----+        +-----+
|{d}  |       |{s}  |        |{io} |
|     |       |     |        |     |
|     |       |     |        |     |
+-----+       +-----+        +-----+

Copyright Stathis Sideris 2004-2009 GNU-GPL-v2
~~~
