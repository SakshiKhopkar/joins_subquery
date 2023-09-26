create table employeeTrack(
id int primary key identity(1,1),
Descriptions varchar(255),
)
drop table employeeTrack
select * from employee
select * from employeeTrack
create trigger tr_employee
on employee after insert
as begin 
declare @id int
declare @name varchar(20)
declare @email varchar(25)
select @id=id,@name=name,@email=email from inserted
insert into employeeTrack values('new record with details'+cast(@id as varchar)+' name'+
@name+' email '+@email+' date '+ cast( GETDATE() as varchar(20))+' added')
end

insert into employee values(12,'Rajashri',22,'rajashri@gmail.com',80000)

create trigger tr_employee_delete
on employee after delete
as begin 
declare @id int
declare @name varchar(20)
declare @email varchar(25)
select @id=id,@name=name,@email=email from deleted
insert into employeeTrack values('new record with details'+cast(@id as varchar)+' name'+
@name+' email '+@email+' date '+ cast( GETDATE() as varchar(20))+' deleted')
end

delete from employee where id=12 

select * from product
alter table product add price int
insert into product(productid,price)values(21,200),(22,400),(23,500),(24,250)
select productname, price,
case 
when price>300 then 'expensive'
when price<300 then 'not expensive'
else 'average'
end as 'remark'
from product
select * from employee
select name,email,salary,
case 
when salary>40000 and salary>90000 then 'High salary'
when salary >25000 and salary<40000 then 'average'
else 'Low salary'
end as 'remark'
from employee
