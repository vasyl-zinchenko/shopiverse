/*
  Warnings:

  - Added the required column `rating` to the `Products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Products" ADD COLUMN     "rating" JSONB NOT NULL,
ALTER COLUMN "price" SET DATA TYPE DECIMAL(65,30);
