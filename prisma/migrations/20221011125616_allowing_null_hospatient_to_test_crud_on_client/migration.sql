BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [isReferred] BIT NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [nickName] VARCHAR(30) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [birthDate] DATE NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [gender] CHAR(6) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [bloodType] VARCHAR(5) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [religion] VARCHAR(15) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [maritalStatus] CHAR(7) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [country_id] CHAR(3) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [prov_id] CHAR(2) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [provName] VARCHAR(50) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [subProv_id] CHAR(2) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [subProvName] VARCHAR(50) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [district_id] CHAR(2) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [districtName] VARCHAR(50) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [subdistrict_id] CHAR(2) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [address] VARCHAR(80) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [mobileNo1] VARCHAR(20) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [mobileNo2] VARCHAR(20) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [phoneNo] VARCHAR(15) NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [createdAt] DATETIME2 NULL;
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [updatedAt] DATETIME NULL;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
