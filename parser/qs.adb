procedure main is
	item_count : integer;
	swap_count : integer;
	compare_count : integer;
	values : array(100) of float;
	
	procedure get_user_input is
		exit : boolean;
		item : float;
	begin
		put_line("enter some positive float numbers terminated by -1");
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


	procedure swap(in left : integer; in right : integer) is
		temp : float;
	begin
		temp := values(left);
		values(left) := values(right);
		values(right) := temp;
		swap_count := swap_count + 1;
	end swap;

	procedure quicksort(in lower : integer; in upper : integer) is
		pivot : float;
		left : integer;
		right : integer;
		is_less : boolean;
		continue : boolean;
	begin
		pivot := values(lower);
		values(item_count) := pivot; -- add a sentinel so we can't run off end
		left := lower + 1;
		right := upper;
		continue := true; -- get do ... while() effect
		while(continue) loop
			compare_count := compare_count + 1;
			while(values(right) > pivot) loop
				compare_count := compare_count + 1;
				right := right - 1; -- find a right value <= pivot
			end loop;

			compare_count := compare_count + 1;
			while(values(left) < pivot) loop
				compare_count := compare_count + 1;
				left := left + 1;
			end loop;

			compare_count := compare_count + 1;
			continue := false;
			if(left < right) then
				continue := true;
				call swap(left, right);
				left := left + 1;
				right := right - 1;
			end if;
		end loop;

		-- left and right have crossed, so move pivot into place
		-- and recurse.
		call swap(lower, right); -- move pivot.

		if((right - 1) > lower) then
			call quicksort(lower, right - 1);
		end if;
		if((right + 1) < upper) then
			call quicksort(right + 1, upper);
		end if;
	end quicksort;

begin

	compare_count := 0;
	swap_count := 0;
	call get_user_input;
	call quicksort(0, item_count - 1);
	call print_list;
	put("quicksorted in ");
	put(compare_count);
	put(" comparisons and ");
	put(swap_count);
	put_line(" swaps.");
end main;
