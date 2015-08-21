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

Notes
-----

As of now this includes all back-end support for listing, finding, creating, updating, and deleting both tasks and lists, as well as the integration between them in a one-to-many relationship. It also includes front-end Sinatra support for all RESTful route handling of lists (index, new, create, show, edit, update, destroy). Front-end support for tasks is currently limited to listing all tasks that belong to a specific list on that list's show (details) page, adding new tasks to a specific list on that list's show page, and creating a new task (processing the form submission).
