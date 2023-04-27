with Ada.Text_IO;
use  Ada.Text_IO;

procedure forloops is
	number:Integer;
begin
	for number in 0..9 loop
		Put_Line(Integer'Image(number));
	end loop;
end forloops;
