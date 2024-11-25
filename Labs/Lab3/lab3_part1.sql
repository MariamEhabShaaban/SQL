--DQL
--1
use Company_SD
select 
D.Dnum,
D.Dname,
E.SSN,
E.Fname+' '+E.Lname as [Full Name]
from Departments D ,Employee E
where D.MGRSSN=E.SSN

--2
select
D.Dname,
P.Pname
from Departments D ,Project P
where D.Dnum=P.Dnum

--3
select
Dp.* ,
E.Fname+' '+E .Lname as [Depend on]
from Dependent Dp ,Employee E
where ESSN=E.SSN

--4
select
P.Pnumber,
P.Pname,
P.Plocation 
from Project P
where P.City in('Cairo','Alex')

--5
select 
P.*
from Project P
where P.Pname like 'a%'

--6
select 
E.Fname+' '+E .Lname as [Full Name] ,
E.SSN,E.Salary,
E.Dno
from Employee E
where (E.Salary between 1000 and 2000) and E.Dno=30

--7
select
E.*,
W.Hours,
P.Dnum,
P.Pname
from Employee E 
inner join Works_for W 
on E.SSN=W.ESSn and W.Hours>=10
inner join Project  P
on W.Pno=P.Pnumber and P.Pname='AL Rabwah' and P.Dnum=10

--8 self join 
select
E.Fname+' '+E .Lname as [Full Name],
S.Fname+' '+ S.Lname as [Supervisor]
from Employee E ,Employee S
where S.SSN=E.Superssn and S.Fname+' '+ S.Lname ='Kamel Mohamed'

--9
select 
E.Fname+' '+E .Lname as [Full Name],
P.Pname
from Employee E 
inner join Works_for W
on E.SSN=W.ESSn
inner join Project P
on W.Pno=P.Pnumber  order by P.Pname;

--10
select 
P.Pnumber ,
D.Dname,
E.Lname,
E.Address,
E.Bdate
from Project P 
inner join Departments D
on P.Dnum=D.Dnum and P.City='Cairo'
inner join Employee E
on D.MGRSSN=E.SSN

--11
select
E.*
from Employee E
inner join Departments D
on D.MGRSSN=E.SSN


--12

select 
E.*,
D.*
from Employee E
left outer join Dependent D
on E.SSN=D.ESSN


--DML

--1
insert into Employee(Fname,Lname,Sex,Bdate,SSN,Address,Superssn,Salary,Dno)
values('Mariam','Ehab','F','12/26/2003',102672,'Portsaieed street',112233,3000,30)

--2

insert into Employee(Fname,Lname,Sex,Bdate,SSN,Address,Superssn,Salary,Dno)
values('Menna','Ehab','F','12/26/2003',102660,'Portsaieed street',NULL,NULL,30)
--3
update Employee 
set Salary+=0.2*Salary
where SSN=102672