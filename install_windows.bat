@echo off
REM ============================================================
REM Script de Instalacao Python 3.12 - Windows
REM ============================================================

echo.
echo ============================================================
echo  Instalacao do Python 3.12 e Ambiente Virtual
echo ============================================================
echo.

REM Criar pasta temp se nao existir
if not exist "c:\temp" mkdir "c:\temp"

REM Baixar Python 3.12
echo Baixando Python 3.12...
powershell -Command "Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.12.0/python-3.12.0.exe' -OutFile 'c:\temp\python-3.12.0.exe'"

if not exist "c:\temp\python-3.12.0.exe" (
    echo [ERRO] Falha no download!
    pause
    exit /b 1
)

echo [OK] Download concluido!
echo.
echo Instalando Python 3.12...

REM Instalar Python
c:\temp\python-3.12.0.exe /quiet InstallAllUsers=0 InstallLauncherAllUsers=0 PrependPath=1 Include_test=0

echo.
echo [OK] Python instalado!
echo.
echo IMPORTANTE: Por favor, FECHE e REABRA este terminal.
echo Depois execute este script novamente para criar o ambiente virtual.
pause
exit /b 0

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
