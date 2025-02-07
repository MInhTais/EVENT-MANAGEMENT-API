import 'dotenv/config'
import bodyParser from 'body-parser'
import express from 'express'
import cors from 'cors';
import eventRoutes from './routes/event.route'
import authRoutes from './routes/authRoutes';

const app = express()


const corsOptions = {
  origin: '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'], 
};

app.use(cors(corsOptions));
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use('/events', eventRoutes)
app.use('/auth', authRoutes)

app.listen(process.env.PORT, () => {
  console.log('Server is running on port ' + process.env.PORT)
})
