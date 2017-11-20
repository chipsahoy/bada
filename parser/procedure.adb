procedure main is
	glbl : integer;
	i : integer;

	procedure foo(in x : integer) is
		procedure nested is
		begin
			put_line("in nested");
			put_line(glbl);
		end nested;
	begin
		put("in foo ");
		put_line(x);
		call nested;
		put("global ");
		put_line(glbl);
		put("i ");
		put_line(i);
	end foo;

begin
	put("enter a positive integer: ");
	get(i);
	glbl := 2+i;
	call foo(i);
	put("after foo global ");
	put_line(glbl);
	put("i ");
	put_line(i);
end main;
