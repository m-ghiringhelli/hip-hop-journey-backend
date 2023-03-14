const { Router } = require('express');
const User = require('../models/User');
const UserService = require('../services/UserService');
const authenticate = require('../middleware/authenticate');

const router = Router();

router
  .get('/me', authenticate, async (req, res) => {
    const { email } = req.user;
    const user = await User.getByEmail(email);
    res.json(req.user);
  })
  .get('/:id', async (req, res) => {
    const id = req.params.id;
    const user = await User.getById(id);

    res.json(user);
  })
  .post('/sessions', async (req, res, next) => {
    try {
      const user = await UserService.signIn(req.body);
      res
        .cookie(process.env.COOKIE_NAME, user, {
          httpOnly: true,
        })
        .json({ 
          message: 'Signed in successfully'
        });
    } catch (e) {
      next(e);
    }
  })
  .post('/', async (req, res, next) => {
    const { email, password } = req.body;
    try {
      const user = await UserService.create({ email, password });
      res.json(user);
    } catch (e) {
      next(e);
    }
  });

module.exports = router;