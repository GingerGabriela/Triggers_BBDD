create or replace trigger nocambiesnombre before update of nombre,num_sup,salario on empleado for each row
BEGIN
	if updating('nombre') then
		raise_application_error(-20474, 'No se permite modificar el nombre del empleado');
	end if;
	if updating('num_sup') then
		raise_application_error(-20374, 'No se permite modificar el num_sup');
	end if;
	if :new.salario > :old.salario *1.1 then
		raise_application_error(-20574, 'No se le puede subir tanto el salario');
	end if;
	end;
/