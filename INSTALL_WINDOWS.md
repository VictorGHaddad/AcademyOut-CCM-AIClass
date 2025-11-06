# 🪟 Guia de Instalação - Windows

Guia rápido para configurar **Python 3.12** e o ambiente virtual no Windows.

---

## 🚀 Instalação Rápida (Recomendada)

Agora o processo é dividido em **duas fases** para garantir que tudo funcione corretamente:

### 🔹 Fase 1 — Instalar o Python

1. **Abra o PowerShell**  
   (se possível, clique com o botão direito e escolha *Executar como administrador*)

2. Navegue até a pasta do projeto:
   ```powershell
   cd caminho\para\AcademyOut-CCM-AIClass



3. Execute o comando de instalação:

   .\setup_python.ps1 -fase install

4. Execute o comando de instalação:

   .\setup_python.ps1 -fase install


O script irá:

✅ Baixar o Python 3.12 automaticamente

✅ Instalar silenciosamente

✅ Adicionar o Python ao PATH

✅ Validar a instalação

💡 Importante: Caso o PowerShell não reconheça o comando python imediatamente, feche e reabra o PowerShell, depois prossiga com a próxima fase.


🔹 Fase 2 — Criar o Ambiente Virtual

Após o Python estar instalado e reconhecido, execute:

   .\setup_python.ps1 -fase setup


O script irá:

✅ Criar o ambiente virtual venv

✅ (Opcional) Permitir recriar caso já exista

✅ Instruir sobre os próximos passos

🧩 (Opcional) Instalar Dependências

Caso queira instalar automaticamente os pacotes do projeto (como Jupyter, Pandas, etc.):

   .\venv\Scripts\Activate.ps1
   pip install -r requirements.txt