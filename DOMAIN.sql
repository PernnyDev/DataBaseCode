
--DOMAIN - Domínios são tipos de dados definidos pelo usuário, criamos uma espécie de restrição na entrada do banco de dados.
CREATE DOMAIN sexo_full AS char(1) DEFAULT 'M' NOT NULL CHECK ( VALUE IN ('M', 'F')); 
CREATE DOMAIN idade AS integer DEFAULT 0 NOT NULL CHECK ( VALUE > 0);
CREATE DOMAIN nascimento AS date DEFAULT '01/01/1900' NOT NULL CHECK ( VALUE > '01/01/1900');
CREATE DOMAIN data_evento AS date CONSTRAINT valida_data CHECK ( VALUE > '01/01/1900' AND VALUE < '01/01/2099');
CREATE TABLE pessoa_teste(cod serial, nasc nascimento, idade idade, sexo sexo_full);

INSERT into pessoa_teste (nasc, idade, sexo) VALUES('01/01/2000', 20,'M');