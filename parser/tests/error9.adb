procedure error9 is
   i : Integer;
begin
   WHILE i < 10 LOOP
      i:= i + 1;
	  i:= i + 1 -- missing ; in stmt
   END LOOP;
end error9;