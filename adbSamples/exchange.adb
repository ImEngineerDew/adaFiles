package body exchange with SPARK_MODE
is
  procedure Exchange(X, Y: in out Float) is
  begin
	X:= Y;
        Y:= X;
  end Exchange;
end exchange;
