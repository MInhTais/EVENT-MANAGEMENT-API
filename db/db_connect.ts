import { drizzle } from 'drizzle-orm/mysql2'
import mysql from 'mysql2/promise'
import * as schema from './schema'

const poolConnection = mysql.createPool({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'event_db'
})

const db = drizzle(poolConnection, { schema: schema, mode: 'default' })
export default db
