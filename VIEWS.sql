CREATE VIEW func_maior_1000 AS SELECT nome FROM
tb_funcionarios WHERE salario > 1000

CREATE OR REPLACE VIEW func_maior_1000 AS SELECT 
tb_a.nome, tb_b.departamento FROM 
tb_funcionarios tb_a
LEFT JOIN 
tb_cargos tb_b
ON tb_a.cargo = tb_b.cargo
WHERE tb_a.salario > 1000