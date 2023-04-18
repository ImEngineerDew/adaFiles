with Ada.Text_IO; 
use  Ada.Text_IO;

procedure newdeclaration is
begin
	Put_Line("Anterior al bloque interno");

	declare
		Alpha: Integer := 0;
	begin
		Alpha:= Alpha+1;
		Put_Line("Ahora estoy dentro del bloque interno");
	end;


	Put_Line("Posterior al bloque interno");
end newdeclaration;
