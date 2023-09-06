create table tb_funcionarios2 as 
select * from tb_funcionarios
union all
select '11' as id, nome, escolaridade, cargo, salario
from tb_funcionarios limit 1;

drop table tb_funcionarios;
alter table tb_funcionarios2 rename to tb_funcionarios

-- Criar uma nova tabela com os salários ajustados em 10%
CREATE TABLE tb_funcionarios2 AS 
SELECT 
    id,
    nome,
    escolaridade,
    cargo,
    salario * 1.1 AS salario
FROM 
    tb_funcionarios;

-- Excluir a tabela original
DROP TABLE IF EXISTS tb_funcionarios;

-- Renomear a nova tabela para tb_funcionarios
ALTER TABLE tb_funcionarios2 RENAME TO tb_funcionarios;

Select * from tb_funcionarios
update tb_funcionarios
set salario = 1200
where salario = 1100
