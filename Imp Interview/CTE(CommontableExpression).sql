/*Common Table Expression*/

/*Find employee whose salary is greater then average salary across All employee*/
select * from myemp ;

/*1.Find the Total_salary of employee*/
select emp_id , sum(salary) as total_salary 
from myemp 
group by emp_id;

/*2.Find the average Salary of employee*/
select avg(salary ) as average_salary_all_stores
from myemp;  


/*Using With Clause and CTE(Common Table Expression)*/
with total_sales (emp_id , total_salary ) as
		(select emp_id , sum(salary) as total_salary 
        from myemp 
        group by emp_id),
        avg_sales(average_salary_all_stores) as
        (select avg(total_salary)  as average_salary_all_stores
        from total_sales)
        
select * from total_sales ts
join avg_sales av
on ts.total_salary > av.average_salary_all_stores;

/*using Subquery Factoring*/
select *
from (select emp_id , sum(salary) as total_salary 
      from myemp 
      group by emp_id ) total_sales
join (select avg(salary) avg_salary_all_employee 
      from myemp) avg_salary 
on total_sales.total_salary >avg_salary.avg_salary_all_employee ;


    

    
        