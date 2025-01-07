--Change colun name from Sex to Gender
EXEC sp_rename "olympic.Sex","Gender", "COLUMN";

--Whole Dataset
select *
from PortfolioProjects.dbo.OLYMPIC

--Total Atletes
select COUNT(distinct Name) as No_of_athletes
from PortfolioProjects.dbo.OLYMPIC

--Total Ahletes by gender
select Gender,COUNT(distinct Name) as No_of_athletes_by_Gender
from PortfolioProjects.dbo.OLYMPIC
group by Gender


--Total  Medals ever won
Select COUNT(Medal) as Total_Medals
from PortfolioProjects.dbo.OLYMPIC
where Medal is not null and Medal != ' '


--Total Gold Medal ever won

Select COUNT(Medal) as Total_Gold_Medals
from PortfolioProjects.dbo.OLYMPIC
where Medal = 'Gold'

--Total Silver Medal ever won

Select COUNT(Medal) as Total_Silver_Medals
from PortfolioProjects.dbo.OLYMPIC
where Medal = 'Silver'


--Total BRonze Medal ever won
Select COUNT(Medal) as Total_Bronze_Medals
from PortfolioProjects.dbo.OLYMPIC
where Medal = 'Bronze'

--Medals by Countries
Select Team ,COUNT(Medal) As Count_of_Countries_Medals
from PortfolioProjects.dbo.OLYMPIC
Where Medal is not Null and Medal != ' '
Group by Team 
order by Count_of_Countries_Medals Desc


--Total Medal by Each Athlete

Select Name,COUNT(Medal) as noOfMedal
from PortfolioProjects.dbo.OLYMPIC
where Medal is not null
group by Name 
order by noOfMedal desc


--Individuals with the most overall Medal
Select Name, 
		Sum(Case When Medal = 'Gold' Then 1 else 0
End) As Gold,
		Sum(Case When Medal = 'Silver' Then 1 else 0
End) As Silver,
		Sum(Case When Medal = 'Bronze' Then 1 else 0
End) As Bronze,
		Sum(Case When Medal = 'Gold' Then 1 else 0
	End) +
		Sum(Case When Medal = 'Silver' Then 1 else 0
	End) +
		Sum(Case When Medal = 'Bronze' Then 1 else 0
	End) As Total_Medals
from PortfolioProjects.dbo.OLYMPIC
where Medal is not null and Medal != ' '
group by Name
order by 
		Sum(Case When Medal = 'Gold' Then 1 else 0
End) +
		Sum(Case When Medal = 'Silver' Then 1 else 0
End) +
		Sum(Case When Medal = 'Bronze' Then 1 else 0
End) Desc



--Countries with the most Overall Medal 
--Medal Distribution by Country
Select Team, 
		Sum(Case When Medal = 'Gold' Then 1 else 0
End) As Gold,
		Sum(Case When Medal = 'Silver' Then 1 else 0
End) As Silver,
		Sum(Case When Medal = 'Bronze' Then 1 else 0
End) As Bronze,
		Sum(Case When Medal = 'Gold' Then 1 else 0
	End) +
		Sum(Case When Medal = 'Silver' Then 1 else 0
	End) +
		Sum(Case When Medal = 'Bronze' Then 1 else 0
	End) As Total_Medals

from PortfolioProjects.dbo.OLYMPIC
where Medal is not null and Medal != ' '
group by Team
order by 
		Sum(Case When Medal = 'Gold' Then 1 else 0
End) +
		Sum(Case When Medal = 'Silver' Then 1 else 0
End) +
		Sum(Case When Medal = 'Bronze' Then 1 else 0
End) Desc



--Athlete distribution by Sport

Select Sport, COUNT(distinct ID)
from PortfolioProjects.dbo.OLYMPIC
group by Sport
order by Sport desc

--Medal Distribution by sport
Select Sport, 
		Sum(Case When Medal = 'Gold' Then 1 else 0
End) As Gold,
		Sum(Case When Medal = 'Silver' Then 1 else 0
End) As Silver,
		Sum(Case When Medal = 'Bronze' Then 1 else 0
End) As Bronze,
Sum(Case When Medal = 'Gold' Then 1 else 0
End) +
Sum(Case When Medal = 'Silver' Then 1 else 0
End) +
Sum(Case When Medal = 'Bronze' Then 1 else 0
End) As Total_Medals

from PortfolioProjects.dbo.OLYMPIC
where Medal is not null and Medal != ' '
group by Sport
order by 
		Sum(Case When Medal = 'Gold' Then 1 else 0
End) +
		Sum(Case When Medal = 'Silver' Then 1 else 0
End) +
		Sum(Case When Medal = 'Bronze' Then 1 else 0
End) Desc

--Medal Distribution by AGE

Select Age, 
		Sum(Case When Medal = 'Gold' Then 1 else 0
End) As Gold,
		Sum(Case When Medal = 'Silver' Then 1 else 0
End) As Silver,
		Sum(Case When Medal = 'Bronze' Then 1 else 0
End) As Bronze,
		Sum(Case When Medal = 'Gold' Then 1 else 0
	End) +
		Sum(Case When Medal = 'Silver' Then 1 else 0
	End) +
		Sum(Case When Medal = 'Bronze' Then 1 else 0
	End) As Total_Medals

from PortfolioProjects.dbo.OLYMPIC
where Medal is not null and Medal != ' '
group by Age
order by 
		Sum(Case When Medal = 'Gold' Then 1 else 0
End) +
		Sum(Case When Medal = 'Silver' Then 1 else 0
End) +
		Sum(Case When Medal = 'Bronze' Then 1 else 0
End) Desc

--Medal Distribution by Gender
select Gender, COUNT(Medal) as no_Medal_by_gender
from PortfolioProjects.dbo.OLYMPIC
where Medal is not null
Group by Gender
order by no_Medal_by_gender


Select Season, COUNT(medal) as Distribution_of_Medals_by_season
from  PortfolioProjects.dbo.OLYMPIC
where Medal is not null
group by Season


--Athletes to Participate in most Olympic
Select Name,COUNT(Distinct City) as No_of_Olympic_Participated
from PortfolioProjects.dbo.OLYMPIC
group by Name Having COUNT(Distinct City) > 1
order by No_of_Olympic_Participated desc