--Cria uma tabela com restrições
CREATE TABLE tabela_modelo (
    ID int not null,
    nome varchar(64) not null,
    cpf varchar(11) not null,
    data_nasc date,
    salario float not null default 1000,
    comentario text null,
    primary key (ID),
    unique(cpf)
);
--Inserir dados para visualizção
INSERT INTO tabela_modelo (id, nome, cpf, data_nasc, salario, comentario)
VALUES (
        2,
        'Mayron',
        '38999955574',
        '09-05-2023',
        2000,
        'comentario besta'
    );
--Altera o nome da tabela
alter Table tabela_modelo
    rename to tabela_exemplo;
--Altera o nome de uma coluna
alter Table tabela_exemplo
    rename data_nasc to data_nascimento;
--Adiciona uma coluna
alter Table tabela_exemplo
add column cidade char(45);
--Removendo uma coluna
alter Table tabela_exemplo drop column cidade;