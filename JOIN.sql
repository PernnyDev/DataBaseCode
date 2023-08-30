/* Crinado tabelas para experimento */
CREATE TABLE TB_A(CAMPO text);
CREATE TABLE TB_B(CAMPO text);
CREATE TABLE TB_C(CAMPO text);
INSERT INTO TB_A (CAMPO)
VALUES ('1'),
    ('2'),
    ('6'),
    ('7'),
    ('8');
INSERT INTO TB_B (CAMPO)
VALUES ('2'),
    ('3'),
    ('5'),
    ('7'),
    ('9'),
    ('4');
INSERT INTO TB_C (CAMPO)
VALUES ('2'),
    ('3'),
    ('7');
/* Fazendo select com left join para encontar a intersecção entre as tabelas */
SELECT TA.*,
    TB.*
from TB_A TA
    left join TB_B TB ON TA.CAMPO = TB.CAMPO;
/* Fazendo SELECT com LEFT join para encontar a intersecção entre as tabelas agora com o filtro, tirando as linhas que não são correspondentes A-B */
SELECT TA.*,
    TB.*
from TB_A TA
    left join TB_B TB ON TA.CAMPO = TB.CAMPO
WHERE TB.CAMPO is not null;
/* Fazendo INNER JOIN que vai trazer a intersecção entre as tabelas  A^B */
SELECT TB_C.*,
    TB_B.*,
    TB_C.*
from TB_A
    INNER join TB_B on TB_A.CAMPO = TB_B.CAMPO
    INNER join TB_C on TB_A.CAMPO = TB_C.CAMPO;
/* Fazendo FULL JOIN que vai trazer a soma dos elementos presentes nas tabelas A+B  */
SELECT *
from TB_A
    FULL join TB_B on TB_A.CAMPO = TB_B.CAMPO;
/* Fazendo UNION que vai trazer a soma dos elementos presentes nas tabelas repetindo os valores iguais  */
SELECT *
from TB_A
UNION all
SELECT *
from TB_C;
/* Fazendo UNION com distinct que vai trazer a soma dos elementos presentes nas tabelas sem repetir os valores iguais  */
SELECT Distinct CAMPO
from (
        SELECT *
        from TB_A
        UNION all
        SELECT *
        from TB_C
    ) JUNTATUDO;

/* Fazendo CROSS que vai trazer o produto entre as duas tabalas  */  

SELECT Distinct TB_C.*, TB_B from
TB_C
CROSS JOIN
TB_B;

/* Fazendo NATURAL que vai trazer o semelhantes entre as tabelas */  

SELECT TB_A.*, TB_C.* from
TB_A
Natural JOIN
TB_C;


