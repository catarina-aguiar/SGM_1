#!/usr/bin/env bash
set -e

# === CRIAÇÃO DE DIRETORIAS ===
mkdir -p data/illumina data/nanopore

# === ILLUMINA ===
ACCESSION_ILLUMINA="ERR2767971"
ILLUMINA_BASE="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR276/001/${ACCESSION_ILLUMINA}"

echo "A descarregar dados Illumina $ACCESSION_ILLUMINA ..."
echo "A guardar em: data/illumina"

wget -c -O data/illumina/${ACCESSION_ILLUMINA}_1.fastq.gz \
    "${ILLUMINA_BASE}/${ACCESSION_ILLUMINA}_1.fastq.gz"

wget -c -O data/illumina/${ACCESSION_ILLUMINA}_2.fastq.gz \
    "${ILLUMINA_BASE}/${ACCESSION_ILLUMINA}_2.fastq.gz"

echo "Download Illumina concluído."

# === NANOPORE ===
ACCESSION_NANOPORE="ERR4352271"
NANOPORE_BASE="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR435/001/${ACCESSION_NANOPORE}"

echo "A descarregar dados Nanopore $ACCESSION_NANOPORE ..."
echo "A guardar em: data/nanopore"

wget -c -O data/nanopore/${ACCESSION_NANOPORE}.fastq.gz \
    "${NANOPORE_BASE}/${ACCESSION_NANOPORE}_1.fastq.gz"

echo "Download Nanopore concluído."
