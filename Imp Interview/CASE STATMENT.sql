use exampledb ;
select * from myemp ;

describe myemp ;

create table myemp2(emp_id decimal(6,0),first_name varchar(20) ,salary decimal(8,2));

insert into myemp2(
select emp_id,first_name,salary from myemp);

select * from myemp2;
alter table myemp2
add  inc_salary integer ;

select emp_id , first_name , last_name ,salary ,
case 
when (salary > 20000) then 'salary is greater then 20000'
when (salary between 10000 and 20000 ) then 'salary between  10000 and 20000'
when (salary <10000 ) then 'salary is less then 10000'
else salary end as cond_1
from myemp2 ;

alter table myemp2
drop column inc_salary ;



/*ASSUME WE HAD A COLUMN MYEMP HAVING COLUMN ID , NAME, SALARY I WOULD LIKE ADDITIONAL COLUMN 
INC_COLUMN AND UPDATING THIS COLUMN AS PER BELOW HR CONDITION
.--IF SALARY < 20000 THEN INCREASE THE SALARY BY 30%
.--IF SALARY BETWEEN 2000 AND 50000 THEN INCREASE THE SALARY BY 20%
.--IF SALARY < 10000 THEN INCREASE THE SALARY BY 10% 
*/

UPDATE MYEMP2 SET INC_SALARY=
CASE 
WHEN (SALARY <20000) THEN (SALARY + SALARY*0.3)
WHEN (SALARY BETWEEN 20000 AND 50000) THEN (SALARY + SALARY *0.2)
ELSE (SALARY +SALARY *0.1)
END ;

SELECT * FROM MYEMP2 ;





