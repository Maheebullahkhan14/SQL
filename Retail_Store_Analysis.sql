create database project2 ;
use project2;
drop table Retail_store ;
create table Retail_store 
(Order_ID integer ,
Customer_Name varchar(255) ,
Category varchar(255) ,
Sub_Category varchar(255) ,
City varchar(255) ,
Order_Date varchar(255) ,
Region varchar(255) ,
Sales integer,
Discount float,
Profit float ,
State varchar(255));

select * from Retail_store ;

/*Q1 I Want only that Sales of city Vellore , Ooty , Perambalur*/
select  sales from Retail_store
where City in ("Vellore","Ooty","Perambalur") ;



/*Q2 Find out All the customers Whose name startwith 'H' and their Sales ?*/
select distinct(Customer_name) , Sales 
from  Retail_store 
where Customer_name like"H%" ;



/*Q3 Find out that person whose Sale is maximum */
select Customer_name , Sales from Retail_store 
order by Sales desc limit 1 ;



/*Q4 Change the Name of State as kerala?*/
update Retail_store set state = "kerala"  ;



/*Q5 Calculate sum(profit), Avg(sales) from the table? */
select sum(profit), avg(sales) from Retail_store;



/*Q6 Use upper case for category and lower case for city?*/
select upper(Category), lower(city ) from Retail_store;



/*Q7 Get the 2nd higest sales ?*/
select max(Sales) from Retail_store 
where sales < (select max(Sales) from Retail_store);


/*other way */ 
select sales from 
(select distinct(sales) from Retail_store order by sales desc limit 2) as
sup order by sales limit 1;   


/*Q8 Top 3 City whose Sales is maximum*/
select  City  , sales from retail_store 
order by sales desc limit 3;



/*Q9 Which region has highest  Sales*/
select region , sales from retail_store 
order by sales desc limit 1;



/*Q10 which region has lowest Sales*/
select region , sales from retail_store 
order by sales limit 1 ;

select * from retail_store ;


/*Q11 Calculate the percentage of discount*/
select discount, (discount*100) as percent from retail_store ;


/*Q12 get the maximum profit gained by products in which city */
select category , profit , city from retail_store 
group by city 
order by profit desc;


/*Q13 get the names of that customer whose sales is between 1500 to 2000*/
select customer_name , sales  from retail_store 
where sales between 1500 and 2000 
order by sales desc ;



/*Q14 get the Total sales of region east */
select sum(sales) as total  from retail_store 
where region ="east" ;



/*15 top 5 city  whose profit is least */
select city , profit from retail_store 
order by profit limit 5 ;


/*16 get the second order profit which is lowest */
select min(profit) from retail_store where profit > (select min(profit) from retail_store);




/*17 get the 4th maximum Sales from the data */
select distinct(sales) from retail_store as r1 where 4-1 = 
(select count(distinct sales) from retail_store as r2 
where r2.sales > r1.sales);




/*Q18 find the 6th maximum sales from the given data*/
select distinct(sales) from retail_store r1 where 6-1 = 
(select count(distinct sales) from retail_store r2 
where r2.sales > r1.sales );





























 
 







	
