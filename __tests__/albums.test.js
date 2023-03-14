const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const app = require('../lib/app');
const request = require('supertest');

describe('album tests', () => {
  beforeEach(() => {
    return setup(pool);
  });

  afterAll(() => {
    pool.end();
  });

  it.only('GET from /albums should return the list of albums', async () => {
    const res = await request(app).get('/api/v1/albums');

    expect(res.status).toBe(200);
    expect(res.body).toHaveLength(220);
  });
});