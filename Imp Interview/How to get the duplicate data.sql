use practice ;

create table duplicate(id integer , d_name varchar(255), dplace varchar(255));
insert into duplicate values( 1,"GULAM","kurla"),(2,"GULAM","chennai"),(3,"kaif","gulistan"),(3,"shanu","rehmaniya"),(4,"kaif","rehmaniya")
;


insert into duplicate values( 1,"GULAM","kurla"),(2,"GULAM","chennai");


select * from duplicate ;

/*How to get the duplicate Values in Sql*/
select id ,d_name , dplace ,count(*)
from duplicate 
group by id  , d_name , dplace
having count(*) > 1;












