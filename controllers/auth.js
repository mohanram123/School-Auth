const mysql = require('mysql');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const dotenv = require('dotenv');
dotenv.config({ path: './.env' });

const db = mysql.createConnection({
  host: process.env.DB_HOST, //ip address of server
  user: process.env.DB_USER,
  password: process.env.DB_PWD,
  database: process.env.DB,
});

exports.register = (req, res) => {
  console.log(req.body);
  const { id, name, role, email, pass } = req.body;
  db.query(
    'select LoginName FROM user_table where LoginName = ?',
    [email],
    async (err, result) => {
      if (err) {
        console.log(err);
      }
      if (result.length > 0) {
        return res.render('register', {
          message: 'That email is taken!',
        });
      }
      let hashedpwd = await bcrypt.hash(pass, 8);
      console.log(hashedpwd);

      db.query(
        'insert into user_table set ?',
        {
          UserID: id,
          UserName: name,
          UserRole: role,
          LoginName: email,
          password: hashedpwd,
          status: false,
        },
        (err, results) => {
          if (err) {
            console.log(err);
          } else {
            console.log(results);
            return res.render('register', {
              message: 'User registered',
            });
          }
        }
      );
    }
  );
};

exports.login = async (req, res) => {
  try {
    const { email, pass } = req.body;

    if (!email || !pass) {
      return res.status(400).render('login', {
        message: 'Please provide an email or password',
      });
    }

    db.query(
      'select * from user_table where LoginName = ?',
      [email],
      async (err, result) => {
        console.log(result);
        if (!result || !(await bcrypt.compare(pass, result[0].password))) {
          res.status(401).render('login', {
            message: 'Email or password is incorrect',
          });
        } else {
          const UserID = result[0].UserID;

          const token = jwt.sign({ UserID }, process.env.JWT_SECRET, {
            algorithm: 'HS256',
            expiresIn: process.env.JWT_EXPIRESIN,
          });

          console.log('The token is ' + token);

          const cookieOptions = {
            expires: new Date(
              Date.now() + process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 60 * 1000
            ),
            httpOnly: true,
          };
          res.cookie('token', token, cookieOptions);
          res.redirect('/success');
        }
      }
    );
  } catch (err) {
    console.log(err);
  }
};
