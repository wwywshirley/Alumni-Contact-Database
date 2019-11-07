--which city has the most alumni live in, so that we can hold an alumni event in this city--
select top 1 city, count(city) as 'Alumni Works In'
from Location l, Alumni a
where l.locId=a.locId
group by city
order by count(city) desc;

--which top 3 skills has the most alumni own,--
--so that we can know which skills are helping students find jobs and used most in real life.--

Select Top 3 skillName, count(c.skillid) as 'By how many alumni owned'
From skill s
Inner join Certification c
On s.skillId = c.skillId
Group by skillName, c.skillID
Order by count(c.skillID) desc;

--which company has the most alumni works in, so that we can recommend students to intern there.

select Top 1 comName,count(a.comID) as 'Alumni Works In'
from Company c
inner join Alumni a
on c.comId = a.comId
group by a.comID,comName
order by count(a.comID) desc;

--Which job roles that have greater than 10 of our alumni, so that we can build our students based on the requirement of these job roles.
SELECT  b.jobTitle AS 'Job Title', COUNT(a.alumniId) AS 'Number of Alumni'
FROM [Alumni] a, [JobRole] b
WHERE a.jobId=b.jobId
GROUP BY b.jobTitle
HAVING COUNT(DISTINCT a.alumniId)>=10;
