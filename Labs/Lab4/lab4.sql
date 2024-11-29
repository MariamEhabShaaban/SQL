use Company_SD
--SQL
--1

select
dp.Dependent_name
from Dependent dp
inner join 
Employee E
on	E.SSN=dp.ESSN 
and E.Sex='F' 
and dp.Sex='F'
union
select
dp.Dependent_name
from Dependent dp
inner join 
Employee E
on	E.SSN=dp.ESSN 
and E.Sex='M' 
and dp.Sex='M'


--2
select 
P.pname,
sum(W.hours) as [Total hours]
from
Project P 
inner join
Works_for W
on 
P.Pnumber=W.Pno
group by
P.Pname

--3

select d.*
from Departments d
join Employee e
on e.dno=d.Dnum
where e.SSN=(
select min(e.SSN)
from Employee e
)


--4

select dname,min(salary) as [min sal],max(salary) as [max sal],avg(salary) as [avg sal]
from Employee  e
inner join
Departments d
on dno=dnum
group by Dname

--5
select e.Lname
from Employee e
inner join 
Departments D
on e.SSN=D.MGRSSN
where D.MGRSSN not in
(
select ESSN 
from Dependent
)


--6

select e.Dno,
d.dname,
count(e.ssn) as [num of emp]
from Employee e
inner join 
Departments d
on d.Dnum=e.Dno
group by e.dno , d.dname
having avg(e.Salary)<(
select avg(e.salary)
from Employee e)

--7
select e.*,p.*
from Project p 
inner join 
Departments d
on d.Dnum=p.Dnum
inner join
Employee e
on e.Dno=d.Dnum
order by d.Dname,e.lname,e.fname

--8
-- to get max (n) salary

select distinct salary
from employee e1
where 2 /* n */ > (
    select count(distinct salary)
    from employee e2
    where e2.salary > e1.salary
) and salary is not null
order by salary desc


--another way

select salary
from
Employee
where Salary>=(
select max(salary)
from Employee
where 
salary <(select max(salary)
from Employee))
order by Salary desc

--9
select concat(e.fname,' ',lname)
from Employee e,Dependent dp
where concat(e.fname,' ',lname)=
 dp.Dependent_name

--10
update employee 
set Salary+=0.3*Salary
where ssn in (
select ssn from Employee e
inner join 
works_for w
on e.ssn=w.ESSn
inner join 
Project p
on p.Pnumber=w.Pno and p.Pname='Al Rabwah'
)

--11

select  e.ssn, concat(e.fname,' ',lname) as [Full name]
from Employee e
where exists(
select dp.ESSN
from
Dependent dp
where dp.ESSN=e.SSN
)


--DML

--1

/*insert into departments(Dname,Dnum,MGRSSN,[MGRStart Date])
values('DEPT IT',100,112233,'1/11/2006')*/

--2
--a

update departments 
set MGRSSN=968574
WHERE DNUM=100

--b
update departments 
set MGRSSN =102672
WHERE DNUM=20

--c
update Employee
set dno=
(select 
Dnum 
from 
Departments 
where MGRSSN = 102672)
,Superssn=102672
where ssn=102660



--3
-- dependent 
delete from Dependent 
where ESSN=223344


--depart

update Departments
set MGRSSN=102672
where MGRSSN =223344

--
update Employee
set Superssn=102672
where  Superssn = 223344;


update Project
set Dnum=(select dno 
from Employee
where ssn=102672)
where dnum=(select dno 
from Employee
where ssn=22334)

update Works_for
set ESSn = 102672
where  ESSn = 223344;


delete from
Employee where
SSN = 223344;

