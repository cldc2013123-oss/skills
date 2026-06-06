#!/bin/bash
# Instalador do pack-completo de skills jurídicas
# Execute: bash instalar-skills.sh

set -euo pipefail

SKILLS_DIR="$HOME/.claude/skills"
PACK="pack-completo"
ZIP_NAME="pack-completo.zip"

echo "🔧 Instalando skills jurídicas em $SKILLS_DIR/$PACK ..."

# Verifica se o unzip está disponível
if ! command -v unzip >/dev/null 2>&1; then
  echo "❌ 'unzip' não encontrado. Instale-o (ex.: sudo apt install unzip) e tente novamente."
  exit 1
fi

# Verifica se o zip existe no diretório atual
if [ ! -f "$ZIP_NAME" ]; then
  echo "❌ Arquivo $ZIP_NAME não encontrado no diretório atual."
  echo "   Coloque o arquivo zip na mesma pasta deste script e rode novamente."
  exit 1
fi

# Cria o diretório base se necessário
mkdir -p "$SKILLS_DIR"

# Extrai o zip
unzip -o "$ZIP_NAME" -d "$SKILLS_DIR/"

echo ""
echo "✅ Skills instaladas em: $SKILLS_DIR/$PACK/"
echo ""
echo "📋 Skills disponíveis:"
ls "$SKILLS_DIR/$PACK/"
echo ""
echo "🚀 Pronto! Abra uma nova sessão do Claude Code para ativar."
