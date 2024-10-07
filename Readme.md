

Comando para se rodar o banco POSTGRESQL em DOCKER:

```chatinput
docker run --name postgresql -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=kanban -p 5432:5432 -d postgres:latest
```

Estrutura do banco de dados:

```chatinput

-- -----------------------------------------------------
-- Table Pessoa
-- -----------------------------------------------------
CREATE TABLE pessoa (
id BIGSERIAL NOT NULL,
nome CHARACTER VARYING(100) NOT NULL,
datanascimento DATE,
cpf CHARACTER VARYING(14),
funcionario BOOLEAN,
gerente BOOLEAN,
CONSTRAINT pk_pessoa PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table Projeto
-- -----------------------------------------------------
CREATE TABLE projeto (
id BIGSERIAL NOT NULL,
nome VARCHAR(200) NOT NULL,
data_inicio DATE,
data_previsao_fim DATE,
data_fim DATE,
descricao VARCHAR(5000),
status VARCHAR(45),
orcamento FLOAT,
risco VARCHAR(45),
idgerente BIGINT NOT NULL,
CONSTRAINT pk_projeto PRIMARY KEY (id),
CONSTRAINT fk_gerente FOREIGN KEY (idgerente)
REFERENCES pessoa (id) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- -----------------------------------------------------
-- Table Membros
-- -----------------------------------------------------
CREATE TABLE membros (
id BIGSERIAL NOT NULL,
idprojeto BIGINT NOT NULL,
idpessoa BIGINT NOT NULL,
papel VARCHAR(100),
CONSTRAINT pk_membros PRIMARY KEY (id),
CONSTRAINT fk_projeto FOREIGN KEY (idprojeto)
REFERENCES projeto (id) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE CASCADE,
CONSTRAINT fk_pessoa FOREIGN KEY (idpessoa)
REFERENCES pessoa (id) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE CASCADE
);
```
