use dannysql ;

#what is the total amount each customer spent at restaurent 
select customer_id, sales.product_id,sum(price) as Spent 
from sales 
inner join menu
on sales.product_id = menu.product_id
where customer_id in ('A' , 'B','C')
group by Customer_id ;




#How many days has each customer visited the restaurant?
select customer_id , count( distinct (order_date))  as Visited 
from sales
group by customer_id ;




#What was the first item from the menu purchased by each customer?
 select customer_id, product_id , product_name from
( select customer_id , m.product_id , product_name ,
row_number() over(partition by customer_id )  R
from sales s
join menu m on
m.product_id = s.product_id) as temp
where temp.R = 1;



#Which item was the most popular for each customer?
#right 
select  distinct product_name ,max(max_ordered) as number_of_times_ordered from 
(
select customer_id , product_name ,
count(*) over (partition by (sales.product_id) ) as max_ordered
from Sales 
join menu on 
Sales.product_id = menu.product_id 
order by max_orderd desc) temp  ;



#What is the most purchased item on the menu and how many times was it purchased by all customers?
select s.customer_id  ,
m.product_id , 
count(m.product_name) as times
from sales s
join menu m on 
s.product_id = m.product_id
where m.product_name = 'ramen' 
group by s.customer_id;

#Which item was purchased first by the customer after they became a member?
select s.customer_id ,
	min(s.order_date) ord_date ,
	s.product_id ,
	m.join_date ,
   me.product_name 
from Sales s
join members m on 
	s.customer_id = m.customer_id 
join menu me on
	s.product_id = me.product_id 
where order_date >= join_date
group by s.customer_id
order by order_date  ;

#Which item was purchased just before the customer became a member?
select customer_id , temp  , product_name from
(
select s.customer_id ,s.order_date ,  me.product_id ,m.join_date, me.product_name ,
dense_rank() over(partition by customer_id order 
by order_date asc) temp
from sales s
join members m on 
s.customer_id = m.customer_id 
join menu me on 
s.product_id = me.product_id) temp2
where order_date < join_date and temp = 1  ;



#What is the total items and amount spent for each member before they became a member?
select customer_id ,product_name , count(product_id) as total_items , sum(price) as Amount_Spent from (
select 
s.customer_id ,
s.order_date ,
m.join_date,
s.product_id ,
me.product_name ,
me.price 
from Sales s
join menu me
on s.product_id = me.product_id
join members m 
on s.customer_id = m.customer_id 
where s.order_date < join_date 
order by customer_id ) temp 
group by customer_id ;

#Q9 If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
with cte as (
select 
	s.customer_id ,
	s.order_date ,
	s.product_id ,
	me.product_name ,
	me.price ,
(case when me.product_name in ('curry' ,'ramen') then price*10 else price*20 end )
 as points 
from Sales s
join menu me
on s.product_id = me.product_id )
select customer_id as Customers , sum(points) as total 
from cte
group by customer_id;


#In the first week after a customer joins the program (including their join date) 
#they earn 2x points on all items, not just sushi - 
#how many points do customer A and B have at the end of January?
select customer_id , sum(total_points) as points from
(
select s.customer_id ,s.order_date , m.join_date , me.product_name ,me.price ,
 case 
	when product_name = 'sushi' then price*20
	when datediff(order_date,join_date) <= 6 and datediff(order_date,join_date) >= 0 then price*20
    when datediff(order_date,join_date) >= 7 and product_name in ('curry','ramen') then price*10
    when datediff(order_date,join_date) < 0 then price*10
	else price*10 end as total_points 
from sales s
join members m on 
s.customer_id = m.customer_id 
join menu me on 
s.product_id = me.product_id) temp
 where order_date < '2021-02-01'
group by customer_id ;


























