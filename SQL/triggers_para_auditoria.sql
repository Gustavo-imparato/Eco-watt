--AUDITORIA
--AUDITORIA DE ALERTA
CREATE SEQUENCE audit_tb_alerta_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE audit_tb_alerta (
    audit_id        INTEGER PRIMARY KEY,
    operacao        VARCHAR2(10) NOT NULL,
    usuario         VARCHAR2(30) DEFAULT USER,
    data_hora       DATE DEFAULT SYSDATE,
    id_alerta       INTEGER,
    mensagem        VARCHAR2(400),
    data_mensagem   DATE    
);


CREATE OR REPLACE TRIGGER trg_audit_tb_alerta
AFTER INSERT OR UPDATE OR DELETE ON tb_alerta
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO audit_tb_alerta (audit_id, operacao, usuario, data_hora, id_alerta, mensagem, data_mensagem)
        VALUES (audit_tb_alerta_seq.NEXTVAL, 'INSERT', USER, SYSDATE, :NEW.id_alerta, :NEW.mensagem, :NEW.data_mensagem);
    ELSIF UPDATING THEN
        INSERT INTO audit_tb_alerta (audit_id, operacao, usuario, data_hora, id_alerta, mensagem, data_mensagem)
        VALUES (audit_tb_alerta_seq.NEXTVAL, 'UPDATE', USER, SYSDATE, :NEW.id_alerta, :NEW.mensagem, :NEW.data_mensagem);
    ELSIF DELETING THEN
        INSERT INTO audit_tb_alerta (audit_id, operacao, usuario, data_hora, id_alerta, mensagem, data_mensagem)
        VALUES (audit_tb_alerta_seq.NEXTVAL, 'DELETE', USER, SYSDATE, :OLD.id_alerta, :OLD.mensagem, :OLD.data_mensagem);
    END IF;
END;

--auditoria de consumo
CREATE SEQUENCE audit_tb_consumo_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE audit_tb_consumo (
    audit_id        INTEGER PRIMARY KEY,
    operacao        VARCHAR2(10) NOT NULL,
    usuario         VARCHAR2(30) DEFAULT USER,
    data_hora       DATE DEFAULT SYSDATE,
    id_consumo      NUMBER,
    data_consumo    DATE,
    consumo         NUMBER
);


CREATE OR REPLACE TRIGGER trg_audit_tb_consumo
AFTER INSERT OR UPDATE OR DELETE ON tb_consumo
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO audit_tb_consumo (audit_id, operacao, usuario, data_hora, id_consumo, data_consumo, consumo)
        VALUES (audit_tb_consumo_seq.NEXTVAL, 'INSERT', USER, SYSDATE, :NEW.id_consumo, :NEW.data_consumo, :NEW.consumo);
    ELSIF UPDATING THEN
        INSERT INTO audit_tb_consumo (audit_id, operacao, usuario, data_hora, id_consumo, data_consumo, consumo)
        VALUES (audit_tb_consumo_seq.NEXTVAL, 'UPDATE', USER, SYSDATE, :NEW.id_consumo, :NEW.data_consumo, :NEW.consumo);
    ELSIF DELETING THEN
        INSERT INTO audit_tb_consumo (audit_id, operacao, usuario, data_hora, id_consumo, data_consumo, consumo)
        VALUES (audit_tb_consumo_seq.NEXTVAL, 'DELETE', USER, SYSDATE, :OLD.id_consumo, :OLD.data_consumo, :OLD.consumo);
    END IF;
END;


--auditoria de dispositivo
CREATE SEQUENCE audit_tb_dispositivo_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE audit_tb_dispositivo (
    audit_id          INTEGER PRIMARY KEY,
    operacao          VARCHAR2(10) NOT NULL,
    usuario           VARCHAR2(30) DEFAULT USER,
    data_hora         DATE DEFAULT SYSDATE,
    id_dispositivo    INTEGER,
    nm_dispositivo    VARCHAR2(100),
    local             VARCHAR2(150),
    tipo              VARCHAR2(100),
    consumo_limite    NUMBER,
    id_consumo        INTEGER,
    id_alerta         INTEGER
);


