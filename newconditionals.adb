with Ada.Text_IO;
use  Ada.Text_IO;

procedure newconditionals is
	age: Integer;
begin
	Put_Line("Por favor escriba su edad: ");
	age:= Integer'Value(Ada.Text_IO.Get_Line);

	if(age<18) then
		Put_Line("Usted todavía es menor de edad");
	elsif(age>18 and age<30) then
		Put_Line("Usted es un adulto joven");
	elsif(age>30 and age<50) then
		Put_Line("Usted es un adulto");
	else
		Put_Line("Usted es un adulto mayor");
	end if;
end newconditionals;
