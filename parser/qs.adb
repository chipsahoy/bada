procedure main is
	item_count : integer;
	values : array(100) of float;
	
	procedure get_user_input is
		exit : boolean;
		item : float;
	begin
		put_line("enter some positive real numbers terminated by -1");
		item_count := 0;
		exit := false;
		while not exit loop
			get(item);
			if (item = (0.0-1.0)) then
				exit := true;
			end if;
			if not (item = (0.0-1.0)) then
				values(item_count) := item;
				item_count := item_count + 1;					
			end if;
		end loop;
	end get_user_input;

	procedure print_list is
		ix : integer;
	begin
		ix := 0;
		while(ix < item_count) loop
			put_line(values(ix));
			ix := ix + 1;
		end loop;
	end print_list;

begin
	call get_user_input;
	call print_list;
end main;
