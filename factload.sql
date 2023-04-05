SELECT pk_department	
	  ,pk_education
	  ,pk_employeeinfo
	  ,pk_jobrole
	  ,pk_situation
      [netHourlyRate]
      ,[grossMonthlyRate]
      ,[percentSalaryHike]
	  
	  ,c.[distanceFromHome]
	  ,c.[numPreviousCompanies]
	  ,CONVERT(nvarchar(10),c.birthday,112) as birthdate
	  ,jobInvolvement
	  ,jobLevel
	  ,performanceRating
	  ,environmentSatisfaction
	  ,jobSatisfaction
	  ,relationshipSatisfaction
	  ,worklifeBalance
	  ,trainingTimesLY
	  ,totalWorkingYears
	  ,yearsAtCompany
	  ,yearsCurrentRole
	  ,yearsSinceLastPromotion
	  ,yearsCurrManager
	  ,CONVERT(nvarchar(10),recrutmentDate,112) as recrutmentDate
	  ,CONVERT(nvarchar(10),exitDate,112) as exitDate
  FROM [dbo].[Salary]  a
  left join [DW_HR].[dbo].DIM_EmployeeInfo b on  a.fullName = b.fullName
  left join [dbo].[Employee] c on b.id = c.id
  left join [DW_HR].[dbo].DIM_Department d on c.departmentID =d.id 
  left join [DW_HR].[dbo].DIM_education e on c.educationID =e.id 
  left join [DW_HR].[dbo].DIM_jobRole f on c.jobRoleID =f.id 
  left join [DW_HR].[dbo].DIM_Situation s on a.empID =  s.empID
  left join dbo.PerformanceSurvey ps on a.empID = ps.empID
  left join dbo.SatisfactionSurvey ss on ss.empID = a.empID
   left join dbo.SituationSurvey ssu on ssu.empID = a.empID

