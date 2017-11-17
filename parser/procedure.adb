procedure main is     
	
begin
	declare
		i : integer;
	begin
		put("enter a positive integer: ");
		get(i);
		while(i > 0) loop
			i:= i - 1;
			if i = 5 then
				put_line("FIVE!");
			end if;
			if not (i = 5) then
				put_line(i);
			end if;
		end loop;
		if(false) then
			i:= 0;
		end if;
		put("final answer is ");
		put(i);
	end;
end main;
