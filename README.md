# School-Auth

An authentication system for school management system using nodejs and mysql

### Initialization

#### Database

1. Install MySQL DB.
2. Create a database named school_system in it.
3. Use the command "mysql -u root/<db_username> -p school_system/<db_name> < sqlDump/schoolupdated.sql".
4. Change the mysql password (DB_PWD) in the .env file, set it as your db password.

#### Node & npm

1. Install [nodejs and npm](https://nodejs.org/dist/v14.15.1/node-v14.15.1-x64.msi)

#### This repo

1. Clone this repository using "git clone https://www.github.com/mohanram123/School-Auth.git"
2. Change the directory to School-Auth.

### How to begin

1. npm i
2. npm start
3. Keep your mysql db ready
4. You can find the website on port 5000

### Things implemented in this web security application

1. Google Open Authentication
2. Handling SQL Injection
3. XSS
4. Safegaurding from malicious file uploads
