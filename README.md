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


Note that the `aria2c EBI` approach results in gzipped versions of the fastq files, so the
timing includes un-gzipping, which is arguably unfair. Another note is that the fastq files
returned by `aria2c` vs. the other approaches doesn't have the same checksum, but it does have
the same number of lines, so I think there may be some differences in the files hosted by SRA
and EBI, but maybe just for quality scores.

The timings are measured on github actions runners, so might not be reflective of
what you would see on your own machine.

TODOs
- Write up a discussion of learnings
- Create a github pages as well as the README?
- Add a graph view?