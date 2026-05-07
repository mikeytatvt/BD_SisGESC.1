# Projeto SisGESC - Banco de Dados 

Nesse repositório do SisGESC (Sistema de Gestão Escolar). Este projeto funciona usando a modelagem completa de um banco de dados transacional chamado OLTP, com uma criação de um Data Warehouse (OLAP) utilizando Star Schema e processos de ETL e de análises de performance e integridade de dados.

# Estrutura do Repositório

- `/sql/`: Contém os scripts divididos por fases do projeto.
- `run_all.sql`: Script unificado para rodar todo o projeto com um único comando.
- `dicionario_de_dados.md`: Descrição detalhada das tabelas e colunas.
- `der_sisgesc.png`: Imagem do Diagrama do Projeto

# Como executar o nosso projeto

Para deixar mais fácil de utilizar a banca técnica colocamos de uma forma unificada e simples de entender com um passo a passo.

1. Clone o repositório em sua máquina.
2. Abra o terminal do seu SGBD (ex: MySQL Command Line ou MySQL Workbench).
3. Navegue até o diretório raiz do projeto.
4. Execute o script principal:
   ```sql
   SOURCE run_all.sql;
