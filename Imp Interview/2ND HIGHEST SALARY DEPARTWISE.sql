/* 2nd Highest Salary departwise */

/*First we have to partition on department and order by salary in descending order */

select first_name , dep_id , salary , row_number() over (partition by dep_id order by salary desc) R  from myemp ;


/*after that we use subquery  and using where clause we will get the second highest Salary R = 2*/

select first_name , dep_id ,salary from(
select first_name , dep_id , salary , row_number() over (partition by dep_id order by salary desc ) R from myemp ) temp 
where R = 2 ;














