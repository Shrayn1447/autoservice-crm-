import express from 'express'
import 'dotenv/config'
import { recordRouter } from "../src/routers/record-router"
const app = express();
const port = process.env.BASE_PORT

app.use('api/record', recordRouter)

app.listen(port, () => {
    console.log('Приложение запущино на ' + `http://localhost:${port}/`)
})