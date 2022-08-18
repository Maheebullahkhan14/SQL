create database AnkitBansal ;
drop table icc_world_cup ;
use ankitbansal ;
create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup ;


select team_1 as team  , count(1) as matches_played , sum(Win) as no_of_wins , count(1)-sum(win) as No_of_losses
from(
select team_1 ,
case when team_1 = winner then 1 else 0 end as Win
from icc_world_cup 
union all
select team_2,
case when team_2 = winner then 1 else 0 end 
from icc_world_cup )temp
group by team ;













