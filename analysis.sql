-- Global Terrorism data Analysis
SELECT *
FROM Sparks.dbo.terror

-- Updating null values
update Sparks.dbo.terror
set nwound = 0 
where nwound is null

update Sparks.dbo.terror
set nkill = 0 
where nkill is null

--Number of attacks per year

SELECT year,count(year) as numberOfAttacks
FROM Sparks.dbo.terror
group by year

-- number of succefull attacks per year
SELECT year,count(success) numberOfsuccess
FROM Sparks.dbo.terror
where success in (select success
				FROM Sparks.dbo.terror
				where success = 1
)
group by year

-- Conclusion by visualization:
-- attacks starts to increase in almost 1975 and continue to increment slighly 
-- up untill 1992, Sudden decrease untill almost 2005, then back to significantly incrase in 2011



--- count attacktype to see the most frequant type 

SELECT attacktype,count(attacktype) attacktypecount
FROM Sparks.dbo.terror
group by attacktype
order by attacktypecount desc

-- Bombing is the most frequent type 

--10 Groups responsible for the highest count of terrorism attacks

Select Top 10 gname, count(gname) numberofattacks
from Sparks.dbo.terror
group by gname
having count(gname) > 50 and gname <> 'Unknown'
order by count(gname) desc

-- the Unknown attacks are over 80 000 
-- the highest attacks number are caused by Taliban and ISIL


-- Weapon type used in each country

select top 20 country,weaptype1_txt,count(weaptype1_txt) countofweapon
from Sparks.dbo.terror
group by country,weaptype1_txt
order by countofweapon desc


-- Number of killed and wounded in each event
Select  eventid,year,country, sum(nkill)killed, sum(nwound) wounded
from Sparks.dbo.terror
group by eventid,year,country
order by killed desc, wounded

-- Iraq has the greatest number of killed people over countries and years Specifically,2014
-- 0 wounded in an event like that is Suspicious
-- US comes the second with the 2001 attack with almost 2767 deaths

