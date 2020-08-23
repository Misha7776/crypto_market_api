server: bundle exec rails server -p $PORT
worker: WORKERS=Rabbit::Consumers::Crypto rake sneakers:run
socket_client: cd ../crypto_socket_client && bundle && ruby socket_client.rb