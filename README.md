# Download_SRA_FASTQ_Benchmarks
Benchmarking approaches to access SRA FASTQ datasets

The Sequence Read Archive (SRA) curated by the NCBI is a fantastic resource for finding and accessing publicly available sequence data.
I am grateful for this fantastic resource, but multiple times in the past I have run into issues knowing how best to retrieve FASTQ files.
I am creating this repository to provide periodic timings and notes for different ways of accessing FASTQs from SRA.

Table of timings for getting paired end fastq's for
[SRR32515828](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR32515828&display=metadata)
 `SRR32515828_1.fastq` and `SRR32515828_2.fastq`. This sample was chosen arbitrarily.

| Date | OS | prefetch, fasterq-dump | aws, fasterq-dump | fasterq-dump only |
| --- | :-- | --: | --: | --: |
| Mar 15th 2025 | macOS | 15.843 | 20.32 | 58.512 |
| Mar 15th 2025 | ubuntu | 12.579 | 11.219 | 28.827 |

New timings at the start of each month

The timings are measured on github actions runners, so might not be reflective of
what you would see on your own machine.

TODOs
- Use a different SRR as the file to download (current is too fast?)
- Avoid hard-coding SRR/ERR number to make it easier to change (make ENV variable?)
- Validate shasums
- Decide if I should be timing to get .fastq or .fastq.gz (currently it's the .fastq)
- Add EBI endpoint approach
- Improve the format of the timing durations
- Consider changing the table format to wide-form
- Write up a discussion of learnings