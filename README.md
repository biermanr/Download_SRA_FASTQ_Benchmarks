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

Table of timings in seconds for getting paired end fastq's for
[SRR32596108](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR32596108&display=metadata)
 `SRR32596108_1.fastq` and `SRR32596108_2.fastq`. This sample was chosen arbitrarily.

New timings at the start of each month

| Date | OS | aria2c EBI | prefetch, fasterq-dump | aws, fasterq-dump | fasterq-dump only |
| --- | :-- | --: | --: | --: | --: |
| Mar 16th 2025 | macOS | 22.89 | 34.68 | 36.70 | 66.75 |
| Mar 16th 2025 | ubuntu | 46.43 | 39.27 | 33.33 | 72.67 |
| Mar 15th 2025 | macOS | 37.58 | 35.85 | 38.54 | 138.96 |
| Mar 15th 2025 | ubuntu | 60.80 | 38.84 | 34.84 | 94.24 |
| Mar 15th 2025 | macOS | 20.74 | 36.41 | 39.22 | 136.01 |
| Mar 15th 2025 | ubuntu | 40.83 | 39.28 | 36.29 | 69.34 |


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