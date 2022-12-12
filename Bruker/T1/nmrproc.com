#!/bin/csh

#
# 3D States-Mode HN-Detected Processing.

xyz2pipe -in fid/test%03d.fid -x -verb \
| nmrPipe -fn TP                                               \
| nmrPipe -fn ZTP                                              \
| nmrPipe -fn TP                                               \
| nmrPipe  -fn SOL                                  \
| nmrPipe  -fn SP -off 0.5 -end 0.98 -pow 2 -c 0.5  \
| nmrPipe  -fn ZF -auto -zf 3                             \
| nmrPipe  -fn FT                                   \
| nmrPipe  -fn PS -p0 220  -p1 0.0 -di               \
| nmrPipe  -fn EXT -left -sw                        \
| nmrPipe  -fn TP                                   \
| nmrPipe  -fn SP -off 0.5 -end 0.98 -pow 1 -c 0.5  \
| nmrPipe  -fn ZF -auto -zf 3                            \
| nmrPipe  -fn FT                                   \
| nmrPipe  -fn PS -p0 90 -p1 0 -di              \
| nmrPipe  -fn TP                                   \
| pipe2xyz -out ft/test%03d.ft2 -x


