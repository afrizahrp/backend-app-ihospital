/*
  Warnings:

  - You are about to alter the column `patientCase` on the `hosAdmission` table. The data in that column could be lost. The data in that column will be cast from `VarChar(2550)` to `VarChar(250)`.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[hosAdmission] ALTER COLUMN [patientCase] VARCHAR(250) NOT NULL;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
