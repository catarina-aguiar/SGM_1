#!/bin/bash
set -e

unicycler \
  -1 data/illumina/*_1.fastq.gz \
  -2 data/illumina/*_2.fastq.gz \
  -l data/nanopore/*.fastq.gz \
  -o results/hybrid_assembly