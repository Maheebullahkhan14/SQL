show databases ;
use exampledb ;
show tables ;
select * from myemp ;

use greatlearning ;
select * from stud_table ;

describe stud_table ;

create table stud2 (id integer , stud_name varchar(255) , age integer , course_name char(50), email varchar(255));
insert into stud2 
select * from stud_table where age > 18 ;

select * from stud2 ;

update stud2 
set age = age-2
where age in (select age from stud_table where age > 17);


delete from stud2 where age in (select age from stud_table where age>= 23);

drop table stud2 ;

select * , 
case 
when age >19 then "greater then 19"
when age = 19 then "Age is 19"
else "age is not in group of 19"
end as age_information 
from stud2 ;




