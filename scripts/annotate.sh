#!/bin/bash
set -e

rm -rf results/illumina_annotation

prokka --outdir results/illumina_annotation \
       --prefix illumina \
       --cpus 4 \
       results/illumina_assembly/contigs.fasta

rm -rf results/nanopore_annotation

prokka --outdir results/nanopore_annotation \
       --prefix nanopore \
       --cpus 4 \
       results/nanopore_assembly/assembly.fasta

rm -rf results/hybrid_annotation

prokka --outdir results/hybrid_annotation \
       --prefix hybrid \
       --cpus 4 \
       results/hybrid_assembly/assembly.fasta