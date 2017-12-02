procedure main is
	a : integer;
	b : integer;
	remainder : integer;
	temp : integer;
begin
	put_line("This is a greatest common divisor program.");
	put("Enter a positive integer. ");
	get(a);
	put("Enter a positive integer. ");
	get(b);

	if(a < b) then
		temp := a;
		a := b;
		b := temp;
	end if;

	remainder := 1;
	while(remainder > 0) loop
		remainder := a mod b;
		a := b;
		b := remainder;
	end loop;
	put("The greatest common divisor is ");
	put_line(a);
end main;
