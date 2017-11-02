procedure error6 is
   i : Integer;
begin
   if i < 2 then i:=2; end while; -- should be end if
end error6;