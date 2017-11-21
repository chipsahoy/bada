procedure main is
	glbl : integer;
	i : integer;

	procedure foo(out x : integer) is
	begin
		put("enter a positive integer: ");
		get(glbl);
		x := glbl + 5;
	end foo;

begin
	call foo(out i);
	put("after foo ");
	put_line(i);
end main;
