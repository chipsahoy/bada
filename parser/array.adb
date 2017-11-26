procedure main is
	i : integer;
	ix : integer;
	x : array(10) of integer;

begin
	ix := 0;
	while(ix < 10) loop
		x(ix) := ix;
		ix := ix + 1;
	end loop;

	ix := 0;
	while(ix < 10) loop
		put_line(x(ix));
		ix := ix + 1;
	end loop;
end main;
