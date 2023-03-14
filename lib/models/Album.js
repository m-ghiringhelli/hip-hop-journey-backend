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

  static async getAllAlbums() {
    const { rows } = await pool.query(
      `SELECT * FROM albums`
    );
    return rows.map((row) => new Album(row));
  }
}