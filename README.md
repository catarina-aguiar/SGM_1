# SGM_1
Este trabalho prático foca-se na reconstrução e na anotação do genoma da bactéria Xanthomonas arboricola pv. juglandis (estirpe CPBF_427). O objetivo central é implementar, comparar, e avaliar criticamente estratégias de montagem distintas, avaliando o impacto da tecnologia de sequenciação na qualidade final do genoma.

⸻

1. Estrutura Geral do Pipeline

O workflow está organizado nas seguintes etapas:
	1.	Download dos dados de sequenciação
	2.	Controlo de qualidade (FastQC e MultiQC)
	3.	Montagem Illumina-only, Nanopore-only e Hybrid
	4.	Avaliação das montagens (QUAST e BUSCO)
	5.	Anotação do genoma (Prokka)
	6.	Geração da tabela final de resultados (sumario.tsv)

Todos os passos são executados através de scripts Bash presentes em scripts/. O ambiente Conda utilizado é definido em environment.yml.

⸻

2. Ambiente Conda

Criar o ambiente:

conda env create -f environment.yml

Ativar o ambiente:

conda activate genomica_sgm


⸻

3. Execução Completa via Makefile

O pipeline pode ser executado de forma integrada com:

make

Este comando executa automaticamente:
	•	download.sh
	•	qc.sh
	•	assemble_illumina.sh
	•	assemble_nanopore.sh
	•	assemble_hybrid.sh
	•	evaluate.sh
	•	annotate.sh
	•	summarize.sh

⸻

4. Descrição dos Scripts

4.1 download.sh

Foram inicialmente testadas alternativas como enaTools e wget, mas estas não permitiram obter os ficheiros. Com base no script disponibilizado no ENA, utilizou-se a ferramenta ENA CLI incluída no ambiente Conda para realizar o download direto dos ficheiros FASTQ.

Os dados são guardados em data/illumina/ e data/nanopore/.

⸻

4.2 qc.sh

Executa FastQC sobre todos os ficheiros .fastq.gz e gera um relatório integrado através de MultiQC.
Resultados em results/qc/.

⸻

4.3 assemble_illumina.sh

Realiza a montagem Illumina-only utilizando SPAdes.
Resultados em results/assembly/illumina/.

(Nota: devido a limitações de espaço no computador utilizado, esta montagem não chegou a ser executada, mas o pipeline mantém a regra para compatibilidade com o enunciado.)

⸻

4.4 assemble_nanopore.sh

Realiza a montagem Nanopore-only utilizando Flye.
Resultados em results/assembly/nanopore/.

Esta foi a montagem efetivamente obtida e utilizada para a análise final.

⸻

4.5 assemble_hybrid.sh

Executa a montagem híbrida com SPAdes híbrido, combinando Illumina e Nanopore.
Resultados em results/assembly/hybrid/.

⸻

4.6 evaluate.sh

Avalia cada montagem com:
	•	QUAST, para métricas estruturais (tamanho, N50, contigs, GC%)
	•	BUSCO, para avaliação do conteúdo genético conservado

Outputs em results/evaluation/quast_* e results/evaluation/busco_*.

⸻

4.7 annotate.sh

Executa a anotação com Prokka, produzindo ficheiros .gff, .gbk, .faa e .ffn.

Resultados em:
	•	results/illumina_annotation/
	•	results/nanopore_annotation/
	•	results/hybrid_annotation/

⸻

4.8 summarize.sh

Gera o ficheiro final sumario.tsv, no formato obrigatório definido pelo enunciado. A tabela inclui:
	•	Tamanho do genoma
	•	Número de contigs
	•	N50
	•	GC%
	•	Completude BUSCO
	•	Número de CDSs
	•	Coluna de referência publicada

Exemplo de output:

Parâmetro	Illumina-only	Nanopore-only	Hybrid	Referencia Publicada
Tamanho_Genoma_bp		5227036		5228174
Num_Contigs		1		1
N50_bp		5227036		5228174
GC_percent		65.37		65.38
BUSCO_Completo_percent		79.8		99.8
Num_CDSs		5104		4367


⸻

5. Reprodutibilidade

Para reproduzir o pipeline completo:

git clone <repo>
cd <pasta>
conda env create -f environment.yml
conda activate genomica_sgm
make


⸻

6. Notas Finais

A montagem Nanopore-only foi a única executada integralmente, apresentando elevada contiguidade e completude genética. As montagens Illumina e Hybrid permanecem definidas no pipeline, garantindo a conformidade estrutural com o enunciado.

⸻
