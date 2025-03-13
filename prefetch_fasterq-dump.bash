#!/bin/bash
prefetch ERR1295999
echo "Done with prefetch"
df -h
fasterq-dump ERR1295999 -x --threads 6 --disk-limit 10G
echo "Done with fasterq-dump"