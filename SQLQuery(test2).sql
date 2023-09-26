create table stud
(
rollno int,
sname varchar(25),
Degree varchar(26),
Birthdate date,
courseId int,
batchId varchar(20),
feespaid int,
Remark varchar(20),
isPlaces varchar(20),
constraint fk_courseId foreign key (courseId) references course(courseID)
)
create table course(
courseID int primary key,
coursename varchar(20),
duration int,
trainerId int,
totalfees int,
constraint fk_trainerId foreign key (trainerId) references trainer(trainerId)
)
drop table course
create table trainer
(
trainerId int primary key,
trainername varchar(20),
joinDate date,
email varchar(30),
experience int
)
drop table stud
select * from course
insert into trainer values(1,'suresh','2001/12/01','suresh@gamil.com',5),(2,'ganesh','2002/11/22','ganeshsh@gamil.com',5),(3,'samidha','2002/10/01','samidha@gamil.com',3),
(4,'vaibhav','2002/09/11','vaibhav@gamil.com',4)
insert into course values (10,'java',6,1,50000),(20,'python',6,2,60000),(30,'AI',4,2,65000),(40,'C#',4,4,55000),(50,'linux',4,3,20000)
insert into stud values(11,'sakshi','Btech','2001/11/23',40,'101',20000,'good','placed'),(12,'sonakshi','Btech','2002/12/23',50,'102',30000,'good','placed'),
(11,'rajesh','Btech','1998/11/20',20,'103',25000,'good','not placed'),(11,'Vaishnavi','Bsc','2000/09/11',30,'104',35000,'not so good','not placed')
insert into stud values(13,'sandhya','Btech','2002/10/13',10,'101',20000,'good','placed')
--. Show list of students. List contains roll no , student name , course name , trainer name in order of course name and student name.
select s.rollno,s.sname,c.coursename,t.trainername from stud s inner join course c on s.courseiD=c.courseid inner join trainer t 
on t.trainerId=c.trainerId order by c.coursename,s.sname
--Show list of students who have pending fees more than 1000rs . List should have student
--name , course name , balance fees . Show this list in descending order of balance fees. 
select s.sname,c.coursename,s.feespaid,(c.totalfees-s.feespaid) as 'pending fees' from stud s inner join course c on s.courseid=c.courseid where (c.totalfees-s.feespaid) >=1000  order by feespaid desc
--Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’.
update stud set batchId =concat(batchId,'_spl') 
where courseId in (select courseId from course c inner join trainer t on c.trainerId=t.trainerId where trainername='suresh')
--Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid by student is more than 60%.
update stud set remark='eligible for exam' where  feespaid > any (select totalfees*0.6 as '60% of fees' from course)
--List name of course for which more than 20 students are enrolled.
select coursename,count(courseId) from course group by coursename having count(courseId)>20
--Select name of student who are in same batch as ‘Atul’
--. Delete all students who are in course which is less than 2 months duration.
delete from stud where courseId in(select courseId from course where duration<6)
--Create a view which shows name of trainer and number of students he is training.
select trainername,count(*) from trainer t inner join course c on c.trainerId=t.trainerid inner join stud on c.courseId=c.courseId group by trainername 
select * from course
select * from stud
select * from trainer
--Show names of students who are more than 20 years old.
select sname from stud where year(cast(getdate() as date))- year(cast(Birthdate as date))>20
--Show names of students who have paid all the fees.
select s.sname from stud s inner join course c on s.courseId=c.courseId where s.feespaid=c.totalfees
update stud set feespaid=55000 where sname='sakshi'
--10. Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.
delete from stud where sname in (select s.sname from stud s inner join course c on s.courseId=c.courseId where s.feespaid=c.totalfees)
and isPlaces='placed'

