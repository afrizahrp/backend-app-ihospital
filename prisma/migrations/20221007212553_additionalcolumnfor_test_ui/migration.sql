BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[sysUser] ADD [avatar] VARCHAR(50),
[avatarColor] VARCHAR(50),
[contact] VARCHAR(50),
[country] VARCHAR(50),
[currentPlan] VARCHAR(50),
[fullName] VARCHAR(50),
[nickName] VARCHAR(50),
[status] VARCHAR(20),
[username] VARCHAR(50);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
