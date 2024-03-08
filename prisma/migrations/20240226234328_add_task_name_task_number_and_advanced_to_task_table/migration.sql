/*
  Warnings:

  - Added the required column `taskName` to the `Task` table without a default value. This is not possible if the table is not empty.
  - Added the required column `taskNumber` to the `Task` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Task" ADD COLUMN     "advanced" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "taskName" TEXT NOT NULL,
ADD COLUMN     "taskNumber" INTEGER NOT NULL;
