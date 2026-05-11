@echo off
title Elie - Instalacja
color 0F

echo.
echo  ======================================
echo   Elie ^| Instalacja i konfiguracja
echo  ======================================
echo.

REM Check Node.js
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [BLAD] Node.js nie znaleziony!
    echo.
    echo Krok 1: Pobierz i zainstaluj Node.js LTS z:
    echo         https://nodejs.org
    echo.
    echo Nastepnie uruchom ten skrypt ponownie.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VER=%%i
echo [OK] Node.js %NODE_VER% - znaleziony

REM Check npm
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [BLAD] npm nie znaleziony!
    pause
    exit /b 1
)

echo [OK] npm znaleziony

REM Install backend
echo.
echo [INFO] Instalowanie zaleznosci backendu...
cd backend
call npm install
if %errorlevel% neq 0 (
    echo [BLAD] Instalacja backendu nie powiodla sie!
    pause
    exit /b 1
)
cd ..
echo [OK] Backend - zainstalowany

REM Install frontend
echo.
echo [INFO] Instalowanie zaleznosci frontendu (moze trwac kilka minut)...
cd frontend
call npm install
if %errorlevel% neq 0 (
    echo [BLAD] Instalacja frontendu nie powiodla sie!
    pause
    exit /b 1
)
cd ..
echo [OK] Frontend - zainstalowany

REM Check Ollama
echo.
curl -s http://localhost:11434/api/tags >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Ollama dziala!
) else (
    echo [UWAGA] Ollama nie dziala.
    echo.
    echo Aby pobrac i zainstalowac Ollama:
    echo 1. Wejdz na: https://ollama.com/download
    echo 2. Pobierz instalator Windows
    echo 3. Zainstaluj Ollame
    echo 4. Nastepnie pobierz modele komendami:
    echo.
    echo    ollama pull gemma4:e4b
    echo    ollama pull gemma4:e2b
    echo.
)

echo.
echo  ======================================
echo   Instalacja zakonczona!
echo  ======================================
echo.
echo  Aby uruchomic Elie, kliknij dwukrotnie:
echo  start.bat
echo.
pause
