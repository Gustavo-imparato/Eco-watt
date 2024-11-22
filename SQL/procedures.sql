CREATE OR REPLACE PROCEDURE inserir_alerta(
    p_id_alerta     IN INTEGER,
    p_mensagem      IN VARCHAR2,
    p_data_mensagem IN DATE
) IS
BEGIN
    INSERT INTO tb_alerta (id_alerta, mensagem, data_mensagem)
    VALUES (p_id_alerta, p_mensagem, p_data_mensagem);
END inserir_alerta;
BEGIN
    -- Inserindo dados na tabela tb_alerta
    inserir_alerta(1, 'Alerta de manutenção', CURRENT_TIMESTAMP);
    inserir_alerta(2, 'Alerta excesso de energia', CURRENT_TIMESTAMP);
    inserir_alerta(3, 'Alerta de aquecimento elevado', CURRENT_TIMESTAMP);
    inserir_alerta(4, 'Alerta de falha no sistema', CURRENT_TIMESTAMP);
    inserir_alerta(5, 'Alerta de falha no dispositivo', CURRENT_TIMESTAMP);
    inserir_alerta(6, 'Alerta de falta de reparos', CURRENT_TIMESTAMP);
    inserir_alerta(7, 'Alerta de falha no dispositivo', CURRENT_TIMESTAMP);
    inserir_alerta(8, 'Alerta de hiperaquecimento', CURRENT_TIMESTAMP);
    inserir_alerta(9, 'Alerta de uso excessivo de energia', CURRENT_TIMESTAMP);
    inserir_alerta(10, 'Alerta de falha no resfriamento', CURRENT_TIMESTAMP);
END;


CREATE OR REPLACE PROCEDURE inserir_consumo(
    p_id_consumo   IN INTEGER,
    p_data_consumo IN DATE,
    p_consumo      IN NUMBER
) IS
BEGIN
    INSERT INTO tb_consumo (id_consumo, data_consumo, consumo)
    VALUES (p_id_consumo, p_data_consumo, p_consumo);
END inserir_consumo;
BEGIN
    -- Inserindo dados na tabela tb_consumo
    inserir_consumo(1, TO_DATE('2024-11-13', 'YYYY-MM-DD'), 150.75);
    inserir_consumo(2, TO_DATE('2024-11-13', 'YYYY-MM-DD'), 200.50);
    inserir_consumo(3, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 175.25);
    inserir_consumo(4, TO_DATE('2024-11-14', 'YYYY-MM-DD'), 180.00);
    inserir_consumo(5, TO_DATE('2024-11-17', 'YYYY-MM-DD'), 190.00);
    inserir_consumo(6, TO_DATE('2024-11-20', 'YYYY-MM-DD'), 160.00);
    inserir_consumo(7, TO_DATE('2024-11-21', 'YYYY-MM-DD'), 80.00);
    inserir_consumo(8, TO_DATE('2024-12-01', 'YYYY-MM-DD'), 183.40);
    inserir_consumo(9, TO_DATE('2024-12-05', 'YYYY-MM-DD'), 176.06);
    inserir_consumo(10, TO_DATE('2024-12-10', 'YYYY-MM-DD'), 180.00);
END;

CREATE OR REPLACE PROCEDURE inserir_dispositivo(
    p_id_dispositivo  IN INTEGER,
    p_nm_dispositivo  IN VARCHAR2,
    p_local           IN VARCHAR2,
    p_tipo            IN VARCHAR2,
    p_consumo_limite  IN NUMBER,
    p_id_consumo      IN INTEGER,
    p_id_alerta       IN INTEGER
) IS
BEGIN
    INSERT INTO tb_dispositivo (id_dispositivo, nm_dispositivo, local, tipo, consumo_limite, id_consumo, id_alerta)
    VALUES (p_id_dispositivo, p_nm_dispositivo, p_local, p_tipo, p_consumo_limite, p_id_consumo, p_id_alerta);
