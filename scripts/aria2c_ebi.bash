#!/bin/bash
PREFIX="${ACCESSION:0:6}"
SUFFIX="00${ACCESSION:10:1}"

aria2c -s8 -x8 https://ftp.sra.ebi.ac.uk/vol1/fastq/$PREFIX/$SUFFIX/$ACCESSION/$ACCESSION.fastq.gz
aria2c -s8 -x8 https://ftp.sra.ebi.ac.uk/vol1/fastq/$PREFIX/$SUFFIX/$ACCESSION/$ACCESSION.fastq.gz

gzip -d $ACCESSION_1.fastq.gz
gzip -d $ACCESSION_2.fastq.gz