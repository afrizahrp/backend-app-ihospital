/*
  Warnings:

  - The primary key for the `sysDept` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[sysDept] DROP CONSTRAINT [sysDept_pkey];
ALTER TABLE [dbo].[sysDept] ALTER COLUMN [id] CHAR(20) NOT NULL;
ALTER TABLE [dbo].[sysDept] ADD CONSTRAINT sysDept_pkey PRIMARY KEY CLUSTERED ([id]);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
