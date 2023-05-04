--  gnat compile -gnat2022 imengineerdew.adb
--  gnat make -gnat2022 imengineerdew.adb

pragma Ada_2022;
with Ada.Text_IO; use  Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Big_Numbers.Big_Integers;
use  Ada.Numerics.Big_Numbers.Big_Integers;

procedure imengineerdew
   with SPARK_MODE => OFF
is
   function pi (k, n : in Integer;
               rd, dm : in Big_Integer;
                    i : in Integer) return Big_Integer;
   --
   function squareRoot (x : in Big_Integer) return Big_Integer;
   function squareRem (low, high, x : Big_Integer) return Big_Integer;
   --  End of definitions
   --
   --  Begin of squareRem function
   function squareRem (low, high, x : Big_Integer) return Big_Integer is
      middle : Big_Integer := (low + high) / 2;
   begin
      if high < low then
         return low - 1;
      elsif middle * middle <= x and (middle + 1) * (middle  + 1) > x then
         return middle;
      elsif middle * middle > x then
         return squareRem (low, middle - 1, x);
      else
         return squareRem (middle + 1, high, x);
      end if;
   end squareRem;
   --  End of squareRem function
   --
   --  Begin of squareRoot function
   function squareRoot (x : in Big_Integer) return Big_Integer is
   --
   begin
         return squareRem (0, x, x);
   end squareRoot;
   --  End of squareRoot method
   --
   --  Begin of pi method
   function pi (k, n : in Integer;
               rd, dm : in Big_Integer;
                    i : in Integer) return Big_Integer is
   begin
      declare
         middle : Big_Integer;
         newIssue : Big_Integer;
         root : Big_Integer;
         powMiddle : Big_Integer;
         newDiameter : Big_Integer;
         piRes : Big_Integer;
         productPi : Big_Integer;
      begin
         middle := dm / 2;
         newIssue := (rd ** 2) - (middle ** 2);
         root := squareRoot (newIssue);
         powMiddle := (middle ** 2);
         --
         newDiameter := squareRoot (powMiddle + ((rd - root) ** 2));
         productPi := 2 ** n;
         --
         piRes := (newDiameter * 6 * productPi) / 2;
         --
         if (i = n) then
            return piRes;
         else
            return pi (k, n, rd, newDiameter, i + 1);
         end if;
      end;
   end pi;
   --  End of pi method
   --
   --  End of all methods and procedures
begin
   declare
      kValue : Integer;
      nValue : Integer;
      radio  : Big_Integer;
      diameter : Big_Integer;
      resPi : Big_Integer;
   begin
      Get (kValue);
      Get (nValue);
      radio := 10 ** kValue;
      diameter := radio;
      resPi := pi (kValue, nValue, radio, diameter, 1);
      Put_Line (Big_Integer'Image (resPi));
   end;
end imengineerdew;

--  $ cat DATA.lst | ./imengineerdew
--  314159265358979323846215702516987516863791293578178723840
