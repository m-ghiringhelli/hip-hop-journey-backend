const { Router } = require('express');
const Album = require('../models/Album');

const router = Router();

router
  .get('/', async (req, res, next) => {
    try {
      const albums = await Album.getAllAlbums();
      res.json(albums);
    } catch (e) {
      next(e);
    }
});

module.exports = router;