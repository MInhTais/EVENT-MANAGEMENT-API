import db from 'db/db_connect'
import { users } from 'db/schema'
import { eq } from 'drizzle-orm'
import * as schema from '../../db/schema'

export const findByEmailService = async ({ email }: { email: string }) => {
  const result = await db.query.users.findFirst({
    where: eq(users.email, email)
  })
  return result
}

export const saveUserService = async ({
  email,
  fullName,
  password
}: {
  email: string
  fullName: string
  password: string
}) => {
  const result = await db
    .insert(schema.users)
    .values({
      email,
      fullName,
      password
    })
    .$returningId()
  return result
}

export const refreshTokenService = async ({ refreshToken, userEmail }: { refreshToken: string; userEmail: string }) => {
  await db.insert(schema.refreshTokens).values({ refreshToken, userEmail })
}
