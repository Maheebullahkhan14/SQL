use library ;
select * from books ;

#Q1 --query the earliest book which is present into library */
select * from books 
order by published  limit 1 ;



#Q2--which patron has issued the most books from the library 
select  p.patronid ,p.firstname ,p.lastname , p.email ,count(p.patronid) as BookIssued_times
 from loans l
join books b on l.bookid = b.bookid 
join patrons p  on l.patronid = p.patronid
group by patronid
order by BookIssued_times desc limit 1 ;


#Q3--which author has written most books that are kept in the library
select  author,
row_number() over (partition by Author ) Written_books from books b 
order by Written_books desc limit 1 ;



#Q4--List All that books from the library which is published in 18th century 
select distinct title , published from books 
where published between 1800 and 1899
order by published; 

#Q5 -- how many books published in each year 
select published ,count(title) as number_of_books_published from books 
group by published 
order by published ;

#Q6--Most 10 popular books to check out
select title , times_issued from 
(
select l.loanid, 
b.bookid 
,patronid 
,b.title ,count(title) as times_issued
from loans l
join books b on l.bookid = b.bookid 
group by title
order by times_issued desc 
limit 10 ) temp
;

#Q7 list 10  patrons which issued the least books from the library
select loanid, firstname , lastname , issued_books from (
select l.loanid,count(p.patronid) as issued_books ,
b.bookid 
,p.patronid 
,p.firstname ,p.lastname
,b.title
from loans l
join books b on l.bookid = b.bookid 
join patrons p on l.patronid = p.patronid
group by patronid 
order by count(patronid) asc limit 10 ) temp ;


#Q8--create a report and give details of that  patrons which has not returned books to the  library 
select firstname , lastname , email from
 (
select l.loanid , 
p.patronid , 
p.firstname , 
p.lastname , 
p.email ,
l.returneddate
from loans l 
join patrons p on l.patronid = p.patronid 
join books b on l.bookid = b.bookid
where returneddate = '') temp ;

#Q9-- How many patrons has not returned the books
with cte as
 (
select l.loanid , 
p.patronid , 
p.firstname , 
p.lastname , 
p.email ,
l.returneddate , count(returneddate) as notreturned
from loans l 
join patrons p on l.patronid = p.patronid 
join books b on l.bookid = b.bookid
where returneddate = '' )
select notreturned from cte ;

#Q10 -- how many number of copies of each books where present in the library 
select title , count(bookid) as copies 
 from books 
 group by title ;

#Q11 What is the difference of days between loandate and duedate

select datediff(duedate , loandate) as days
from loans 
limit 1 ;

#Q13 how many loans are there in each books which are published in 19th century 
with loans1 as (
select l.loanid ,b.published , b.bookid ,b.title , count(l.loanid) as total_loans  from loans l
join books b on l.bookid = b.bookid
where published between 1900 and 1999 
group by bookid
order by total_loans  )
select total_loans , title , published  from loans1 
 ;

#Q14 Get the information of that patron where due date is 13 july 2020
with cte as 
(
select l.* ,p.firstname , p.lastname , p.email ,b.title
from loans l
join patrons p on l.patronid = p.patronid
join books b on b.bookid = l.bookid 
where l.duedate = '2020-07-13' and returneddate = ''
) 
select patronid , firstname , lastname , email , title
from cte ;

-- #Q15 Update the loan table where book is returned to the library on 5 july 2020
-- #and the barcode of the book  is 6435968624

-- first have to find the row of that book from books table
-- select * from loans 
-- where bookid in 
-- (
-- select bookid 
-- from books
-- where barcode = 6435968624 
-- and returneddate = '' ) ;

select * from loans 
where bookid in 
(
select bookid 
from books
where barcode = 6435968624 
and returneddate = '2020-07-05' ) ;


#updating the loans table where bookid contains that barcode = 6435968624
update loans 
set returneddate = '2020-07-05'
where bookid in (
select bookid 
from books
where barcode = 6435968624 
and returneddate = '') ;

#Q16--Count how many books named dracula  are present in the library 

-- Fisrt we have to find the copies of that book
select count(bookid) as totalcopies 
from books 
where title like '%dracula%' ;

-- then find the total number of loans of that book which is not returned
select count(loanid) as totloans from loans where bookid in(
select bookid from books 
where title like '%dracula%'
and returneddate = '') ;

-- To find the number of books available in the library 
-- we have to subtract totalcopies - totalloans of that book

select 
		(select count(bookid) as totalcopies 
		from books 
		where title like '%dracula%' )
        -
        (select count(loanid) as totloans from loans where bookid in(
select bookid from books 
where title like '%dracula%'
and returneddate = ''))  as available_books ;
        

