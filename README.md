# 📊 Data Quality - Validação e Enriquecimento de Contatos

## 🧠 Contexto

Em bases de dados reais, é comum encontrar inconsistências em informações de contato como e-mails e telefones.  
Esses problemas impactam diretamente a efetividade de campanhas, a comunicação com clientes e a tomada de decisão.

---

## ⚠️ Problema

Dados de contato podem conter:

- E-mails inválidos ou com padrões de teste (ex: "teste@", "naotem@...")
- Telefones com formatação incorreta ou inválidos
- Informações ausentes ou inconsistentes

Isso pode gerar:
- Baixa taxa de contato
- Erros operacionais
- Decisões baseadas em dados incorretos

---

## 🛠️ Solução

Desenvolvi uma análise em SQL com foco em qualidade de dados, aplicando regras de validação mais robustas, como:

### 📧 E-mails
- Validação de formato
- Identificação de padrões inválidos (teste, placeholder, etc)
- Normalização dos dados

### 📞 Telefones
- Remoção de caracteres não numéricos
- Validação de quantidade de dígitos (10 ou 11)
- Regras para identificação de números inválidos

---

## 📊 Análise de Qualidade

A análise não apenas identifica inconsistências, mas mede o impacto da qualidade dos dados:

- % de e-mails inválidos  
- % de telefones inválidos  
- % de contatos totalmente válidos  
- % de clientes sem nenhum contato válido  

---

## 📈 Impacto

Esse tipo de análise permite:

- Aumentar a eficiência de campanhas  
- Reduzir erros operacionais  
- Melhorar a confiabilidade dos dados  
- Apoiar decisões mais assertivas  

---

## 🧪 Tecnologias utilizadas

- SQL  
- Lógica de validação de dados  
- Estruturação analítica  

---

## ⚠️ Observação

Projeto desenvolvido com dados fictícios, inspirado em cenários reais de negócio.