# 🚀 Guia Rápido de Instalação

## Passo a Passo para Rodar o Projeto

### 1️⃣ Instalar Node.js

Se você ainda não tem o Node.js instalado:
- Baixe em: https://nodejs.org/
- Recomendado: versão LTS (Long Term Support)
- Verifique a instalação: `node --version`

### 2️⃣ Instalar Dependências do Backend

Abra o terminal na pasta do projeto e execute:

```bash
cd backend
npm install
```

Isso irá instalar todas as dependências necessárias:
- express
- cors
- dotenv
- mysql2
- tedious
- date-fns
- nodemon (dev)

### 3️⃣ Instalar Dependências do Frontend

Em outro terminal (ou na mesma janela):

```bash
cd frontend
npm install
```

Isso irá instalar:
- react
- react-dom
- axios
- date-fns
- vite
- @vitejs/plugin-react

### 4️⃣ Iniciar o Backend

No terminal do backend:

```bash
npm start
```

Você verá uma mensagem como:
```
═══════════════════════════════════════════════════
  Validador Financeiro LCV-SNK
═══════════════════════════════════════════════════
  🚀 Servidor rodando na porta 3001
  🌐 URL: http://localhost:3001
  📝 Health Check: http://localhost:3001/health
═══════════════════════════════════════════════════
```

### 5️⃣ Iniciar o Frontend

No terminal do frontend:

```bash
npm run dev
```

Você verá:
```
  VITE v5.0.8  ready in XXX ms

  ➜  Local:   http://localhost:3003/
  ➜  Network: use --host to expose
  ➜  press h + enter to show help
```

### 6️⃣ Acessar a Aplicação

Abra seu navegador em: **http://localhost:3003**

## 📋 Resumo dos Comandos

### Backend
```bash
cd backend
npm install          # Instalar dependências
npm start           # Rodar em produção
npm run dev         # Rodar em desenvolvimento (com auto-reload)
```

### Frontend
```bash
cd frontend
npm install         # Instalar dependências
npm run dev        # Rodar servidor de desenvolvimento
npm run build      # Criar build de produção
npm run preview    # Visualizar build de produção
```

## ⚡ Comandos Rápidos (Windows)

Você pode criar um arquivo `iniciar.bat` na raiz do projeto com:

```batch
@echo off
echo Iniciando Backend...
start cmd /k "cd backend && npm start"

timeout /t 3

echo Iniciando Frontend...
start cmd /k "cd frontend && npm run dev"

echo.
echo ========================================
echo Aplicacao iniciada!
echo Backend: http://localhost:3001
echo Frontend: http://localhost:3003
echo ========================================
```

## ⚡ Comandos Rápidos (Linux/Mac)

Você pode criar um arquivo `iniciar.sh` na raiz do projeto com:

```bash
#!/bin/bash

echo "Iniciando Backend..."
cd backend && npm start &

sleep 3

echo "Iniciando Frontend..."
cd frontend && npm run dev &

echo ""
echo "========================================"
echo "Aplicação iniciada!"
echo "Backend: http://localhost:3001"
echo "Frontend: http://localhost:3003"
echo "========================================"
```

Depois execute: `chmod +x iniciar.sh && ./iniciar.sh`

## 🔍 Testar Conexões

Para testar se as conexões com os bancos de dados estão funcionando:

1. Acesse: http://localhost:3001/api/validation/test-connections
2. Você deve ver algo como:

```json
{
  "success": true,
  "connections": {
    "locavia": true,
    "sankhya": true,
    "errors": {}
  }
}
```

## ❗ Problemas Comuns

### Porta já em uso

Se a porta 3001 ou 3003 estiver em uso:

**Backend** - Edite o `.env` e mude a porta:
```
PORT=3002
```

**Frontend** - Edite o `vite.config.js` e mude a porta:
```js
server: {
  port: 3004
}
```

### Erro ao conectar com banco de dados

1. Verifique as credenciais no arquivo `.env`
2. Teste a conexão usando: http://localhost:3001/api/validation/test-connections
3. Verifique se os servidores de banco de dados estão acessíveis

### Módulos não encontrados

```bash
# Limpar cache e reinstalar
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

## 📦 Lista de Dependências Instaladas

### Backend (package.json)
```json
{
  "dependencies": {
    "express": "^4.18.2",
    "cors": "^2.8.5",
    "dotenv": "^16.3.1",
    "mysql2": "^3.6.5",
    "tedious": "^16.6.1",
    "date-fns": "^3.0.6"
  },
  "devDependencies": {
    "nodemon": "^3.0.2"
  }
}
```

### Frontend (package.json)
```json
{
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "axios": "^1.6.2",
    "date-fns": "^3.0.6"
  },
  "devDependencies": {
    "@types/react": "^18.2.43",
    "@types/react-dom": "^18.2.17",
    "@vitejs/plugin-react": "^4.2.1",
    "vite": "^5.0.8"
  }
}
```

## ✅ Pronto!

Agora você está pronto para usar o Validador Financeiro LCV-SNK! 🎉
