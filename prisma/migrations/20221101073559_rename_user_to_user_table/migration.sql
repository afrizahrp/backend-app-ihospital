/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
BEGIN TRY

BEGIN TRAN;

-- DropTable
DROP TABLE [dbo].[User];

-- CreateTable
CREATE TABLE [dbo].[users] (
    [id] CHAR(20) NOT NULL,
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
    [createdBy] CHAR(10) NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [users_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedBy] CHAR(10) NOT NULL,
    [updatedAt] DATETIME2 NOT NULL CONSTRAINT [users_updatedAt_df] DEFAULT CURRENT_TIMESTAMP,
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
