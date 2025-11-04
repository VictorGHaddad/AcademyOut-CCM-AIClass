@echo off
REM ============================================================
REM Script de Instalacao Python 3.12 - Windows
REM ============================================================

echo.
echo ============================================================
echo  Instalacao do Python 3.12 e Ambiente Virtual
echo ============================================================
echo.

REM Verificar se Python esta instalado
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [AVISO] Python nao encontrado. Iniciando download...
    echo.
    
    REM Baixar Python 3.12
    echo Baixando Python 3.12...
    powershell -Command "& {Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe' -OutFile 'python-installer.exe'}"
    
    if not exist python-installer.exe (
        echo [ERRO] Falha no download!
        echo Por favor, baixe manualmente: https://www.python.org/downloads/
        pause
        exit /b 1
    )
    
    echo [OK] Download concluido!
    echo.
    echo Instalando Python 3.12...
    echo IMPORTANTE: Marque a opcao "Add Python to PATH"!
    echo.
    
    REM Instalar Python
    python-installer.exe /quiet InstallAllUsers=1 PrependPath=1
    
    echo.
    echo [OK] Python instalado!
    echo Por favor, FECHE e REABRA este terminal, depois execute este script novamente.
    del python-installer.exe
    pause
    exit /b 0
)

echo [OK] Python encontrado!
python --version
echo.

REM Criar ambiente virtual
echo ============================================================
echo Criando ambiente virtual...
echo ============================================================

if exist venv (
    echo [AVISO] Pasta venv ja existe. Deseja recriar? (S/N)
    set /p resposta=
    if /i "%resposta%"=="S" (
        rmdir /s /q venv
    ) else (
        echo [INFO] Mantendo ambiente virtual existente.
        goto :fim
    )
)

python -m venv venv
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao criar ambiente virtual!
    pause
    exit /b 1
)
echo [OK] Ambiente virtual criado!
echo.

:fim
REM Mensagem final
echo ============================================================
echo  INSTALACAO CONCLUIDA COM SUCESSO!
echo ============================================================
echo.
echo Proximos passos:
echo.
echo 1. Ativar o ambiente virtual:
echo    venv\Scripts\activate
echo.
echo 2. Instalar as dependencias:
echo    pip install -r requirements.txt
echo.
echo 3. Iniciar o Jupyter Notebook:
echo    jupyter notebook
echo.
echo ============================================================
pause
