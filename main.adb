with Ada.Text_IO;
use Ada.Text_IO;

function sum(a, b: Integer) return Integer is
begin
    return a + b;
end sum;

procedure main is
    a, b, res: Integer;
begin
    a := Integer'Value(Ada.Text_IO.Get_Line);
    b := Integer'Value(Ada.Text_IO.Get_Line);

    res := sum(a, b);

    Put_Line(Integer'Image(res));
end main;

