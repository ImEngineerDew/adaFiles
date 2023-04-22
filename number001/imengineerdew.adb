with Ada.Text_IO; use  Ada.text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure imengineerdew is
  function sumatory(a,b: Integer)return Integer is
  begin
    return a+b;
  end sumatory;
  
  valA,valB:Integer;
  result:Integer;

begin
  Get(valA);
  Get(valB);

  result:=sumatory(valA,valB);

  Put_Line(Integer'Image(result));	
end imengineerdew;
