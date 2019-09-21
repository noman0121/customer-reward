

Implementation a system for calculating rewards based on recommendations of customers.

### Requirements:
 - `Ruby version >= 2.3.1`
 - `Bundler version 1.12.5`

### Install:
 - `bundle install`

### Tests:
 - `bundle exec rubocop`
 - `bundle exec rspec`

### Run:
 - `rails s`
 - `curl -X POST localhost:3000/rewards --data-binary @example.txt -H "Content-Type: text/plain"`
