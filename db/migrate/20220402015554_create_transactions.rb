class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :stock, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :stock_share
      t.datetime :date
      t.decimal :price

      t.timestamps
    end
  end
end
