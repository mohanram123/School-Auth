const express = require('express');
const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');
dotenv.config({ path: './.env' });
const router = express.Router();

router.get('/', (req, res) => {
  res.render('index');
});

router.get('/register', (req, res) => {
  res.render('register');
});

router.get('/login', (req, res) => {
  res.render('login');
});

router.get('/success', isAuthorized, (req, res) => {
  res.render('success');
});

function isAuthorized(req, res, next) {
  const token = req.cookies.token;
  if (!token) {
    return res.status(401).end();
  }
  var payload;
  try {
    payload = jwt.verify(token, process.env.JWT_SECRET);
  } catch (e) {
    if (e instanceof jwt.JsonWebTokenError) {
      return res.status(401).end();
    }
    return res.status(400).end();
  }
  //Token renewing logic needs some work!

  // const nowUnixSeconds = Math.round(Number(new Date()) / 1000);
  // if (payload.exp - nowUnixSeconds > 30) {
  //   return res.status(400).end();
  // }
  // const newtoken = jwt.sign({ UserID }, process.env.JWT_SECRET, {
  //   algorithm: 'HS256',
  //   expiresIn: process.env.JWT_EXPIRESIN,
  // });

  // const cookieOptions = {
  //   expires: new Date(
  //     Date.now() + process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 60 * 1000
  //   ),
  //   httpOnly: true,
  // };

  // res.cookie('token', newToken, cookieOptions);
  return next();
}

module.exports = router;
