# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. It allows administrators to add products and set discounts for a certain period of time. Users can add products to their cart and checkout using Stripe.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Put admin autherization keys into appropriate .env vars
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Testing

* Rspec 3.5
* Capybara
* Poltergeist

Run `bin/rspec` to run all tests.