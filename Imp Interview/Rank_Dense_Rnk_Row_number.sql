use exampledb ;
select * from myemp ;

select * ,
rank() over(order by salary desc)as rnk ,
dense_rank() over (order by salary desc) as d_rnk
from myemp ;


select * ,
row_number()over (order by salary desc)as rn
from myemp ;

/*suppose now i want departwise highest salary */
SELECT * FROM(
SELECT * ,
RANK() OVER (PARTITION BY DEP_ID ORDER BY SALARY DESC) d 
FROM MYEMP)AS SAL 
WHERE D = 1;
