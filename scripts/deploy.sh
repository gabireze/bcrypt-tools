#!/bin/bash

# Script de Deploy para Bcrypt Tools
# Uso: sudo bash scripts/deploy.sh

echo "🚀 Iniciando deploy do Bcrypt Tools..."

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Diretório do projeto
PROJECT_DIR="$HOME/bcrypt-tools"
WEB_DIR="/var/www/bcrypt.gabireze.cloud"

# Verificar se está no diretório correto
if [ ! -d "$PROJECT_DIR" ]; then
    echo -e "${RED}❌ Erro: Diretório $PROJECT_DIR não encontrado${NC}"
    exit 1
fi

cd $PROJECT_DIR

echo -e "${YELLOW}📥 Atualizando código do GitHub...${NC}"
git pull origin main

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Erro ao atualizar código do GitHub${NC}"
    exit 1
fi

echo -e "${YELLOW}📋 Copiando arquivos HTML...${NC}"
sudo cp *.html $WEB_DIR/

echo -e "${YELLOW}📄 Copiando arquivos estáticos...${NC}"
sudo cp robots.txt sitemap.xml site.webmanifest browserconfig.xml ads.txt _redirects $WEB_DIR/ 2>/dev/null

echo -e "${YELLOW}🖼️  Copiando imagens...${NC}"
sudo cp -r images $WEB_DIR/

echo -e "${YELLOW}🔒 Ajustando permissões...${NC}"
sudo chown -R www-data:www-data $WEB_DIR
sudo chmod -R 755 $WEB_DIR

echo -e "${YELLOW}🔍 Testando configuração do Nginx...${NC}"
sudo nginx -t

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Erro na configuração do Nginx${NC}"
    exit 1
fi

echo -e "${YELLOW}🔄 Recarregando Nginx...${NC}"
sudo systemctl reload nginx

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Erro ao recarregar Nginx${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}✅ Deploy concluído com sucesso!${NC}"
echo -e "${GREEN}🌐 Site: https://bcrypt.gabireze.cloud${NC}"
echo ""
echo -e "📊 Arquivos atualizados:"
ls -lh $WEB_DIR/*.html | wc -l
echo " arquivos HTML copiados"
