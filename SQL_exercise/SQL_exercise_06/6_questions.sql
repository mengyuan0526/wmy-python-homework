-- Scientists
-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
Select * from scientists;
Select * from projects;
Select * from AssignedTo;
Select a.name as scientist_name,c.name as project_name,sum(c.hours) as duration 
from scientists a inner join AssignedTo b on a.ssn=b.scientist inner join projects c on b.project=c.code 
group by a.name, c.code 
order by c.name,a.name;
-- 6.2 Select the project names which are not assigned yet
SELECT name from projects WHERE code not in (SELECT project FROM assignedto);
