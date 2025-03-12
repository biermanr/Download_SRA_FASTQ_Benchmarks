# Download_SRA_FASTQ_Benchmarks
Benchmarking approaches to access SRA FASTQ datasets

The Sequence Read Archive (SRA) curated by the NCBI is a fantastic resource for finding and accessing publicly available sequence data.
I am grateful for this fantastic resource, but multiple times in the past I have run into issues knowing how best to retrieve FASTQ files.
I am creating this repository to provide periodic timings and notes for different ways of accessing FASTQs from SRA.

Table of timings for getting paired end fastq's for
[ERR1295999](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=ERR1295999&display=metadata)
 `ERR1295999_1.fastq` and `ERR1295999_2.fastq`. This sample was chosen arbitrarily.

| Approach | Platform | Time | Date |
| -------- | -------- | ---- | ---- |
| prefetch+fasterq-dump | macos-latest | 00:10:00 | Mar 11th 2025 |
| prefetch, fasterq-dump | macos-latest | 01:00:00 | Mar 12th 2025 |
(new timings at the start of each month)

The timings are measured on github actions runners, so might not be reflective of
what you would see on your own machine.