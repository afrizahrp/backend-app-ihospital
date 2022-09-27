/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `hosPatient` will be added. If there are existing duplicate values, this will fail.

*/
BEGIN TRY

BEGIN TRAN;

-- CreateIndex
ALTER TABLE [dbo].[hosPatient] ADD CONSTRAINT [hosPatient_email_key] UNIQUE NONCLUSTERED ([email]);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH