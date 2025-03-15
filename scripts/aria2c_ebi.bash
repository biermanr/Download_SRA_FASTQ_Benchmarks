#!/bin/bash

# ebi stores the accessions in an FTP URI grouped by prefixes, suffixes, for example
# for ACESSION SRR32596108 you need to access:
#   ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR325/008/SRR32596108/SRR32596108_1.fastq.gz
PREFIX="${ACCESSION:0:6}"
SUFFIX="00${ACCESSION:10:1}"

aria2c -s8 -x8 ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${PREFIX}/${SUFFIX}/${ACCESSION}/${ACCESSION}_1.fastq.gz
aria2c -s8 -x8 ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${PREFIX}/${SUFFIX}/${ACCESSION}/${ACCESSION}_2.fastq.gz

gzip -d $ACCESSION_1.fastq.gz
gzip -d $ACCESSION_2.fastq.gz