CREATE OR REPLACE TRIGGER trg_audit_tb_dispositivo
AFTER INSERT OR UPDATE OR DELETE ON tb_dispositivo
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO audit_tb_dispositivo (audit_id, operacao, usuario, data_hora, id_dispositivo, nm_dispositivo, local, tipo, consumo_limite, id_consumo, id_alerta)
        VALUES (audit_tb_dispositivo_seq.NEXTVAL, 'INSERT', USER, SYSDATE, :NEW.id_dispositivo, :NEW.nm_dispositivo, :NEW.local, :NEW.tipo, :NEW.consumo_limite, :NEW.id_consumo, :NEW.id_alerta);
    ELSIF UPDATING THEN
        INSERT INTO audit_tb_dispositivo (audit_id, operacao, usuario, data_hora, id_dispositivo, nm_dispositivo, local, tipo, consumo_limite, id_consumo, id_alerta)
        VALUES (audit_tb_dispositivo_seq.NEXTVAL, 'UPDATE', USER, SYSDATE, :NEW.id_dispositivo, :NEW.nm_dispositivo, :NEW.local, :NEW.tipo, :NEW.consumo_limite, :NEW.id_consumo, :NEW.id_alerta);
    ELSIF DELETING THEN
        INSERT INTO audit_tb_dispositivo (audit_id, operacao, usuario, data_hora, id_dispositivo, nm_dispositivo, local, tipo, consumo_limite, id_consumo, id_alerta)
        VALUES (audit_tb_dispositivo_seq.NEXTVAL, 'DELETE', USER, SYSDATE, :OLD.id_dispositivo, :OLD.nm_dispositivo, :OLD.local, :OLD.tipo, :OLD.consumo_limite, :OLD.id_consumo, :OLD.id_alerta);
    END IF;
END;

--auditoria de empresa 
CREATE SEQUENCE audit_tb_empresa_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE audit_tb_empresa (
    audit_id         INTEGER PRIMARY KEY,
    operacao         VARCHAR2(10) NOT NULL,
    usuario          VARCHAR2(30) DEFAULT USER,
    data_hora        DATE DEFAULT SYSDATE,
    id_empresa       INTEGER,
    nm_empresa       VARCHAR2(100),
    cnpj             VARCHAR2(20),
    email            VARCHAR2(50),
    id_dispositivo   INTEGER,
    id_consumo       INTEGER,
    id_alerta        INTEGER,
    id_usuario       INTEGER
);

CREATE OR REPLACE TRIGGER trg_audit_tb_empresa
AFTER INSERT OR UPDATE OR DELETE ON tb_empresa
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO audit_tb_empresa (audit_id, operacao, usuario, data_hora, id_empresa, nm_empresa, cnpj, email, id_dispositivo, id_consumo, id_alerta, id_usuario)
        VALUES (audit_tb_empresa_seq.NEXTVAL, 'INSERT', USER, SYSDATE, :NEW.id_empresa, :NEW.nm_empresa, :NEW.cnpj, :NEW.email, :NEW.id_dispositivo, :NEW.id_consumo, :NEW.id_alerta, :NEW.id_usuario);
    ELSIF UPDATING THEN
        INSERT INTO audit_tb_empresa (audit_id, operacao, usuario, data_hora, id_empresa, nm_empresa, cnpj, email, id_dispositivo, id_consumo, id_alerta, id_usuario)
        VALUES (audit_tb_empresa_seq.NEXTVAL, 'UPDATE', USER, SYSDATE, :NEW.id_empresa, :NEW.nm_empresa, :NEW.cnpj, :NEW.email, :NEW.id_dispositivo, :NEW.id_consumo, :NEW.id_alerta, :NEW.id_usuario);
    ELSIF DELETING THEN
        INSERT INTO audit_tb_empresa (audit_id, operacao, usuario, data_hora, id_empresa, nm_empresa, cnpj, email, id_dispositivo, id_consumo, id_alerta, id_usuario)
        VALUES (audit_tb_empresa_seq.NEXTVAL, 'DELETE', USER, SYSDATE, :OLD.id_empresa, :OLD.nm_empresa, :OLD.cnpj, :OLD.email, :OLD.id_dispositivo, :OLD.id_consumo, :OLD.id_alerta, :OLD.id_usuario);
    END IF;
END;

--auditoria de usuario
CREATE SEQUENCE audit_tb_usuario_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE audit_tb_usuario (
    audit_id     INTEGER PRIMARY KEY,
    operacao     VARCHAR2(10) NOT NULL,
    usuario      VARCHAR2(30) DEFAULT USER,
    data_hora    DATE DEFAULT SYSDATE,
    id_usuario   INTEGER,
    nm_usuario   VARCHAR2(100),
    email        VARCHAR2(50)
);

CREATE OR REPLACE TRIGGER trg_audit_tb_usuario
AFTER INSERT OR UPDATE OR DELETE ON tb_usuario
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO audit_tb_usuario (audit_id, operacao, usuario, data_hora, id_usuario, nm_usuario, email)
        VALUES (audit_tb_usuario_seq.NEXTVAL, 'INSERT', USER, SYSDATE, :NEW.id_usuario, :NEW.nm_usuario, :NEW.email);
    ELSIF UPDATING THEN
        INSERT INTO audit_tb_usuario (audit_id, operacao, usuario, data_hora, id_usuario, nm_usuario, email)
        VALUES (audit_tb_usuario_seq.NEXTVAL, 'UPDATE', USER, SYSDATE, :NEW.id_usuario, :NEW.nm_usuario, :NEW.email);
    ELSIF DELETING THEN
        INSERT INTO audit_tb_usuario (audit_id, operacao, usuario, data_hora, id_usuario, nm_usuario, email)
        VALUES (audit_tb_usuario_seq.NEXTVAL, 'DELETE', USER, SYSDATE, :OLD.id_usuario, :OLD.nm_usuario, :OLD.email);
    END IF;
