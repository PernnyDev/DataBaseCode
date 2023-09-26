
/* Cria a tabela para estudo  */
CREATE TABLE public.conta(
	ID INTEGER primary key,
cliente varchar(255) not null,
saldo numeric(15,5) default 0
);


/*  Insere dados na tabela*/
INSERT INTO public.conta(id,cliente,saldo)
Values (1,'João',1000),
(2,'Pedro',15000),
(3,'Mario',450),
(4,'Joaquim',40000);

select * from conta;

/*Comando BEGIN que inicia a transação e não efetiva até encontrar o COMMIT */
SELECT * FROM public.conta WHERE id=1;
BEGIN;
UPDATE public.conta SET saldo=120 WHERE id =1;
ROLLBACK;
SELECT * FROM public.conta WHERE id=1;