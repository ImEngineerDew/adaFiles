with Ada.Text_IO;
use  Ada.Text_IO;


procedure switches is
        cases: Integer;
begin
        Put_Line("Ingrese un número: ");
        cases:= Integer'Value(Ada.Text_IO.Get_Line);

        case cases is
                when 0 =>
                        Put_Line("Opción cero");
                when 1 .. 9 =>
                        Put_Line("Son enteros positivos");
                when 10 | 11 | 12 | 14 | 16 | 18 =>
                        Put_Line("Numeros pares de 10 a 18");
                when others =>
                        Put_Line("No existe tal número");
        end case;
end switches;
