USE [backendDb]
GO
/****** Object:  StoredProcedure [dbo].[get_document_id]    Script Date: 07/09/2022 00.20.02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*


DECLARE @RC int
DECLARE @rt_company_Id char(3)
DECLARE @rt_branch_Id char(3)
DECLARE @rt_prefix char(2)
DECLARE @rt_doc_date datetime
DECLARE @rt_doc_id char(20)
DECLARE @rt_module_Id char(2)

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[[get_document_id]] 
   'NMS'
  ,'100'
  ,'HOS'
  ,'REG'
  ,@rt_doc_id OUTPUT

SELECT * FROM SYS_BRANCH

*/


/****************************************************************/
/* Procedure Name		: [get_document_id]	*/
/*  Modified By 		: Afriza									*/
/* Date					: 11 September 2022								*/
/****************************************************************/
CREATE	PROCEDURE [dbo].[get_document_id]
	@rt_company_Id		VARchar(5),
	@rt_branch_Id		VARchar(10),
	@rt_module_Id 		VARchar(3),
	@rt_prefix			VARchar(3),
	--@rt_doc_date		Datetime,
	@rt_user_Id			Char(20),
	@rt_doc_id			Varchar(20) OUTPUT


AS

DECLARE @f_prefix			VARchar (3)
DECLARE @f_upd_no			Integer
--DECLARE @f_lastcounter		Integer
DECLARE @f_year				VARchar (4)
DECLARE @f_month			VARchar (2)
DECLARE @f_today			datetime
DECLARE @f_refreshAt		VARchar (1)
DECLARE @f_startmonth		tinyint
DECLARE @f_startyear		smallint
--DECLARE @f_startcount		Integer
DECLARE @f_digit			Integer
DECLARE @f_temp1			Integer
DECLARE @f_temp2			Integer
DECLARE @l_flag				VARchar (1)
DECLARE @f_description		varchar (40)
DECLARE @f_pattern		varchar (30)
DECLARE @f_format_new		varchar (30)
--DECLARE @f_combiner			varchar(20)
DECLARE @f_firstChar		VARchar (2)
DECLARE @f_secondChar		VARchar (2)
DECLARE @f_autoGenerate			Bit
DECLARE @f_createdBy		varchar (10)
declare @f_createdAt		datetime
Declare @f_format1			Varchar (4)
Declare @f_format2			Varchar (4)
Declare @f_format3			Varchar (4)
Declare @f_format4			Varchar (4)
Declare @f_format5			Varchar (4)
DECLARE @f_finalformat		Varchar (30)
DECLARE @f_doc_id			Varchar(20)

SET NOCOUNT ON

BEGIN TRANSACTION


SELECT @l_flag			= 'Y'

SELECT @f_prefix		= Ltrim(Rtrim(@rt_prefix))


--PRINT @f_prefix



SELECT @f_createdBy	= suser_sname()
SELECT @f_createdAt	= getdate()
SELECT @f_today			=  getdate()--@rt_doc_date
SELECT @f_year			= convert(varchar(4),YEAR(@f_today))
SELECT @f_month			= right(convert(varchar(3),MONTH(@f_today)+100),2)

SELECT @f_doc_id = ''

SELECT	@f_upd_no			= recounter, 
		@f_digit 			= digits,
		@f_refreshAt		= refreshAt,
		@f_startmonth 		= 9  , --Cast(startMonth as tinyint),
		@f_startyear		= 2022 ,  --Cast(startYear as smallint),
		@f_description		= description,
		@f_pattern		= pattern,
		@f_firstChar		= firstChar,
		@f_secondChar		= secondChar,
		@f_autoGenerate			= autoGenerate
FROM  dbo.sysCounter 
WHERE company_id 		= @rt_company_Id 
AND   counter_Id 		= @f_prefix
--AND		branch_Id = @rt_branch_Id

IF @@ROWCOUNT <> 0
BEGIN 
IF @f_firstChar IS NULL
	SELECT @f_firstChar = ''
IF @f_secondChar IS NULL
	SELECT @f_secondChar = ''


SELECT @f_format_new = REPLACE(@f_pattern, '-', '')


IF LEN(@f_format_new) >= 12
BEGIN

	SELECT	@f_format1 = SUBSTRING(@f_pattern, 0, CHARINDEX('-', @f_pattern)),
			@f_format2 = SUBSTRING(@f_pattern, 6, CHARINDEX('-', @f_pattern) - 1) ,
			@f_format3 = SUBSTRING(@f_pattern, 11, CHARINDEX('-', @f_pattern) - 1),
			@f_format4 = SUBSTRING(@f_pattern, 16, CHARINDEX('-', @f_pattern) - 1) ,
			@f_format5 = SUBSTRING(@f_pattern, 21, CHARINDEX('-', @f_pattern) - 1) 
