const express = require('express');

const app = express();

// app.get('/', (req, res) => {
//   res.send('It work');
// })

app.use('/api/v1/users', require('./controllers/users'));

module.exports = app;