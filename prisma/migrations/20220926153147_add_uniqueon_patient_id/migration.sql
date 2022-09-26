/*
  Warnings:

  - A unique constraint covering the columns `[id]` on the table `hosPatient` will be added. If there are existing duplicate values, this will fail.

*/
BEGIN TRY

BEGIN TRAN;

-- CreateIndex
ALTER TABLE [dbo].[hosPatient] ADD CONSTRAINT [hosPatient_id_key] UNIQUE NONCLUSTERED ([id]);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
