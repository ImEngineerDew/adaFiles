with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure imengineerdew
  with SPARK_MODE => OFF
is
   type Arrays is array (Integer range <>) of Integer;
   procedure readVector (A : in out Arrays; i : in Integer);
   procedure showVector (A : in Arrays; i : in Integer);
   procedure bubb (A : in out Arrays;  k : in Integer; swp : in out Arrays);
   --  Calling the method that return an Integer
   function vectorSize return Integer;
   --  Calling the first recursive method (Reading an array)
   function vectorSize return Integer is
      Size : Integer;
   begin
      Put ("Please write the size of your array: ");
      Get (Size);
      return Size;
   end vectorSize;
   procedure readVector (A : in out Arrays; i : in Integer) is
   begin
      --  It's quite similar to if(i.equals(vectorA) || i.equals(vectorB))
      if i = A'Length then
         return;
      end if;
      if i >= A'First and i <= A'Last then
         Put ("Please write the numbers to apply bubble sorting: ");
         Get (A (i));
         readVector (A, i + 1);
      end if;
   end readVector;
   --  Calling the next recursive method (show an array)
   procedure showVector (A : in Arrays; i : in Integer) is
   begin
      --  This method can show the numbers typed by keyboard
      if i = A'Length then
         return;
      end if;
      if i >= A'First and i <= A'Last then
         Put (Integer'Image ((A (i))));
         showVector (A, i + 1);
      end if;
   end showVector;
   --  Calling the next recursive method (Bubble sort)
   procedure bubb (A : in out Arrays;  k : in Integer; swp : in out Arrays) is
      isSwapped : Boolean := False;
      flagHelp : Integer;
   begin
      if k = A'Length then
         return;
      end if;
      for l in 0 .. k - 1 loop
         if A (l) > A (l + 1) then
            flagHelp := A (l);
            A (l) := A (l + 1);
            A (l + 1) := flagHelp;
            isSwapped := True;
            --  Increases swaps and passes
            swp (0) := swp (0) + 1;
         end if;
      end loop;
      swp (1) := swp (1) + 1;
      if isSwapped then
         bubb (A, k - 1, swp);
      end if;
   end bubb;
begin
   --  Setting up the variables prior to run this app
   declare
      setSize : Integer := vectorSize;     -- Define the size of your array
      vectorA : Arrays (0 .. setSize - 1); -- Define the vectorA
      swaps :  Arrays (0 .. 1) := (0, 0);  -- Define the swaps & passes
   begin
      readVector (vectorA, vectorA'First);
      bubb (vectorA, vectorA'Last, swaps);
      Put ("Swaps: "& Integer'Image (swaps (1)) & " " &" Passes: "& Integer'Image (swaps (0)));
   end;
end imengineerdew;

--  $ cat DATA.lst | ./imengineerdew
--  14 85
