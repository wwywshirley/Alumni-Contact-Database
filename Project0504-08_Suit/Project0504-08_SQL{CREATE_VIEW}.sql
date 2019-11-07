CREATE VIEW Overview AS
Select AL.alumniId,AL.fName,AL.lName,Al.gradYear,AL.workYears,Al.eMail,Al.linkdinURL,
Com.comName,Com.industry,Job.jobTitle,skill.skillName
from
dbo.Alumni as AL,
dbo.Company as Com,
dbo.JobRole as Job,
dbo.Certification as Cer,
dbo.Skill as skill
where AL.comId=Com.comId and AL.jobId=Job.jobId and Cer.alumniId=Al.alumniId and skill.skillId=Cer.skillId
