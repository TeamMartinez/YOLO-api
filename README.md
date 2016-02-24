# YOLOProject-api
The api for the yolo project 

## Dependencies
* rvm 1.26.11

## Getting Started
Make sure that rvm is installed correctly with:
```
$ rvm -v
```

Install and set ruby 2.3.0 as default ruby version:
```
$ rvm install 2.3.0
$ rvm use ruby-2.3.0
```

Install the `bundler` gem:
```
$ gem install bundler
```

From inside application directory, install gem dependencies: 
```
$ bundle install
```

## Database Setup
Create and seed the database:
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Drop database (drop then create / seed to refresh app data)
```
$ rake db:drop
```

## Serve the application:
Serve rails on :3000:
```
$ rails s
```

## Documentation
Api spec available at: http://vm344a.se.rit.edu/apipie
