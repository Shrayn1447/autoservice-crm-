/*
  Warnings:

  - You are about to drop the column `brand` on the `Auto` table. All the data in the column will be lost.
  - You are about to drop the column `position` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `Order` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[vin]` on the table `Auto` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[phone]` on the table `Client` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `Client` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `brandId` to the `Auto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `positionId` to the `Employee` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Auto" DROP COLUMN "brand",
ADD COLUMN     "brandId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Employee" DROP COLUMN "position",
ADD COLUMN     "positionId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "status";

-- CreateTable
CREATE TABLE "Brand" (
    "id" SERIAL NOT NULL,
    "brandName" TEXT NOT NULL,

    CONSTRAINT "Brand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderStatus" (
    "orderId" INTEGER NOT NULL,
    "statusId" INTEGER NOT NULL,

    CONSTRAINT "OrderStatus_pkey" PRIMARY KEY ("orderId","statusId")
);

-- CreateTable
CREATE TABLE "Status" (
    "id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Position" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "Position_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Brand_brandName_key" ON "Brand"("brandName");

-- CreateIndex
CREATE UNIQUE INDEX "Status_status_key" ON "Status"("status");

-- CreateIndex
CREATE UNIQUE INDEX "Auto_vin_key" ON "Auto"("vin");

-- CreateIndex
CREATE UNIQUE INDEX "Client_phone_key" ON "Client"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Client_email_key" ON "Client"("email");

-- AddForeignKey
ALTER TABLE "Auto" ADD CONSTRAINT "Auto_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "Brand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderStatus" ADD CONSTRAINT "OrderStatus_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderStatus" ADD CONSTRAINT "OrderStatus_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES "Status"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_positionId_fkey" FOREIGN KEY ("positionId") REFERENCES "Position"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
