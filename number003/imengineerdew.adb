with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure imengineerdew is
   Size : Integer;
   type ArrayIntegers is array (Positive range <>) of Integer;
   vectorA : ArrayIntegers;
   vectorB : ArrayIntegers;

   procedure readVector (A, B : ArrayIntegers ; i : Integer);
   
   procedure readVector (A, B : ArrayIntegers ; i : Integer) is
   begin
        Put_Line("This is a read vector");
   end readVector;

   procedure showVector (A, B : ArrayIntegers ; i : Integer);
   
   procedure showVector (A, B : ArrayIntegers ; i : Integer) is
   begin
       Put_Line("This is a show vector");
   end showVector;
 
begin
   Get(Size);
   vectorA := ArrayIntegers (1 .. size);
   vectorB := ArrayIntegers (1 .. size);

   -- put here the recursion
   readVector (vectorA , vectorB , 0);
   showVector (vectorA , vectorB , 0);
end imengineerdew;
