
USE backendDb
GO

INSERT INTO backendDb.dbo.sysCompany
SELECT * FROM  backendDb_old.dbo.syscompany
GO

INSERT INTO backendDb.dbo.sysBranch
SELECT * FROM backendDb_old.dbo.sysbranch 
GO

INSERT INTO backendDb.dbo.sysUserRole VALUES('ADMIN','ADMINISTRATOR',1,'Full assigned to operate all functions',
'SYSTEM',GETDATE(),'SYSTEM',GETDATE(),'NMS','KLM1-JKT05')
GO

INSERT INTO backendDb.dbo.sysUserRole VALUES('USER','GUEST USER',0,'Restricted assigned to operate all functions',
'SYSTEM',GETDATE(),'SYSTEM',GETDATE(),'NMS','KLM1-JKT05')
GO


INSERT INTO backendDb.dbo.sysUserRole VALUES('CLIENT','CLIENT USER',0,'Restricted assigned to operate all functions',
'SYSTEM',GETDATE(),'SYSTEM',GETDATE(),'NMS','KLM1-JKT05')

INSERT INTO backendDb.dbo.sysCounter
SELECT [module_id]
      ,[counter_id]
      ,0
      ,[description]
      ,[pattern]
      ,ISNULL([combiner],'-')
      ,[refreshAt]
      ,[firstChar]
      ,[secondChar]
      ,[digits]
      ,[startyear]
      ,9
      ,[startcount]
      ,0
      ,[autoGenerate]
      ,ISNULL([createdBy],'')
      ,GETDATE()
      ,ISNULL([updatedBy],'')
      ,GETDATE()
      ,[company_id]
      ,[branch_id]
  FROM backendDb_old.[dbo].[syscounter]
  GO


  


/*
select con.[name] as constraint_name,
    schema_name(t.schema_id) + '.' + t.[name]  as [table],
    col.[name] as column_name,
    con.[definition]
from sys.default_constraints con
    left outer join sys.objects t
        on con.parent_object_id = t.object_id
    left outer join sys.all_columns col
        on con.parent_column_id = col.column_id
        and con.parent_object_id = col.object_id
order by [table]
*/
