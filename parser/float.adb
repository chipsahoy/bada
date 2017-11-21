procedure main is
	x : float;
	y : float;
	z : float;

	procedure foo(out r : float) is
	begin
		put("enter a float: ");
		get(r);
	end foo;

begin
	call foo(out x);
	put("after foo ");
	put_line(x*x);
end main;
