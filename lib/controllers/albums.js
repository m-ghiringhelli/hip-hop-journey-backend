const { Router } = require('express');
const Album = require('../models/Album');

const router = Router();

router
  .get('/:id', async (req, res, next) => {
    const id = req.params.id;
    try {
      const album = await Album.getById(id);
      res.json(album);
    } catch(e) {
      next(e);
    }
  })
  .get('/', async (req, res, next) => {
    try {
      const albums = await Album.getAll();
      res.json(albums);
    } catch (e) {
      next(e);
    }
});

module.exports = router;