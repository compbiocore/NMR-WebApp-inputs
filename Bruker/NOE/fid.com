#!/bin/csh

bruk2pipe -in ./ser \
  -bad 0.0 -ext -aswap -AMX -decim 2440 -dspfvs 20 -grpdly 68  \
  -xN              1024  -yN                 2  -zN               256  \
  -xT               512  -yT                 2  -zT               128  \
  -xMODE            DQD  -yMODE           Real  -zMODE  Echo-AntiEcho  \
  -xSW         8196.721  -ySW            2.000  -zSW         2311.604  \
  -xOBS         600.133  -yOBS           1.000  -zOBS          60.818  \
  -xCAR           4.725  -yCAR           0.000  -zCAR         120.031  \
  -xLAB              HN  -yLAB             TAU  -zLAB             15N  \
  -ndim               3  -aq2D         Complex                         \
  -out ./fid/test%03d.fid -verb -ov

sleep 5
