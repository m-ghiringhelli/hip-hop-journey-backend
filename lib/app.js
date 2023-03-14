const express = require('express');
const cookieParser = require('cookie-parser');
const cors = require('cors');

const app = express();

app.use(express.json());
app.use(cookieParser());
app.use(
  cors({
    origin: ['http://127.0.0.1:3000', 'http://localhost:3000'],
    credentials: true,
  })
);

app.use('/api/v1/users', require('./controllers/users'));
app.use('/api/v1/albums', require('./controllers/albums'));

app.use(require('./middleware/not-found'));
app.use(require('./middleware/error'));

module.exports = app;