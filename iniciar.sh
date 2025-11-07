#!/bin/bash

clear

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "  Validador Financeiro LCV-SNK - Inicializador"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "Verificando instalações..."
echo ""

# Verificar se o Node.js está instalado
if ! command -v node &> /dev/null; then
    echo "❌ Node.js não encontrado!"
    echo "Por favor, instale o Node.js de https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js encontrado: $(node --version)"
echo ""

# Verificar se as dependências do backend estão instaladas
if [ ! -d "backend/node_modules" ]; then
    echo "⚠️  Dependências do backend não encontradas."
    echo "Instalando..."
    cd backend
    npm install
    cd ..
    echo ""
fi

# Verificar se as dependências do frontend estão instaladas
if [ ! -d "frontend/node_modules" ]; then
    echo "⚠️  Dependências do frontend não encontradas."
    echo "Instalando..."
    cd frontend
    npm install
    cd ..
    echo ""
fi

echo "═══════════════════════════════════════════════════════════════════"
echo "  Iniciando Aplicação"
echo "═══════════════════════════════════════════════════════════════════"
echo ""

# Criar diretório para logs se não existir
mkdir -p logs

echo "🚀 Iniciando Backend (Porta 3002)..."
cd backend
npm start > ../logs/backend.log 2>&1 &
BACKEND_PID=$!
cd ..

# Aguardar 5 segundos
sleep 5

echo "🌐 Iniciando Frontend (Porta 3003)..."
cd frontend
npm run dev > ../logs/frontend.log 2>&1 &
FRONTEND_PID=$!
cd ..

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "  Aplicação Iniciada com Sucesso!"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "📍 URLs da Aplicação:"
echo "   Frontend:  http://localhost:3003"
echo "   Backend:   http://localhost:3002"
echo "   Health:    http://localhost:3002/health"
echo ""
echo "📝 PIDs dos Processos:"
echo "   Backend:  $BACKEND_PID"
echo "   Frontend: $FRONTEND_PID"
echo ""
echo "💡 Para parar os servidores, execute: ./parar.sh"
echo ""
echo "📄 Logs salvos em:"
echo "   Backend:  logs/backend.log"
echo "   Frontend: logs/frontend.log"
echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo ""

# Salvar PIDs para o script de parada
echo "$BACKEND_PID" > logs/backend.pid
echo "$FRONTEND_PID" > logs/frontend.pid

echo "Pressione Ctrl+C para parar todos os serviços..."
echo ""

# Aguardar interrupção
trap "kill $BACKEND_PID $FRONTEND_PID 2>/dev/null; echo ''; echo 'Servidores parados.'; exit" INT TERM

# Manter o script rodando
wait
