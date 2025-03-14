#!/bin/bash
aws s3 sync s3://sra-pub-run-odp/sra/SRR32515828/ SRR32515828 --no-sign-request
fasterq-dump -x --threads 6 SRR32515828/SRR32515828
