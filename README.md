# User Server

A demo rails app as a simple authentication web app based on Devise and MongoDB, this application will be used for learning purposes, also it makes part of **Dockerizing the Gem**, a meetup held in Cali on November 4, 2017

# Essential Dependencies

- Ruby 2.4.2
- Rails 5.1.4
- bootstrap 4.alpha
- MongoDB 3.4
- Mongoid 6.1.0

# Configuration

copy all example files (config files) to real ones

```
cp config/mongoid.yml.example config/mongoid.yml
```

install all dependencies

```
bundle install
```

Run the server

```
rails server
```

Server will run on `localhost:3000`

Enjoy it!
