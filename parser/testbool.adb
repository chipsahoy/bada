procedure main is
	count : integer;
	w : boolean;
	x : boolean;
	y : boolean;
	z : boolean;
	t: constant boolean := true;
	f: constant boolean := false;

	procedure assert(in exp : boolean) is
	begin
		count := count + 1;
		if not exp then
			put(count);
			put_line(" assert failed");
		end if;
	end assert;

	procedure testout(out b : boolean) is
	begin
		b := false;
	end testout;

	procedure testin(in b : boolean) is
	begin
		call assert(b);
		b := false;
	end testin;


begin
	count := 0-1;
	put_line("proving that assert(false) is detected:");
	call assert(false);
	put_line("now on to the tests...");

	-- test assignment
	w := (0 < 1);
	x := true;
	y := false;
	z := x;

	-- test =
	call assert(w = true);
	call assert(x = w);
	call assert(not (x = y));

	-- test AND
	call assert(w AND x);
	call assert(not(true and false));
	call assert(not (x AND y));
	call assert(w AND true);

	-- test OR
	call assert(true OR false);
	call assert(not(false OR false));
	call assert(x OR y); 
	call assert(y OR true);

	-- test NOT
	call assert(not(false));
	call assert(not(y));
	call assert(not(x AND y));

	-- test in param
	call testin(x);
	call assert(x); -- verify we passed by value

	-- test out param
	call testout(out x);
	call assert(not(x)); -- verify x changed

	-- test write
	put_line("writing alternating values");
	put_line(true);
	put_line(false);
	put_line(w);
	put_line(x);
	put_line(0 < 1);
	put_line(not(true));

	put(count);
	put_line(" tests taken.");
end main;
