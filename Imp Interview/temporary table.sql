
/*OUR QUESTION GET THE UNIQUE VALUES FROM TABLE A AND INSERT IT INTO TABLE B*/
/*STEP :1 FIRST WE HAVE TO CREATE TABLE B*/
create table emp_5
(id integer not null auto_increment , 
name varchar (255),
designation varchar(255) ,
dob date ,
primary key (id) ) ;

drop table emp_5;
select * from emp_4;
/*Not Worked*/
insert into emp_5 
select * from emp_4 as e4
where not exists(
select * from emp_5 e5 where e5.designation = e4.designation );

/*ONLY SELECT THOSE VALUES WHICH ARE UNIQUE FROM TABLE A*/
select * from emp_5;
insert into emp_5 (name,designation,dob)
select distinct ( name),designation,dob from emp_4;
