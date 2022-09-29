

INSERT INTO backendDb.dbo.syscompany
SELECT * FROM  backendDb_old.dbo.syscompany

INSERT INTO backendDb.dbo.sysBranch
SELECT *
FROM   backenddb_old.dbo.sysBranch



INSERT INTO backenddb.dbo.sysUserRole VALUES('ADMIN','ADMINISTRATOR',1,'Full assigned to operate all functions',
'SYSTEM',GETDATE(),'SYSTEM',GETDATE(),'NMS','KLM1-JKT05')


INSERT INTO backenddb.dbo.sysUserRole VALUES('USER','GUEST USER',0,'Restricted assigned to operate all functions',
'SYSTEM',GETDATE(),'SYSTEM',GETDATE(),'NMS','KLM1-JKT05')


INSERT INTO backenddb.dbo.sysUserRole VALUES('CLIENT','CLIENT USER',0,'Restricted assigned to operate all functions',
'SYSTEM',GETDATE(),'SYSTEM',GETDATE(),'NMS','KLM1-JKT05')



INSERT INTO backenddb.dbo.sysUserRole VALUES('MANAGER','MANAGE USER',0,'Restricted assigned to operate all functions',
'SYSTEM',GETDATE(),'SYSTEM',GETDATE(),'NMS','KLM1-JKT05')



  drop table #2

  select * from syscounter

  SELECT * INTO #2 FROM backendDb_old1.dbo.syscounter

  UPDATE #2 set counter_id = 'PTN',   
  startMonth = right(convert(varchar(3),MONTH(getdate())+100),2), 
  startYear = convert(varchar(4),YEAR(getdate())),
  recounter = 0, lastCounter = 0 , firstChar ='.'

  INSERT INTO SYSCOUNTER
  SELECT * FROM #2
    
  UPDATE #2 set counter_id = 'AMS', 
  startMonth = right(convert(varchar(3),MONTH(getdate())+100),2), 
  startYear = convert(varchar(4),YEAR(getdate())),
  recounter = 0, lastCounter = 0 , firstChar ='.'

  INSERT INTO SYSCOUNTER
  SELECT * FROM #2



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
