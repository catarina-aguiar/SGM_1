#!/bin/bash
set -e

prokka --outdir results/illumina_annotation \
       --prefix illumina \
       --cpus 4 \
       results/illumina_assembly/contigs.fasta

prokka --outdir results/nanopore_annotation \
       --prefix nanopore \
       --cpus 4 \
       results/nanopore_assembly/assembly.fasta

prokka --outdir results/hybrid_annotation \
       --prefix hybrid \
       --cpus 4 \
       results/hybrid_assembly/assembly.fasta