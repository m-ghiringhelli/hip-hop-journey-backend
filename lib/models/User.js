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
    // okay so if there is a user, we want to throw
    // a new error that informs user still exists.
    // if there's not a user then we need to do all the stuff
    // that's in here
    console.log('User.insert', user);
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
    // console.log('model insert', user);
    // const message = console.log('Email already exists');
    // if (user.email) return message;
    // console.log('model', user);
  }

  static async getByEmail(email) {
    console.log('getByEmail email', email);
    const { rows } = await pool.query(
      `
        SELECT * FROM users
        WHERE email = $1
      `,
      [email]
    );
    console.log('getByEmail', rows);
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