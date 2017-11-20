procedure main is     
	procedure foo(in x : integer) is
	begin
		put("in foo ");
		put_line(x);
	end foo;
begin
	declare
		i : integer;
	begin
		put("enter a positive integer: ");
		get(i);
		call foo(i);
		put_line("after foo");
	end;
end main;
