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

  it('GET from /albums should return the list of albums', async () => {
    const res = await request(app).get('/api/v1/albums');

    expect(res.status).toBe(200);
    expect(res.body).toHaveLength(220);
  });

  it('GET from /albums/:id should return correct album', async () => {
    const res = await request(app).get('/api/v1/albums/3');

    expect(res.status).toBe(200);
    expect(res.body).toEqual({
      id: '3',
      artist: 'Grandmaster Flash and the Furious Five',
      title: 'The Message',
      released: '10/1/1982',
      location: 'The Bronx, NY',
      recordCompany: 'Sugar Hill',
      region: 'East',
    });

    const noAlbum = await request(app).get('/api/v1/albums/300');
    expect(noAlbum.status).toBe(200);
    expect(noAlbum.body).toEqual(null);
  });
});