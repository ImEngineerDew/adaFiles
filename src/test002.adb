with Spark_Context;


procedure test002 is

   function sumatory (a,b:Integer) return Integer is
   begin
      return a+b;
   end sumatory;

begin
   sumatory(12,18);
end;

end test002;
