# ConfigShare API

API to save restaurant menu and customers' order

## Routes

### Application Routes
- GET `/`: root route

### Project Routes
- GET `api/v1/restaurants/`: returns a json list of all restaurant
- GET `api/v1/restaurants/[ID]`: returns a json of all information about a restaurant
- POST `api/v1/projects/`: creates a new restaurant

### Configuration Routes
- GET `api/v1/projects/[PROJECT_ID]/configurations/`: returns a json of all configurations for a project
- GET `api/v1/projects/[PROJECT_ID]/configurations/[ID].json`: returns a json of all information about a configuration
- GET `api/v1/projects/[PROJECT_ID]/configurations/[ID]/document`: returns a text/plain document with a configuration document
- POST `api/v1/projects/[PROJECT_ID]/configurations/`: creates a new configuration for a project

## Install

Install this API by cloning the *relevant branch* and installing required gems:

    $ bundle install

## Testing

Test this API by running:

    $ RACK_ENV=test rake db:migrate
    $ bundle exec rake spec

## Develop

Run this API during development:

    $ rake db:migrate
    $ bundle exec rackup

or use autoloading during development:

    $ bundle exec rerun rackup
