create table order_train_2410 (
	id_order bigint,
	cod_prod bigint,
	ordem_pro smallint,
	reorder smallint
)

create table departament_2410 (
	department_id bigint,
	department text
)

create table corredor_2410 (
	aisle_id bigint,
	aisle text
)

create table produto_2410 (
	product_id bigint,
	product_name text,
	aisle_id bigint,
	department_id bigint
)

select * from order_train_2410

SELECT COUNT(*) AS total_linhas
FROM order_train_2410;

-- MODO 1
Explain analyse
Select a.*, b.*, c.aisle, d.department from order_train_2410 a
left join 
produto_2410 b
on
a.cod_prod = b.product_id

left join 
corredor_2410 c
on
b.aisle_id = c.aisle_id 

left join 
departament_2410 d
on
b.department_id = d.department_id 

limit 1000

CREATE INDEX ON produto_2410 (product_id);
CREATE INDEX ON corredor_2410(aisle_id);
CREATE INDEX ON departament_2410(department_id);
CREATE INDEX ON order_train_2410(cod_prod);


-- MODO 2 MUDEI A CONSULTA PARA VER o PLANO
explain analyse
select a.*,query_1.* from order_train_2410 a
left join
(select b.*,c.aisle,d.department from produto_2410 b
join corredor_2410 c
on
b.aisle_id = c.aisle_id
join departament_2410 d
 on
b.department_id = d.department_id) as query_1

on
a.cod_prod = query_1.product_id 

limit 1000
