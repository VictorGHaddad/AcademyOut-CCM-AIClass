# ============================================================
# Script de Instalacao Python 3.12 - Windows (PowerShell)
# ============================================================

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " Instalacao do Python 3.12 e Ambiente Virtual" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# Verificar se Python esta instalado
$pythonInstalled = Get-Command python -ErrorAction SilentlyContinue

if ($pythonInstalled) {
    $pythonVersion = python --version 2>&1
    Write-Host "[OK] Python encontrado!" -ForegroundColor Green
    Write-Host $pythonVersion
    Write-Host ""
}
else {
    Write-Host "[AVISO] Python nao encontrado. Iniciando instalacao..." -ForegroundColor Yellow
    Write-Host ""
    
    # Criar pasta temp se nao existir
    if (-not (Test-Path "c:\temp")) {
        New-Item -Path "c:\temp" -ItemType Directory -Force | Out-Null
    }
    
    # Baixar Python 3.12
    Write-Host "Baixando Python 3.12..." -ForegroundColor Cyan
    $url = "https://www.python.org/ftp/python/3.12.0/python-3.12.0.exe"
    $output = "c:\temp\python-3.12.0.exe"
    
    try {
        Invoke-WebRequest -Uri $url -OutFile $output
        Write-Host "[OK] Download concluido!" -ForegroundColor Green
        Write-Host ""
        
        Write-Host "Instalando Python 3.12..." -ForegroundColor Cyan
        
        # Instalar Python silenciosamente
        Start-Process -FilePath $output -ArgumentList "/quiet", "InstallAllUsers=0", "InstallLauncherAllUsers=0", "PrependPath=1", "Include_test=0" -Wait
        
        Write-Host "[OK] Python instalado!" -ForegroundColor Green
        Write-Host ""
        Write-Host "IMPORTANTE: Por favor, FECHE e REABRA o PowerShell." -ForegroundColor Yellow
        Write-Host "Depois execute este script novamente para criar o ambiente virtual." -ForegroundColor Yellow
        
        Read-Host "Pressione Enter para sair"
        exit 0
    }
    catch {
        Write-Host "[ERRO] Falha no download!" -ForegroundColor Red
        Write-Host "Erro: $_" -ForegroundColor Red
        Read-Host "Pressione Enter para sair"
        exit 1
    }
}

# Criar ambiente virtual
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "Criando ambiente virtual..." -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan

if (Test-Path "venv") {
    Write-Host "[AVISO] Pasta venv ja existe. Deseja recriar? (S/N)" -ForegroundColor Yellow
    $resposta = Read-Host
    if ($resposta -eq "S" -or $resposta -eq "s") {
        Remove-Item -Recurse -Force venv
    }
    else {
        Write-Host "[INFO] Mantendo ambiente virtual existente." -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Proximos passos:" -ForegroundColor Cyan
        Write-Host "1. Ativar o ambiente virtual: .\venv\Scripts\Activate.ps1" -ForegroundColor White
        Write-Host "2. Instalar as dependencias: pip install -r requirements.txt" -ForegroundColor White
        Write-Host "3. Iniciar o Jupyter: jupyter notebook" -ForegroundColor White
        Read-Host "Pressione Enter para sair"
        exit 0
    }
}

python -m venv venv
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERRO] Falha ao criar ambiente virtual!" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}
Write-Host "[OK] Ambiente virtual criado!" -ForegroundColor Green
Write-Host ""

# Mensagem final
Write-Host "============================================================" -ForegroundColor Green
Write-Host " INSTALACAO CONCLUIDA COM SUCESSO!" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Proximos passos:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Ativar o ambiente virtual:" -ForegroundColor White
Write-Host "   .\venv\Scripts\Activate.ps1" -ForegroundColor Yellow
Write-Host ""
Write-Host "2. Instalar as dependencias:" -ForegroundColor White
Write-Host "   pip install -r requirements.txt" -ForegroundColor Yellow
Write-Host ""
Write-Host "3. Iniciar o Jupyter Notebook:" -ForegroundColor White
Write-Host "   jupyter notebook" -ForegroundColor Yellow
Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Read-Host "Pressione Enter para sair"
