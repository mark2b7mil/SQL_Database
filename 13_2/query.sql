create procedure test()
begin
declare varx int;
declare vary int;
declare i int;
declare mes varchar(500);
set i = 1;
set varx = 10;
set vary = 20;
set mes = 'Common factors of 10 and 20:';
	
	while (i <= varx) do
		
	   if ((varx%i=0) and (vary%i=0)) then
	      set mes = concat(mes, ' ', i);
	   end if;
	   set i=i+1;
	end while;
	select mes as message;
end