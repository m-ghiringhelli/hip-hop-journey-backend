// eslint-disable-next-line no-unused-vars
module.exports = (err, req, res, next) => {
  const status = err.status || 500;
  console.log('error middleware', err.message);
  res.status(status);

  if (process.env.NODE_ENV !== 'test') {
    console.log(err);
  }

  res.send({
    message: err.message,
  });
};