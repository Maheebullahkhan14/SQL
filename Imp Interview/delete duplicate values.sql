use interview ;
select * from emp_1 ;
describe emp_1 ;

with cte as(
select name , row_number() over(partition by designation order by designation) as d 
from emp_1)
delete  cte2
from emp_1 
cte2 inner join cte c 
on cte2.name = c.name	
where d >1;




