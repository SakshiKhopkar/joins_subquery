create function addition(@a int , @b int)
returns int
as begin declare @c int
set @c = @a+@b
return @c 
end
-- scalar function 
create function GetEmpName(@id int)
returns varchar(20)
as begin
return( select ename from employ where Eid=@id)
end
-- call the function
select dbo.GetEMpName(1)

-- multivalue function 
create function GEtEMpByDept (@did int)
returns table 
as return(select * from employ where did =@did)
-- call the function
select * from dbo.getempbydept(103)

create function discountedPrice(@price int)
returns decimal
as begin
declare @disprice decimal
set @disprice=@price-(@price*0.1)
return @disprice
end
select * from product