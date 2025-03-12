
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

ROW="| $METHOD | $PLATFORM | $TIMING | $DATE_STR |"

# Annoying that sed works differently on mac vs linux
if [[ $PLATFORM == "macos-"* ]]; then
    sed -i '' "s/\(.*new timings at the start of each month.*\)/$ROW\n\1/" README.md
fi

if [[ $PLATFORM == "ubuntu-"* ]]; then
    sed -i "s/\(.*new timings at the start of each month.*\)/$ROW\n\1/" README.md
fi
