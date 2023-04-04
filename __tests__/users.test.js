const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');
const UserService = require('../lib/services/UserService');

const mockUser = {
  email: 'test@test.com',
  password: '123456',
}

const registerAndLogin = async (userProps = {}) => {
  const agent = request.agent(app);
  const password = userProps.password ?? mockUser.password;
  const user = await UserService.create({ ...mockUser, ...userProps });

  const { email } = user;
  await agent.post('/api/v1/users/sessions').send({ email, password });
  return [agent, user];
}

describe('user tests', () => {
  beforeEach(() => {
    return setup(pool);
  });
  
  it('POST to /users should create a user', async () => {
    // put user in db
    const res = await request(app).post('/api/v1/users').send(mockUser);
    expect(res.status).toBe(200);
    const user = res.body;
    expect(user).toEqual({
      id: expect.any(String),
      email: mockUser.email,
      currentAlbum: '1',
    });
    // verify user is in db
    const userCheck = await request(app).get(`/api/v1/users/${res.body.id}`);
    expect(userCheck.status).toBe(200);
    expect(userCheck.body).toEqual(user);
  });
  
  it('GET to /users/me should return current user when authed', async () => {
    // check for user when not logged in (should fail)
    const loggedOutRes = await request(app).get('/api/v1/users/me');
    expect(loggedOutRes.status).toBe(401);
    

    const [agent] = await registerAndLogin();
    // check for logged in user
    const loggedInRes = await agent.get('/api/v1/users/me');
    expect(loggedInRes.status).toBe(200);
    expect(loggedInRes.body).toEqual({
      id: expect.any(String),
      email: mockUser.email,
      currentAlbum: '1',
      exp: expect.any(Number),
      iat: expect.any(Number),
    });
  })

  it.only('UPDATE to /users/me should update the current album for that user', async () => {
    // add a user
    const [agent, user] = await registerAndLogin();
    // send update to user
    const updatedUser = await agent
      .put(`/api/v1/users/${user.id}`)
      .send({ ...user, currentAlbum: '3'});
    expect(updatedUser.status).toBe(200);
    expect(updatedUser.body.currentAlbum).toEqual('3');
    // try to update other user, should fail
    const deniedUser = await agent
      .put('/api/v1/users/1')
      .send({ ...user, currentAlbum: '3'});
    expect(deniedUser.status).toBe(403);
  });

  afterAll(() => {
    pool.end();
  });
});