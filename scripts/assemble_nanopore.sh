#!/bin/bash
set -e

flye \
  --nano-raw data/nanopore/*.fastq.gz \
  --out-dir results/nanopore_assembly \
  --threads 4