<#
.SYNOPSIS
    Instala o Python 3.12 e configura um ambiente virtual.
.DESCRIPTION
    Este script possui duas fases:
    1. install - Faz download e instala o Python 3.12
    2. setup   - Cria o ambiente virtual e prepara o ambiente
.EXAMPLE
    .\setup_python.ps1 -fase install
    .\setup_python.ps1 -fase setup
#>

param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("install", "setup")]
    [string]$fase
)

# ============================================================
# Funções auxiliares
# ============================================================

function Write-Section($text) {
    Write-Host ""
    Write-Host "============================================================" -ForegroundColor Cyan
    Write-Host " $text" -ForegroundColor Cyan
    Write-Host "============================================================" -ForegroundColor Cyan
    Write-Host ""
}

function Pause-Exit($msg = "Pressione Enter para sair") {
    Read-Host $msg | Out-Null
    exit
}

# ============================================================
# FASE 1 - INSTALACAO DO PYTHON
# ============================================================

if ($fase -eq "install") {

    Write-Section "Instalacao do Python 3.12"

    $url = "https://www.python.org/ftp/python/3.12.0/python-3.12.0.exe"
    $output = "C:\temp\python-3.12.0.exe"

    # Cria pasta temp se necessário
    if (-not (Test-Path "C:\temp")) {
        New-Item -Path "C:\temp" -ItemType Directory -Force | Out-Null
    }

    Write-Host "Baixando instalador..." -ForegroundColor Cyan
    try {
        Invoke-WebRequest -Uri $url -OutFile $output -UseBasicParsing
        Write-Host "[OK] Download concluído!" -ForegroundColor Green
    }
    catch {
        Write-Host "[ERRO] Falha ao baixar o instalador do Python!" -ForegroundColor Red
        Pause-Exit
    }

    Write-Host ""
    Write-Host "Instalando Python 3.12..." -ForegroundColor Cyan
    try {
        Start-Process -FilePath $output -ArgumentList "/quiet", "InstallAllUsers=0", "InstallLauncherAllUsers=0", "PrependPath=1", "Include_test=0" -Wait
        Write-Host "[OK] Instalação concluída!" -ForegroundColor Green
    }
    catch {
        Write-Host "[ERRO] Falha durante a instalação do Python!" -ForegroundColor Red
        Pause-Exit
    }

    Write-Host ""
    Write-Host "Atualizando variáveis de ambiente..." -ForegroundColor Cyan

    # Recarrega PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

    # Testa se Python está disponível
    try {
        $pythonVersion = python --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "[OK] Python detectado: $pythonVersion" -ForegroundColor Green
        }
        else {
            throw "Python não encontrado."
        }
    }
    catch {
        Write-Host "[AVISO] O Python foi instalado, mas o PowerShell ainda não reconhece o comando." -ForegroundColor Yellow
        Write-Host "Feche e reabra o PowerShell, depois execute:" -ForegroundColor Yellow
        Write-Host "   .\setup_python.ps1 -fase setup" -ForegroundColor White
        Pause-Exit
    }

    Write-Host ""
    Write-Host "Python instalado com sucesso!" -ForegroundColor Green
    Write-Host "Agora execute:" -ForegroundColor Cyan
    Write-Host "   .\setup_python.ps1 -fase setup" -ForegroundColor Yellow
    Pause-Exit
}

# ============================================================
# FASE 2 - SETUP DO AMBIENTE VIRTUAL
# ============================================================

elseif ($fase -eq "setup") {

    Write-Section "Configuracao do Ambiente Virtual"

    # Verifica se o Python está acessível
    try {
        python --version | Out-Null
    }
    catch {
        Write-Host "[ERRO] Python não encontrado. Execute antes:" -ForegroundColor Red
        Write-Host "   .\setup_python.ps1 -fase install" -ForegroundColor Yellow
        Pause-Exit
    }

    # Cria ambiente virtual
    if (Test-Path "venv") {
        Write-Host "[AVISO] Ambiente virtual 'venv' já existe. Deseja recriar? (S/N)" -ForegroundColor Yellow
        $resposta = Read-Host
        if ($resposta -eq "S" -or $resposta -eq "s") {
            Remove-Item -Recurse -Force venv
        }
        else {
            Write-Host "[INFO] Mantendo ambiente existente." -ForegroundColor Cyan
            Pause-Exit "Pressione Enter para sair"
        }
    }

    Write-Host "Criando ambiente virtual..." -ForegroundColor Cyan
    python -m venv venv

    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERRO] Falha ao criar ambiente virtual!" -ForegroundColor Red
        Pause-Exit
    }

    Write-Host "[OK] Ambiente virtual criado!" -ForegroundColor Green
    Write-Host ""

    Write-Section "Setup Concluido!"

    Write-Host "Proximos passos:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1. Ativar o ambiente virtual:" -ForegroundColor White
    Write-Host "   .\venv\Scripts\Activate.ps1" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "2. Instalar dependências (se houver):" -ForegroundColor White
    Write-Host "   pip install -r requirements.txt" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "3. Iniciar o Jupyter Notebook (opcional):" -ForegroundColor White
    Write-Host "   jupyter notebook" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "============================================================" -ForegroundColor Cyan
    Pause-Exit
}
