--  ulimit -s 1000000  <--- Please set up this stack memory prior to compile
--  gnat compile imengineerdew.adb
--  gnat make imengineerdew.adb

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Long_Float_Text_IO; use Ada.Long_Float_Text_IO;
with Ada.Long_Integer_Text_IO; use Ada.Long_Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use  Ada.Numerics.Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;

procedure imengineerdew
   with SPARK_MODE => OFF
is
   type Arrays is array (Integer range <>) of Long_Integer;
   procedure readVector (A : in out Arrays; index : in Integer);
   procedure showResult (A : in Arrays; index : in Integer);
   function vectorSize return Integer;
   function calculateSquaresAux (s : in Long_Integer;
                                 m : in Long_Integer;
                                 n : in Long_Integer) return Long_Integer;
   --  End of definitions
   --
   --  Begin of vectorSize function
   function vectorSize return Integer is
      Size : Integer;
   begin
      Get (Size);
      return Size;
   end vectorSize;
   --  End of vectorSize function
   --
   --  Begin of readVector procedure
   procedure readVector (A : in out Arrays; index : in Integer) is
      s : Long_Integer;
   begin
      if index = A'Length then
         return;
      end if;
      if index >= A'First and index <= A'Last then
         Get (s);
         A (index) := calculateSquaresAux (s, 2, 1);
         readVector (A, index + 1);
      end if;
   end readVector;
   --  End of readVector procedure
   --
   --  Begin of function sqr
   function calculateSquaresAux (s : in Long_Integer;
                                 m : in Long_Integer;
                                 n : in Long_Integer) return Long_Integer is
      a : Long_Integer;
      b : Long_Integer;
      c : Long_Integer;
      cs : Long_Integer;
   begin
      if m > Long_Integer (Sqrt (Float (s))) then
         return 0;
      end if;
      if n <= m then
         a  :=  (m**2) - (n * n);
         b  :=  2 * m * n;
         c  :=  (m**2) + (n ** 2);
         if a + b + c = s then
            cs  :=  c**2;
            return cs;
         end if;
         return calculateSquaresAux (s, m, n + 1);
      end if;
      return calculateSquaresAux (s, m + 1, 1);
   end calculateSquaresAux;
   --  End of function sqr
   --
   --  Begin of showResult (or showVector) procedure
   procedure showResult (A : in Arrays; index : in Integer) is
   begin
      if index = A'Length then
         return;
      end if;
      if index >= A'First and index <= A'Last then
         Put (A (index), 4);
         New_Line;
         showResult (A, index + 1);
      end if;
   end showResult;
   --  End of showResult procedure
   --
   --  End of all methods and procedures
begin
   declare
      setSize : Integer := vectorSize;
      pythagoras : Arrays (0 .. setSize - 1);
   begin
      readVector (pythagoras, 0);
      showResult (pythagoras, 0);
   end;
end imengineerdew;

--  $ cat DATA.lst | ./imengineerdew
--  48089301276025
--  80234029449025
--  76379576890681
--  78128362950625
--  113352071836249
--  83115768736225
--  90359568235225
--  46018924875625
--  37827580070569
