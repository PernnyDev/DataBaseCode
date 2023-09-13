
--A o código está identificando os níveis de escolaridade cuja soma dos salários dos funcionários seja maior que 10% do total de salários de todos os funcionários 
WITH escolar_sal AS ( 
SELECT escolaridade, SUM(salario) AS total_sal
	FROM tb_funcionarios
	GROUP BY escolaridade
), top_escolar AS (
SELECT escolaridade 
	FROM escolar_sal
WHERE total_sal > (SELECT SUM(total_sal)/10 FROM escolar_sal)
	
)

SELECT escolaridade,
cargo,
COUNT(1) AS tot_funcionarios,
SUM(salario) AS val_acum_salario
FROM tb_funcionarios
WHERE escolaridade IN (SELECT escolaridade FROM top_escolar)
GROUP BY escolaridade, cargo;
