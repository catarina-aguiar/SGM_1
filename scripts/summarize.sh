#!/bin/bash
set -e

OUT=results/summary/sumario.tsv
mkdir -p results/summary

# === CABEÇALHO ===
echo -e "Parâmetro\tIllumina-only\tNanopore-only\tHybrid\tReferencia Publicada" > "$OUT"

# === FUNÇÕES AUXILIARES ===

get_quast_value() {
    local asm=$1
    local metric=$2 # size / n50 / contigs / gc
    local file=""
    case "$asm" in
        illumina) file="results/evaluation/quast_illumina/report.tsv" ;;
        nanopore) file="results/evaluation/quast_nanopore/report.tsv" ;;
        hybrid)   file="results/evaluation/quast_hybrid/report.tsv" ;;
        *) return 0 ;;
    esac

    [[ -f "$file" ]] || { echo -n ""; return 0; }

    case "$metric" in
        size)
            # só a primeira linha de "Total length"
            grep -m1 "^Total length" "$file" | awk -F '\t' '{print $2}'
            ;;
        n50)
            grep -m1 "^N50" "$file" | awk -F '\t' '{print $2}'
            ;;
        contigs)
            # só a primeira linha de "# contigs"
            grep -m1 "^# contigs" "$file" | awk -F '\t' '{print $2}'
            ;;
        gc)
            grep -m1 "^GC (%)" "$file" | awk -F '\t' '{print $2}'
            ;;
    esac
}


get_busco_complete() {
    local asm=$1
    local dir="${asm}_busco"

    local summary
    summary=$(ls "${dir}"/short_summary*.txt 2>/dev/null | head -n1 || true)

    [[ -f "$summary" ]] || { echo -n ""; return 0; }

    grep -o 'C:[0-9.]*%' "$summary" | head -n1 | sed 's/C:\([0-9.]*\)%.*/\1/'
}

get_num_cds() {
    local asm=$1
    local file=""
    case "$asm" in
        illumina) file="results/illumina_annotation/illumina.gff" ;;
        nanopore) file="results/nanopore_annotation/nanopore.gff" ;;
        hybrid)   file="results/hybrid_annotation/hybrid.gff" ;;
        *) return 0 ;;
    esac

    [[ -f "$file" ]] || { echo -n ""; return 0; }

    grep -c $'\tCDS\t' "$file"
}

# == VALORES FICHEIROS ===

illumina_size=$(get_quast_value illumina size)
nanopore_size=$(get_quast_value nanopore size)
hybrid_size=$(get_quast_value hybrid size)

illumina_contigs=$(get_quast_value illumina contigs)
nanopore_contigs=$(get_quast_value nanopore contigs)
hybrid_contigs=$(get_quast_value hybrid contigs)

illumina_n50=$(get_quast_value illumina n50)
nanopore_n50=$(get_quast_value nanopore n50)
hybrid_n50=$(get_quast_value hybrid n50)

illumina_gc=$(get_quast_value illumina gc)
nanopore_gc=$(get_quast_value nanopore gc)
hybrid_gc=$(get_quast_value hybrid gc)

illumina_busco=$(get_busco_complete illumina)
nanopore_busco=$(get_busco_complete nanopore)
hybrid_busco=$(get_busco_complete hybrid)

illumina_cds=$(get_num_cds illumina)
nanopore_cds=$(get_num_cds nanopore)
hybrid_cds=$(get_num_cds hybrid)

# === ESCRITA DA TABELA ===

echo -e "Tamanho_Genoma_bp\t${illumina_size}\t${nanopore_size}\t${hybrid_size}\t5228174" >> "$OUT"
echo -e "Num_Contigs\t${illumina_contigs}\t${nanopore_contigs}\t${hybrid_contigs}\t1" >> "$OUT"
echo -e "N50_bp\t${illumina_n50}\t${nanopore_n50}\t${hybrid_n50}\t5228174" >> "$OUT"
echo -e "GC_percent\t${illumina_gc}\t${nanopore_gc}\t${hybrid_gc}\t65.38" >> "$OUT"
echo -e "BUSCO_Completo_percent\t${illumina_busco}\t${nanopore_busco}\t${hybrid_busco}\t99.8" >> "$OUT"
echo -e "Num_CDSs\t${illumina_cds}\t${nanopore_cds}\t${hybrid_cds}\t4367" >> "$OUT"
