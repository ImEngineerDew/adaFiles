With Ada.Text_IO; Use Ada.Text_IO;

procedure declarations is
	A, B: Integer := 0;
	C   : Integer := 100;
	D   : Integer;
begin
	--That's an increment operation--
	A:= A+1;

	--That's a regular operation of addition--
	D:= A+B+C;
	Put_Line("La suma es igual a: "&Integer'Image(D));
end declarations;
