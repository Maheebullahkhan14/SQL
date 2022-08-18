/*3 WAYS TO GET THE DUPLICATE DATA
use interview ;
select * from emp_1 ;

/*IDENTIFY DUPLICATE DATA*/
select *  from(

select * , row_number() over(partition by designation order by id) as d 
from emp_1)  x 
WHERE X.D > 1
order by id;


SELECT * 
FROM emp_1 E2 WHERE ID = (
select max(id) 
from emp_1 e1
where e1.name=e2.name AND e1.designation =e2.designation AND e1.dob=e2.dob);


SELECT NAME, DESIGNATION , COUNT(*)
FROM EMP_1
GROUP BY NAME,DESIGNATION
HAVING COUNT(*) > 1;










