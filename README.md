# School-Auth

An authentication system for school management system using nodejs and mysql

## Initialization

### Setting up

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

## Features and Vulnerabilities Secured in this project.

### 1. Google OAuth
This site support Google Open Authentication, which requires only the email address to grant access into a user's account, provided that the email is registered in the database.
This makes logging into the account faster and more secure, as it avoids and phishing attempts.

### 2. XSS 
The webpages in this school management site are secured from any Cross Site Scripting attacks, as the inputs are sanitised for the prevention of any of XSS payloads.

### 3. SQL Injection
The login and register forms in this site are also secured from SQL injection attacks, as the inputs are sanitised of any sql injection payloads. The username and name fields (first name and last name) do not accept any special characters, remove white spaces and ensure there are no SQLI type payloads. 

### 4. File Uploads
The site supports file uploads which check for the file's hash and check with an anti-virus database using the virus-total API, for the file's maliciousness. It can be modified to accept the required file formats and to discard certain file formats like - .exe, .php etc.

