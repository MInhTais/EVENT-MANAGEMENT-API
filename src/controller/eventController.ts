/* eslint-disable prettier/prettier */
import e, { Request, RequestHandler, Response } from 'express'
import db from 'db/db_connect'
import { and, eq, like, sql } from 'drizzle-orm'
import { eventRegistrations, events } from 'db/schema'
import expressAsyncHandler from 'express-async-handler'

export const getAllEvents = async (req: Request, res: Response) => {
  const events = await db.query.events.findMany()

  res.json({
    data: events.length ? events : undefined,
    message: events.length ? 'Lấy tất cả sự kiện thành công' : 'Chưa có sự kiện'
  })
}

export const getEventById = async (req: Request, res: Response) => {
  const eventId = parseInt(req.params.id)
  const event = await db.query.events.findFirst({
    where: eq(events.id, eventId),
    with: {
      registrations: true
    }
  })

    res.json({
    data: event ? event : undefined,
    message: event ? 'Lấy chi tiết sự kiện thành công' : 'Không tìm thấy sự kiện'
  })
}

export const createEvent = async (req: Request, res: Response) => {
  const {
    content,
    createdByName,
    eventDate,
    location,
    maxParticipants,
    title,
    userEmail
  }: typeof events.$inferInsert = req.body

  const eventDateFormatted = new Date(eventDate)

  const newEvent = await db.insert(events).values({
    content,
    createdByName,
    eventDate: eventDateFormatted,
    location,
    maxParticipants,
    title,
    userEmail
  })

  res.json({
    data: newEvent,
    message: 'Tạo sự kiện thành công'
  })
}

export const deleteEventById = async (req: Request, res: Response) => {
  const { email, eventId } = req.query

  const event = await db.query.events.findFirst({
    where: eq(events.id, Number(eventId))
  })

  if (event?.userEmail === email) {
    await db.delete(events).where(eq(events.id, Number(eventId)))
    res.json({
      message: 'Xóa sự kiện thành công'
    })
  }
}

export const registerParticipation = async (req: Request, res: Response) => {
  const { email, eventId, fullName, gender, phoneNumber }: typeof eventRegistrations.$inferInsert = req.body

  try {
    await db.insert(eventRegistrations).values({ email, eventId, fullName, gender, phoneNumber })
    await db
      .update(events)
      .set({ currentParticipants: sql`${events.currentParticipants} + 1` })
      .where(eq(events.id, eventId))
    res.json({
      message: 'Đăng ký tham gia sự kiện thành công'
    })
  } catch (error) {
    res.status(500).json({ message: 'Đã có lỗi xảy ra khi đăng ký tham gia sự kiện' })
  }
}

export const searchEventName = async (req: Request, res: Response) => {
  const { title } = req.body as { title: string }
  console.log(req.body)
  const data = await db.query.events.findMany({
    where: like(events.title, `%${title}%`)
  })

  res.json({
    data: data.length ? data : [],
    message: data.length ? 'Tìm kiếm sự kiện thành công' : 'Không tìm thấy sự kiện'
  })
}

export const myEvents = async (req: Request, res: Response) => {
  const { email } = req.body as { email: string }

  const data = await db.query.events.findMany({
    where: eq(events.userEmail, email)
  })
  res.json({
    data: data.length ? data : [],
    message: data.length ? 'Lấy sự kiện của bạn thành công' : 'Không tìm thấy sự kiện của bạn'
  })
}

export type UpdateEventBody = Partial<typeof events.$inferInsert> & {
  email: string
  eventId: number
}

// eslint-disable-next-line @typescript-eslint/no-empty-object-type
export const updateStatusMyEvent: RequestHandler<{}, {}, UpdateEventBody> = expressAsyncHandler(
  async (req, res, next) => {
    try {
      const { email, eventId } = req.body

      const event = await db.query.events.findFirst({
        where: eq(events.id, eventId)
      })

      if (!event) {
        res.status(404).json({ message: 'Sự kiện không tồn tại' })
        return
      }

      if (event.userEmail !== email) {
        res.status(403).json({ message: 'Bạn không có quyền cập nhật sự kiện này' })
        return
      }

      const newStatus = event.status === 'active' ? 'canceled' : 'active'

      await db.update(events).set({ status: newStatus }).where(eq(events.id, eventId))

      res.json({
        message: `Sự kiện đã được cập nhật thành trạng thái ${newStatus === 'canceled' ? 'Đã hủy' : 'Đang hoạt động'}`
      })
    } catch (error) {
      next(error)
    }
  }
)

export const updateEvent = async (req: Request, res: Response) => {
  try {
    const data = req.body as UpdateEventBody

    console.log(typeof data.eventDate)
    if (!data.eventDate) {
      throw new Error('eventDate is required')
    }

    const eventDate = new Date(data.eventDate)

    if (isNaN(eventDate.getTime())) {
      throw new Error('Ngày không hợp lệ')
    }

    await db
      .update(events)
      .set({
        ...data,
        eventDate
      })
      .where(eq(events.id, data.eventId))

    res.json({
      message: 'Cập nhật sự kiện thành công'
    })
  } catch (error) {
    console.log(error)
    res.status(400).json({
      data: error instanceof Error ? error.message : error,
      message: 'Cập nhật thất bại, dữ liệu không hợp lệ'
    })
  }
}

export const myRegistration = async (req: Request, res: Response) => {
  const { email } = req.body as { email: string }

  const data = await db.query.eventRegistrations.findMany({
    where: eq(eventRegistrations.email, email),
    with: {
      event: true
    }
  })
  res.json({
    data: data.length ? data : [],
    message: data.length ? 'Lấy sự kiện của bạn đăng kí thành công' : 'Không tìm thấy sự kiện đăng kí của bạn'
  })
}

export const checkJoin =  async(req: Request, res: Response) =>{

  const {email, eventId} = req.body as {email: string, eventId: number}
  const registration = await db.query.eventRegistrations.findFirst({
    where:(
      and(
        eq(eventRegistrations.email,email),
        eq(eventRegistrations.eventId, eventId)
      )
    ),
  })

  res.json({
    data: registration ? registration : undefined,
    message: 'Lấy thông tin thành công'
  })

}