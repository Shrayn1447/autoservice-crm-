import { Router } from "express";
import  controler from '../controllers/record-controller'
export const recordRouter = Router()

recordRouter.get('/', controler.getAllRecords)
recordRouter.post('/',  controler.createRecords)
recordRouter.put('/:id',  controler.updateRecords)
recordRouter.delete('/:id', controler.deleteRecords)
