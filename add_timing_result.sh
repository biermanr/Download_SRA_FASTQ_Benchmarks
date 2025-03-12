
METHOD="aws"
PLATFORM="ubuntu-latest"
DATE_STR="Mar 12th 2025"


ROW="| $METHOD | $PLATFORM | $TIMING | $DATE_STR |"
sed -i '' "s/\(.*new timings at the start of each month.*\)/$ROW\n\1/" README.md
