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

# Deployment - Docker

## Assumptions

- you have already installed a docker environment, you can use docker-machine or the docker engine itself
- optionally, you could execute the app using docker-compose

## Deployment

if you are using docker-machine remember to attach the required environment variables

```
eval $(docker-machine env development)
```

### Pure Docker implementation

Build the **user server** machine

```
docker build -t user_server .
```

Running the container

```
docker run -itP -v $(pwd):/app user_server
```

**Note** type `docker ps` to see what port you must use in your browser for accessing the app, also if you are using *docker-machine* you must use the docker-machine ip instead your local address `docker-machine ip “${DOCKER_MACHINE_NAME}”`

### Docker compose

you also can use docker compose for build and running the containers on production environment, we have a dockerfile set specifically designed for production, those files are

- Dockerfile-app
- Dockerfile-nginx

We have a shared volume for accessing directly to assets between ngnix and app services

```
docker-compose build
```

```
docker-compose up
```
Now you can access to the application on port 80 + (NGINX, puma, mongodb) using your local address or the docker-machine address if you are using it...

Enjoy it!
