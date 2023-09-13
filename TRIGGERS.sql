
--Cria uma tabela employees
CREATE TABLE employess(id serial not null primary key,
					  first_name varchar(40) not null,
					  last_name varchar(40) not null );



--Cria uma tabela employees_audits
CREATE TABLE employess_audits(id serial not null primary key,
							  empoloyee_id int not null,
							  last_name varchar(40) not null ,
							  changed_on TIMESTAMP(6) not null);

--Cria uma função para logar as alterações							  
CREATE OR REPLACE FUNCTION
log_last_name_changes() RETURNS TRIGGER LANGUAGE PLPGSQL AS
$$
BEGIN IF NEW.last_name <> OLD.last_name THEN
INSERT INTO
employee_audits(
employee_id, 
	last_name,changed_on) VALUES (OLD.id, OLD.last_name, now());
 	END IF;  
	RETURN NEW;
	END;
$$;


--Cria um gatilho na tabela para acionar a função para logar as alterações
CREATE TRIGGER last_name_changes BEFORE
UPDATE ON employess FOR EACH ROW
EXECUTE PROCEDURE
log_last_name_changes();



--Insere registros na tabela
INSERT INTO employess(first_name, last_name) VALUES('John','Doe');
INSERT INTO employess(first_name, last_name) VALUES('Lily','Bush');

--Atualiza o registro
UPDATE employess SET last_name = 'Brown' where id=2;

--Verifica os registros
SELECT * from employess_audits;
SELECT * from employess;