import { mysqlTable, int, varchar, text, mysqlEnum, timestamp, boolean } from 'drizzle-orm/mysql-core'
import { relations } from 'drizzle-orm'

export const users = mysqlTable('users', {
  email: varchar('email', { length: 255 }).primaryKey().notNull(),
  password: varchar('password', { length: 255 }).notNull(),
  fullName: varchar('full_name', { length: 255 }).notNull(),
  isActive: boolean('is_active').default(true),
  createdAt: timestamp('created_at').defaultNow().notNull(),
  updatedAt: timestamp('updated_at').defaultNow().notNull()
})

export const refreshTokens = mysqlTable('refresh_tokens', {
  id: int('id').autoincrement().primaryKey(),
  userEmail: varchar('user_email', { length: 255 }).notNull(),
  refreshToken: varchar('refresh_token', { length: 255 }).notNull()
})

export const events = mysqlTable('events', {
  id: int('id').autoincrement().primaryKey(),
  title: varchar('title', { length: 255 }).notNull(),
  content: text('content').notNull(),
  eventDate: timestamp('event_date').notNull(),
  location: varchar('location', { length: 255 }).notNull(),
  currentParticipants: int('current_participants').default(0),
  maxParticipants: int('max_participants').notNull(),
  status: mysqlEnum('status', ['active', 'canceled']).default('active').notNull(),
  createdByName: varchar('created_by_name', { length: 255 }).notNull(),
  userEmail: varchar('user_email', { length: 255 }).notNull()
})

export const eventRegistrations = mysqlTable('event_registrations', {
  id: int('id').autoincrement().primaryKey(),
  eventId: int('event_id')
    .notNull()
    .references(() => events.id, { onDelete: 'cascade' }),
  fullName: varchar('full_name', { length: 255 }).notNull(),
  gender: mysqlEnum('gender', ['male', 'female', 'other']).notNull(),
  email: varchar('email', { length: 255 }).notNull(),
  phoneNumber: varchar('phone_number', { length: 20 }).notNull(),
  registeredAt: timestamp('registered_at').defaultNow().notNull()
})

export const usersRelations = relations(users, ({ many }) => ({
  refreshTokens: many(refreshTokens),
  events: many(events)
}))

export const refreshTokensRelations = relations(refreshTokens, ({ one }) => ({
  user: one(users, {
    fields: [refreshTokens.userEmail],
    references: [users.email]
  })
}))

export const eventsRelations = relations(events, ({ one, many }) => ({
  registrations: many(eventRegistrations),
  user: one(users, {
    fields: [events.userEmail],
    references: [users.email]
  })
}))

export const eventRegistrationsRelations = relations(eventRegistrations, ({ one }) => ({
  event: one(events, {
    fields: [eventRegistrations.eventId],
    references: [events.id]
  })
}))
