const passport = require('passport');
const dotenv = require('dotenv');
dotenv.config({ path: './.env' });
const mysql = require('mysql');

const db = mysql.createConnection({
  host: process.env.DB_HOST, //ip address of server
  user: process.env.DB_USER,
  password: process.env.DB_PWD,
  database: process.env.DB,
});

const GoogleStrategy = require('passport-google-oauth2').Strategy;

passport.serializeUser(function (user, done) {
  //console.log('The passport function ' + user.id);
  done(null, user);
  //done user.id
});

passport.deserializeUser(function (id, done) {
  //   User.findById(id, function (err, user) {
  //     done(err, user);
  //   });
  done(null, id);
});

passport.use(
  new GoogleStrategy(
    {
      clientID: process.env.CLIENT_ID,
      clientSecret: process.env.CLIENT_SEC,
      callbackURL: 'http://localhost:5000/google/callback',
      passReqToCallback: true,
    },
    function (request, accessToken, refreshToken, profile, done) {
      //db logic - profile.id contains - email,name,user profile

      //if user exists - return to the done function
      console.log('Profile ' + profile.email + ' ' + profile.displayName);
      db.query(
        'select LoginName FROM user_table where LoginName = ?',
        [profile.email],
        async (err, result) => {
          if (err) {
            console.log(err);
          }
          if (result.length > 0) {
            return done(err, profile);
          }
        }
      );
    }
  )
);
