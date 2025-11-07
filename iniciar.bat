@echo off
chcp 65001 > nul
cls

echo.
echo ═══════════════════════════════════════════════════════════════════
echo   Validador Financeiro LCV-SNK - Inicializador
echo ═══════════════════════════════════════════════════════════════════
echo.
echo Verificando instalações...
echo.

:: Verificar se o Node.js está instalado
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js não encontrado!
    echo Por favor, instale o Node.js de https://nodejs.org/
    pause
    exit /b 1
)

echo ✅ Node.js encontrado:
node --version
echo.

:: Verificar se as dependências do backend estão instaladas
if not exist "backend\node_modules\" (
    echo ⚠️  Dependências do backend não encontradas.
    echo Instalando...
    cd backend
    call npm install
    cd ..
    echo.
)

:: Verificar se as dependências do frontend estão instaladas
if not exist "frontend\node_modules\" (
    echo ⚠️  Dependências do frontend não encontradas.
    echo Instalando...
    cd frontend
    call npm install
    cd ..
    echo.
)

echo ═══════════════════════════════════════════════════════════════════
echo   Iniciando Aplicação
echo ═══════════════════════════════════════════════════════════════════
echo.

echo 🚀 Iniciando Backend (Porta 3002)...
start "Backend - Validador LCV-SNK" cmd /k "cd backend && npm start"

:: Aguardar 5 segundos
timeout /t 5 /nobreak > nul

echo 🌐 Iniciando Frontend (Porta 3003)...
start "Frontend - Validador LCV-SNK" cmd /k "cd frontend && npm run dev"

echo.
echo ═══════════════════════════════════════════════════════════════════
echo   Aplicação Iniciada com Sucesso!
echo ═══════════════════════════════════════════════════════════════════
echo.
echo 📍 URLs da Aplicação:
echo    Frontend:  http://localhost:3003
echo    Backend:   http://localhost:3002
echo    Health:    http://localhost:3002/health
echo.
echo 📝 Aguarde alguns segundos e depois acesse http://localhost:3003
echo.
echo 💡 Dica: Pressione Ctrl+C em cada janela para parar os servidores
echo.
echo ═══════════════════════════════════════════════════════════════════
echo.
pause
