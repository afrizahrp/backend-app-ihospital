/*
  Warnings:

  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `users` table. The data in that column could be lost. The data in that column will be cast from `Char(20)` to `TinyInt`.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[users] DROP CONSTRAINT [users_pkey];
ALTER TABLE [dbo].[users] ALTER COLUMN [id] TINYINT NOT NULL;
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
