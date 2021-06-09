-- Gerado por Oracle SQL Developer Data Modeler 21.1.0.092.1221
--   em:        2021-05-30 03:19:00 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_sb_departamento (
    id_departamento   NUMBER(8) NOT NULL,
    des_departamento  VARCHAR2(80) NOT NULL
);

ALTER TABLE t_sb_departamento ADD CONSTRAINT pk_sb_departamento PRIMARY KEY ( id_departamento );

CREATE TABLE t_sb_funcionario (
    id_funcionario   NUMBER(8) NOT NULL,
    id_premio        NUMBER(8) NOT NULL,
    nom_funcionario  VARCHAR2(80) NOT NULL,
    num_cpf_cnpj     VARCHAR2(14) NOT NULL,
    des_senha        VARCHAR2(30) NOT NULL,
    nom_cargo        VARCHAR2(80) NOT NULL
);

CREATE UNIQUE INDEX t_sb_funcionario_idx ON
    t_sb_funcionario (
        id_premio
    ASC );

ALTER TABLE t_sb_funcionario ADD CONSTRAINT pk_sb_funcionario PRIMARY KEY ( id_funcionario );

CREATE TABLE t_sb_funcionario_departamento (
    id_func_departamento  NUMBER(8) NOT NULL,
    id_funcionario        NUMBER(8) NOT NULL,
    id_departamento       NUMBER(8) NOT NULL
);

CREATE UNIQUE INDEX t_sb_funci_departa_idx ON
    t_sb_funcionario_departamento (
        id_funcionario
    ASC );

ALTER TABLE t_sb_funcionario_departamento ADD CONSTRAINT pk_sb_funci_departa PRIMARY KEY ( id_func_departamento );

CREATE TABLE t_sb_item (
    id_tem     NUMBER(8) NOT NULL,
    nom_item   VARCHAR2(80) NOT NULL,
    des_item   VARCHAR2(250) NOT NULL,
    sta_ativo  CHAR(1) NOT NULL
);

ALTER TABLE t_sb_item ADD CONSTRAINT t_sb_item_pk PRIMARY KEY ( id_tem );

CREATE TABLE t_sb_item_resgate (
    id_item_resgate  NUMBER(8) NOT NULL,
    id_resgate       NUMBER(8) NOT NULL,
    id_tem           NUMBER(8) NOT NULL
);

ALTER TABLE t_sb_item_resgate ADD CONSTRAINT t_sb_item_resgate_pk PRIMARY KEY ( id_item_resgate );

CREATE TABLE t_sb_premio (
    id_premio   NUMBER(8) NOT NULL,
    tp_premio   VARCHAR2(30) NOT NULL,
    sta_ativo   CHAR(1) NOT NULL,
    qtd_premio  NUMBER(8) NOT NULL,
    id_resgate  NUMBER(8) NOT NULL
);

CREATE UNIQUE INDEX t_sb_premio_idx ON
    t_sb_premio (
        id_resgate
    ASC );

ALTER TABLE t_sb_premio ADD CONSTRAINT pk_sb_premio PRIMARY KEY ( id_premio );

CREATE TABLE t_sb_resgate (
    id_resgate  NUMBER(8) NOT NULL,
    tp_resgate  VARCHAR2(30) NOT NULL
);

ALTER TABLE t_sb_resgate ADD CONSTRAINT t_sb_resgate_pk PRIMARY KEY ( id_resgate );

CREATE TABLE t_sb_tarefa (
    id_tarefa       NUMBER(8) NOT NULL,
    id_funcionario  NUMBER(8),
    des_tarefa      VARCHAR2(250),
    sta_ativo       CHAR(1) NOT NULL,
    obs_tarefa      VARCHAR2(250) NOT NULL
);

ALTER TABLE t_sb_tarefa ADD CONSTRAINT t_sb_tarefa_pk PRIMARY KEY ( id_tarefa );

CREATE TABLE t_sb_tarefa_topico (
    id_tarefa_top  NUMBER(8) NOT NULL,
    id_tarefa      NUMBER(8) NOT NULL,
    id_topico      NUMBER(8) NOT NULL
);

ALTER TABLE t_sb_tarefa_topico ADD CONSTRAINT pk_sb_tarefa_topico PRIMARY KEY ( id_tarefa_top );

CREATE TABLE t_sb_topico (
    id_topico   NUMBER(8) NOT NULL,
    des_topico  VARCHAR2(250) NOT NULL
);

ALTER TABLE t_sb_topico ADD CONSTRAINT t_sb_topico_pk PRIMARY KEY ( id_topico );

ALTER TABLE t_sb_funcionario_departamento
    ADD CONSTRAINT fk_sb_departa_funci FOREIGN KEY ( id_funcionario )
        REFERENCES t_sb_funcionario ( id_funcionario );

ALTER TABLE t_sb_funcionario_departamento
    ADD CONSTRAINT fk_sb_funci_departa FOREIGN KEY ( id_departamento )
        REFERENCES t_sb_departamento ( id_departamento );

ALTER TABLE t_sb_funcionario
    ADD CONSTRAINT fk_sb_funcionario_premio FOREIGN KEY ( id_premio )
        REFERENCES t_sb_premio ( id_premio );

ALTER TABLE t_sb_item_resgate
    ADD CONSTRAINT fk_sb_item_resgate FOREIGN KEY ( id_tem )
        REFERENCES t_sb_item ( id_tem );

ALTER TABLE t_sb_premio
    ADD CONSTRAINT fk_sb_premio_resgate FOREIGN KEY ( id_resgate )
        REFERENCES t_sb_resgate ( id_resgate );

ALTER TABLE t_sb_item_resgate
    ADD CONSTRAINT fk_sb_resgate_item FOREIGN KEY ( id_resgate )
        REFERENCES t_sb_resgate ( id_resgate );

ALTER TABLE t_sb_tarefa
    ADD CONSTRAINT fk_sb_tarefa_funcionario FOREIGN KEY ( id_funcionario )
        REFERENCES t_sb_funcionario ( id_funcionario );

ALTER TABLE t_sb_tarefa_topico
    ADD CONSTRAINT fk_sb_tarefa_topico FOREIGN KEY ( id_tarefa )
        REFERENCES t_sb_tarefa ( id_tarefa );

ALTER TABLE t_sb_tarefa_topico
    ADD CONSTRAINT fk_sb_topico_tarefa FOREIGN KEY ( id_topico )
        REFERENCES t_sb_topico ( id_topico );

INSERT INTO t_sb_funcionario (id_funcionario, id_premio, nom_funcionario, num_cpf_cnpj, des_senha, nom_cargo) 
      VALUES (1, 3, 'Ruan Pereira Azevedo', '44499796794', 'admin123', 'Desenvolvedor Full Stack Junior');
      
INSERT INTO t_sb_funcionario (id_funcionario, id_premio, nom_funcionario, num_cpf_cnpj, des_senha, nom_cargo) 
      VALUES (2, 5, 'Ana Magalhãe', '47497756792', 'admin4321', 'Desenvolvedor Full Stack Senior');
      

DELETE FROM t_sb_funcionario WHERE id_funcionario = 1;

SELECT * FROM t_sb_funcionario;

SELECT t_sb_funcionario.id_premio, t_sb_resgate.id_premio FROM t_sb_funcionario AS 
      id_premio INNER JOIN t_sb_resgate AS id_premio ON t_sb_funcionario.id_premio = t_sb_resgate.id_premio;
      
SELECT t_sb_funcionario, t_sb_departamento FROM t_sb_funcionario_departamento 
        GROUP BY t_sb_funcionario, t_sb_departamento;
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             3
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
