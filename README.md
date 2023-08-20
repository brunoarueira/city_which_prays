# City which Prays

This app was made to register volunteers to deliver gifts (specially books) to many places around them.

## Stack

I've made this app using:

* Ruby 2.7.1

* Rails 6

* React

* RSpec

* PostgreSQL

## Development

First, You'll need to git clone this repository then:

	cd city_which_prays/

And run the following commands on the console:

	bundle install
	cp config/database.sample.yml config/database.yml
	rake db:create
	rake db:migrate

And in the final:

	rails s

Open your browser! Let's try :)

## Deployed to heroku

You can see the app online here [https://city-which-prays.herokuapp.com/](https://city-which-prays.herokuapp.com/)

## TODO

* Apply redux, I tried but the capybara's driver not allowed me to run the app on test env

* Improve for other resolutions like tablets

## Author

Bruno Arueira.