END;


--auditoria de relatorio
CREATE SEQUENCE audit_tb_relatorio_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE audit_tb_relatorio (
    audit_id        INTEGER PRIMARY KEY,
    operacao        VARCHAR2(10) NOT NULL,
    usuario         VARCHAR2(30) DEFAULT USER,
    data_hora       DATE DEFAULT SYSDATE,
    id_relatorio    INTEGER,
    data_geracao    DATE,
    consumo_total   NUMBER,
    consumo_medio   NUMBER,
    alertas_ativos  INTEGER,
    id_usuario      INTEGER
);


CREATE OR REPLACE TRIGGER trg_audit_tb_relatorio
AFTER INSERT OR UPDATE OR DELETE ON tb_relatorio
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO audit_tb_relatorio (audit_id, operacao, usuario, data_hora, id_relatorio, data_geracao, consumo_total, consumo_medio, alertas_ativos, id_usuario)
        VALUES (audit_tb_relatorio_seq.NEXTVAL, 'INSERT', USER, SYSDATE, :NEW.id_relatorio, :NEW.data_geracao, :NEW.consumo_total, :NEW.consumo_medio, :NEW.alertas_ativos, :NEW.id_usuario);
    ELSIF UPDATING THEN
        INSERT INTO audit_tb_relatorio (audit_id, operacao, usuario, data_hora, id_relatorio, data_geracao, consumo_total, consumo_medio, alertas_ativos, id_usuario)
        VALUES (audit_tb_relatorio_seq.NEXTVAL, 'UPDATE', USER, SYSDATE, :NEW.id_relatorio, :NEW.data_geracao, :NEW.consumo_total, :NEW.consumo_medio, :NEW.alertas_ativos, :NEW.id_usuario);
    ELSIF DELETING THEN
        INSERT INTO audit_tb_relatorio (audit_id, operacao, usuario, data_hora, id_relatorio, data_geracao, consumo_total, consumo_medio, alertas_ativos, id_usuario)
        VALUES (audit_tb_relatorio_seq.NEXTVAL, 'DELETE', USER, SYSDATE, :OLD.id_relatorio, :OLD.data_geracao, :OLD.consumo_total, :OLD.consumo_medio, :OLD.alertas_ativos, :OLD.id_usuario);
    END IF;
END;


--TESTE DAS AUDITORIAS
BEGIN
    inserir_alerta(17, 'alerta de super aquecimento', CURRENT_TIMESTAMP);
    inserir_consumo(17, TO_DATE('2024-12-7', 'YYYY-MM-DD'), 400.00);
    inserir_dispositivo(17, 'sensor de calor sala de maquinas', 'sala 401', 'sensor de calor', 300.00, 17, 17);
    inserir_usuario(17, 'Darrow', 'reaper', 'ares@mars.com');
    inserir_empresa(17, 'Mars e co', '22.334.455/0001-22', 'contato@mars.com', 17, 17, 17, 17);
    inserir_relatorio(17, TO_DATE('2002-11-30', 'YYYY-MM-DD'), 7000.74, 230, 9, 17);
END;

UPDATE tb_alerta
SET mensagem = 'alerta de hiperaquecimento'
WHERE id_alerta = 17;

UPDATE tb_consumo
SET consumo = 405.45
WHERE id_consumo = 17;

UPDATE tb_dispositivo
SET local = 'sala 701'
WHERE id_dispositivo = 17;

UPDATE tb_usuario
SET nm_usuario = 'Darrow o lykos'
WHERE id_usuario = 17;

UPDATE tb_empresa
SET email = 'support@marssolutions.com'
WHERE id_empresa = 17;

UPDATE tb_relatorio
SET consumo_total = 8000.00
WHERE id_relatorio = 17;

DELETE FROM tb_alerta
WHERE id_alerta = 17;

DELETE FROM tb_consumo
WHERE id_consumo = 17;

DELETE FROM tb_dispositivo
WHERE id_dispositivo = 17;

DELETE FROM tb_usuario
WHERE id_usuario = 17;

DELETE FROM tb_empresa
WHERE id_empresa = 17;

DELETE FROM tb_relatorio
WHERE id_relatorio = 17;

SELECT * FROM audit_tb_alerta;
SELECT * FROM audit_tb_consumo;
SELECT * FROM audit_tb_dispositivo;
SELECT * FROM audit_tb_empresa;
SELECT * FROM audit_tb_usuario;
SELECT * FROM audit_tb_relatorio;

