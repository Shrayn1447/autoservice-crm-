import { Request, Response } from "express"
import { getAllRecord } from "../models/record-model"
async function getAllRecords(req:Request, res:Response) {
    const result = await getAllRecord()
    res.send({dfa : 'Ghbdtn '})
}

async function createRecords(req:Request, res:Response) {

}

async function updateRecords(req:Request, res:Response) {

}

async function deleteRecords(req:Request, res:Response) {

}

export default { getAllRecords, createRecords, updateRecords, deleteRecords }