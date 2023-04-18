with Ada.Text_IO;
use  Ada.Text_IO;

procedure forloops is
	number:Integer;
begin
	Put_Line("Escriba un número a recorrrer: ");
	number:= Integer'value(Ada.Text_IO.Get_Line);

	for number in 0..9 loop
		Put_Line(Integer'Image(number));
	end loop;
end forloops;
