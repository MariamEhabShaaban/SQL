use ITI
--1

select count(st_age)
from student

--2
select distinct ins_name
from Instructor

--3


select s.st_id as [student name] ,isnull(s.St_Fname+' '+s.St_Lname,'') as [Full Name] ,Dept_Name as[Department name]
from Student s
inner join 
Department d
on d.dept_id=s.dept_id


--4

select ins_name,dept_name
from Instructor i
left join
Department d
on d.Dept_Id=i.Dept_Id

--5
select concat(st_fname,' ',st_lname) as[full name],crs_name
from Student s
inner join 
Stud_Course st_c
on st_c.St_Id=s.St_Id and st_c.Grade is not null
inner join
Course c
on c.Crs_Id=st_c.Crs_Id

--6
select count(crs_id),top_name
from Course c
inner join Topic t
on t.Top_Id=c.Top_Id
group by Top_Name

--7
select min(salary),max(salary)
from Instructor

--8
select ins_name
from Instructor i
where i.Salary<(
select avg(Salary)
from Instructor
)

--9
select dept_name
from Department d
inner join 
Instructor i
on i.Dept_Id=d.Dept_Id
where i.Salary=(
select min(salary)
from Instructor
)

--10
  --way1
select * from
Instructor i1
where 2>(
select count(Salary)
from Instructor i2
where i2.Salary>i1.Salary
) and Salary is not null
order by Salary desc
  
  --way2
select distinct top(2) salary
from Instructor i
order by i.Salary desc
  
  --way3
select  salary 
from(
select salary ,ROW_NUMBER() over(order by salary desc)as rn
from Instructor i
) as new_table
where rn<=2
  
  --way4
select salary
from (
select salary,dense_rank() over(order by salary desc)as dr
from Instructor 
) as new_table
where dr<=2

  --way5
select salary from (
select salary ,rank() over(order by salary desc)as r
from Instructor
) as new
where r<=2

--11

select Ins_name,isnull(salary,0)
from Instructor

--12

select avg(salary)
from Instructor

--13

select s1.st_fname,sup.*
from Student s1
inner join 
student sup
on sup.St_Id=s1.St_super

--14

select salary,Dept_name
from(
select * ,DENSE_RANK() over (partition by dept_id order by salary desc)as dr
from Instructor
)as new
inner join
Department d
on d.Dept_Id=new.dept_id


--15
select *
from (
select *,row_number() over(partition by dept_id order by newid()) as rn
from Instructor
) as new
where rn=1;








