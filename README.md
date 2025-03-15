# Download_SRA_FASTQ_Benchmarks
Benchmarking approaches to access SRA FASTQ datasets

The Sequence Read Archive (SRA) curated by the NCBI is a fantastic resource for finding and accessing publicly available sequence data.
I am grateful for this fantastic resource, but multiple times in the past I have run into issues knowing how best to retrieve FASTQ files.
I am creating this repository to provide periodic timings and notes for different ways of accessing FASTQs from SRA.

Table of timings in seconds for getting paired end fastq's for
[SRR32596108](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR32596108&display=metadata)
 `SRR32596108_1.fastq` and `SRR32596108_2.fastq`. This sample was chosen arbitrarily.

New timings at the start of each month

| Date | OS | aria2c EBI | prefetch, fasterq-dump | aws, fasterq-dump | fasterq-dump only |
| --- | :-- | --: | --: | --: | --: |
| Mar 15th 2025 | macOS | 33.88 | 39.05 | 37.98 | 137.50 |
| Mar 15th 2025 | ubuntu | 42.15 | 40.04 | 36.94 | 192.43 |


Note that the `aria2c EBI` approach results in gzipped versions of the fastq files, so the
timing includes un-gzipping, which is arguably fair or not.

The timings are measured on github actions runners, so might not be reflective of
what you would see on your own machine.

TODOs
- Validate shasums
- Write up a discussion of learnings
- Create a github pages as well as the README?
- Add a graph view?