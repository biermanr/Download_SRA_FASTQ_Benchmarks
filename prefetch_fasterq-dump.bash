#!/bin/bash
prefetch ERR1295999
echo "Done with prefetch"
fasterq-dump --threads 6 --disk-limit 20G ERR1295999
echo "Done with fasterq-dump"