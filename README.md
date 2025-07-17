# Sistema de Cadastro de Colaboradores Consulting

## Descrição

Este projeto implementa um sistema completo para cadastro de colaboradores, com foco em **segurança, consistência e rastreabilidade** das informações.

O sistema valida rigorosamente os dados inseridos (como nome, CPF, e-mail, CEP, data de nascimento), utiliza a API pública ViaCEP para preencher automaticamente os dados de endereço a partir do CEP, armazena as informações em um banco de dados SQLite e registra todas as operações em arquivo de log.

Além disso, conta com uma suíte de testes automatizados que cobrem validações, chamadas à API e operações no banco, garantindo a confiabilidade do sistema.

---

## Funcionalidades

- Validação dos campos de entrada via expressões regulares:
  - Nome completo
  - CPF (formato: `000.000.000-00`)
  - E-mail válido
  - CEP (formato: `00000-000`)
  - Data de nascimento (`dd/mm/aaaa`)

- Consulta automática de endereço pela API ViaCEP, preenchendo:
  - Rua
  - Cidade
  - Estado

- Armazenamento dos dados em banco de dados SQLite (`colaboradores.db`):
  - Tabela `colaboradores` com todas as informações

- Registro de todas as operações (inserções, consultas, erros etc.) em arquivo de log `logs.txt` com data e hora.

- Testes automatizados usando `unittest`, cobrindo:
  - Validação das entradas
  - Consulta à API ViaCEP (para CEP válido e inválido)
  - Inserção e consulta no banco de dados

---

## Estrutura dos Arquivos

- `main.py` — Script principal com as funcionalidades do sistema
- `colaboradores.db` — Banco de dados SQLite gerado
- `tests.py` — Testes automatizados com unittest
- `logs.txt` — Arquivo de logs gerado durante a execução do sistema
- `README.md` — Este arquivo de documentação


