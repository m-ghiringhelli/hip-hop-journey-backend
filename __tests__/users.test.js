const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

const mockUser = {
  email: 'test@test.com',
  password: '123456',
}

describe('user tests', () => {
  beforeEach(() => {
    return setup(pool);
  });

  afterAll(() => {
    pool.end();
  });

  it('POST to users should create a user', async () => {
    const res = await request(app).post('/api/v1/users').send(mockUser);
    expect(res.status).toBe(200);
    const user = res.body;
    expect(user).toEqual({
      id: expect.any(String),
      email: mockUser.email,
    });
    const userCheck = await request(app).get(`/api/v1/users/${res.body.id}`);
    expect(userCheck.status).toBe(200);
    expect(userCheck).toEqual(user);
  });
});