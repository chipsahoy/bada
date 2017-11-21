procedure main is
	c: constant integer := 1;
	i : integer;
	j : integer;
	b : boolean;
	r : float;
	t: constant integer := true; -- type mismatch

	procedure testoutint(out b : integer) is
	begin
		 b := 0;
	end testoutint;

	procedure testinint(in b : integer) is
	begin
	end testinint;

	procedure testoutfloat(out b : float) is
	begin
		 b := 0.0;
	end testoutfloat;

	procedure testinfloat(in b : float) is
	begin
	end testinfloat;

	procedure testoutbool(out b : boolean) is
	begin
		 b := false;
	end testoutbool;

	procedure testinbool(in b : boolean) is
	begin
	end testinbool;

begin
	put_line("this program checks for compile time errors, never runs.");


	-- test assignment
	c := 3; -- assign to constant
	i := 0.0; -- type mismatch
	i := false; -- type mismatch
	i := b; -- type mismatch
	i := r; -- type mismatch
	-- 0 := i; -- not an lvalue

	-- test =
	put(i = 0.0);
	put(false = i);
	put(i = b);
	put(r = i);


	-- test +
	put(i + 0.0);
	put(i + false);
	put(i + b);
	put(i + r);

	-- test -
	put(i - 0.0);
	put(i - false);
	put(i - b);
	put(i - r);

	-- test *
	put(i * 0.0);
	put(i * false);
	put(i * b);
	put(i * r);

	-- test /
	put(i / 0.0);
	put(i / false);
	put(i / b);
	put(i / r);


	-- test mod
	put(i mod 0.0);
	put(i mod false);
	put(i mod b);
	put(i mod r);

	put(0.0 mod i);
	put(true mod i);
	put(b mod i);
	put(r mod i);

	-- test in param
	call testinint(0.0);
	call testinint(false);
	call testinint(b);
	call testinint(r);

	call testinbool(i);
	call testinbool(2);
	call testinfloat(i);
	call testinfloat(2);

	-- test out param
	-- call testoutint(out 0.0);
	-- call testoutint(out false);
	call testoutint(out b);
	call testoutint(out r);

	call testoutbool(out i);
	-- call testoutbool(out 2);
	call testoutfloat(out i);
	-- call testoutfloat(out 2);

end main;
