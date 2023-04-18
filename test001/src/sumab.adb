with Ada.Text_IO;

procedure sumab is
    valueA, valueB, resulV: Integer;
begin
    valueA:= Integer'Value(Ada.Text_IO.Get_Line);
    valueB:= Integer'Value(Ada.Text_IO.Get_Line);
    resulV:= valueA + valueB;

    Ada.Text_IO.Put_Line(Integer'Image(resulV));
end sumab;
