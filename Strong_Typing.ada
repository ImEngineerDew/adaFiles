with Ada.Text_IO;
use  Ada.Text_IO;

procedure Strong_Typing is
	valueA:Integer := 12;
	valueB:Integer := 5;
	result:Float;
begin
	result:= Float(valueA)/Float(ValueB);
	Put_Line("Result: "&Float'image(result));
end Strong_Typing;
