const { Router } = require('express');
const UserService = require('../services/UserService');

const router = Router();

router.post('/', async (req, res) => {
  // console.log(req.body);
  const { email, password } = req.body;
  console.log('controller', email, password);
  const user = await UserService.create({ email, password });
  console.log(user);
  res.json(req.body);
});

module.exports = router;