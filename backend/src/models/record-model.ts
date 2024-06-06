import {prisma} from './db'
// async function createRecord() {
//         const record = await prisma.record.create({
//             data: {
//                 description
//             }
//         })
// }

async function getAllRecord() {
    const record = await prisma.record.findMany()
    return record
}
export { getAllRecord }