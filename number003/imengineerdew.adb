with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure imengineerdew is
   type ArrayIntegers is array (Integer range <>) of Integer;
   
   --A quickly function that gets a size of your array
   function getVectorSize return integer is 
       Size : Integer;
   begin
       Get(Size);
       return size;
   end getVectorSize;

   procedure readVector (A, B : in out ArrayIntegers ; i : in Integer);
   procedure showVector (A, B : in ArrayIntegers ; i : in Integer);
   procedure resultSum  (A, B : in ArrayIntegers  ; i : in Integer);
   
   procedure readVector (A, B : in out ArrayIntegers ; i : in Integer) is
   begin
        if i = A'Length or i = B'Length then
            return;
        end if;
        if i >= A'First and i <= A'Last and i >= B'First and i <= B'Last then
           Get (A(i));
           Get (B(i));     
           readVector (A, B , i+1);
        end if;
   end readVector;   
   
   procedure showVector (A, B : in ArrayIntegers ; i : in Integer) is
   begin
       if i = A'Length or i = B'Length then
           return;
       end if;
       -- Check if the values of A and B are inside or outside
       if i >= A'First and i <= A'Last and i >= B'First and i <= B'Last then
           Put (A(i));
           Put (B(i));     
           showVector (A, B , i+1);
        end if;
   end showVector;   
   
   procedure resultSum (A, B : in ArrayIntegers ; i : in Integer) is
   begin
       if i = A'Length or i = B'Length then
           return;
       end if;
       -- Check if the values of A and B are inside or outside
       if i >= A'First and i <= A'Last and i >= B'First and i <= B'Last then
           Put (A(i) + B(i));
           resultSum (A, B , i+1); 
       end if;
   end resultSum;   

--- This is the public static void main(String args[]) {} of Ada
begin
   declare
      vectorSize : Integer := getVectorSize;
      --The position of ArrayIntegers is zero
      vectorA , vectorB : ArrayIntegers (0 .. vectorSize); 
   begin
      -- put here the recursion
      readVector (vectorA , vectorB , 1);
      resultSum (vectorA , vectorB , 1);
   end;
end imengineerdew;
