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

select ins.ins_name ,d.dept_name
from Instructor ins
inner join 
department d
on d.dept_id=ins.dept_id

--5
select concat(s.st_fname,' ',s.st_lname) as[student name],c.crs_name as [course] 
from student s
inner join 
Stud_Course sc
on sc.St_Id=s.St_Id and sc.Grade is not null
inner join Course c
on c.Crs_Id=sc.Crs_Id

--6
select top_name ,count(c.crs_id) as[number of courses]
from
Topic t
inner join
Course c
on t.Top_Id=c.Top_Id
group by top_name 

--7

select max(salary) as[max sal],
min(salary) as[min sal]
from Instructor


--8

select *
from Instructor
where Salary<(select avg(salary)
from Instructor)

--9
select d.dept_name
from Department d
inner join
Instructor ins
on ins.Dept_Id=d.Dept_Id
where ins.Salary=
(select min(Salary)
from Instructor)

--10
select top(2) salary
from Instructor
order by salary desc

--another way using ranking functions

select salary
from (select salary, dense_rank() over(order by salary desc)as DR
from instructor) as sal
where DR<=2

--11
select ins_name,coalesce (salary,0)  --there is no bonus column
from Instructor


--12

select avg(salary)
from Instructor


--13 self join

select st.st_fname,sup.*
from Student st,Student sup
where sup.St_Id=st.St_super

--14
select salary,Dept_Id from(
select * ,dense_rank() over(partition by dept_id order by salary desc) as DR
from Instructor) as new_table
where DR<=2


--15
select * from( 
select * ,ROW_NUMBER() over(partition by dept_id order by newid() )as Ran
from student )
as ran_st
where ran=1



