import { Request, Response } from 'express'
import bcrypt from 'bcryptjs'

import { generateAccessToken, generateRefreshToken } from '~/utils/jwt'
import { findByEmailService, refreshTokenService, saveUserService } from '~/service/auth.service'

export const loginController = async (req: Request, res: Response) => {
  const { email, password }: { email: string; password: string } = req.body
  console.log(email, password)
  const userPromies = await findByEmailService({ email })
  console.log(userPromies)
  const [userWithPassword] = await Promise.all([userPromies])
  console.log(userWithPassword)

  if (userWithPassword && bcrypt.compareSync(password, userWithPassword.password as string)) {
    const access_token = generateAccessToken({
      email: userWithPassword.email,
      name: userWithPassword.fullName
    })
    const refresh_token = generateRefreshToken({ email: userWithPassword.email, name: userWithPassword.fullName })
    await refreshTokenService({ userEmail: userWithPassword.email, refreshToken: refresh_token })
    const user: Omit<typeof userWithPassword, 'password'> = (({ password, ...rest }) => rest)(userWithPassword)
    res.json({ data: { access_token, refresh_token, user }, message: 'Đăng nhập thành công', status: 200 })
  } else {
    res.status(422).json({
      message: 'Lỗi',
      data: {
        password: 'Email hoặc mật khẩu không đúng'
      }
    })
  }
}

export const registerController = async (req: Request, res: Response) => {
  const { email, fullName, password } = req.body as { email: string; fullName: string; password: string }

  const findUserByEmail = await findByEmailService({ email })

  if (findUserByEmail) {
    res.json({
      message: 'Tài khoản đã tồn tại'
    })
  } else {
    const passHash = await bcrypt.hash(password, 10)
    await saveUserService({ email, fullName, password: passHash })

    res.status(200).json({
      message: 'Tài khoản đã tạo thành công hãy đăng nhập lại'
    })
  }
}
