#!/usr/bin/env bash
set -e

mkdir -p data/illumina data/nanopore

# O URL base do FTP do ENA para ficheiros FASTQ
ENA_FTP_BASE="ftp.sra.ebi.ac.uk/vol1/fastq"

# === CONSTRUÇÃO URL ===
ACCESSION_ILLUMINA="ERR2767971"
ACCESSION_NANOPORE="ERR4352271"

PREFIXO1_ILLUMINA="${ACCESSION_ILLUMINA:0:3}"
PREFIXO2_ILLUMINA="${ACCESSION_ILLUMINA:3:3}"

PREFIXO1_NANOPORE="${ACCESSION_NANOPORE:0:3}"
PREFIXO2_NANOPORE="${ACCESSION_NANOPORE:3:3}"

# ILLUMINA
URL_IL_R1="ftp://${ENA_FTP_BASE}/${PREFIXO1_ILLUMINA}/${PREFIXO2_ILLUMINA}/${ACCESSION_ILLUMINA}/${ACCESSION_ILLUMINA}_1.fastq.gz"
URL_IL_R2="ftp://${ENA_FTP_BASE}/${PREFIXO1_ILLUMINA}/${PREFIXO2_ILLUMINA}/${ACCESSION_ILLUMINA}/${ACCESSION_ILLUMINA}_2.fastq.gz"

# NANOPORE
URL_NANO_R1="ftp://${ENA_FTP_BASE}/${PREFIXO1_NANOPORE}/${PREFIXO2_NANOPORE}/${ACCESSION_NANOPORE}/${ACCESSION_NANOPORE}_1.fastq.gz"

# === Download Illumina ===
echo "A descarregar dados Illumina $ACCESSION_ILLUMINA ..."
echo "A guardar em: data/illumina"

wget -P data/illumina "$URL_IL_R1"
wget -P data/illumina "$URL_IL_R2"

echo "Download de $ACCESSION_ILLUMINA concluído."

# Download Nanopore
echo "A descarregar dados Nanopore $ACCESSION_NANOPORE ..."
echo "A guardar em: data/Nanopore"

wget -P data/nanopore "$URL_NANO_R1"

echo "Download de $ACCESSION_NANOPORE concluído."