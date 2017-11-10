procedure main is     
	i : integer;
	flag : boolean;

	procedure first(
		in i : integer; 
		out x : float) 
		is
		k : integer;
	begin
		put("hello");
	end first;
	
begin
	declare
		f : float;
	begin
		call first(1, f);
	end;
end main;
