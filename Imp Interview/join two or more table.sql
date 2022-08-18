
create table employee1 (empid integer primary key , e_name varchar(255) );
create table department1 (depid integer primary key  ,man varchar(255) );
create table  details2 (e_id integer , did integer , salary integer);


alter table details2 ADD constraint 
foreign key(e_id) REFERENCES employee3(empid) ,ADD constraint foreign key(did) references department(depid) ;


insert into employee1 values (1 , "Rajesh"),(2 , "suresh"),(3,"Shailesh");
insert into department1 values ( 1, "kamlesh"),(2,"Sameer"),(3,"Amir");
insert into details2 values(,1,69000);


select * from details1 ;
select * from department2 ;
select * from employee4 ;


set identity insert employee4(empid) on 




