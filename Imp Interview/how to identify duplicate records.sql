/*how to identify duplicate records*/
drop database interview1 ;
use interview ;

create table if not exists emp_1
(id integer not null auto_increment , 
name varchar (255),
designation varchar(255) ,
dob date ,
primary key (id) ) ;



INSERT INTO EMP_1(NAME, DESIGNATION, DOB ) VALUES ('JOHN', 'Engineer', '2009-01-18');
INSERT INTO EMP_1(NAME, DESIGNATION, DOB ) VALUES ('PETER', 'VP', '1989-05-28');
INSERT INTO EMP_1(NAME, DESIGNATION, DOB ) VALUES ('JESSICA', 'CIO', '1979-05-28');
INSERT INTO EMP_1(NAME, DESIGNATION, DOB ) VALUES ('JOHN', 'Engineer', '2009-01-18');
INSERT INTO EMP_1(NAME, DESIGNATION, DOB ) VALUES ('PETER', 'VP', '1989-05-28');

select * from Emp_1 ;
select name , designation , dob ,count(*) as numoccurences
from emp_1
group by name,designation,dob
having count(*)>1 ;






select * from emp_1;












