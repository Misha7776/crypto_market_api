server: bundle exec rails server -p $PORT
worker: bundle exec sneakers work Rabbit::Consumers::Crypto --require app/services/rabbit/consumers/crypto.rb
socket_client: cd ../crypto_socket_client && bundle && ruby socket_client.rb