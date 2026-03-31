import { defineEventHandler, readBody, setResponseStatus } from 'h3';
import mysql from 'mysql2/promise';
import {
  clearRefreshTokenCookie,
  setRefreshTokenCookie,
} from '~/utils/cookie-utils';
import { generateAccessToken, generateRefreshToken } from '~/utils/jwt-utils';
import {
  forbiddenResponse,
  useResponseError,
  useResponseSuccess,
} from '~/utils/response';

export default defineEventHandler(async (event) => {
  const { password, username } = await readBody(event);
  if (!password || !username) {
    setResponseStatus(event, 400);
    return useResponseError(
      'BadRequestException',
      '아이디와 비밀번호를 입력해주세요.',
    );
  }

  // MariaDB 연결 설정
  const connection = await mysql.createConnection({
    host: process.env.MYSQL_HOST || '127.0.0.1',
    port: Number(process.env.MYSQL_PORT) || 3306,
    user: process.env.MYSQL_USER || 'root',
    password: process.env.MYSQL_PASSWORD || '',
    database: process.env.MYSQL_DATABASE || 'vben_admin',
  });

  try {
    // 사용자 조회
    const [rows] = await connection.execute(
      'SELECT * FROM users WHERE username = ? AND password = ?',
      [username, password],
    );

    const findUser = (rows as any[])[0];

    if (!findUser) {
      clearRefreshTokenCookie(event);
      return forbiddenResponse(event, '아이디 또는 비밀번호가 올바르지 않습니다.');
    }

    // roles가 문자열(JSON)로 저장되어 있으므로 파싱 (MariaDB JSON 타입 대응)
    if (typeof findUser.roles === 'string') {
      findUser.roles = JSON.parse(findUser.roles);
    }

    const accessToken = generateAccessToken(findUser);
    const refreshToken = generateRefreshToken(findUser);

    setRefreshTokenCookie(event, refreshToken);

    return useResponseSuccess({
      ...findUser,
      accessToken,
    });
  } catch (error: any) {
    console.error('Database Error:', error);
    return useResponseError('InternalServerError', '데이터베이스 연결 오류가 발생했습니다.');
  } finally {
    await connection.end();
  }
});
