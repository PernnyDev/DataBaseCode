


CREATE TABLE para_eliminar as SELECT * from tb_funcionarios
where salario > 1000;

-- SELECT: Mostra os dados da tabela
SELECT * from para_eliminar;

-- DELETE: Apaga os dados da tabela
DELETE from para_eliminar where nome = 'Thais';

-- TRUNCATE: Limpa a tabela, mas não pode ser usado em tabelas com chave estrangeira
truncate table para_eliminar;

-- DROP: Apaga a tabela
drop table para_eliminar;