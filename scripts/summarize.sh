#!/bin/bash
set -e

OUT=results/summary/sumario.tsv
mkdir -p results/summary

echo -e "Assembly\tTotal Length\tN50\t# Contigs\tGC (%)" > $OUT

parse() {
    label=$1
    file=$2

    total=$(grep -w "Total length" "$file" | awk '{print $3}')
    n50=$(grep -w "N50" "$file" | awk '{print $2}')
    contigs=$(grep -w "# contigs" "$file" | awk '{print $3}')
    gc=$(grep -w "GC (%)" "$file" | awk '{print $3}')

    echo -e "${label}\t${total}\t${n50}\t${contigs}\t${gc}" >> $OUT
}

parse "Illumina" results/evaluation/quast_illumina/report.tsv
parse "Nanopore" results/evaluation/quast_nanopore/report.tsv
parse "Hybrid"   results/evaluation/quast_hybrid/report.tsv