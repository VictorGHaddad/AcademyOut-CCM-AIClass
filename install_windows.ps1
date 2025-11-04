# ============================================================
# Script de Instalacao Python 3.12 - Windows (PowerShell)
# ============================================================

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " Instalacao do Python 3.12 e Ambiente Virtual" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# Verificar se Python esta instalado
try {
    $pythonVersion = python --version 2>&1
    Write-Host "[OK] Python encontrado!" -ForegroundColor Green
    Write-Host $pythonVersion
    Write-Host ""
}
catch {
    Write-Host "[AVISO] Python nao encontrado. Iniciando download..." -ForegroundColor Yellow
    Write-Host ""
    
    # Baixar Python 3.12
    Write-Host "Baixando Python 3.12..." -ForegroundColor Cyan
    $url = "https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe"
    $output = "python-installer.exe"
    
    try {
        Invoke-WebRequest -Uri $url -OutFile $output
        Write-Host "[OK] Download concluido!" -ForegroundColor Green
        Write-Host ""
        
        Write-Host "Instalando Python 3.12..." -ForegroundColor Cyan
        Write-Host "IMPORTANTE: Marque a opcao 'Add Python to PATH'!" -ForegroundColor Yellow
        Write-Host ""
        
        # Instalar Python silenciosamente
        Start-Process -FilePath $output -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1" -Wait
        
        Write-Host "[OK] Python instalado!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Por favor, FECHE e REABRA o PowerShell, depois execute este script novamente." -ForegroundColor Yellow
        
        Remove-Item $output -ErrorAction SilentlyContinue
        Read-Host "Pressione Enter para sair"
        exit 0
    }
    catch {
        Write-Host "[ERRO] Falha no download!" -ForegroundColor Red
        Write-Host "Por favor, baixe manualmente: https://www.python.org/downloads/" -ForegroundColor Yellow
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
