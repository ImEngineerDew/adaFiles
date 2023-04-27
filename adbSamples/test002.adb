with Ada.Text_IO;
use  Ada.Text_IO;

procedure test002 is
    valueA, valueB, valueC: Integer;    
begin
    Put_Line ("Ingrese el valor de a: ");
    valueA:= Integer'Value(Ada.Text_IO.Get_Line);
    Put_Line ("Ingrese el valor de b: ");
    valueB:= Integer'Value(Ada.Text_IO.Get_Line);
    valueC:= valueA+valueB;

    Ada.Text_IO.Put_Line("El resultado de la suma es: "&Integer'Image(valueC));    
end test002;
