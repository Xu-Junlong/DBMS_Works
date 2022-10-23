select RegionDescription,FirstName,LastName,BirthDate
from (select RegionDescription,FirstName,LastName,BirthDate,RegionId,row_number() over (partition by RegionDescription order by BirthDate desc ) as num
      from Employee,Region,Territory,EmployeeTerritory
      where Employee.Id=EmployeeTerritory.EmployeeId and EmployeeTerritory.TerritoryId=Territory.Id and Territory.RegionId=Region.Id)
where num=1
order by RegionId;