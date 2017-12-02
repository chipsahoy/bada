procedure main is
	count : integer;
	w : float;
	x : float;
	y : float;
	z : float;

	procedure assert(in exp : boolean) is
	begin
		count := count + 1;
		if not exp then
			put(count);
			put_line(" assert failed");
		end if;
	end assert;

	procedure testout(out b : float) is
	begin
		b := 21.0;
	end testout;

	procedure testin(in b : float) is
	begin
		call assert(b = 22.0);
		b := 8.0; -- verify passed by value
	end testin;


begin
	count := 0-1;
	put_line("proving that assert(false) is detected:");
	call assert(false);
	put_line("now on to the tests...");

	-- test assignment
	w := 0.0-1.0;
	x := 0.0;
	y := 1.0;
	z := y*2.0;

	-- test =
	call assert(w = (x-y));
	call assert(x = 0.0);
	call assert(2.0 = 2.0);
	call assert(z = z);


	-- test +
	call assert((1.0+1.0)=2.0);
	call assert(x=(w+y));
	call assert((y+1.0)=z); 
	call assert((1.0+2.0+3.0+4.0+5.0+6.0+7.0+8.0)=36.0);

	-- test -
	call assert((3.0-2.0)=1.0);
	call assert((y-w)=z);
	call assert((5.0-4.0-3.0)=(0.0-2.0));
	call assert((z-x)=(9.0-7.0));

	-- test *
	call assert((2.0*2.0)=4.0);
	call assert((2.0*x)=(z*x));
	call assert((w*w)=y);
	call assert((z*5.0)=10.0);

	-- test /
	call assert((18.0 / 3.0) = 6.0);
	call assert((5.0 / 2.0) = 2.5);
	call assert((0.0 / y) = 0.0);
	call assert((1.0 / z) = 0.5);

	-- test precedence
	call assert((1.0 + 2.0 * 3.0 - 4.0) = 3.0);

	-- test in param
	x := 22.0;
	call testin(x);
	call assert(x = 22.0); -- verify we passed by value

	-- test out param
	call testout(out x);
	call assert(x = 21.0); -- verify x changed

	-- test write
	put_line("writing floats");
	put_line(0.0);
	put_line(w);
	put_line(x);
	put_line(y+15.0);

	put(count);
	put_line(" tests taken.");
end main;
