procedure main is     
	test_count : integer;
	failed : integer;

	procedure test(in cond : boolean) is
	begin
		test_count := test_count + 1;
		if not cond then
			failed := failed + 1;
			put("failed test ");
			put_line(test_count);
		end if;
	end test;

begin
	test_count := 0;
	failed := 0;
	-- begin tests
	-- end tests, print results
	put(test_count);
	put(" tests taken. Failed ");
	put_line(failed);
end main;
