-- display the emp details who has max salary in emp table
--outer query                            inner/ subquery
select * from Employee where salary=(select max(salary) from Employee)

-- display emp details who work in HR dept

select * from Employ
select * from deptment
select * from Employ where did=
(
select did from deptment where dname='Developer'
)

-- display emp details who has less salary than Ragav

select * from Employ where salary <
(
select salary from employ where ename='ragav'
)

-- display the emp details who has less salary than the avg salary of all emps
select * from Employ where salary<
(
select avg(salary) from Employ
)

--display the emp from dev dept who has less salary then the 
--avg salary of admin dept
select * from Employ where salary<
(
select avg(salary) from Employ where did=(select did from deptment where dname='HR')
)
and did=(select did from deptment where dname='developer')
-- display the emp details who has 2nd highest salary
select * from Employ where salary=
(
select max(salary) from Employ where salary<>
(
select max(salary) from Employ
)
)
-- update the salary by 2000rs for emp who work in hr dept

update Employ set salary=salary+2000 where did in
(
select did from Deptment where dname='HR'
)

-- delete the emp who work in admin dept

delete from Employ where did in
(
select did from Deptment where dname='Admin'
)

