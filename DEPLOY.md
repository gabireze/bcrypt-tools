# 🚀 Guia de Deploy - Bcrypt Tools

## 📋 Informações do Servidor

- **Domínio**: bcrypt.gabireze.cloud
- **Diretório Web**: `/var/www/bcrypt.gabireze.cloud`
- **Nginx Config**: `/etc/nginx/sites-available/bcrypt.gabireze.cloud`
- **SSL**: Let's Encrypt (renovação automática)

## 🔧 Configuração Inicial (Primeira vez)

### 1. Criar estrutura de diretórios no servidor

```bash
# Conecte-se ao servidor
ssh your-server

# Criar diretório para o site
sudo mkdir -p /var/www/bcrypt.gabireze.cloud

# Clonar repositório (se ainda não existir)
cd ~
git clone https://github.com/gabireze/bcrypt-tools.git
```

### 2. Configurar Nginx

```bash
# Copiar configuração do Nginx
sudo cp ~/bcrypt-tools/config/nginx.conf /etc/nginx/sites-available/bcrypt.gabireze.cloud

# Criar link simbólico para ativar o site
sudo ln -s /etc/nginx/sites-available/bcrypt.gabireze.cloud /etc/nginx/sites-enabled/

# Testar configuração
sudo nginx -t

# Recarregar Nginx
sudo systemctl reload nginx
```

### 3. Configurar SSL (Let's Encrypt)

```bash
# Instalar Certbot (se ainda não estiver instalado)
sudo apt update
sudo apt install certbot python3-certbot-nginx

# Obter certificado SSL
sudo certbot --nginx -d bcrypt.gabireze.cloud -d www.bcrypt.gabireze.cloud

# Testar renovação automática
sudo certbot renew --dry-run
```

### 4. Deploy inicial dos arquivos

```bash
# Copiar todos os arquivos HTML
sudo cp ~/bcrypt-tools/*.html /var/www/bcrypt.gabireze.cloud/

# Copiar outros arquivos necessários
sudo cp ~/bcrypt-tools/robots.txt /var/www/bcrypt.gabireze.cloud/
sudo cp ~/bcrypt-tools/sitemap.xml /var/www/bcrypt.gabireze.cloud/
sudo cp ~/bcrypt-tools/site.webmanifest /var/www/bcrypt.gabireze.cloud/
sudo cp ~/bcrypt-tools/browserconfig.xml /var/www/bcrypt.gabireze.cloud/
sudo cp ~/bcrypt-tools/ads.txt /var/www/bcrypt.gabireze.cloud/
sudo cp ~/bcrypt-tools/_redirects /var/www/bcrypt.gabireze.cloud/

# Copiar pasta de imagens
sudo cp -r ~/bcrypt-tools/images /var/www/bcrypt.gabireze.cloud/

# Ajustar permissões
sudo chown -R www-data:www-data /var/www/bcrypt.gabireze.cloud
sudo chmod -R 755 /var/www/bcrypt.gabireze.cloud
```

## 🔄 Deploy de Atualizações

### Método Rápido:

```bash
# 1. Conecte-se ao servidor
ssh your-server

# 2. Navegue até o diretório do projeto
cd ~/bcrypt-tools

# 3. Atualize o código
git pull origin main

# 4. Copie os arquivos atualizados
sudo cp *.html /var/www/bcrypt.gabireze.cloud/
sudo cp robots.txt sitemap.xml site.webmanifest browserconfig.xml ads.txt _redirects /var/www/bcrypt.gabireze.cloud/
sudo cp -r images /var/www/bcrypt.gabireze.cloud/

# 5. Ajustar permissões
sudo chown -R www-data:www-data /var/www/bcrypt.gabireze.cloud

# 6. Limpar cache do Nginx (opcional)
sudo systemctl reload nginx
```

### Script de Deploy Automático:

Você pode criar um script `scripts/deploy.sh`:

```bash
#!/bin/bash

echo "🚀 Iniciando deploy do Bcrypt Tools..."

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Diretório do projeto
PROJECT_DIR="$HOME/bcrypt-tools"
WEB_DIR="/var/www/bcrypt.gabireze.cloud"

cd $PROJECT_DIR

echo -e "${YELLOW}📥 Atualizando código...${NC}"
git pull origin main

echo -e "${YELLOW}📋 Copiando arquivos...${NC}"
sudo cp *.html $WEB_DIR/
sudo cp robots.txt sitemap.xml site.webmanifest browserconfig.xml ads.txt _redirects $WEB_DIR/
sudo cp -r images $WEB_DIR/

echo -e "${YELLOW}🔒 Ajustando permissões...${NC}"
sudo chown -R www-data:www-data $WEB_DIR
sudo chmod -R 755 $WEB_DIR

echo -e "${YELLOW}🔄 Recarregando Nginx...${NC}"
sudo nginx -t && sudo systemctl reload nginx

echo -e "${GREEN}✅ Deploy concluído com sucesso!${NC}"
echo -e "${GREEN}🌐 Site: https://bcrypt.gabireze.cloud/${NC}"
```

