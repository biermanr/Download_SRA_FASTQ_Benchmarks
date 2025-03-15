#!/bin/bash
aws s3 sync s3://sra-pub-run-odp/sra/$ACCESSION/ $ACCESSION --no-sign-request
fasterq-dump -x --threads 6 $ACCESSION/$ACCESSION