END inserir_dispositivo;
BEGIN
    -- Inserindo dados na tabela tb_dispositivo
    inserir_dispositivo(1, 'Dispositivo A', 'Sala 101', 'Sensor', 100.00, 1, 1);
    inserir_dispositivo(2, 'Dispositivo B', 'Sala 101', 'Sensor', 150.00, 2, 2);
    inserir_dispositivo(3, 'Dispositivo C', 'Sala 203', 'Monitor', 200.00, 3, 3);
    inserir_dispositivo(4, 'Dispositivo D', 'Sala 104', 'Controle', 250.00, 4, 4);
    inserir_dispositivo(5, 'Dispositivo E', 'Sala 305', 'Controle de temperatura', 151.00, 5, 5);
    inserir_dispositivo(6, 'Dispositivo F', 'Sala 503', 'Monitor central', 450.00, 6, 6);
    inserir_dispositivo(7, 'Dispositivo G', 'Sala 101', 'Sensor central', 50.00, 7, 7);
    inserir_dispositivo(8, 'Dispositivo H', 'Sala 003', 'Servidor', 600.00, 8, 8);
    inserir_dispositivo(9, 'Dispositivo I', 'Sala 801', 'Sensor de movimentacao', 130.00, 9, 9);
    inserir_dispositivo(10, 'Dispositivo J', 'Sala 909', 'Servidor central', 900.00, 10, 10);
END;

CREATE OR REPLACE PROCEDURE inserir_usuario(
    p_id_usuario IN INTEGER,
    p_nm_usuario IN VARCHAR2,
    p_password   IN VARCHAR2,
    p_email      IN VARCHAR2
) IS
BEGIN
    INSERT INTO tb_usuario (id_usuario, nm_usuario, password, email)
    VALUES (p_id_usuario, p_nm_usuario, p_password, p_email);
END inserir_usuario;
BEGIN
    -- Inserindo dados na tabela tb_usuario
    inserir_usuario(1, 'Teddy Roosevelt', '1890', 'america@email.com');
    inserir_usuario(2, 'Angela Merkel', 'senha456', 'markel@email.com');
    inserir_usuario(3, 'Margaret Thatcher', 'senha789', 'imperio@email.com');
    inserir_usuario(4, 'Dom joao vi', 'senha123', 'costela@email.com');
    inserir_usuario(5, 'Dalinar Kholin', 'senha012', 'dalinar@email.com');
    inserir_usuario(6, 'Dom pedro i', 'senha3442', 'portuga@email.com');
    inserir_usuario(7, 'Barao de maua', '778833', 'brasil@email.com');
    inserir_usuario(8, 'Ulyses grant', 'senha012', 'costa@email.com');
    inserir_usuario(9, 'Alfredo', 'senha012', 'pio@email.com');
    inserir_usuario(10, 'Bluetooth', 'senha012', 'dinamerca@email.com');

END;


CREATE OR REPLACE PROCEDURE inserir_empresa(
    p_id_empresa     IN INTEGER,
    p_nm_empresa     IN VARCHAR2,
    p_cnpj           IN VARCHAR2,
    p_email          IN VARCHAR2,
    p_id_dispositivo IN INTEGER,
    p_id_consumo     IN INTEGER,
    p_id_alerta      IN INTEGER,
    p_id_usuario     IN INTEGER
) IS
BEGIN
    INSERT INTO tb_empresa (id_empresa, nm_empresa, cnpj, email, id_dispositivo, id_consumo, id_alerta, id_usuario)
    VALUES (p_id_empresa, p_nm_empresa, p_cnpj, p_email, p_id_dispositivo, p_id_consumo, p_id_alerta, p_id_usuario);
