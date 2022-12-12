#!/bin/csh

nmrPipe -in test.fid \
| nmrPipe  -fn SOL                                    \
| nmrPipe  -fn SP -off 0.5 -end 0.98 -pow 1 -c 0.5    \
#| nmrPipe  -fn EM -lb 5 \
| nmrPipe  -fn ZF -auto                               \
| nmrPipe  -fn FT -auto                                    \
| nmrPipe  -fn PS -p0 -36.0 -p1 -32.0 -di                 \
| nmrPipe  -fn EXT -x1 11ppm -xn 6ppm -sw                     \
| nmrPipe  -fn TP                                     \
| nmrPipe  -fn SP -off 0.5 -end 0.98 -pow 1 -c 0.5    \
| nmrPipe  -fn ZF -auto                               \
| nmrPipe  -fn FT -auto                                    \
| nmrPipe  -fn PS -p0 -90 -p1 0 -di                \
| nmrPipe  -fn TP \
#| nmrPipe  -fn POLY -auto -ord 5 -x1  11ppm -xn 6ppm \
   -verb -ov -out test.ft2
nmrPipe -in test.ft2 -verb \
| pipe2xyz -nv -out trosy.tris.nv
