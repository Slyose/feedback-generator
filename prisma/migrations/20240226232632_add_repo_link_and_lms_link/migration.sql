/*
  Warnings:

  - Added the required column `lmsLink` to the `Sprint` table without a default value. This is not possible if the table is not empty.
  - Added the required column `repoLink` to the `Sprint` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Sprint" ADD COLUMN     "lmsLink" TEXT NOT NULL,
ADD COLUMN     "repoLink" TEXT NOT NULL;
