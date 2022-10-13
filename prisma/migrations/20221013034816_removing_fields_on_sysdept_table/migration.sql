/*
  Warnings:

  - You are about to drop the column `Divs_id` on the `sysDept` table. All the data in the column will be lost.
  - You are about to drop the column `branch_id` on the `sysDept` table. All the data in the column will be lost.
  - You are about to drop the column `company_id` on the `sysDept` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `sysDept` table. All the data in the column will be lost.
  - You are about to drop the column `createdBy` on the `sysDept` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `sysDept` table. All the data in the column will be lost.
  - You are about to drop the column `updatedBy` on the `sysDept` table. All the data in the column will be lost.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[sysDept] DROP COLUMN [Divs_id],
[branch_id],
[company_id],
[createdAt],
[createdBy],
[updatedAt],
[updatedBy];

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
