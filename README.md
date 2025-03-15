# Download_SRA_FASTQ_Benchmarks
Benchmarking approaches to access SRA FASTQ datasets

The Sequence Read Archive (SRA) curated by the NCBI is a fantastic resource for finding and accessing publicly available sequence data.
I am grateful for this fantastic resource, but multiple times in the past I have run into issues knowing how best to retrieve FASTQ files.
I am creating this repository to provide periodic timings and notes for different ways of accessing FASTQs from SRA.

Table of timings in seconds for getting paired end fastq's for
[SRR32596108](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR32596108&display=metadata)
 `SRR32596108_1.fastq` and `SRR32596108_2.fastq`. This sample was chosen arbitrarily.

| Date | OS | prefetch, fasterq-dump | aws, fasterq-dump | fasterq-dump only | wget ebi |
| --- | :-- | --: | --: | --: | --: |
| Mar 15th 2025 | macOS | 35.38 | 43.77 | 137.93 | 21.74 |
| Mar 15th 2025 | ubuntu | 48.30 | 33.23 | 93.25 | 13.46 |
| Mar 15th 2025 | macOS | 21.84 | 28.72 | 137.58 | 50.16 |
| Mar 15th 2025 | ubuntu | 34.59 | 35.21 | 162.79 | 31.29 |

New timings at the start of each month

The timings are measured on github actions runners, so might not be reflective of
what you would see on your own machine.

TODOs
- Validate shasums
- Decide if I should be timing to get .fastq or .fastq.gz (currently it's the .fastq)
- Add EBI endpoint approach
- Write up a discussion of learnings
- Create a github pages as well as the README?
- Add a graph view?
- Use aria2c instead of wget or in-addition