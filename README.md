# SGM_1
Este trabalho prático foca-se na reconstrução e na anotação do genoma da bactéria Xanthomonas arboricola pv. juglandis (estirpe CPBF_427). O objetivo central é implementar, comparar, e avaliar criticamente estratégias de montagem distintas, avaliando o impacto da tecnologia de sequenciação na qualidade final do genoma.

Membros do Grupo (Grupo_I)
 - Catarina Aguiar (202205932)
 - Filipa Marinha (202304935)

## 1. Estrutura Geral do Projecto

A estrutura do repositório está organizada da seguinte forma:


```
SGM_1/
│
├── data/
│   ├── illumina/
│   └── nanopore/
│
├── scripts/
│   ├── go.sh
│   ├── qc.sh
│   ├── assemble_illumina.sh
│   ├── assemble_nanopore.sh
│   ├── assemble_hybrid.sh
│   ├── evaluate.sh
│   ├── annotate.sh
│   └── summarize.sh
│
├── results/
│   ├── evaluation/
│   │   ├── qc/
│   │   ├── illumina_assembly/
│   │   ├── nanopore_assembly/
│   │   └── hybrid_assembly/
│   │
│   └── (outros resultados gerados automaticamente)
│
├── Makefile
├── README.md
└── environment.yml
```

## 2. Ferramentas Utilizadas (com versões)

As ferramentas utilizadas no pipeline encontram-se definidas no ficheiro environment.yml. As principais ferramentas e respetivas versões são:

channels:
  - conda-forge
  - bioconda
  - defaults

dependencies:
  Base
  - python=3.9

  Quality Control
  - fastqc=0.12.1
  - multiqc=1.15

  Assembly
  - spades=3.15.5
  - flye=2.9.3
  - unicycler=0.5.0

  Assembly evaluation
  - quast=5.2.0
  - busco=5.6.1

  Annotation
  - prokka=1.14.6

  Utilities
  - bash
  - coreutils
  - grep
  - gawk
  - sed
  - sra-tools

## 3. Execução Completa
Toda a análise pode ser reproduzida de forma automática executando:

```
git clone <repo>
cd <pasta>
bash scrips/go.sh
```
