class CreateCurrency < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :seq_no
      t.string :name
      t.string :symbol
      t.integer :exchange_status, default: 0, null: false
      t.text :ask
      t.text :bid
      t.text :trade
      t.timestamp :traded_at

      t.datetime :created_at,  null: false
      t.datetime :updated_at,  null: false
    end
  end
end
