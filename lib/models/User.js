const pool = require('../utils/pool');

module.exports = class User {
  id;
  email;
  #passwordHash;

  constructor(row) {
    this.id = row.id;
    this.email = row.email;
    this.#passwordHash = row.password_hash;
  }

  static async insert({ email, passwordHash }) {
    const user = await this.getByEmail(email);

    if (user) {
      throw new Error('Account already exists');
    } else {
      const userInsert = await pool.query(
        `
          INSERT INTO users (email, password_hash)
          VALUES ($1, $2)
          RETURNING *
        `,
        [email, passwordHash]
      );
      const { rows } = userInsert;
      const response = rows[0] ? new User(rows[0]) : null;
      return response;
    }
  }

  static async getByEmail(email) {
    const { rows } = await pool.query(
      `
        SELECT * FROM users
        WHERE email = $1
      `,
      [email]
    );
    const response = rows[0] ? new User(rows[0]) : null;
    return response;
  }

  static async getById(id) {
    const { rows } = await pool.query(
      `
        SELECT * FROM users
        WHERE id = $1 
      `,
      [id]
    );
    const response = rows[0] ? new User(rows[0]) : null;
    return response;
  }

  get passwordHash() {
    return this.#passwordHash;
  }
}