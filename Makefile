# === MAKEFILE ===

#  === PHONY & ALL ===
.PHONY: all download qc assemble_illumina assemble_nanopore assemble_hybrid evaluate annotate summarize clean

all: download qc assemble_illumina assemble_nanopore assemble_hybrid evaluate annotate summarize

# === TARGETS ===

# Download dos dados brutos
download:
	bash scripts/download.sh

# Controlo de qualidade
qc:
	bash scripts/qc.sh

# Assembly Illumina
assemble_illumina:
	bash scripts/assemble_illumina.sh

# Assembly Nanopore
assemble_nanopore:
	bash scripts/assemble_nanopore.sh

# # Assemble Hybrid
assemble_hybrid:
	bash scripts/assemble_hybrid.sh

# Avaliação (QUAST + BUSCO)
evaluate:
	bash scripts/evaluate.sh

# Anotação (PROKKA)
annotate:
	bash scripts/annotate.sh

# Geração do sumário
summarize:
	bash scripts/summarize.sh

# Limpa o projeto
clean:
	@echo "A remover ficheiros com resultados gerados..."
	rm -f sumario.tsv
