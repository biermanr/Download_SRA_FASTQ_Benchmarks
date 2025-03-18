# Download_SRA_FASTQ_Benchmarks
Benchmarking approaches to access SRA FASTQ datasets

The Sequence Read Archive (SRA) curated by the NCBI is a fantastic resource for finding and accessing publicly available sequence data.
I am grateful for this fantastic resource, but multiple times in the past I have run into issues knowing how best to retrieve FASTQ files.
I am creating this repository to provide periodic timings and notes for different ways of accessing FASTQs from SRA.


The different approaches currently being used are
- [aria2c EBI](scripts/aria2c_ebi.bash) which downloads from EBI's mirror of SRA
- [prefetch, fasterq-dump](scripts/prefetch_and_fasterqdump.bash) which is SRA's recommendation
- [aws, fasterq-dump](scripts/aws_and_fasterqdump.bash) which directly downloads the .sra file from aws instead of using prefetch
- [fasterq-dump only](scripts/fasterqdump_only.bash) which is running fasterq-dump without prefetch of aws.
    - This is explicitly NOT recommened by NCBI
- [fastq-dump only](scripts/fastqdump_only.bash) which is just running fastq-dump for comparison.

Table of timings in seconds for getting paired end fastq's for
[SRR32596108](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR32596108&display=metadata)
 `SRR32596108_1.fastq` and `SRR32596108_2.fastq`. This sample was chosen arbitrarily.

New timings at the start of each month

| Date | OS | aria2c EBI | prefetch, fasterq-dump | aws, fasterq-dump | fasterq-dump only | fastq-dump only |
| --- | :-- | --: | --: | --: | --: | --: |
| Mar 18th 2025 | macOS | 36.88 | 38.07 | 43.06 | 74.06 | 94.58 |
| Mar 18th 2025 | ubuntu | 53.31 | 41.11 | 33.80 | 170.85 | 200.44 |
| Mar 18th 2025 | macOS | 26.61 | 35.28 | 42.61 | 137.12 | 174.25 |
| Mar 18th 2025 | ubuntu | 50.25 | 46.63 | 34.37 | 76.51 | 228.88 |


Notes
- The `aria2c EBI` approach results in gzipped versions of the fastq files
    - timing includes un-gzipping, which is arguably unfair
- The fastq files returned by `aria2c` vs. the other approaches doesn't have the same shasum
    - but it does have the same number of lines
    - There may be some differences in the files hosted by SRA and EBI, but maybe just for quality scores
- aria2c downloading from `ftp://` was ~2-3X slower than from `https://` with aria2c
    - This seems strange since the URI's for EBI are `ftp.sra.ebi.ac.uk/vol1/fastq`
- The timings are measured on github actions runners, so might not be reflective of your experience

TODOs
- Write up a discussion of learnings
- Create a github pages as well as the README?
- Add a graph view?
- Add fastq-dump for comparison