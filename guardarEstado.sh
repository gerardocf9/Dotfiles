sar -P ALL 1 15 | grep -v Average | grep -v Linux |awk '{if ($0 ~ /[0-9]/) { print $1","$2","$4","$5","$6; }  }'>~/usocpu.log