END

IF LEN(@f_format_new) = 8
BEGIN

	SELECT	@f_format1 = SUBSTRING(@f_pattern, 0, CHARINDEX('-', @f_pattern)),
			@f_format2 = SUBSTRING(@f_pattern, 6, CHARINDEX('-', @f_pattern) - 1)
END


IF LEN(@f_format_new) = 4
BEGIN

	SELECT	@f_format1 = LEFT(@f_pattern, 4)
END

--IF @f_format1 = 
--SELECT @f_format1 = @f_prefix

	IF @f_upd_no 		IS NULL  SELECT @f_upd_no = 1
	--IF @f_lastcounter   IS NULL  SELECT @f_lastcounter = 0
	--IF @f_startcount 	IS NULL  SELECT @f_startcount = 1
	IF @f_digit 		IS NULL  SELECT @f_digit = 5

	-- Annual Counter
	-- Document No Will Be Restarting Annualy
	IF @f_refreshAt = 'A'
	BEGIN
		IF EXISTS (SELECT 1
		FROM  dbo.sysCounter 
		WHERE company_id 		= @rt_company_Id
		AND		branch_Id = @rt_branch_Id
		AND   counter_Id 		= @f_prefix
		AND   startYear		= @f_year)
		BEGIN
			SELECT @f_upd_no	= recounter
			FROM  dbo.sysCounter 
			WHERE company_id 		= @rt_company_Id
			--AND		branch_Id = @rt_branch_Id
			AND   counter_Id 		= @f_prefix
			AND   startYear		= @f_year
			IF @@ERROR <> 0 OR @@ROWCOUNT = 0
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Could Not Read Yearly Last Document No.',16,-1)
				RETURN
			END


			UPDATE dbo.sysCounter
			SET	recounter		= @f_upd_no + 1,
			lastCounter = @f_upd_no
			WHERE company_id		= @rt_company_Id			
		--	AND		branch_Id = @rt_branch_Id
			AND   counter_Id	= @f_prefix 
			AND   startYear		= @f_year
			IF @@ERROR <> 0 
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Could Not Update Yearly Document Control Master File',16,-1)
				RETURN
			END
		END
		ELSE
		BEGIN
			SELECT @f_upd_no	= 0
			INSERT INTO dbo.sysCounter 
				(
				company_id,					branch_Id,
				module_id, 					counter_Id,
				recounter,					digits,						
				refreshAt,					startMonth,					
				startYear,					description,				
				pattern,					firstChar,
				secondChar,					autoGenerate,
				createdBy,					createdAt
				)
			VALUES 
				(
				@rt_company_Id, 				@rt_branch_Id,
				@rt_module_Id,					@f_prefix,
				1,							@f_digit,					
				@f_refreshAt,				@f_month,					
				@f_year,					@f_description,				
				@f_pattern,				@f_firstChar,
				@f_secondChar,				@f_autoGenerate,
				@f_createdBy,				@f_createdAt
				) 
			IF @@ERROR <> 0 
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Could Not Insert Yearly Document Control Master File',16,-1)
				RETURN
			END
		END
	END

	-- Monthly Counter
	-- Document No Will Be Restarting Monthly
	IF @f_refreshAt = 'M'
	BEGIN
		IF EXISTS (SELECT 1
		FROM  dbo.sysCounter 
		WHERE company_id 		= @rt_company_Id
		AND		branch_Id = @rt_branch_Id
		AND   counter_Id 		= @f_prefix
		--AND   startMonth		= @f_month
		--AND   startYear			= @f_year
		)
		BEGIN
			SELECT @f_upd_no	= recounter
			FROM  dbo.sysCounter 
			WHERE company_id 		= @rt_company_Id
			AND   counter_Id 		= @f_prefix
			--AND   startMonth		= @f_month
			--AND   startYear			= @f_year
			IF @@ERROR <> 0 --OR @@ROWCOUNT = 0
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Could Not Read Monthly Last Document No.',16,-1)
				RETURN
			END
			UPDATE dbo.sysCounter
			SET	recounter		= @f_upd_no + 1,
			lastCounter = @f_upd_no
			WHERE company_id	= @rt_company_Id			
			AND		branch_Id = @rt_branch_Id
			AND   counter_Id	= @f_prefix 
			--AND   startMonth	= @f_month
			--AND   startYear	= @f_year
			IF @@ERROR <> 0 
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Could Not Update Monthly Document Control Master File',16,-1)
				RETURN
			END
		END
		ELSE
		BEGIN
			SELECT @f_upd_no	= 0
			--print 'f prefix : ' + @f_prefix
			INSERT INTO dbo.sysCounter 
				(
				company_id,					branch_Id,
				module_id, 					counter_Id,
				recounter,					digits,						
				refreshAt,					startMonth,					
				startYear,					description,				
				pattern,					firstChar,
				secondChar,				autoGenerate,
				createdBy,					createdAt
				)
			VALUES 
				(
				@rt_company_Id, 			@rt_branch_Id,
				@rt_module_Id,				@f_prefix,
				1,							@f_digit,					
				@f_refreshAt,				@f_month,					
				@f_year,					@f_description,				
				@f_pattern,					@f_firstChar,
				@f_secondChar,				@f_autoGenerate,
				@f_createdBy,				@f_createdAt
				) 
			IF @@ERROR <> 0 
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR('Could Not Insert Monthly Document Control Master File',16,-1)
				RETURN
			END
		END
	END

	-- Annual Counter
	-- Document No Will Not Be Restarting
	IF @f_refreshAt = 'N'
	BEGIN
		UPDATE dbo.sysCounter
		SET	recounter		= @f_upd_no + 1,
			lastCounter = @f_upd_no
		WHERE company_id		= @rt_company_Id		
		AND		branch_Id = @rt_branch_Id
		AND   counter_Id	= @f_prefix 
		IF @@ERROR <> 0 
		BEGIN
			ROLLBACK TRANSACTION
			RAISERROR('Could Not Update None Document Control Master File',16,-1)
			RETURN
		END
	END

	SELECT @f_temp1 = convert(Integer,'1' + replicate(0,@f_digit))+
					@f_upd_no + 1

	IF @f_format1 = 'CHR1'
	BEGIN
		SELECT @f_finalformat = @f_prefix
	END

	IF @f_format1 = 'YEAR'
	BEGIN
		SELECT @f_finalformat = @f_year
	END

	IF @f_format1 = 'MNTH'
	BEGIN
		SELECT @f_finalformat = @f_month
	END

	IF @f_format1 = 'NUMB'
	BEGIN
		SELECT @f_finalformat = convert(Integer,'1' + replicate(0,(@f_digit-1)))+ @f_upd_no + 1 -- convert(varchar(12),Right(@f_temp1,@f_digit))
	END

	IF @f_format2 = 'YEAR'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + @f_year
	END

	IF @f_format2 = 'YYYY'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + RIGHT(@f_year,2)
	END

	IF @f_format2 = 'MNTH'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + @f_month
	END

	IF @f_format2 = 'NUMB'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + convert(varchar(12),Right(@f_temp1,@f_digit))
	END

	IF @f_format3 = 'YEAR'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + @f_year
	END
	
	IF @f_format3 = 'YYYY'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + RIGHT(@f_year,2)
	END

	IF @f_format3 = 'MNTH'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + @f_month
	END

	IF @f_format3 = 'NUMB'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + convert(varchar(12),Right(@f_temp1,@f_digit))
	END

	IF @f_format4 = 'YEAR'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + @f_startyear
	END
	IF @f_format4 = 'YYYY'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + RIGHT(@f_startyear,2)
	END

	IF @f_format4 = 'MNTH'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + @f_startmonth
	END

	IF @f_format4 = 'NUMB'
	BEGIN
		SELECT @f_finalformat = @f_finalformat + @f_firstChar + convert(varchar(12),Right(@f_temp1,@f_digit))
	END

	SELECT @f_finalformat = REPLACE(@f_finalformat, ' ', '')
	SELECT @f_finalformat = REPLACE(@f_finalformat, '///', '/')
	SELECT @f_finalformat = REPLACE(@f_finalformat, '//', '/')

	IF RIGHT(LTRIM(RTRIM(@f_finalformat)),1) = '/'
	BEGIN
		SELECT @f_finalformat = LEFT(@f_finalformat, LEN(@f_finalformat) - 1)
	END

	SELECT @rt_doc_id = @f_finalformat
	--SELECT @f_doc_id = @rt_doc_id

	--DELETE log_document_id
	INSERT INTO sysDocId(doc_id,module_id,prefix_id,company_id,branch_id,createdBy,createdAt)
	VALUES (@rt_doc_id,@rt_module_Id,@rt_prefix,@rt_company_Id,@rt_branch_Id,@rt_user_Id,GETDATE())


	SELECT MAX(doc_id)as doc_id FROM sysDocId WHERE createdBy = @rt_user_Id


END
ELSE
BEGIN
	--SELECT @rt_doc_id = ''
	ROLLBACK TRANSACTION
	RAISERROR('Could Not Read Document Control Master File-ZZ',16,-1)
	RETURN
END

COMMIT TRANSACTION
RETURN
/* End Of Procedure */
