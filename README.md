# 📦 Calculadora de Preços Mínimos

Aplicativo desenvolvido em Delphi com banco de dados Firebird para cadastrar produtos, registrar pedidos e calcular preços mínimos de venda com base em margens definidas. Ideal para controle comercial simplificado com segurança e agilidade.

---

## ✨ Funcionalidades

- 🔐 Login seguro com senha criptografada (SHA-256)
- 🛒 Cadastro de produtos (SKU, descrição, custo, margem mínima, preço de venda)
- 🧾 Cadastro de pedidos com:
  - Seleção de produtos via `DBLookupComboBox`
  - Cálculo automático de total por item (quantidade × preço)
  - Totalização dinâmica do pedido
- 👥 Controle de usuários com validação segura
- 🗃️ Integração com banco Firebird via FireDAC
- 🧠 Arquitetura modular: separação em camadas (View, Model, Controller, DAO)

---

## 🚀 Requisitos

- Delphi 12.3 ou compatível  
- Firebird Database Server  
- IBExpert ou outro gerenciador de banco (opcional)  
- Git (para clonar o projeto)

---

## ⚙️ Instalação

```bash
git clone https://github.com/mabreu2022/calculadoraprecosminimos.git
