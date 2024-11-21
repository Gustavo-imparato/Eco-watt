--TO DO 

-- Tabela relatorio
ALTER TABLE tb_consumo
MODIFY consumo NUMBER;

ALTER TABLE tb_dispositivo
MODIFY consumo_limite NUMBER;

-- FAZENDO DROP DAS TABELAS
DROP TABLE tb_empresa CASCADE CONSTRAINTS;
DROP TABLE tb_dispositivo CASCADE CONSTRAINTS;
DROP TABLE tb_alerta CASCADE CONSTRAINTS;
DROP TABLE tb_consumo CASCADE CONSTRAINTS;
DROP TABLE tb_usuario CASCADE CONSTRAINTS;
DROP TABLE tb_relatorio CASCADE CONSTRAINTS;

--CRIANDO TABELAS

-- Tabela tb_alerta
CREATE TABLE tb_alerta (
    id_alerta     INTEGER PRIMARY KEY,
    mensagem      VARCHAR2(400) NOT NULL,
    data_mensagem DATE NOT NULL
);

-- Tabela tb_consumo
CREATE TABLE tb_consumo (
    id_consumo   NUMBER PRIMARY KEY,
    data_consumo DATE NOT NULL,
    consumo      NUMBER(10, 2) NOT NULL 
);

-- Tabela tb_dispositivo
CREATE TABLE tb_dispositivo (
    id_dispositivo   INTEGER PRIMARY KEY,
    nm_dispositivo   VARCHAR2(100) NOT NULL,
    local            VARCHAR2(150) NOT NULL,
    tipo             VARCHAR2(100),
    consumo_limite   NUMBER(10, 2) NOT NULL,
    id_consumo       INTEGER NOT NULL, 
    id_alerta        INTEGER NOT NULL  
);

-- Tabela tb_empresa
CREATE TABLE tb_empresa (
    id_empresa        INTEGER PRIMARY KEY,
    nm_empresa        VARCHAR2(100) NOT NULL,
    cnpj              VARCHAR2(20),
    email             VARCHAR2(50) NOT NULL,
    id_dispositivo    INTEGER NOT NULL, 
    id_consumo        INTEGER NOT NULL, 
    id_alerta         INTEGER NOT NULL, 
    id_usuario        INTEGER NOT NULL  
);

-- Tabela tb_usuario
CREATE TABLE tb_usuario (
    id_usuario INTEGER PRIMARY KEY,
    nm_usuario VARCHAR2(100) NOT NULL,
    password   VARCHAR2(64) NOT NULL,
    email      VARCHAR2(50) NOT NULL
);

-- Tabela relatorio
CREATE TABLE tb_relatorio (
    id_relatorio INTEGER PRIMARY KEY,
    data_geracao DATE NOT NULL,
    consumo_total NUMBER(10, 2) NOT NULL,
    consumo_medio NUMBER(10, 2) NOT NULL,
    alertas_ativos INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL
);

-- Definindo chaves estrangeiras
ALTER TABLE tb_dispositivo
    ADD CONSTRAINT tb_dispositivo_tb_alerta_fk FOREIGN KEY (id_alerta)
        REFERENCES tb_alerta (id_alerta);

ALTER TABLE tb_dispositivo
    ADD CONSTRAINT tb_dispositivo_tb_consumo_fk FOREIGN KEY (id_consumo)
        REFERENCES tb_consumo (id_consumo);

ALTER TABLE tb_empresa
    ADD CONSTRAINT tb_empresa_tb_dispositivo_fk FOREIGN KEY (id_dispositivo)
        REFERENCES tb_dispositivo (id_dispositivo);

ALTER TABLE tb_empresa
    ADD CONSTRAINT tb_empresa_tb_usuario_fk FOREIGN KEY (id_usuario)
        REFERENCES tb_usuario (id_usuario);
        
ALTER TABLE tb_relatorio
    ADD CONSTRAINT tb_relatorio_tb_usuario_fk FOREIGN KEY (id_usuario)
        REFERENCES tb_usuario (id_usuario);