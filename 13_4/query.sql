create procedure test()
begin
declare success_string varchar(40) default '1 row was inserted.';
declare wrong_string varchar(40) default 'Row was not inserted - duplicate entry.';
declare dup_entry tinyint default false;

begin
declare exit handler for 1062
set dup_entry = true;
insert into categories (category_id, category_name)
values (default, 'Guitars');
select success_string as message;
end;

if dup_entry = true then
	select wrong_string as message;
end if;

end

/*Write a script that creates a stored procedure named test. This procedure should attempt to insert a new category named “Guitars” into the Categories table. 
 The procedure should return a 1 row, 1 column result set with a column named result.  If the insert is successful, the procedure should return the value:
1 row was inserted.
If the update is unsuccessful, the procedure should return the value:
Row was not inserted - duplicate entry.
*/
