-- program, rule 1
procedure all is
   -- decl/decls, rules 4-8,38,39
   ival: Integer;
   bval: Boolean;
   rval: Float;
   ci: constant Integer := 3;
   cb: constant Boolean := false;
   cr: constant Float := 3.14;
   
begin
   -- statement, rules 2-3
   -- assignment statement, rules 9,15
   ival := ci;
   bval := cb;
   rval := cr;
   -- if statement, rules 10,16
   IF bval THEN END IF;
   -- read statement, rules 11,17
   Get(iVal);
   -- write statement, rules 12,18,23,24
   Put("string literal");
   Put(ival);
   -- loop statement, rules 13,19
   while bval LOOP
      bval := false;
   END LOOP;
   -- block statement, rules 14,20-22
   BEGIN
      ival := 10;
   END;
   DECLARE
      i: Integer;
      r: Float;
   BEGIN
      i := 2;
   END;
   BEGIN
   END;
   
   -- expression, rules 25-37
   IF NOT bval = cb THEN -- rule 34,32
      ival := ival + (1); -- rule 35,26,37,36
      ival := ival * 4; -- rule 29
   END IF;
   
     
end all;
