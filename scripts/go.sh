#!/usr/bin/env bash
# === SCRIPT PARA CORRER PROJETO ===

set -e # Aborta em situação de erro
# set -x # Debugging

# === CRIAÇÃO CONDA ===
echo "=== CRIAÇÃO CONDA ==="

# Nome ambiente
NOME_AMBIENTE="SGM_proj1"

# Informa utilizador da criação
echo "A criar o ambiente Conda '$NOME_AMBIENTE'..."

# Ativa funções do conda no shell
source "$(conda info --base)/etc/profile.d/conda.sh"

# Cria ambiente com base nas dependências e versões em environment.yml
if conda env list | awk '{print $1}' | grep -qx "$NOME_AMBIENTE"; then
    echo "Ambiente '$NOME_AMBIENTE' já existente. A reutilizar..."
else
    echo "A criar ambiente '$NOME_AMBIENTE' a partir de environment.yml..."
    conda env create -f environment.yml
fi

# === ATIVAÇÃO CONDA ===
echo ""
echo "=== ATIVAÇÃO CONDA ==="

echo "A ativar o ambiente..."
conda activate "$NOME_AMBIENTE"
echo "Ambiente ativado!"

# === MAKEFILE ===
echo ""
echo "=== MAKEFILE ==="

echo "A executar Makefile..."
make all
echo "Pipeline concluído com sucesso!"