# === MAKEFILE ===

#  === PHONY & ALL ===
.PHONY: all download qc assemble_illumina assemble_nanopore assemble_hybrid evaluate annotate summarize clean

all: download qc assemble_illumina assemble_nanopore assemble_hybrid evaluate annotate summarize

# === TARGETS ===

# Download dos dados brutos
download:
	@echo "DOWNLOAD_TESTE"
	bash scripts/download.sh

# Controlo de qualidade
qc:
	@echo "QC_TESTE"
	bash scripts/qc.sh

# Assembly Illumina
# assemble_illumina:
# 	@echo "ILLUMINA"
# 	bash scripts/assemble_illumina.sh

# Assembly Nanopore
assemble_nanopore:
	@echo "NANOPORE"
	bash scripts/assemble_nanopore.sh

# # Assemble Hybrid
# assemble_hybrid:
# 	@echo "HYBRID"
# 	bash scripts/assemble_hybrid.sh

# Avaliação (QUAST + BUSCO)
evaluate:
	@echo "EVALUATE_TESTE"
	bash scripts/evaluate.sh

# Anotação (PROKKA)
annotate:
	@echo "ANNOTATE_TESTE"
	bash scripts/annotate.sh

# Geração do sumário
summarize:
	@echo "SUMMARIZE_TESTE"
	bash scripts/summarize.sh

# Limpa o projeto
clean:
	@echo "A remover ficheiros com resultados gerados..."
	rm -f sumario.tsv
