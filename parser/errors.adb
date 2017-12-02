procedure main is
	c: constant integer := 1;
	i : integer;
	j : integer;
	b : boolean;
	r : float;
	t: constant integer := true; -- type mismatch

	procedure pythag(in x : integer; in y : integer; out z : integer) is
	begin
		z := x*x + y*y;
	end pythag;

	procedure duplicate is
	begin
	end duplicate;

	procedure duplicate is -- duplicate procedure name
	begin
	end not_duplicate; -- wrong end name

begin
	put_line("this program checks for compile time errors, never runs.");
	declare
		i : integer;
		i : integer; -- duplicate definition
		-- a : array(2.0) of boolean; -- only integer sizes
		aa : array(0) of float; -- min size is 1
	begin
		c := 2; -- changing a constant
		j := false; -- type mismatch
		if(1) then -- expected boolean
			get(c); -- read a constant
			get(b); -- read a boolean
		end if;
		while(2) loop -- expected boolean
		end loop;
		call undef; -- no such procedure
		call i; -- not a procedure
		call pythag(3, 4); -- not enough params
		call pythag(3, 4, out i, 5); -- too many params
		call pythag(3, 4, out c); -- changing a constant
		call pythag(out i, 4, out j); -- not an out param
		call pythag(3.0, 4, out i); -- type mismatch
		call pythag(3, 4, out r); -- type mismatch
		call pythag(3, 4, i); -- missing 'out'
		i := 3 + 4.0; -- type mismatch expprime
		i := 3 * 4.0; -- type mismatch termprime
		b := 3 < 4.0; -- type mismatch factorprime
		b := not 1; -- not requires bool
		ii := i; -- undefined variable
		r := 3.0 and r; -- illegal on float
		r := 3.0 mod 2; -- illegal on float
		r := 3.0 or r; -- illegal on float
	end;

end main;
