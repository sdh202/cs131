#!/usr/bin/awk -f

{
  num[$1]++;
}

END {
  for (replies in num) {
    if (num[replies] >= 3) {
      print replies, num[replies];
    }
  }
}
