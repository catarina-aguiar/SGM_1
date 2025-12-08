#!/bin/bash
set -e

spades.py \
  -1 data/illumina/*_1.fastq.gz \
  -2 data/illumina/*_2.fastq.gz \
  -o results/illumina_assembly