
-- ******* Laborat�rio 3 *******

--1. Criar o Banco SISTEMA_ACADEMICO
 CREATE DATABASE SISTEMA_ACADEMICO
 
 --2. Colocar o banco SISTEMA_ACADEMICO em uso
 USE SISTEMA_ACADEMICO
 
 --3. Criar a tabela TB_CARGO com as colunas descritas abaixo:-- COD_CARGO INT - PK-- CARGO VARCHAR(30)
 CREATE TABLE TB_CARGO
 (COD_CARGO INT
 ,CARGO VARCHAR(30)
 ,CONSTRAINT PK_CARGO_CODCARGO PRIMARY KEY(COD_CARGO)
 )
 
 --4. Criar a tabela TB_DISCIPLINA com as colunas descritas abaixo:
 -- COD_DISCIPLINA INT - PK
 -- NOME_DISCIPLINA VARCHAR(30)
 
 CREATE TABLE TB_DISCIPLINA
 (COD_DISCIPLINA INT
,NOME_DISCIPLINA VARCHAR(30)
 ,CONSTRAINT PK_DISCIPLINA_CODDISP PRIMARY KEY(COD_DISCIPLINA)
 )
 
 
 --5. Criar a tabela TB_ALUNO com as colunas descritas abaixo:
 --COD_ALUNO INT AUTONUMERACAO(1,1) - PK
 --NOME VARCHAR(50) NOT NULL
 --CPF_ALUNO INT NOT NULL
 --COD_CARGO INT NOT NULL - FK
 --END_ALUNO VARCHAR(60) NOT NULL
 --BAIRRO_ALUNO VARCHAR(20) NULL
 --CIDADE_ALUNO VARCHAR(20) NULL
 --ESTADO_ALUNO CHAR(2) NULL
 --CEP_ALUNO CHAR(8) NULL
 --FONE CHAR(11) NULL
 --STATUS_ALUNO CHAR(1)
 --DATA_CAD_ALUNO DATE NOT NULL
 
 
 CREATE TABLE TB_ALUNO
 (COD_ALUNO INT IDENTITY(1,1)
 ,NOME VARCHAR(50) NOT NULL
 ,CPF_ALUNO INT NOT NULL
 ,COD_CARGO INT NOT NULL
 ,END_ALUNO VARCHAR(60) NOT NULL
 ,BAIRRO_ALUNO VARCHAR(20) NULL
 ,CIDADE_ALUNO VARCHAR(20) NULL
 ,ESTADO_ALUNO CHAR(2) NULL
 ,CEP_ALUNO CHAR(8) NULL
 ,FONE CHAR(11) NULL
 ,STATUS_ALUNO CHAR(1)
 ,DATA_CAD_ALUNO DATE NOT NULL
 ,CONSTRAINT PK_ALUNO_COD PRIMARY KEY(COD_ALUNO) 
)


--6. Adicionar chave estrangeira para a coluna COD_CARGO na tabela TB_ALUNO.
 ALTER TABLE TB_ALUNO
 ADD 
CONSTRAINT FK_ALUNO_CODCARGO FOREIGN KEY(COD_CARGO) REFERENCES TB_CARGO(COD_CARGO)
 
 
 --7. Alterar o tipo de dados da coluna CPF_ALUNO para BIGINT NOT NULL
 
 ALTER TABLE TB_ALUNO
 ALTER COLUMN CPF_ALUNO BIGINT NOT NULL
 
 --8. O campo STATUS_ALUNO deve receber somente �A� para Ativo e �I� para Inativo
 ALTER TABLE TB_ALUNO
 ADD
 CONSTRAINT CK_ALUNO_STATUS CHECK(STATUS_ALUNO IN ('A','I'))
 
 
 --9. Criar a tabela TB_ALUNO_DISCIPLINA que conter� as disciplinas que o aluno cursa.
 
 CREATE TABLE TB_ALUNO_DISCIPLINA
 (COD_ALUNO_DISCIP INT NOT NULL
 ,COD_ALUNO INT 
,COD_DISCIPLINA INT
 )
 
 
 --10. Na tabela TB_ALUNO_DISCIPLINA adicionar:
 --Chave primaria para a coluna COD_ALUNO_DISCIP
 --Chave estrangeira para as colunas COD_ALUNO e COD_DISCIPLINA
 
 ALTER TABLE TB_ALUNO_DISCIPLINA
 ADD
 CONSTRAINT PK_ALUNO_DISCIPL_CODIGO PRIMARY KEY(COD_ALUNO_DISCIP),
 CONSTRAINT FK_ALUNO_DISCIPL_CODALUNO FOREIGN KEY(COD_ALUNO) REFERENCES TB_ALUNO(COD_ALUNO),
 CONSTRAINT FK_ALUNO_DISCIPL_CODDISCIPL FOREIGN KEY(COD_DISCIPLINA) REFERENCES TB_DISCIPLINA(COD_DISCIPLINA)
 
 
 --11. Adicionar constraint UNIQUE na coluna CPF_ALUNO.  
ALTER TABLE TB_ALUNO
 ADD
 CONSTRAINT UN_ALUNO_CPF UNIQUE(CPF_ALUNO)

 
 --12. Por default a coluna DATA_CAD_ALUNO deve receber a data atual.
 ALTER TABLE TB_ALUNO
 ADD CONSTRAINT DF_ALUNO_DATACADAL 
DEFAULT GETDATE() FOR DATA_CAD_ALUNO
 
 
 
 



