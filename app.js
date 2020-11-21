const express = require('express');
const mysql = require('mysql');
const path = require('path');
const dotenv = require('dotenv');
const router = require('./routes/pages');
const authRouter = require('./routes/auth');
const googleRouter = require('./routes/google');
const cookieParser = require('cookie-parser');
const passport = require('passport');
const cookieSession = require('cookie-session');
require('./passport-setup');

dotenv.config({ path: './.env' });

const app = express();

const db = mysql.createConnection({
  host: process.env.DB_HOST, //ip address of server
  user: process.env.DB_USER,
  password: process.env.DB_PWD,
  database: process.env.DB,
});

const publicDir = path.join(__dirname, './public');
app.use(express.static(publicDir));

app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(cookieParser());

app.use(
  cookieSession({
    name: 'school-session',
    keys: ['key1', 'key2'],
  })
);

app.use(passport.initialize());
app.use(passport.session());

app.set('view engine', 'hbs');

app.use('/', router); // Index page
app.use('/auth', authRouter); // Normal registration and authentication
app.use('/google', googleRouter); // Google oauth authentication

db.connect((err) => {
  if (err) {
    console.log(err);
  } else {
    console.log('MYSQL Connected!');
  }
});

app.listen(5000, () => {
  console.log('Server started on port 5000');
});
