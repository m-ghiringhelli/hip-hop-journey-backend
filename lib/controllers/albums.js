const { Router } = require('express');

const router = Router();

router
  .get('/', async (req, res) => {
    res.json('farts!');
  });

module.exports = router;