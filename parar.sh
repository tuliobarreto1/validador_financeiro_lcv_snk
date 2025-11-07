#!/bin/bash

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "  Parando Validador Financeiro LCV-SNK"
echo "═══════════════════════════════════════════════════════════════════"
echo ""

# Verificar se os arquivos PID existem
if [ -f "logs/backend.pid" ]; then
    BACKEND_PID=$(cat logs/backend.pid)
    echo "Parando Backend (PID: $BACKEND_PID)..."
    kill $BACKEND_PID 2>/dev/null
    rm logs/backend.pid
    echo "✅ Backend parado"
else
    echo "⚠️  PID do Backend não encontrado"
fi

if [ -f "logs/frontend.pid" ]; then
    FRONTEND_PID=$(cat logs/frontend.pid)
    echo "Parando Frontend (PID: $FRONTEND_PID)..."
    kill $FRONTEND_PID 2>/dev/null
    rm logs/frontend.pid
    echo "✅ Frontend parado"
else
    echo "⚠️  PID do Frontend não encontrado"
fi

# Tentar matar processos restantes nas portas
echo ""
echo "Verificando processos nas portas 3003 e 3002..."

# Linux
if command -v fuser &> /dev/null; then
    fuser -k 3003/tcp 2>/dev/null
    fuser -k 3002/tcp 2>/dev/null
fi

# macOS
if command -v lsof &> /dev/null; then
    kill $(lsof -t -i:3003) 2>/dev/null
    kill $(lsof -t -i:3002) 2>/dev/null
fi

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "  Todos os serviços foram parados"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
