#how to convert column to rows 
create table newtable as
select emp_id ,
sum(case when salary_component_type ='salary' then val end) as Salary ,
sum(case when salary_component_type = 'bonus' then val end) as Bonus ,
sum(case when salary_component_type = 'hike_percent' then val end) as Hike 
from emp_compensation 
group by emp_id  ;

select emp_id , 'salary' as salary_type ,  salary as val  from newtable 
union all 
select emp_id , 'bonus' as salary_type ,  bonus as val  from newtable 
union all
select emp_id , 'salary' as salary_type ,  hike as val  from newtable ;
