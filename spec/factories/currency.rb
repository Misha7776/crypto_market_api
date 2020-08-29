FactoryBot.define do
  factory :currency do
    seq_no { Faker::Config.random.seed }
    name { Faker::CryptoCoin.coin_name }
    symbol { Faker::CryptoCoin.acronym }
    exchange_status { %w[working suspended].sample }
    ask { [{ price: '9753.00', size: '0.0000000' }] }
    bid { [] }
    trade { [] }
    traded_at { Time.current.to_i }
  end
end
