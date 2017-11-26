procedure main is
	x : array(10) of integer;
	ix : integer;

begin
	ix := 2;
	x(0) := 0;
	x(1) := 1;
	while(ix < 10) 
	loop
		x(ix) := x(ix - 1) + x(ix - 2);
	end loop;
	ix := 0;
	while(ix < 10)
	loop
		put_line(x(ix));
	end loop;
end main;
