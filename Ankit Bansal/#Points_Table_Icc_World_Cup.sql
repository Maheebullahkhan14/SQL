#Derive a Points Table from Icc World Cup

#We use case statements if team_1 win then 1 else 0 
select team_1 ,
Case when team_1 = winner then 1 else 0 end
from icc_world_cup ;

#Step :2
#Same for team2 
select team_2,
Case when team_2 = winner then 1 else 0 end 
from icc_world_cup ;

#after that we will combine both case 
select team_1 ,
Case when team_1 = winner then 1 else 0 end
from icc_world_cup 
union all
select team_2,
Case when team_2 = winner then 1 else 0 end as Win
from icc_world_cup ;

#using subquery and count of 1 for matches_played , sum of case to find number of wins , count - sum to find losses 

select team_1 as team ,
count(1) as Matches_played ,
sum(win) as No_of_Wins,
count(1) - sum(win) as No_of_Losses 
from 
(select team_1  ,
Case when team_1 = winner then 1 else 0 end as Win
from icc_world_cup 
union all
select team_2,
Case when team_2 = winner then 1 else 0 end 
from icc_world_cup )temp
group by team_1 ;






