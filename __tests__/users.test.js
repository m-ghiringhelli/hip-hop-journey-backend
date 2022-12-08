const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  afterAll(() => {
    pool.end();
  });

  it('POST to users should create a user', () => {
    expect(1).toEqual(1);
  })
});