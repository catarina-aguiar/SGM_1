#!/usr/bin/env bash
set -e

echo "=============================================="
echo "  DOWNLOAD DOS DADOS DO PROJECTO SGM"
echo "=============================================="

mkdir -p data/illumina
mkdir -p data/nanopore
mkdir -p data/reference

echo ""
echo "[1/4] A descarregar dados Illumina (ERX2780812)..."
fasterq-dump ERX2780812 -O data/illumina
gzip data/illumina/*.fastq

echo ""
echo "[2/4] A descarregar dados Nanopore (ERX4296810)..."
fasterq-dump ERX4296810 -O data/nanopore
gzip data/nanopore/*.fastq

echo ""
echo "[3/4] A descarregar genoma de referência (GCA_903989475)..."
wget -O data/reference/reference.fna.gz \
    "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/903/989/475/GCA_903989475.1_CPBF_427v1/GCA_903989475.1_CPBF_427v1_genomic.fna.gz"

gunzip -f data/reference/reference.fna.gz

echo ""
echo "----------------------------------------------"
echo "   DOWNLOAD CONCLUÍDO COM SUCESSO!"
echo "   Dados guardados em:"
echo "   - data/illumina/"
echo "   - data/nanopore/"
echo "   - data/reference/"
echo "----------------------------------------------"
