const { Router } = require('express');

const router = Router();

router.post('/', (req, res) => {
  res.json('Farts');
});

module.exports = router;