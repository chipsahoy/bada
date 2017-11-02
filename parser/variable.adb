procedure variable is     
	i : integer;
	f : float;
	begin
		i := 3;
		get(j); -- error undefined j
	declare  
		i : boolean;  
		j : integer;
	begin
		get(i); -- local i
		put(f); -- from parent scope
		j := 0;
	end;
	i := 2; -- the bool i is gone but integer i still valid
	j := 1; -- error, j out of scope
	declare
		x : float;
		x : boolean; -- error, duplicate definition
	begin
	end;
	declare
		c : constant boolean := false;
		i : constant integer := 0;
		pi : constant float := 3.14;
	begin
		declare
			c : integer;
		begin
			get(x); -- error, x is out of scope
			put(c); -- local c

			declare
				c : float;
			begin
				c := 0.9; -- local c
			end;
			c := i; -- back to integer c
		end;
	end;
end variable;
