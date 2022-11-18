##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.1.1]
- Rails [7.0.4]

##### 1. Check out the repository

```bash
git clone git@github.com:alitwiscode/book_library.git
```

##### 2. Create database.yml file

Copy the example database.yml file and edit the database configuration as required.

```bash
cp config/database.example.yml config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails db:create
rails db:migrate
```

##### 4. Import or seed data to the database

Run the following commands to seed or import data.

```ruby
rails db:seed
```
or
``` ruby
rake import:authors
rake import:books
```

##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
bin/rails server -p 3000
bin/rails tailwindcss:watch
```
Or with foreman

```ruby
./bin/dev
```

And now you can visit the site with the URL http://localhost:3000
