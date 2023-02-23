const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/User');

module.exports = class UserService {
  static async create({ email, password }) {
    const passwordHash = await bcrypt.hash(
      password,
      Number(process.env.SALT_ROUNDS)
    );
    try {
      const user = await User.insert({ email, passwordHash });
      return user;
    } catch (e) {
      console.error(e);
      e.status = 403;
      throw e;
    }
  }

  static async signIn({ email, password }) {
    try {
      const user = await User.getByEmail(email);

      if (!user) throw new Error(`We can't find that email`);

      if (!bcrypt.compareSync(password, user.passwordHash)) {
        throw new Error('That password appears to be incorrect');
      }

      const token = jwt.sign({ ...user }, process.env.JWT_SECRET, {
        expiresIn: '1 day',
      });

      return token
    } catch (e) {
      e.status = 401;
      throw e;
    }
  }
}