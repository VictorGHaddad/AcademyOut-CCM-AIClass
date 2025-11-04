# 🏠 Previsão de Preços de Casas - Curso de Data Science

Repositório com notebooks educacionais sobre Machine Learning e Deep Learning aplicados à previsão de preços de imóveis.

## 📚 Conteúdo

### Aula 01 - Regressão Linear
**Arquivo:** `aula_01.ipynb`

Introdução completa à Ciência de Dados com foco em Regressão Linear:

- 📊 Análise Exploratória de Dados (EDA)
- 🔍 Análise de correlações
- 🧹 Limpeza e preparação de dados
- 📈 Visualizações estatísticas
- 🤖 Modelo de Regressão Linear
- 📊 Avaliação de performance (R², MAE, RMSE)
- 🎯 Interpretação de coeficientes
- 💻 Simulador interativo de preços

**Conceitos abordados:**
- Regressão linear múltipla
- Análise de correlação
- Métricas de avaliação
- Interpretabilidade de modelos

---

### Aula 02 - Redes Neurais
**Arquivo:** `aula_02.ipynb`

Introdução ao Deep Learning com Redes Neurais Artificiais:

- 🧠 Arquitetura de Redes Neurais
- 🔧 Normalização de dados (StandardScaler)
- 🏗️ Construção de modelo Sequential (Keras/TensorFlow)
- 📉 Early Stopping para evitar overfitting
- 📊 Visualização de curvas de aprendizado
- 🎯 Avaliação e comparação com modelos tradicionais
- 💻 Simulador com predições neurais

**Arquitetura do modelo:**
- Camada 1: 64 neurônios + ReLU + Dropout (20%)
- Camada 2: 32 neurônios + ReLU + Dropout (20%)
- Camada 3: 16 neurônios + ReLU
- Camada de saída: 1 neurônio (regressão)
- Otimizador: Adam
- Loss: MSE (Mean Squared Error)

---

## 📁 Dataset

**Arquivo:** `Housing.csv` / `Housing_BR.csv`

Dataset com informações de 545 imóveis contendo:

### Features:
- **area_m2**: Área em metros quadrados
- **quartos**: Número de quartos
- **banheiros**: Número de banheiros
- **andares**: Número de andares
- **rua_principal**: Localizado em rua principal (0/1)
- **quarto_hospedes**: Possui quarto de hóspedes (0/1)
- **porao**: Possui porão (0/1)
- **aquecimento_agua**: Possui aquecimento de água (0/1)
- **ar_condicionado**: Possui ar condicionado (0/1)
- **vagas_garagem**: Número de vagas na garagem
- **area_preferencial**: Localizado em área preferencial (0/1)
- **mobilia**: Estado da mobília (0=sem móveis, 1=semi-mobiliada, 2=mobiliada)

### Target:
- **preco**: Preço em milhares de Reais (R$)

### Transformações aplicadas:
- ✅ Conversão de área: pés² → m² (fator: 0.092903)
- ✅ Conversão de preço: valores originais → milhares de R$
- ✅ Formatação brasileira: R$ 1.234.567,89
- ✅ Colunas em português

---

## 🚀 Como Usar

### 1. Clonar o repositório
```bash
git clone https://github.com/VictorGHaddad/AcademyOut-CCM-AIClass.git
cd AcademyOut-CCM-AIClass
```

### 2. Criar ambiente virtual
```bash
python3 -m venv venv
source venv/bin/activate  # Linux/Mac
# ou
venv\Scripts\activate  # Windows
```

### 3. Instalar dependências
```bash
pip install -r requirements.txt
```

### 4. Executar Jupyter Notebook
```bash
jupyter notebook
```

### 5. Abrir os notebooks
- `aula_01.ipynb` - Comece por aqui!
- `aula_02.ipynb` - Deep Learning

---

## 📦 Dependências

```
pandas
numpy
matplotlib
seaborn
scikit-learn
tensorflow
jupyter
```

Instale tudo de uma vez:
```bash
pip install pandas numpy matplotlib seaborn scikit-learn tensorflow jupyter
```

---

## 🎯 Objetivos de Aprendizado

### Após completar a Aula 01:
- ✅ Entender o processo completo de um projeto de Data Science
- ✅ Realizar análise exploratória de dados
- ✅ Construir e avaliar modelos de regressão linear
- ✅ Interpretar resultados e coeficientes
- ✅ Fazer previsões com modelos treinados

### Após completar a Aula 02:
- ✅ Compreender conceitos básicos de Deep Learning
- ✅ Construir redes neurais com Keras/TensorFlow
- ✅ Aplicar técnicas de regularização (Dropout)
- ✅ Entender a importância da normalização
- ✅ Comparar modelos tradicionais vs redes neurais

---

## 📊 Comparação de Modelos

| Característica | Regressão Linear | Rede Neural |
|----------------|------------------|-------------|
| **Complexidade** | Baixa | Alta |
| **Interpretabilidade** | Alta | Baixa |
| **Relações não-lineares** | Não captura | Captura bem |
| **Quantidade de dados** | Funciona com poucos | Precisa de mais |
| **Tempo de treino** | Rápido | Mais lento |
| **Overfitting** | Raro | Comum (requer cuidado) |

---

## 🛠️ Simuladores Interativos

Ambos os notebooks incluem simuladores onde você pode:

1. **Ajustar características da casa**
   - Área em m²
   - Número de quartos, banheiros, andares
   - Características especiais (AC, porão, etc.)
   - Estado da mobília

2. **Obter previsão instantânea**
   - Preço formatado em Reais (R$)
   - Resumo das características
   - Comparação entre modelos

### Exemplo de uso:
```python
# Alterar valores no simulador
area_m2 = 465.15
quartos = 3
banheiros = 2
ar_condicionado = 1
mobilia = 2  # Mobiliada
# ... executar célula para ver previsão
```

---

## 📈 Resultados Esperados

### Regressão Linear (Aula 01):
- R² Score: ~65-75%
- MAE: ~200-300 mil reais
- Modelo interpretável com coeficientes claros

### Rede Neural (Aula 02):
- R² Score: ~70-80% (pode superar regressão linear)
- MAE: ~180-280 mil reais
- Melhor captura de padrões complexos

---

## 📝 Licença

Este projeto é destinado para fins educacionais.

---

## 🔗 Recursos Adicionais

### Documentação:
- [Pandas](https://pandas.pydata.org/docs/)
- [Scikit-learn](https://scikit-learn.org/stable/)
- [TensorFlow/Keras](https://www.tensorflow.org/api_docs)
- [Matplotlib](https://matplotlib.org/stable/contents.html)
- [Seaborn](https://seaborn.pydata.org/)

### Tutoriais recomendados:
- [Kaggle Learn](https://www.kaggle.com/learn)
- [TensorFlow Tutorials](https://www.tensorflow.org/tutorials)
- [Scikit-learn Tutorials](https://scikit-learn.org/stable/tutorial/index.html)

---

**Bons estudos! 🚀📊🧠**
