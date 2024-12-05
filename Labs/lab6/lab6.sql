
use [SD32-Company]


sp_addtype loc ,'nchar(2)'

create table department (
deptno nchar(10) primary key,
deptname varchar(20),
Location loc
)

create  rule  r1 as  @x in ('NY','DS','KW')

sp_bindrule  r1 ,loc
create default d as 'NY'
sp_bindefault d,loc 

create table employee (
empno int ,
empFname varchar(20),
empLname varchar(20),
deptNo nchar(10),
salary int
constraint c1 primary key (empno),
constraint c2 foreign key (deptno) references department(deptno),
constraint c3 unique (salary),
constraint c4 check(empFname is not null),
constraint c5 check(empLname is not null)

)

create rule r2 as  @x < 6000


sp_bindrule r2,'employee.salary'

create schema company
alter schema company transfer department
create schema Human_Resource
alter schema Human_Resource transfer employee

--3
-- to show all constraints 

select *
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where TABLE_NAME='Employee';


--4

create synonym emp for human_resource.employee

error we should determine schema name

select * from employee

select * from human_resource.employee

-- i make synonym for human_resource.employee  so it deal with this query as emp is another table
select * from [Human Resource].Emp
select * from emp   -- work

 insert into project 
 values ('p1','Apollo',120000)
 insert into project 
 values ('p2','Gemini',95000)
 insert into project 
 values ('p3','Mercury ',185600)


insert into works_on
values(10102,'p1','Analyst','1/10/2006')

--5

 update project
 set budget=1.1*budget
 where pno=(
 select pno from
 works_on
 where empno=10102
 )

 --6

 update company.department
 set deptname='sales'
 where deptno=(
 select deptno 
 from emp
 where empFname='james'
 )


 --7

 update works_on
 set enter_date='12.12.2007'
 where pno='p1' and empno in (
 select empno
 from emp
 inner join
 company.department dp
 on dp.deptno=emp.deptno and dp.deptname='sales'

 )


 --8
 delete from works_on
 where empno in(
 select empno 
 from emp
 inner join 
 company.department dp
 on dp.deptno=emp.deptno and dp.location='KW'

 )




