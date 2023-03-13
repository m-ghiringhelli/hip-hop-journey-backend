const jwt = require('jsonwebtoken');

module.exports = async (req, res, next) => {
  try {
    const cookie = req.cookies['hiphopsession'];
    if (!cookie) throw new Error('No user logged in');

    const user = jwt.verify(cookie, process.env.JWT_SECRET);
    req.user = user;

    next();
  } catch (e) {
    e.status = 401;
    next (e);
  }
};