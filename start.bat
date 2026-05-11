@echo off
title Elie - Lokalny AI Asystent
color 0F

echo.
echo  ======================================
echo   Elie ^| Lokalny Asystent AI
echo  ======================================
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [BLAD] Node.js nie jest zainstalowany!
    echo Pobierz Node.js z: https://nodejs.org
    pause
    exit /b 1
)

REM Check if Ollama is running
curl -s http://localhost:11434/api/tags >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] Ollama nie dziala. Probuje uruchomic...
    start "" "ollama" serve
    timeout /t 3 /nobreak >nul
)

REM Install backend dependencies if needed
if not exist "backend\node_modules" (
    echo [INFO] Instalowanie zaleznosci backendu...
    cd backend
    call npm install
    cd ..
)

REM Install frontend dependencies if needed
if not exist "frontend\node_modules" (
    echo [INFO] Instalowanie zaleznosci frontendu...
    cd frontend
    call npm install
    cd ..
)

echo [OK] Uruchamianie backendu na porcie 3001...
start "Elie Backend" cmd /k "cd backend && node server.js"

timeout /t 2 /nobreak >nul

echo [OK] Uruchamianie frontendu na porcie 3000...
start "Elie Frontend" cmd /k "cd frontend && npm start"

timeout /t 5 /nobreak >nul

echo.
echo [OK] Elie uruchomiony!
echo     Frontend: http://localhost:3000
echo     Backend:  http://localhost:3001
echo.
echo Otwieranie przegladarki...
start http://localhost:3000

echo.
echo Zamknij to okno gdy skonczysz korzystac z Elie.
pause
