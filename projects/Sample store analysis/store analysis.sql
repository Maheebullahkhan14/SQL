 use market_store ;
select * from store ;

/*Q1 what is the total order*/
select count(*) as total_orders from store ;

/*Q2 what is the total order region wise*/
select Count(*) as Total_orders , region from store 
group by region
order by total_orders;

/*Q3 get the name of that region which has maximum count of order */
select region ,max(total_orders) as max  from (

select s.region ,count(*) as Total_orders  from store s 
group by region ) temp
group by region  
order by max desc
offset 0 rows
fetch next 1 rows only;


/*Q4 get the total sales , total profit by region */
select 
	region ,
	round(sum(sales),2) as total_sales ,
	   round(sum(profit),2) as total_profit 
	   from store 
	   group by region;

/*Q5 which Region has maximum sales */
select 
	 region ,
	 round(sum(sales) , 1) as total_sales
	 from store
	 group by region
	 order by total_sales desc
	 offset 0 rows
	 fetch first 1 rows only;

/*Q6 get the name and total sales of that region which has 3 highest sales */
select 
	 region ,
	 round(sum(sales), 1 ) as total_sales
	 from store
	 group by region
	 order by total_sales desc
	 offset 2 rows
	 fetch first 1 rows only ;

/*Q7 get the total quantity of products state wise*/
select state , count(quantity) from store
group by state;

/*Q8 get the name of that state which has maximum number of quantity products*/
select state,  count(quantity) as total_products from store
group by state 
order by total_products desc
offset 0 rows
fetch first 1 rows only ;
 
/*Q9 get the name of that city which has good ship mode like first class and second class*/
select distinct city ,Ship_Mode from store 
where ship_mode in ('first class' , 'Second Class')
order by ship_mode


/*Q10 count the total cities which have ship mode like first class */
select count(distinct city ) from store 
where Ship_Mode = 'first class' 


/*Q11 how many registered customers during the years 2016 - 2018*/
select count(*) as registered_customers 
	from (	
	select  year(order_date) as year , order_id from store)
	temp
	where year between 2016 and 2018  ;

select * from store ;

/*Q12 calculate frequency of each order id by each cutomer_name in descending  order */
select  count( order_id) as total_order ,
customer_name from store
group by Customer_Name ,order_id
order by total_order desc 

/*Q13 calculate total sales of each customer name*/
select
	 round(sum(sales),2) as total_sales , 
	 customer_name from store
	 group by customer_name
	 order by total_sales desc 

/*Q14 Display No of customers in each region in descending order*/
select count(distinct customer_name) as total_customer ,
	  region from store 
	  group by region 
	  order by total_customer desc ;


/*Q15 display the records for the customers who live in state in california and postal code 90032*/

select * from store 
where state = 'California' and Postal_Code = 90032

/*16 display all the records where the difference of days between order_date and 
ship_date is greater then 5 */

select * from store
where DATEDIFF(day ,order_date, ship_date)  >5

/*17 create table name new_table and enter the top 10 customer who had done max sales */


select round(sum(sales),2) as total_sales ,customer_name 
into new_table
from store
group by customer_name
order by total_sales desc 
offset 0 rows
fetch first 10 rows only ;


/*18 get the duplicate values from the data*/
select order_id , count(order_id) from store 
group by order_id 
having count(order_id) > 1

select * from store 

/* Q19 get the each year sales of each region from data order by maximum sales of region*/
select 
	 year(order_date) as year ,
	 round(sum(sales),2)  as total_sales, 
	 region  
	 from store 
	 group by region , year(order_date )
	 order by year , total_sales desc ;

/*Q20 In Which year the maximum sales of each region */

select total_sales , year ,region  from (

select 
	  round(max(sales),2) as total_sales 
	  , year(order_date) as year,
	  row_number() over (partition by region order by max(sales) desc) as RN
	  ,region
	  from store 
	  group by region , year(order_date))temp
	  where RN = 1
	  order by total_sales desc
	  
/*Q21 which category is most selled in each state  which year */
select total_sold  ,category , year , state from (

select 
		count(category) as total_sold ,
		category , 
		state , 
		year(order_date) as year  ,
		row_number() over (partition by state order by count(category) desc )rn
		from store
group by 
		category ,
		state , 
		year(order_date) ) temp
		where rn = 1
		order by total_sold desc


/*Q22 Which category is most selled in each state and get the details of every year*/

select 
		count(category) as total_sold ,
		category , 
		state , 
		year(order_date) as year  
	
		from store
group by 
		category ,
		state , 
		year(order_date) 
order by count(category) desc


select * from store ;

/*Q23 Which category has given the most profit in each state */
select total_profit , state , category , rn from(

select round(sum(profit),2) as total_profit ,
state ,
category,
row_number() over (partition by state order by sum(profit) desc)rn    
from store 
group by category , state)temp
where rn =1 
order by total_profit desc ;


/*Q24 get the total monthly sales in the year 2019*/
select year(order_date) as Year,
month(order_date) as Month ,
round(sum(sales),1) as total_sales
from store
group by year(order_date) ,month(order_date) 
having year(order_date) = 2019
order by  total_sales desc

/*Q25 get the name of that month which has the highest sales in year 2018*/
select year(order_date) as Year,
	datename(month ,order_date) as Month ,
	round(sum(sales),1) as total_sales
from store
	group by year(order_date) , datename(month,order_date) 
	having year(order_date) = 2018
	order by  total_sales desc
	offset 0 rows
	fetch first  1 rows only

/*Q26 get the sales of each year into quarter wise  */

select 
	  year(order_date) as year 
,	 (month(order_date)+2)/3  as quarter
,	  round(sum(sales),1) as total     
from store 
group by  year(order_date) , (month(order_date)+2)/3
order by year , quarter







