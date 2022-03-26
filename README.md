# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Ruby version ruby 3.0.3p157
Rails version Rails 7.0.2.3

• Movie: Title, Text, Ratings, Category
• Rating system from 1-10 available to registered users
• The home page that shows all movies and the ability to filter movies by categories in url Friendly_id
• Movie Details Page that shows the average rating
• From the Home page, it is possible to provide a quick star rating without reloading a page.
• Admin Interface to manage movies (CRUD)
• Pagination of Movies on Home Page
• Deploy an application to cloud servers like a Heroku or DigitalOcean
• Provide test coverage for the app using RSpec or TDD
• Use bootstrap or similar for the UI

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


