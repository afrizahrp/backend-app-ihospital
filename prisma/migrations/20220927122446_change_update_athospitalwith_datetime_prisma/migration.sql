/*
  Warnings:

  - You are about to alter the column `updatedAt` on the `hosPatient` table. The data in that column could be lost. The data in that column will be cast from `DateTime2` to `DateTime`.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[hosPatient] ALTER COLUMN [updatedAt] DATETIME NOT NULL;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
