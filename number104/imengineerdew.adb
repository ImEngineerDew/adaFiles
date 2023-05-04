with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Long_Float_Text_IO; use Ada.Long_Float_Text_IO;

procedure imengineerdew
   with SPARK_Mode => OFF
is
   type Arrays is array (Integer range <>) of Long_Float;
   procedure readVector (A : in out  Arrays; index : in Integer);
   procedure show (res : in out Arrays; A : in out Arrays; index : Integer);
   procedure resultTri  (result : in out Arrays; index : Integer);
   function vectorSize return Integer;
   function calculateArea (area : in out Arrays) return Long_Float;
   --  End of definitions
   --
   --  Begin of vectorSize Integer return method
   function vectorSize return Integer is
      Size : Integer;
   begin
      Get (Size);
      return Size;
   end vectorSize;
   --  End of vectorSize Integer return method
   --
   --  Begin of readVector void method
   procedure readVector (A : in out Arrays; index : Integer) is
   begin
      if index = A'Length then
         return;
      end if;
      if index >= A'First and index <= A'Last then
         Get (A (index));
         readVector (A, index + 1);
      end if;
   end readVector;
   --  End of readVector void method
   --
   --  Begin of show void method
   procedure show (res : in out Arrays; A : in out Arrays; index : Integer) is
   begin
      if index = res'Length then
         return;
      end if;
      if index >= res'First and index <= res'Last then
         readVector (A, 0);
         res (index) := calculateArea (A);
         show (res, A, index + 1);
      end if;
   end show;
   --  End of show void method
   --
   --  Begin of resultTri method
   procedure resultTri  (result : in out Arrays; index : Integer) is
   begin
      if index = result'Length then
         return;
      end if;
      if index >= result'First and index <= result'Last then
         Put (Item => result (index), Fore => 0, Aft => 1, Exp => 0);
         New_Line;
         resultTri (result, index + 1);
      end if;
   end resultTri;
   --  End of resultTri method
   --
   --  Begin of calculateArea method that return a Long_Float
   function calculateArea (area : in out Arrays) return Long_Float is
      result : Long_Float;
   begin
      result := 0.5 * abs (((area (0) * area (3)) + (area (2) * area (5))
                          + (area (4) * area (1)) - (area (2) * area (1))
                          - (area (4) * area (3)) - (area (0) * area (5))));
      return result;
   end calculateArea;
   --  End of calcuateArea Long_Float return method
   --
   --  End of all methods and procedures
begin
   declare
      setSize : Integer := vectorSize;
      result  : Arrays (0 .. setSize - 1);
      vectorDef : Arrays (0 .. 6 - 1);
   begin
      --  A debug code line that indicates the size of your array
      show (result, vectorDef, 0);
      resultTri (result, 0); --> It prints with scientific notation
   end;
end imengineerdew;

--  $ cat DATA.lst | ./imengineerdew
--  2144740.5
--  25372731.0
--  12311521.5
--  14001892.0
--  19618994.0
--  13864169.0
--  11367147.0
--  5677778.0
--  16303398.5
--  10550523.0
--  7370229.0
--  11961245.5
--  3812345.0
--  3024252.0
--  11388230.0
--  16298337.0