END inserir_empresa;
BEGIN
    -- Inserindo dados na tabela tb_empresa
    inserir_empresa(1, 'Coca cola', '12.345.678/0001-99', 'contato@empresaA.com', 1, 1, 1, 1);
    inserir_empresa(2, 'Pepsi', '98.765.432/0001-00', 'contato@empresaB.com', 2, 2, 2, 2);
    inserir_empresa(3, 'Guarana', '11.223.344/0001-11', 'contato@empresaC.com', 3, 3, 3, 3);
    inserir_empresa(4, 'Minalva', '22.334.455/0001-22', 'contato@empresaD.com', 4, 4, 4, 4);
    inserir_empresa(5, 'Del vale', '22.334.455/0001-22', 'contato@empresaE.com', 5, 5, 5, 5);
    inserir_empresa(6, 'Aurora', '22.334.455/0001-22', 'contato@empresaF.com', 6, 6, 6, 6);
    inserir_empresa(7, 'Fanta', '22.334.455/0001-22', 'contato@empresaG.com', 7, 7, 7, 7);
    inserir_empresa(8, 'Sprite', '22.334.455/0001-22', 'contato@empresaH.com', 8, 8, 8, 8);
    inserir_empresa(9, 'Guiness', '22.334.455/0001-22', 'contato@empresaI.com', 9, 9, 9, 9);
    inserir_empresa(10, 'Spaten', '22.334.455/0001-22', 'contato@empresaJ.com', 10, 10, 10, 10);
END;

CREATE OR REPLACE PROCEDURE inserir_relatorio(
    p_id_relatorio IN INTEGER,
    p_data_geracao IN DATE,
    p_consumo_total IN NUMBER,
    p_consumo_medio IN NUMBER,
    p_alertas_ativos IN INTEGER,
    p_id_usuario IN INTEGER
) IS
BEGIN
    INSERT INTO tb_relatorio (id_relatorio, data_geracao, consumo_total, consumo_medio, alertas_ativos, id_usuario)
    VALUES (p_id_relatorio, p_data_geracao, p_consumo_total, p_consumo_medio, p_alertas_ativos, p_id_usuario);
END inserir_relatorio;

BEGIN
    inserir_relatorio(1, TO_DATE('2024-10-01', 'YYYY-MM-DD'), 1234.56, 123.45, 2, 1);
    inserir_relatorio(2, TO_DATE('2024-11-10', 'YYYY-MM-DD'), 9876.54, 987.65, 5, 2);
    inserir_relatorio(3, TO_DATE('2024-11-15', 'YYYY-MM-DD'), 4567.89, 456.78, 1, 1);
    inserir_relatorio(4, TO_DATE('2024-11-18', 'YYYY-MM-DD'), 3210.12, 321.01, 3, 4);
    inserir_relatorio(5, TO_DATE('2024-11-20', 'YYYY-MM-DD'), 6789.00, 678.90, 4, 2);
    inserir_relatorio(6, TO_DATE('2024-11-17', 'YYYY-MM-DD'), 7000.00, 300.90, 1, 1);
    inserir_relatorio(7, TO_DATE('2024-12-02', 'YYYY-MM-DD'), 1000.00, 808.90, 9, 4);
    inserir_relatorio(8, TO_DATE('2024-12-21', 'YYYY-MM-DD'), 9000.00, 10.90, 0, 1);
    inserir_relatorio(9, TO_DATE('2024-12-24', 'YYYY-MM-DD'), 2134.89, 378.90, 2, 5);
    inserir_relatorio(10, TO_DATE('2024-12-27', 'YYYY-MM-DD'), 6788.98, 467.90, 7, 2);

END;

SELECT * FROM tb_alerta;
SELECT * FROM tb_dispositivo;
SELECT * FROM tb_consumo;
SELECT * FROM tb_empresa;
SELECT * FROM tb_usuario;
SELECT * FROM tb_relatorio;

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE exportar_database_json IS
    v_json_alertas CLOB;
    v_json_consumo CLOB;
    v_json_dispositivo CLOB;
    v_json_empresa CLOB;
    v_json_relatorio CLOB;
    v_json_usuario CLOB;
