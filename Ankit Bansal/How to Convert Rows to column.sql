#how to convert rows into column
select emp_id ,
sum(case when salary_component_type ='salary' then val end) as Salary ,
sum(case when salary_component_type = 'bonus' then val end) as Bonus ,
sum(case when salary_component_type = 'hike_percent' then val end) as Hike 
from emp_compensation 
group by emp_id  ;