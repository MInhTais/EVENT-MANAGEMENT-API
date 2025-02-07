# EVENT-MANAGEMENT-API

## Mô tả dự án

Dự án sử dụng **Express.js** (viết bằng TypeScript) để xây dựng API. Dữ liệu được lưu trữ trong **MySQL**, và ORM **Drizzle** được sử dụng để thao tác cơ sở dữ liệu một cách hiệu quả. Bảo mật được đảm bảo thông qua **JWT** (JSON Web Token) và **bcryptjs** để mã hóa mật khẩu.

## Công nghệ sử dụng

- **Nodejs/Express.js (TypeScript)** - Framework backend nhanh chóng, mạnh mẽ
- **MySQL** - Hệ quản trị cơ sở dữ liệu quan hệ
- **Drizzle ORM** - ORM nhẹ nhàng, dễ dùng và hiệu quả
- **JWT (JSON Web Token)** - Cơ chế xác thực bằng token
- **bcryptjs** - Thư viện mã hóa mật khẩu an toàn

## Cấu trúc dự án

```
EVENT-MANAGEMENT-API/
│── db/
│── drizzle/
│── node_modules/
│── scripts/
│── src/
│   ├── controller/
│   ├── routes/
│   ├── service/
│   ├── utils/
│   │   ├── index.ts
│   │   ├── type.d.ts
│── .editorconfig
│── .env
│── .gitignore
│── .prettierignore
│── .prettierrc
│── drizzle.config.ts
│── eslint.config.mjs
│── nodemon.json
│── package-lock.json
│── package.json
│── tsconfig.json
```

## API Authentication

- **Đăng ký:** `POST /auth/register`
- **Đăng nhập:** `POST /auth/login`

## API RESTful

Xây dựng các API tuân theo chuẩn RESTful API để đảm bảo có thể dễ dàng tích hợp với bất kỳ công nghệ Frontend nào.

### 1. Sự kiện

- **GET /events**: Lấy danh sách sự kiện, có hỗ trợ truy vấn tìm kiếm (có thể chọn sử dụng query string hoặc truyền dữ liệu qua body).
- **GET /events/:id**: Lấy thông tin chi tiết của một sự kiện.
- **POST /events**: Thêm mới một sự kiện.
- **PUT /events/:id**: Cập nhật thông tin sự kiện.
- **DELETE /events/:id**: Xóa sự kiện.

### 2. Đăng ký tham gia

- **POST /events/:id/register**: Đăng ký tham gia một sự kiện.

## License

MIT
