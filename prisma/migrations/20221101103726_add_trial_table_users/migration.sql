BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[users] (
    [id] TINYINT NOT NULL,
    [fullName] VARCHAR(60) NOT NULL,
    [company] VARCHAR(60) NOT NULL,
    [role] VARCHAR(20) NOT NULL,
    [username] VARCHAR(30) NOT NULL,
    [country] VARCHAR(20) NOT NULL,
    [contact] VARCHAR(20) NOT NULL,
    [email] VARCHAR(20) NOT NULL,
    [currentPlan] VARCHAR(20) NOT NULL,
    [status] VARCHAR(20) NOT NULL,
    [avatar] VARCHAR(60) NOT NULL,
    CONSTRAINT [users_pkey] PRIMARY KEY CLUSTERED ([id])
);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
