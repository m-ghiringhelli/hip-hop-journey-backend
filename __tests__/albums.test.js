const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const app = require('../lib/app');

describe('album tests', () => {
  beforeEach(() => {
    return setup(pool);
  });

  afterAll(() => {
    pool.end();
  });

  it.only('GET from /albums should return the list of albums', async () => {

  });
});