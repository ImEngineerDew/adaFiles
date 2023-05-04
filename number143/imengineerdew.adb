--  gnat compile imengineerdew.adb
--  gnat make imengineerdew.adb

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Long_Float_Text_IO; use Ada.Long_Float_Text_IO;
with Ada.Long_Integer_Text_IO; use Ada.Long_Integer_Text_IO;

procedure imengineerdew
   with SPARK_MODE => OFF
is
   type Arrays is array (Integer range <>) of Long_Integer;
   procedure read (A, B : in out Arrays; i : in Integer);
   procedure show (A, B, RS : in Arrays; i : in Integer);
   function bezout (A, B, R, S, T, X, Y, Z : in Long_Integer) return Arrays;
   function GCD (A, B : in Long_Integer) return Long_Integer;
   function calcGCD (A, B : in Arrays; i : in Integer) return Arrays;
   function getVectorSize return Integer;
   --  End of definitions
   --
   --  Begin to getVectorSize function
   function getVectorSize return Integer is
      Size : Integer;
   begin
      Get (Size);
      return Size;
   end getVectorSize;
   --  End of getVectorSize function
   --
   --  Begin of bezout function
   function bezout (A, B, R, S, T, X, Y, Z : in Long_Integer) return Arrays is
      result : Arrays (0 .. 2);
      otherR : Long_Integer;
      other5 : Long_Integer;
      otherT : Long_Integer;
      quotient, temp : Long_Integer;
   begin
      if R = 0 then
         result (0) := X;
         result (1) := Y;
         result (2) := Z;
         return result;
      else
         quotient := X / R;
         temp := X mod R;
         otherR := temp;
         --
         temp := Y - quotient * S;
         other5 := temp;
         --
         temp := Z - quotient * T;
         otherT := temp;
         result := bezout (A, B, otherR, other5, otherT, R, S, T);
         return result;
      end if;
   end bezout;
   --  End of bezout function
   --
   --  Begin of GCD function
   function GCD (A, B : in Long_Integer) return Long_Integer is
      coefficients : Arrays (0 .. 2);
   begin
      if A < B then
         return GCD (B, A);
      elsif B = 0 then
         return A;
      else
         coefficients := bezout (A, B, A, 1, 0, B, 0, 1);
         return coefficients (0);
      end if;
   end GCD;
   --  End of GCD function
   --
   --  Begin of calcGCD procedure
   function calcGCD (A, B : in Arrays; i : in Integer) return Arrays is
      gcdValue : Arrays (0 .. A'Length - 1);
   begin
      if i = A'Length then
         return gcdValue;
      else
         gcdValue := calcGCD (A, B, i + 1);
         gcdValue (i) := GCD (A (i), B (i));
         return gcdValue;
      end if;
   end calcGCD;
   --  End of calcGCD procedure
   --
   --  Begin of read procedure
   procedure read (A, B : in out Arrays; i : in Integer) is
   begin
      if i = A'Length then
         return;
      end if;
      if i >= A'First and i <= A'Last and i >= B'First and i <= B'Last then
         Get (A (i));
         Get (B (i));
         read (A, B, i + 1);
      end if;
   end read;
   --   End of read procedure
   --
   --   Begin of show procedure
   procedure show (A, B, RS : in Arrays; i : in Integer) is
      k : Arrays (0 .. 2);
   begin
      if i = A'Length then
         return;
      end if;
      if i >= A'First and i <= A'Last and i >= B'First and i <= B'Last then
         k := bezout (A (i), B (i), A (i), 1, 0, B (i), 0, 1);
         Put_Line (RS (i)'Image & " " & k (1)'Image & " " & k (2)'Image & " ");
         show (A, B, RS, i + 1);
      end if;
   end show;
   --  End of show procedure
   --
   --  End of all procedures and methods
begin
   declare
      setSize  : Integer := getVectorSize;
      gcdValue : Arrays (0 .. setSize - 1);
      vectorA  : Arrays (0 .. setSize - 1);
      vectorB  : Arrays (0 .. setSize - 1);
   begin
      read (vectorA, vectorB, 0);
      gcdValue := calcGCD (vectorA, vectorB, 0);
      show (vectorA, vectorB, gcdValue, 0);
   end;
end imengineerdew;

--  $ cat DATA.lst | ./imengineerdew
--  1  17872 -5789
--  1 -3399  24238
--  2 -18088  4353
--  9  556 -1795
--  1 -2922  2887
--  1  21835 -10679
--  1 -24482  26609
--  1 -6184  7755
--  33  608 -993
--  3  584 -429
--  7  3727 -2091
--  1  25249 -18762
--  1 -5783  6004
--  2  1069 -1693
--  1  120 -169
--  1  25008 -7331
--  29  769 -1493
--  1 -1240  4393
--  4  8697 -3854
--  2 -4180  4813
--  1 -23433  4540
--  3  255 -107
--  1 -6531  1985
--  2  6046 -6693
--  18  1222 -381