BEGIN
    -- Exportando os dados de tb_alerta
    SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                   'id_alerta' VALUE id_alerta,
                   'mensagem' VALUE mensagem,
                   'data_mensagem' VALUE TO_CHAR(data_mensagem, 'YYYY-MM-DD HH24:MI:SS')
               )
           )
    INTO v_json_alertas
    FROM tb_alerta;

    DBMS_OUTPUT.PUT_LINE('Dados de Alertas:');
    DBMS_OUTPUT.PUT_LINE(v_json_alertas);

    -- Exportando os dados de tb_consumo
    SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                   'id_consumo' VALUE id_consumo,
                   'data_consumo' VALUE TO_CHAR(data_consumo, 'YYYY-MM-DD HH24:MI:SS'),
                   'consumo' VALUE consumo
               )
           )
    INTO v_json_consumo
    FROM tb_consumo;

    DBMS_OUTPUT.PUT_LINE('Dados de Consumo:');
    DBMS_OUTPUT.PUT_LINE(v_json_consumo);

    -- Exportando os dados de tb_dispositivo
    SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                   'id_dispositivo' VALUE id_dispositivo,
                   'nm_dispositivo' VALUE nm_dispositivo,
                   'local' VALUE local,
                   'tipo' VALUE tipo,
                   'consumo_limite' VALUE consumo_limite,
                   'id_consumo' VALUE id_consumo,
                   'id_alerta' VALUE id_alerta
               )
           )
    INTO v_json_dispositivo
    FROM tb_dispositivo;

    DBMS_OUTPUT.PUT_LINE('Dados de Dispositivos:');
    DBMS_OUTPUT.PUT_LINE(v_json_dispositivo);

    -- Exportando os dados de tb_empresa
    SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                   'id_empresa' VALUE id_empresa,
                   'nm_empresa' VALUE nm_empresa,
                   'cnpj' VALUE cnpj,
                   'email' VALUE email,
                   'id_dispositivo' VALUE id_dispositivo,
                   'id_consumo' VALUE id_consumo,
                   'id_alerta' VALUE id_alerta,
                   'id_usuario' VALUE id_usuario
               )
           )
    INTO v_json_empresa
    FROM tb_empresa;

    DBMS_OUTPUT.PUT_LINE('Dados de Empresas:');
    DBMS_OUTPUT.PUT_LINE(v_json_empresa);

    -- Exportando os dados de tb_relatorio
    SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                   'id_relatorio' VALUE id_relatorio,
                   'data_geracao' VALUE TO_CHAR(data_geracao, 'YYYY-MM-DD HH24:MI:SS'),
                   'consumo_total' VALUE consumo_total,
                   'consumo_medio' VALUE consumo_medio,
                   'alertas_ativos' VALUE alertas_ativos,
                   'id_usuario' VALUE id_usuario
               )
           )
    INTO v_json_relatorio
    FROM tb_relatorio;

    DBMS_OUTPUT.PUT_LINE('Dados de Relatórios:');
    DBMS_OUTPUT.PUT_LINE(v_json_relatorio);

    -- Exportando os dados de tb_usuario
    SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                   'id_usuario' VALUE id_usuario,
                   'nm_usuario' VALUE nm_usuario,
                   'password' VALUE password,
                   'email' VALUE email
               )
           )
    INTO v_json_usuario
    FROM tb_usuario;

    DBMS_OUTPUT.PUT_LINE('Dados de Usuários:');
    DBMS_OUTPUT.PUT_LINE(v_json_usuario);
END exportar_database_json;

EXEC exportar_database_json;





--function para validacao da tabela dispositivo

SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION VALIDAR_CONSUMO(data_consumo_in DATE)
RETURN BOOLEAN
IS
    v_count INTEGER;
    v_id_consumo INTEGER;
    v_consumo NUMBER(10, 2);
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM tb_consumo
    WHERE data_consumo = data_consumo_in;

    IF v_count = 0 THEN
        RETURN FALSE;
    ELSIF v_count > 1 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Mais de um consumo encontrado para a data informada.');
    ELSE
        SELECT id_consumo, consumo
        INTO v_id_consumo, v_consumo
        FROM tb_consumo
        WHERE data_consumo = data_consumo_in;

        DBMS_OUTPUT.PUT_LINE('ID Consumo: ' || v_id_consumo);
        DBMS_OUTPUT.PUT_LINE('Data Consumo: ' || TO_CHAR(data_consumo_in, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('Consumo: ' || TO_CHAR(v_consumo, '9999999.99') || ' kWh');

        RETURN TRUE;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado para a data informada.');
        RETURN FALSE;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro inesperado: ' || SQLERRM);
        RETURN FALSE;
END VALIDAR_CONSUMO;


BEGIN
    IF NOT VALIDAR_CONSUMO(TO_DATE('2024-11-21', 'YYYY-MM-DD')) THEN
        DBMS_OUTPUT.PUT_LINE('Validação falhou para o consumo. ');
        DBMS_OUTPUT.PUT_LINE('A data mencionada não está vinculada a nenhum consumo cadastrado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Validação bem-sucedida para o consumo.');
    END IF;
END;

SELECT * FROM tb_consumo;


SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION validar_dispositivo(id_dispositivo_in INTEGER)
RETURN BOOLEAN
IS
    v_count INTEGER;
    v_nm_dispositivo VARCHAR2(100);
    v_local VARCHAR2(150);
    v_tipo VARCHAR2(100);
    v_consumo_limite NUMBER(10, 2);
    v_id_consumo INTEGER;
    v_id_alerta INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM tb_dispositivo
    WHERE id_dispositivo = id_dispositivo_in;

    IF v_count = 0 THEN
        RETURN FALSE;
    ELSIF v_count > 1 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Mais de um dispositivo encontrado para o ID informado.');
    ELSE
        SELECT nm_dispositivo, local, tipo, consumo_limite, id_consumo, id_alerta
        INTO v_nm_dispositivo, v_local, v_tipo, v_consumo_limite, v_id_consumo, v_id_alerta
        FROM tb_dispositivo
        WHERE id_dispositivo = id_dispositivo_in;

        DBMS_OUTPUT.PUT_LINE('ID Dispositivo: ' || id_dispositivo_in);
        DBMS_OUTPUT.PUT_LINE('Nome Dispositivo: ' || v_nm_dispositivo);
        DBMS_OUTPUT.PUT_LINE('Local: ' || v_local);
        DBMS_OUTPUT.PUT_LINE('Tipo: ' || NVL(v_tipo, 'Não especificado'));
        DBMS_OUTPUT.PUT_LINE('Consumo Limite: ' || TO_CHAR(v_consumo_limite, '9999999.99'));
        DBMS_OUTPUT.PUT_LINE('ID Consumo: ' || v_id_consumo);
        DBMS_OUTPUT.PUT_LINE('ID Alerta: ' || v_id_alerta);

        RETURN TRUE;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado para o ID informado.');
        RETURN FALSE;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro inesperado: ' || SQLERRM);
        RETURN FALSE;
END validar_dispositivo;


BEGIN
    IF NOT validar_dispositivo(1) THEN
        DBMS_OUTPUT.PUT_LINE('Dispositivo não encontrado ou mais de um encontrado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Dispositivo validado com sucesso.');
    END IF;
END;

--validacao para a tabela consumo

SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION VALIDAR_CONSUMO(data_consumo_in DATE)
RETURN BOOLEAN
IS
    v_count INTEGER;
    v_id_consumo INTEGER;
    v_consumo NUMBER(10, 2);
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM tb_consumo
    WHERE data_consumo = data_consumo_in;

    IF v_count = 0 THEN
        RETURN FALSE;
    ELSIF v_count > 1 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Mais de um consumo encontrado para a data informada.');
    ELSE
        SELECT id_consumo, consumo
        INTO v_id_consumo, v_consumo
        FROM tb_consumo
        WHERE data_consumo = data_consumo_in;

        DBMS_OUTPUT.PUT_LINE('ID Consumo: ' || v_id_consumo);
        DBMS_OUTPUT.PUT_LINE('Data Consumo: ' || TO_CHAR(data_consumo_in, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('Consumo: ' || TO_CHAR(v_consumo, '9999999.99') || ' kWh');

        RETURN TRUE;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado para a data informada.');
        RETURN FALSE;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro inesperado: ' || SQLERRM);
        RETURN FALSE;
END VALIDAR_CONSUMO;


BEGIN
    IF NOT VALIDAR_CONSUMO(TO_DATE('2024-11-21', 'YYYY-MM-DD')) THEN
        DBMS_OUTPUT.PUT_LINE('Validação falhou para o consumo. ');
        DBMS_OUTPUT.PUT_LINE('A data mencionada não está vinculada a nenhum consumo cadastrado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Validação bem-sucedida para o consumo.');
    END IF;
END;


