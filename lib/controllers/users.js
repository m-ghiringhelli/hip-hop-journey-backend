const { Router } = require('express');

const router = Router();

router.post('/', async (req, res) => {
  await console.log(req.body);
  res.json(req.body);
});

module.exports = router;