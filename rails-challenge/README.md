# README


## Setup

Make sure you have ruby 3.1.0 and the bundler gem

1. Bundle and install gem dependencies

```shell
bundle
```

2. Create and Migrate the database

```ruby
rails db:create
rails db:migrate
```

3. Seed the database

```ruby
rails db:seed
```

## Notes

*charges* scaffold is called credit_card_charges

I encountered a rails bug with rspec views, so I used capybara and added the unit tests in the features folder.
