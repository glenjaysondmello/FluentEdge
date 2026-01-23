-- CreateEnum
CREATE TYPE "TestStatus" AS ENUM ('PROCESSING', 'COMPLETED', 'FAILED');

-- AlterTable
ALTER TABLE "SpeakingTest" ADD COLUMN     "status" "TestStatus" NOT NULL DEFAULT 'PROCESSING';
