# Benchmarking approaches to access SRA FASTQ datasets

The Sequence Read Archive (SRA) curated by the NCBI is a fantastic resource for finding and accessing publicly available sequence data.
I am grateful for this fantastic resource, but multiple times in the past I have run into issues knowing how best to retrieve FASTQ files.
I am creating this repository to provide periodic timings and notes for different ways of accessing FASTQs from SRA. Selected sample `SRR32596108`
to download fairly arbitrarily. This sample has 8.3M paired-end 145 bp-length reads.

<table cellspacing="0" cellpadding="0" border="0">
  <tbody>
  <td width="600px">

```mermaid
---
config:
    xyChart:
        width: 800
        height: 600
    themeVariables:
        xyChart:
            plotColorPalette: "#4d72b1,#dd8452,#54a968,#c34e52,#8272b2"
---
xychart-beta
    title "FASTQ fetch of sample SRR32596108 timing on macOS-latest"
    x-axis [ March-18th, Mar-20th-2025, Mar-24th-2025, Apr-01th-2025, May-01th-2025, Jun-01th-2025 ]
    y-axis "Time in seconds"
    line "aria2c_EBI_data" [ 38.31, 66.08, 23.05, 179.59, 20.99, 26.62 ]
    line "prefetch_fasterq-dump_data" [ 35.28, 36.82, 42.38, 28.86, 49.89, 56.04 ]
    line "aws_fasterq-dump_data" [ 42.61, 49.37, 38.05, 46.24, 41.65, 46.90 ]
    line "fasterq-dump_only_data" [ 137.12, 146.65, 75.08, 138.50, 151.45, 141.95 ]
    line "fastq-dump_only_data" [ 180.01, 172.61, 168.79, 178.75, 177.43, 184.25 ]
 ```
</td>
<td>

![fastqdump_legend](https://placehold.co/10x10/8272b2/8272b2) - fastq-dump only

![fasterqdump_legend](https://placehold.co/10x10/c34e52/c34e52) - fasterq-dump only

![prefetch_fasterqdump_legend](https://placehold.co/10x10/dd8452/dd8452) - prefetch, fasterq-dump

![prefetch_fasterqdump_legend](https://placehold.co/10x10/54a968/54a968) - aws, fasterq-dump

![aria2c_legend](https://placehold.co/10x10/4d72b1/4d72b1) - aria2c EBI

</td>
</tr>
</tbody>
</table>


The different approaches currently being used are
- [aria2c EBI](scripts/aria2c_ebi.bash) which downloads from EBI's mirror of SRA
- [prefetch, fasterq-dump](scripts/prefetch_and_fasterqdump.bash) which is SRA's recommendation
- [aws, fasterq-dump](scripts/aws_and_fasterqdump.bash) which directly downloads the .sra file from aws instead of using prefetch
- [fasterq-dump only](scripts/fasterqdump_only.bash) which is running fasterq-dump without prefetch of aws.
    - This is explicitly NOT recommened by NCBI
- [fastq-dump only](scripts/fastqdump_only.bash) which is just running fastq-dump for comparison.

## Notes
- The `aria2c EBI` approach results in gzipped versions of the fastq files
    - timing includes un-gzipping, which is arguably unfair
- The fastq files returned by `aria2c` vs. the other approaches doesn't have the same shasum
    - but it does have the same number of lines
    - There may be some differences in the files hosted by SRA and EBI, but maybe just for quality scores
- aria2c downloading from `ftp://` was ~2-3X slower than from `https://` with aria2c
    - This seems strange since the URI's for EBI are `ftp.sra.ebi.ac.uk/vol1/fastq`
- The timings are measured on github actions runners, so might not be reflective of your experience

## TODOs
- Write up a discussion of learnings

## Table of timings in seconds
Timing for getting paired end fastq's for
[SRR32596108](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR32596108&display=metadata)
 `SRR32596108_1.fastq` and `SRR32596108_2.fastq`

| Date | OS | aria2c EBI | prefetch, fasterq-dump | aws, fasterq-dump | fasterq-dump only | fastq-dump only |
| --- | :-- | --: | --: | --: | --: | --: |
| Jun-01th-2025 | macOS | 26.62 | 56.04 | 46.90 | 141.95 | 184.25 |
| Jun-01th-2025 | ubuntu | 41.58 | 39.45 | 36.34 | 72.73 | 104.51 |
| May-01th-2025 | macOS | 20.99 | 49.89 | 41.65 | 151.45 | 177.43 |
| May-01th-2025 | ubuntu | 43.91 | 45.98 | 40.88 | 104.35 | 111.51 |
| Apr-01th-2025 | macOS | 179.59 | 28.86 | 46.24 | 138.50 | 178.75 |
| Apr-01th-2025 | ubuntu | 201.69 | 49.98 | 33.92 | 75.80 | 106.93 |
| Mar-24th-2025 | macOS | 23.05 | 42.38 | 38.05 | 75.08 | 168.79 |
| Mar-24th-2025 | ubuntu | 43.25 | 43.43 | 34.94 | 73.02 | 102.96 |
| Mar-20th-2025 | macOS | 66.08 | 36.82 | 49.37 | 146.65 | 172.61 |
| Mar-20th-2025 | ubuntu | 67.70 | 49.42 | 33.34 | 204.66 | 128.15 |
| Mar-18th-2025 | macOS | 38.31 | 35.28 | 42.61 | 137.12 | 180.01 |
| Mar-18th-2025 | ubuntu | 53.31 | 41.11 | 33.80 | 170.85 | 200.44 |
