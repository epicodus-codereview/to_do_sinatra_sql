# _to-do_

##### This application is a demonstration application designed to show classes, tests, views with Sinatra and SQL (no Active Record).

## Technologies Used

Application: Ruby, Sinatra<br>
Testing: Rspec, Capybara<br>
Database: Postgres

Installation
------------

Install Salon Manager by first cloning the repository.  
```
$ git clone https://github.com/epicodus-lessons/to_do_sinatra_sql
```

Install required gems:
```
$ bundle install
```

```
In PSQL:
CREATE DATABASE to_do;
\c to_do
CREATE TABLE lists (id serial PRIMARY KEY, name varchar);
CREATE TABLE tasks (id serial PRIMARY KEY, description varchar, list_id int);
CREATE DATABASE to_do_test WITH TEMPLATE to_do;
```

Start the webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in browser.

License
-------

GNU GPL v2. Copyright 2015 **Epicodus**
