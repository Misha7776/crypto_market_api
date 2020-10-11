rabbit_server: rabbitmq-server

rails_server: bundle exec rails server -b 0.0.0.0 -p 3000
rabbit_worker: WORKERS=Rabbit::Consumers::Crypto rake sneakers:run

redis_server: redis-server
telegram_bot_poller: cd ../crypto_bot && bundle && rake telegram:bot:poller

socket_client: cd ../crypto_socket_client && bundle && ruby socket_client.rb
