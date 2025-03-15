#!/bin/bash
prefetch $ACCESSION
fasterq-dump -x --threads 6 $ACCESSION