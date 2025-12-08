#!/bin/bash
set -e

mkdir -p results/evaluation

quast results/illumina_assembly/contigs.fasta \
      -o results/evaluation/quast_illumina

quast results/nanopore_assembly/assembly.fasta \
      -o results/evaluation/quast_nanopore

quast results/hybrid_assembly/assembly.fasta \
      -o results/evaluation/quast_hybrid

busco -i results/illumina_assembly/contigs.fasta \
      -l bacteria_odb10 -m genome \
      -o illumina_busco

busco -i results/nanopore_assembly/assembly.fasta \
      -l bacteria_odb10 -m genome \
      -o nanopore_busco

busco -i results/hybrid_assembly/assembly.fasta \
      -l bacteria_odb10 -m genome \
      -o hybrid_busco