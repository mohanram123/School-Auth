const express = require('express');
const jwt = require('jsonwebtoken');
const dotenv = require('dotenv');
dotenv.config({ path: './.env' });
const router = express.Router();

// fileupload requirements
path = require('path');
fs   =require('fs');
virusCheck = require("../public/assets/virusCheck");
multerconf = require("../public/assets/multerreq");

router.get('/', (req, res) => {
  console.log("INDEX PAGE: ")
  console.log(req.cookies)
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

router.get('/admin', isAuthorized, (req, res) => {
  res.render('admin');
});

router.get('/student', isAuthorized, (req, res) => {
  res.render('student');
});

router.get('/teacher', (req, res) => {
  res.render('teacher');
});

router.get('/teacher/fileupload', (req, res) => {
  res.render('fileupload');
});
var fileName = new Map();
router.post("/teacher/fileupload", function(req, res){
  upload(req, res,async function(err){
    if(req.file!=undefined)
    {
      console.log(req.file.path);
      hashVal=virusCheck.third(req.file.path);
      val1 = await virusCheck.first(req.file.path).then(
      function(result){
        return result;
      }
    );
    data=await virusCheck.test(req.file.path); 
    
    val=await virusCheck.second(hashVal).then(
      function(result){
        return result;
      }
    );
    console.log(val[4]);
  }
  if(req.file!=undefined){
    if(val[4]==1){
      fs.writeFileSync(req.file.path, data  );
      var changedName=hashVal+path.extname(req.file.originalname).toLowerCase();
      fileName[req.file.filename]=hashVal+path.extname(req.file.originalname).toLowerCase();
      fs.renameSync('./public/uploads/'+req.file.filename,'./public/uploads/'+changedName);
      fs.chmod('./public/uploads/'+changedName, 0o400, () => {
        console.log('Permissions Changed! Only Read Access!');
      });
    }
    else if(val[4]==0){
      data=Object();
      console.log(data);
    }
  }
    if(err){
      console.log(err);
      res.render("fileupload", {msg:err})
    }
    else{
      if(req.file==undefined){
        res.render("fileupload", {msg: "No file selected"});
      }
      else if(val[4]!=1){
        res.render("fileupload",{msg:"Malicious File Caught"});
      }
      else{
        console.log(req.body.nameinput)
        console.log(req.file)
        res.render("fileupload", {msg: "File uploaded!",file:`uploads/${req.file.filename}`});
      }
    }
  })
});
router.get('/logout', (req, res) => {
  res.clearCookie('token'); 
  console.log(res.cookie)
  res.redirect('/');
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
  return next();
}

module.exports = router;
