/*
  Warnings:

  - You are about to drop the column `rating` on the `Products` table. All the data in the column will be lost.
  - Added the required column `rating_count` to the `Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rating_rate` to the `Products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Products" DROP COLUMN "rating",
ADD COLUMN     "rating_count" DECIMAL(65,30) NOT NULL,
ADD COLUMN     "rating_rate" DECIMAL(65,30) NOT NULL;
