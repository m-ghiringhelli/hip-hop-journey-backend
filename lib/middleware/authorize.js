const User = require("../models/User");

module.exports = async (req, res, next) => {
  try {
    if (req.user.id !== req.params.id) {
      throw new Error('Wrong user');
    }
    next();
  } catch(e) {
    e.status = 403;
    next(e);
  }
};