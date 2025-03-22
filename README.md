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
    x-axis [March-18th, March-19th, March-20th, March-21st]
    y-axis "Time in seconds" 0 --> 220
    line "aria2c EBI" [ 38.31 , 38.14 , 30.13 , 36.88 , 26.61 ]
    line "prefetch, fasterq-dump" [ 35.28, 38.07, 51.50, 53.38, 37.13 ]
    line "aws, fasterq-dump" [ 42.61, 43.06, 50.37, 43.06, 41.17 ]
    line "fasterq-dump only" [ 137.12, 170.85, 96.33, 77.43, 142.32 ]
    line "fastq-dump only" [ 180.01 , 166.50 , 166.53 , 94.58 , 174.25 ]
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
- MAKE THE GRAPH VIEW UPDATE AUTOMATICALLY
- Write up a discussion of learnings
- Create a github pages as well as the README?

## Table of timings in seconds
Timing for getting paired end fastq's for
[SRR32596108](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR32596108&display=metadata)
 `SRR32596108_1.fastq` and `SRR32596108_2.fastq`

| Date | OS | aria2c EBI | prefetch, fasterq-dump | aws, fasterq-dump | fasterq-dump only | fastq-dump only |
| --- | :-- | --: | --: | --: | --: | --: |
| Mar 22nd 2025 | macOS | 23.75 | 43.83 | 49.35 | 149.98 | 185.83 |
| Mar 22nd 2025 | ubuntu | 44.56 | 39.76 | 34.64 | 77.06 | 106.28 |
| Mar 21st 2025 | macOS | 38.31 | 37.13 | 41.17 | 142.32 | 180.01 |
| Mar 21st 2025 | ubuntu | 59.55 | 41.47 | 35.63 | 102.59 | 101.77 |
| Mar 20th 2025 | macOS | 38.14 | 53.38 | 43.06 | 134.63 | 166.50 |
| Mar 20th 2025 | ubuntu | 44.15 | 48.00 | 40.69 | 77.43 | 128.43 |
| Mar 19th 2025 | macOS | 30.13 | 51.50 | 50.37 | 140.40 | 166.53 |
| Mar 19th 2025 | ubuntu | 43.52 | 39.41 | 35.02 | 96.33 | 130.84 |
| Mar 18th 2025 | macOS | 36.88 | 38.07 | 43.06 | 74.06 | 94.58 |
| Mar 18th 2025 | ubuntu | 53.31 | 41.11 | 33.80 | 170.85 | 200.44 |
| Mar 18th 2025 | macOS | 26.61 | 35.28 | 42.61 | 137.12 | 174.25 |
| Mar 18th 2025 | ubuntu | 50.25 | 46.63 | 34.37 | 76.51 | 228.88 |
