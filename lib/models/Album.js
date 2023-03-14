const pool = require('../utils/pool');

module.exports = class Album {
  id;
  artist;
  title;
  released;
  location;
  recordCompany;
  region;

  constructor(row) {
    this.id = row.id;
    this.artist = row.artist;
    this.title = row.title;
    this.released = row.released;
    this.location = row.location;
    this.recordCompany = row.record_company;
    this.region = row.region;
  }

  static async getAll() {
    const { rows } = await pool.query(
      `SELECT * FROM albums`
    );
    const albums = rows.map((row) => new Album(row));
    return albums;
  }

  static async getById(id) {
    const { rows } = await pool.query(
      `SELECT * FROM albums
      WHERE id=$1
      `, [id]
    );
    const album = rows[0]
      ? new Album(rows[0])
      : null;
    return album;
  }
}