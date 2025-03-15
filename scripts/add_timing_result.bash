#!/bin/bash
# Stolen from https://stackoverflow.com/questions/2495459/formatting-the-date-in-unix-to-include-suffix-on-day-st-nd-rd-and-th
DaySuffix() {
  case `date +%e` in
    1|21|31) echo "st";;
    2|22)    echo "nd";;
    3|23)    echo "rd";;
    *)       echo "th";;
  esac
}
DATE_STR=$(date "+%b %d`DaySuffix` %Y")

ROW="| $ARIA2C_EBI | $DATE_STR | $OS | $PF_FQD | $AWS_FQD | $FQD_ONLY |"

sed -i "s/\(.* --- .*\)/\1\n$ROW/" README.md
