#!/bin/csh

bruk2pipe -in ./ser \
  -bad 0.0 -ext -aswap -AMX -decim 2800 -dspfvs 20 -grpdly 68  \
  -xN              2048  -yN               256  \
  -xT              1024  -yT               128  \
  -xMODE            DQD  -yMODE  Echo-AntiEcho  \
  -xSW         7142.857  -ySW         2128.565  \
  -xOBS         600.133  -yOBS          60.818  \
  -xCAR           4.725  -yCAR         120.034  \
  -xLAB              HN  -yLAB             15N  \
  -ndim               2  -aq2D         Complex  \
  -out ./test.fid -verb -ov

sleep 5
