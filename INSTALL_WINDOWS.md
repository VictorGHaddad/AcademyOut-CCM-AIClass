# 🪟 Guia de Instalação - Windows

Guia rápido para configurar Python 3.12 e ambiente virtual no Windows.

---

## 🚀 Instalação Rápida (Recomendado)

### Opção 1: Script Batch (CMD)

1. Abra o **Prompt de Comando** (cmd.exe)
2. Navegue até a pasta do projeto:
   ```cmd
   cd caminho\para\AcademyOut-CCM-AIClass
   ```
3. Execute o script:
   ```cmd
   install_windows.bat
   ```

### Opção 2: Script PowerShell

1. Abra o **PowerShell**
2. Navegue até a pasta do projeto:
   ```powershell
   cd caminho\para\AcademyOut-CCM-AIClass
   ```
3. Execute o script:
   ```powershell
   .\install_windows.ps1
   ```

**O script irá:**
- ✅ Baixar Python 3.12 para `c:\temp\`
- ✅ Instalar Python 3.12 automaticamente
- ✅ Adicionar Python ao PATH
- ✅ Criar ambiente virtual (venv)
- ✅ Instruir sobre os próximos passos

> 💡 **Importante:** Após a instalação do Python, **feche e reabra** o terminal e execute o script novamente para criar o ambiente virtual.

---

---

## 📦 Instalação Manual

Se preferir instalar manualmente, siga os passos abaixo:

### 1. Instalar Python 3.12

1. **Baixe Python 3.12**:
   - Acesse: [https://www.python.org/downloads/release/python-3120/](https://www.python.org/downloads/release/python-3120/)
   - Baixe o instalador apropriado:
     - Para Windows 64-bit: **Windows x86-64 executable installer**
     - Para Windows 32-bit: **Windows x86 executable installer**

2. **Instale o Python**:
   - Execute o instalador baixado
   - ✅ **IMPORTANTE:** Marque **"Add Python 3.12 to PATH"**
   - Clique em **"Install Now"**

---

## 🐛 Solução de Problemas

### Erro: "python não é reconhecido"
**Solução:** Reinstale o Python e marque "Add Python to PATH"

### Erro ao executar script PowerShell
**Solução:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Erro ao instalar TensorFlow
**Solução:** Instale o Visual C++ Redistributable:
- Download: https://aka.ms/vs/17/release/vc_redist.x64.exe

---

## � Próximos Passos

Após a instalação:
1. Ative o ambiente: `venv\Scripts\activate`
2. Instale dependências: `pip install -r requirements.txt`  
3. Execute: `jupyter notebook`
4. Abra: `aula_01.ipynb` ou `aula_02.ipynb`

---

**Pronto para começar! 🚀**
