#!/usr/bin/env bash
# === SCRIPT PARA CORRER PROJETO ===

set -e # Aborta em situação de erro
# set -x # Debugging

# === CRIAÇÃO CONDA ===
echo "=== CRIAÇÃO CONDA ==="

# Nome ambiente
NOME_AMBIENTE="SGM_proj1"

# Lista pacotes
PACOTES="shellcheck"

# Informa utilizador da criação
echo "A criar o ambiente Conda '$NOME_AMBIENTE'..."

# Ativa funções do conda no shell
source "$(conda info --base)/etc/profile.d/conda.sh"

# Verifica se ambiente já existe
set +e
grep_result=$(conda env list | awk '{print $1}' | grep -E "^$NOME_AMBIENTE$")
RESULTADO=$?
set -e

if [ $RESULTADO -eq 0 ]; then
    echo ""
    echo "O ambiente '$NOME_AMBIENTE' já existe."
    exit 0
fi

# Cria o ambiente de forma não interativa (--yes)
conda create --name "$NOME_AMBIENTE" --channel conda-forge --yes $PACOTES

# Verifica se criação foi bem sucedida
if [ $? -eq 0 ]; then
        echo ""
        echo "Ambiente '$NOME_AMBIENTE' criado com sucesso!"
else
        echo ""
        echo "Ocorreu um erro ao criar o ambiente '$NOME_AMBIENTE'."
        echo "Verifique se o ambiente já existe com 'conda env list'."
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