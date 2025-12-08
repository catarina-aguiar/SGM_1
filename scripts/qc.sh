#!/bin/bash
set -e

mkdir -p results/qc

fastqc -o results/qc data/illumina/*.fastq.gz
fastqc -o results/qc data/nanopore/*.fastq.gz