# Download_SRA_FASTQ_Benchmarks
Benchmarking approaches to access SRA FASTQ datasets

The Sequence Read Archive (SRA) curated by the NCBI is a fantastic resource for finding and accessing publicly available sequence data.
I am grateful for this fantastic resource, but multiple times in the past I have run into issues knowing how best to retrieve FASTQ files.
I am creating this repository to provide periodic timings and notes for different ways of accessing FASTQs from SRA.

Table of timings for getting paired end fastq's for
[SRR32515828](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR32515828&display=metadata)
 `SRR32515828_1.fastq` and `SRR32515828_2.fastq`. This sample was chosen arbitrarily.

| Approach | Platform | Time | Date |
| -------- | -------- | ---- | ---- |
| aws, fasterq-dump | macos-latest | 0m18.699s | Mar 14th 2025 |
| aws, fasterq-dump | ubuntu-latest | 0m12.180s | Mar 14th 2025 |
| fasterq-dump only | macos-latest | 1m0.712s | Mar 14th 2025 |
| fasterq-dump only | ubuntu-latest | 0m31.241s | Mar 14th 2025 |
| prefetch, fasterq-dump | macos-latest | 0m15.320s | Mar 14th 2025 |
| prefetch, fasterq-dump | ubuntu-latest | 0m16.918s | Mar 14th 2025 |

New timings at the start of each month

The timings are measured on github actions runners, so might not be reflective of
what you would see on your own machine.

TODOs
- Use a different SRR as the file to download (current is too fast)
- Validate shasums
- Decide if I should be timing to get .fastq or .fastq.gz