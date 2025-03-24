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
DATE_STR=$(date "+%b-%d`DaySuffix`-%Y")

# Add rows to README table
ROW="| $DATE_STR | $OS | $ARIA2C_EBI | $PF_FQD | $AWS_FQD | $FASTERQ_ONLY | $FASTQ_ONLY |"
sed -i "s/\(.* --- .*\)/\1\n$ROW/" README.md

# Add data point to lineplot (just for macOS)
if [[ $OS == "macOS" ]]; then
  sed -i "s/\(.*x-axis.*\) ]/\1, $DATE_STR ]/" README.md
  sed -i "s/\(.*aria2c_EBI_data.*\) ]/\1, $ARIA2C_EBI ]/" README.md
  sed -i "s/\(.*prefetch_fasterq-dump_data.*\) ]/\1, $PF_FQD ]/" README.md
  sed -i "s/\(.*aws_fasterq-dump_data.*\) ]/\1, $AWS_FQD ]/" README.md
  sed -i "s/\(.*fasterq-dump_only_data.*\) ]/\1, $FASTERQ_ONLY ]/" README.md
  sed -i "s/\(.*fastq-dump_only_data.*\) ]/\1, $FASTQ_ONLY ]/" README.md
fi