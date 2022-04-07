class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.decimal :balance, default: 0
      t.references :trader, null: false, foreign_key: true

      t.timestamps
    end
  end
end
