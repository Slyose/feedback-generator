-- CreateEnum
CREATE TYPE "Importance" AS ENUM ('must', 'should', 'could');

-- CreateTable
CREATE TABLE "SprintCategory" (
    "id" TEXT NOT NULL,
    "categoryName" TEXT NOT NULL,

    CONSTRAINT "SprintCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sprint" (
    "id" TEXT NOT NULL,
    "sprintName" TEXT NOT NULL,
    "categoryID" TEXT NOT NULL,

    CONSTRAINT "Sprint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Task" (
    "id" TEXT NOT NULL,
    "sprintID" TEXT NOT NULL,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Aspect" (
    "id" TEXT NOT NULL,
    "taskID" TEXT NOT NULL,
    "description" VARCHAR(200) NOT NULL,
    "importance" "Importance" NOT NULL,

    CONSTRAINT "Aspect_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Feedback" (
    "id" TEXT NOT NULL,
    "userID" VARCHAR(128) NOT NULL,
    "aspectID" VARCHAR(128) NOT NULL,
    "whatWentWell" TEXT NOT NULL,
    "evenBetterIf" TEXT NOT NULL,
    "public" BOOLEAN NOT NULL,

    CONSTRAINT "Feedback_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Sprint" ADD CONSTRAINT "Sprint_categoryID_fkey" FOREIGN KEY ("categoryID") REFERENCES "SprintCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_sprintID_fkey" FOREIGN KEY ("sprintID") REFERENCES "Sprint"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Aspect" ADD CONSTRAINT "Aspect_taskID_fkey" FOREIGN KEY ("taskID") REFERENCES "Task"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_aspectID_fkey" FOREIGN KEY ("aspectID") REFERENCES "Aspect"("id") ON DELETE CASCADE ON UPDATE CASCADE;
