procedure main is
	count : integer;
	w : integer;
	x : integer;
	y : integer;
	z : integer;
	t: constant integer := true;
	f: constant integer := false;

	procedure assert(in exp : boolean) is
	begin
		count := count + 1;
		if not exp then
			put(count);
			put_line(" assert failed");
		end if;
	end assert;

	procedure testout(out b : integer) is
	begin
		b := 21;
	end testout;

	procedure testin(in b : integer) is
	begin
		call assert(b = 22);
		b := 8; -- verify passed by value
	end testin;


begin
	count := 0-1;
	put_line("proving that assert(false) is detected:");
	call assert(false);
	put_line("now on to the tests...");

	-- test assignment
	w := 0-1;
	x := 0;
	y := 1;
	z := y*2;

	-- test =
	call assert(w = (x-y));
	call assert(x = 0);
	call assert(2 = 2);
	call assert(z = z);


	-- test +
	call assert((1+1)=2);
	call assert(x=(w+y));
	call assert((y+1)=z); 
	call assert((1+2+3+4+5+6+7+8)=36);

	-- test -
	call assert((3-2)=1);
	call assert((y-w)=z);
	call assert((5-4-3)=(0-2));
	call assert((z-x)=(9-7));

	-- test *
	call assert((2*2)=4);
	call assert((87*x)=(z*x));
	call assert((w*w)=y);
	call assert((z*5)=10);

	-- test /
	call assert((18 / 3) = 6);
	call assert((17 / 3) = 5);
	call assert((0 / y) = 0);
	call assert((7 / z) = 3);


	-- test mod
	call assert((18 mod 3) = 0);
	call assert((17 mod 3) = 2);
	call assert((7 mod z) = 1);
	call assert((2 mod 5) = 2);

	-- test in param
	x := 22;
	call testin(x);
	call assert(x = 22); -- verify we passed by value

	-- test out param
	call testout(out x);
	call assert(x = 21); -- verify x changed

	-- test write
	put_line("writing integers");
	put_line(0);
	put_line(w);
	put_line(x);
	put_line(y+15);

	put(count);
	put_line(" tests taken.");
end main;
