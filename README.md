# Crypto Maarket API

## Project scope

Solution for monitoring the crypto currencies market.  

- Real-time updates of crypto currencies
- Available history of all events that happened with a currency

## Runtime environment

The infrasturcture of Dream project consists of the following services:

- Socket client written in Ruby
- RabbitMQ broker for message distribution
- PostgreSQL database
- Redis in-memory database
- Sidekiq background processing
- Rails event store gem for storing events

## Commands for setup
- Make sure the crypto_socket_client is in the same folder with current app.
#### Then run
```ruby
bundle install
rails db:setup
```

#### Automated setup

```
# foreman start
....
....
....
Application is ready!
```

#### Manual setup

1. Install ruby
1. Install PostgreSQL
1. Install RabbitMQ

#### Manual boot

1. Run PostgreSQL in background
1. `$ rebbit-server`
1. `$ rails s`
1. `$ WORKERS=Rabbit::Consumers::Crypto rake sneakers:run`
1. `$ ruby socket_client.rb`

## Test environment

- Linter `$ rubocop`
- Test suit `$ rspec`