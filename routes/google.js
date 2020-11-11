const express = require('express');
const passport = require('passport');
require('../passport-setup');
const Grouter = express.Router();

const isLoggedIn = (req, res, next) => {
  if (req.user) {
    next();
  } else {
    res.sendStatus(401);
  }
};

Grouter.get('/', passport.authenticate('google', { scope: ['email', 'profile'] }));

Grouter.get('/failed', (req, res) => {
  // render a failed page
  res.render('failure');
});

Grouter.get('/good', isLoggedIn, (req, res) => {
  // render the success page
  console.log(req.cookies)
  res.render('success');
});

Grouter.get('/student', isLoggedIn, (req, res) => {
  // render the success page
  console.log(req.cookies)
  res.render('student');
});


Grouter.get('/logout', (req, res) => {
  req.session = null;
  req.logOut();
  res.redirect('/');
});

Grouter.get('/callback', passport.authenticate('google', {
    successRedirect: '/google/student',
    failureRedirect: '/google/failed',
  })
);

module.exports = Grouter;
