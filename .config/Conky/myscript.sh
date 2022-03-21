#!/bin/bash
deadbeef --nowplaying "%e %l" |
awk '
{ n = split("::" $1,t,":")
  elapsed = (t[n-2]*60+t[n-1])*60+t[n]
  n = split("::" $2,t,":")
  total = (t[n-2]*60+t[n-1])*60+t[n]
  printf "%d\n",elapsed*100/total
}'