multer     = require('multer'),
sanitize   = require('sanitize-filename'),
path       = require('path');

storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, './public/uploads/');
    },
    filename: function(req, file, cb) {  
    cb(null, sanitize(file.originalname));
    }
});

function checkFileType(file, cb){
  const filetypes = /pdf|docx|doc|csv|php/;
  const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
  const mimetype = filetypes.test(file.mimetype);
  if(mimetype && extname){
    return cb(null,true);
  } else {
    // cb(`${file.mimetype}`+'File Type is not Allowed!');
    cb('File Type is not Accepted!');
  }
}

upload = multer({
  storage:storage, 
  limits:{fileSize:100000000},
  fileFilter: function(req, file, cb){
  checkFileType(file, cb); 
  }
}).single("fileinput");




module.exports = upload