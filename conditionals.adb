with Ada.Text_IO;
use  Ada.Text_IO;

procedure conditionals is
	Variable: Integer;
begin
	Put_Line("Ingrese un valor a comparar: ");
	Variable:= Integer'Value(Ada.Text_IO.Get_Line);

	if Variable>0 then
		Put_Line("Es mayor a cero");
	elsif variable<0 then
		Put_Line("Es menor a cero");
	else
		Put_Line("Es igual a cero");
	end if;
end conditionals;
	
