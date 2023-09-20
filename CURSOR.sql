CREATE FUNCTION somasalario() returns numeric as $$
DECLARE 
SAL NUMERIC DEFAULT 0;
SAL_TOT NUMERIC DEFAULT 0;
v_cursor CURSOR FOR SELECT salario from tb_funcionarios;

BEGIN
OPEN v_cursor;
LOOP
	FETCH v_cursor INTO sal;
		IF NOT FOUND THEN
			EXIT;
		END IF;
		sal_tot = sal_tot + sal;
		RAISE NOTICE 'Total %',sal_tot;
	END LOOP;
	RETURN sal_tot;
	END;
	$$ language plpgsql;
	select somasalario();