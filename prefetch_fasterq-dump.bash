#!/bin/bash
prefetch ERR1295999
echo "Done with prefetch"
df -h
fasterq-dump ERR1295999 --threads 6 --disk-limit 25G
echo "Done with fasterq-dump"