const { Router } = require('express');
const User = require('../models/User');
const UserService = require('../services/UserService');

const router = Router();

router
  .get('/:id', async (req, res) => {
    const id = req.params.id;
    const user = await User.getById(id);
    console.log('controller', user);
    res.json(user);
  })
  .post('/', async (req, res) => {
    const { email, password } = req.body;
    const user = await UserService.create({ email, password });
    console.log(user);
    res.json(user);
  });

module.exports = router;