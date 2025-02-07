import db from '../db/db_connect'
import * as schema from '../db/schema'

const main = async () => {
  try {
    console.log('Delete table in database')
    await db.delete(schema.users)
    await db.delete(schema.events)
    await db.delete(schema.eventRegistrations)

    console.log('Sending database')

    await db.insert(schema.users).values([
      {
        email: 'minhtai2019cb2@gmail.com',
        fullName: 'Nguyễn Minh Tai',
        password: '$2a$10$2vJdG7.fMmFVGTCbQrXI.eolGUPxn6s/ffP6c8J8rlvTSCBHZOo4K',
        isActive: true,
        createdAt: new Date()
      },
      {
        email: 'minhanh@gmail.com',
        fullName: 'Nguyễn Minh Anh',
        password: '$2a$10$2vJdG7.fMmFVGTCbQrXI.eolGUPxn6s/ffP6c8J8rlvTSCBHZOo4K',
        isActive: true,
        createdAt: new Date()
      }
    ])

    await db.insert(schema.events).values([
      {
        id: 1,
        title: 'Hội thảo Công nghệ AI 2025',
        content: 'Sự kiện quy tụ các chuyên gia AI hàng đầu, chia sẻ về xu hướng và ứng dụng thực tế.',
        eventDate: new Date('2025-03-15T09:00:00'),
        location: 'Trung tâm Hội nghị Quốc gia, Hà Nội',
        currentParticipants: 1,
        maxParticipants: 300,
        status: 'canceled',
        createdByName: 'Nguyễn Minh Tại',
        userEmail: 'minhtai2019cb2@gmail.com'
      },
      {
        id: 2,
        title: 'Chạy bộ vì sức khỏe 2025',
        content: 'Giải chạy thường niên nhằm nâng cao nhận thức về sức khỏe và kết nối cộng đồng.',
        eventDate: new Date('2025-04-10T06:30:00'),
        location: 'Công viên Thống Nhất, Hà Nội',
        currentParticipants: 1,
        maxParticipants: 1000,
        status: 'active',
        createdByName: 'Nguyễn Minh Tại',
        userEmail: 'minhtai2019cb2@gmail.com'
      },
      {
        id: 3,
        title: 'Triển lãm công nghệ Blockchain',
        content: 'Sự kiện giới thiệu các ứng dụng mới nhất của Blockchain trong tài chính và kinh doanh.',
        eventDate: new Date('2025-05-20T10:00:00'),
        location: 'Trung tâm Hội nghị GEM, TP. HCM',
        currentParticipants: 1,
        maxParticipants: 200,
        status: 'active',
        createdByName: 'Nguyễn Minh Tại',
        userEmail: 'minhtai2019cb2@gmail.com'
      },
      {
        id: 4,
        title: 'Khóa học Lập trình Web miễn phí',
        content: 'Chuỗi bài giảng dành cho người mới bắt đầu, hướng dẫn từ HTML, CSS đến JavaScript.',
        eventDate: new Date('2025-06-05T14:00:00'),
        location: 'Học viện Công nghệ BKACAD, Hà Nội',
        currentParticipants: 1,
        maxParticipants: 150,
        status: 'active',
        createdByName: 'Nguyễn Minh Tại',
        userEmail: 'minhtai2019cb2@gmail.com'
      },
      {
        id: 5,
        title: 'Hội chợ ẩm thực Việt Nam 2025',
        content: 'Cơ hội khám phá và thưởng thức những món ăn đặc sắc từ khắp mọi miền đất nước.',
        eventDate: new Date('2025-07-15T18:00:00'),
        location: 'Phố đi bộ Nguyễn Huệ, TP. HCM',
        currentParticipants: 1,
        maxParticipants: 500,
        status: 'active',
        createdByName: 'Nguyễn Minh Tại',
        userEmail: 'minhtai2019cb2@gmail.com'
      },
      {
        id: 6,
        title: 'Gala ca nhạc gây quỹ từ thiện',
        content: 'Đêm nhạc quy tụ nhiều nghệ sĩ nổi tiếng, gây quỹ giúp đỡ trẻ em nghèo vượt khó.',
        eventDate: new Date('2025-08-22T19:30:00'),
        location: 'Nhà hát Lớn Hà Nội',
        currentParticipants: 1,
        maxParticipants: 400,
        status: 'canceled',
        createdByName: 'Nguyễn Minh Anh',
        userEmail: 'minhanh@gmail.com'
      }
    ])

    await db.insert(schema.eventRegistrations).values([
      {
        id: 1,
        eventId: 1, // Liên kết với sự kiện "Hội thảo Công nghệ AI 2025"
        fullName: 'Nguyễn Văn A',
        gender: 'male',
        email: 'nguyenvana@example.com',
        phoneNumber: '0912345678',
        registeredAt: new Date('2025-02-10T08:00:00')
      },
      {
        id: 2,
        eventId: 2, // Liên kết với sự kiện "Chạy bộ vì sức khỏe 2025"
        fullName: 'Trần Thị B',
        gender: 'female',
        email: 'tranthib@example.com',
        phoneNumber: '0923456789',
        registeredAt: new Date('2025-02-12T09:15:00')
      },
      {
        id: 3,
        eventId: 3, // Liên kết với sự kiện "Triển lãm công nghệ Blockchain"
        fullName: 'Lê Văn C',
        gender: 'male',
        email: 'levanc@example.com',
        phoneNumber: '0934567890',
        registeredAt: new Date('2025-02-15T10:30:00')
      },
      {
        id: 4,
        eventId: 4, // Liên kết với sự kiện "Khóa học Lập trình Web miễn phí"
        fullName: 'Phạm Thị D',
        gender: 'female',
        email: 'phamthid@example.com',
        phoneNumber: '0945678901',
        registeredAt: new Date('2025-02-18T14:45:00')
      },
      {
        id: 5,
        eventId: 5, // Liên kết với sự kiện "Hội chợ ẩm thực Việt Nam 2025"
        fullName: 'Ngô Minh E',
        gender: 'male',
        email: 'gnominhe@example.com',
        phoneNumber: '0956789012',
        registeredAt: new Date('2025-02-20T16:00:00')
      },
      {
        id: 6,
        eventId: 6, // Liên kết với sự kiện "Gala ca nhạc gây quỹ từ thiện"
        fullName: 'Đặng Hoàng F',
        gender: 'other',
        email: 'danghoangf@example.com',
        phoneNumber: '0967890123',
        registeredAt: new Date('2025-02-22T19:10:00')
      }
    ])

    console.log('Sedding finished')
  } catch (error) {
    console.log(error)
    throw new Error('Failed to send database')
  }
}

main()
