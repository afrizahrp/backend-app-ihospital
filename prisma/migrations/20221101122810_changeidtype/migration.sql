/*
  Warnings:

  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[users] DROP CONSTRAINT [users_pkey];
ALTER TABLE [dbo].[users] ALTER COLUMN [id] CHAR(20) NOT NULL;
ALTER TABLE [dbo].[users] ADD CONSTRAINT users_pkey PRIMARY KEY CLUSTERED ([id]);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