Para usar o script:
```bash
sudo bash ~/bcrypt-tools/scripts/deploy.sh
```

## 🔍 Verificar Status

```bash
# Status do Nginx
sudo systemctl status nginx

# Testar configuração
sudo nginx -t

# Ver logs em tempo real
sudo tail -f /var/log/nginx/bcrypt.gabireze.cloud.access.log
sudo tail -f /var/log/nginx/bcrypt.gabireze.cloud.error.log

# Testar o site
curl -I https://bcrypt.gabireze.cloud/

# Verificar se todos os arquivos estão no lugar
ls -lah /var/www/bcrypt.gabireze.cloud/
```

## 🛠️ Comandos Úteis

### Verificar arquivos HTML
```bash
ls -lh /var/www/bcrypt.gabireze.cloud/*.html
```

### Atualizar apenas um arquivo específico
```bash
sudo cp ~/bcrypt-tools/index.html /var/www/bcrypt.gabireze.cloud/
sudo chown www-data:www-data /var/www/bcrypt.gabireze.cloud/index.html
```

### Renovar certificado SSL (manual)
```bash
sudo certbot renew
sudo systemctl reload nginx
```

### Verificar certificado SSL
```bash
sudo certbot certificates
```

## 📊 Estrutura de Arquivos no Servidor

```
/var/www/bcrypt.gabireze.cloud/
├── index.html
├── md5.html
├── sha1.html
├── sha256.html
├── sha512.html
├── md4.html
├── hmac.html
├── pbkdf2.html
├── argon2.html
├── crc32.html
├── privacy-policy.html
├── terms-of-use.html
├── thank-you.html
├── 404.html
├── robots.txt
├── sitemap.xml
├── site.webmanifest
├── browserconfig.xml
├── ads.txt
├── _redirects
└── images/
    └── (arquivos de imagem)
```

## 🔐 Segurança

- ✅ SSL/TLS: Let's Encrypt com renovação automática
- ✅ Headers de segurança configurados no Nginx
- ✅ Redirecionamento HTTP → HTTPS
- ✅ Redirecionamento www → não-www
- ✅ Permissões adequadas (755 para diretórios, 644 para arquivos)
- ✅ Proteção contra acesso a arquivos ocultos
- ✅ Compressão Gzip habilitada

## 🐛 Troubleshooting

### Site não carrega (403 Forbidden)
```bash
# Verificar permissões
ls -la /var/www/bcrypt.gabireze.cloud
sudo chown -R www-data:www-data /var/www/bcrypt.gabireze.cloud
sudo chmod -R 755 /var/www/bcrypt.gabireze.cloud
```

### Nginx não reinicia
```bash
# Ver erro detalhado
sudo nginx -t
sudo systemctl status nginx
sudo journalctl -xeu nginx.service
```

### Certificado SSL expirado
```bash
# Forçar renovação
sudo certbot renew --force-renewal
sudo systemctl reload nginx
```

### Arquivo não aparece atualizado
```bash
# Verificar se o arquivo foi copiado corretamente
ls -lh /var/www/bcrypt.gabireze.cloud/index.html
cat /var/www/bcrypt.gabireze.cloud/index.html | head -20

# Limpar cache do navegador ou testar com curl
curl https://bcrypt.gabireze.cloud/ | head -20
```

## 📞 Suporte

Em caso de problemas, verificar:
1. Logs do Nginx: `/var/log/nginx/bcrypt.gabireze.cloud.error.log`
2. Status do serviço: `sudo systemctl status nginx`
3. Configuração: `sudo nginx -t`
4. Permissões dos arquivos: `ls -la /var/www/bcrypt.gabireze.cloud`

## 📋 Checklist de Deploy

- [ ] Código atualizado do GitHub (`git pull`)
- [ ] Arquivos HTML copiados
- [ ] Arquivos estáticos copiados (robots.txt, sitemap.xml, etc.)
- [ ] Imagens copiadas
- [ ] Permissões ajustadas (www-data:www-data)
- [ ] Nginx testado (`sudo nginx -t`)
- [ ] Nginx recarregado
- [ ] Site testado no navegador
- [ ] Certificado SSL válido

---

**Última atualização**: 14/11/2025
