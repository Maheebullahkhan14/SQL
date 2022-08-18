#find the No of New And Repeat customers
select * from customer_orders ;

with first_visit as (
	select customer_id , min(order_date) as first_visit_date
	from customer_orders
	group by customer_id )

	select co.order_date ,
    sum(case when co.order_date =fv.first_visit_date then 1 else 0 end) as First_day,
    sum(case when co.order_date != fv.first_visit_date then 1 else 0 end) as Repeat_day ,
    fv.first_visit_date from customer_orders  co
	inner join first_visit fv on
	co.customer_id = fv.customer_id
    group by co.order_date;












select order_date ,
case when order_date = min(order_date) then 1 else 0 end as First_visit_flag ,
case when order_date != min(order_date) then 1 else 0 end as Repeated 
from customer_orders 
group by order_date ;
