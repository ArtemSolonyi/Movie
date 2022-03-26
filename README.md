# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Ruby version ruby 3.0.3
Rails version Rails 7.0.2.3

1)Movie: Title, Text, Ratings, Category
2)Rating system from 1-10 available to registered users
3)The home page that shows all movies and the ability to filter movies by categories in url Friendly_id
4)Movie Details Page that shows the average rating
5) From the Home page, it is possible to provide a quick star rating without reloading a page.
6)Admin Interface to manage movies (CRUD)
7) Pagination of Movies on Home Page
8) Deploy an application to cloud servers like a Heroku or DigitalOcean
9)Provide test coverage for the app using RSpec or TDD
10)Use bootstrap or similar for the UI

 Database production pg/ development sqlite3

 To run the test suite "bundler exec rspec"

 Setup Gems Manually:
 gem 'friendly_id', '~> 5.4.0'
 gem 'will_paginate'
 gem 'will_paginate-bootstrap4'
 gem "factory_bot_rails"
 gem 'shoulda-matchers'
 
 Deploy to heroku:
 https://safe-sea-96714.herokuapp.com


