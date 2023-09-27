/* Cria a tabela para estudo  */
CREATE TABLE public.conta(
    ID INTEGER primary key,
    cliente varchar(255) not null,
    saldo numeric(15, 5) default 0
);
/*  Insere dados na tabela*/
INSERT INTO public.conta(id, cliente, saldo)
Values (1, 'João', 1000),
    (2, 'Pedro', 15000),
    (3, 'Mario', 450),
    (4, 'Joaquim', 40000);
select *
from conta;
/*Comando BEGIN que inicia a transação e não efetiva até encontrar o COMMIT */
SELECT *
FROM public.conta
WHERE id = 1;
BEGIN;
UPDATE public.conta
SET saldo = 120
WHERE id = 1;
ROLLBACK;
SELECT *
FROM public.conta
WHERE id = 1;
COMMIT;



/* Atividade Em caso de erro Criar um tipo definido pelo usuário (custom data type)
Aterar a função para saída do novo tipo
Colocar um print da variável número dentro do loop */


CREATE TYPE public.telefone_usuario AS (
    usuario_id INTEGER,
    nome CHARACTER VARYING(100),
    fone_id INTEGER,
    ddd CHARACTER VARYING(2),
    numero CHARACTER VARYING(10)
);
drop function cur_telefones(integer);
CREATE OR REPLACE FUNCTION public.cur_telefones(p_usuario_id INTEGER) RETURNS SETOF public.telefone_usuario AS $BODY$
DECLARE --cursor
    reg public.telefone_usuario;
BEGIN --busca os telefones do usuário informado com o nome
FOR reg IN
SELECT t.usuario_id,
    u.nome,
    t.fone_id,
    t.ddd,
    t.numero
FROM public.telefone t
    JOIN public.usuario u ON t.usuario_id = u.usuario_id
WHERE t.usuario_id = p_usuario_id LOOP RETURN NEXT reg;
-- Adicione um print da variável 'numero'
RAISE NOTICE 'Número de Telefone: %',
reg.numero;
END LOOP;
RETURN;
END;
$BODY$ LANGUAGE plpgsql VOLATILE;
SELECT *
FROM cur_telefones(1);
SELECT nome,
    ddd,
    numero
FROM cur_telefones(1);

/* COMMIT */