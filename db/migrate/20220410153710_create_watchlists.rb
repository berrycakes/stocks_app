class CreateWatchlists < ActiveRecord::Migration[6.1]
  def change
    create_table :watchlists do |t|
      t.references :stock, null: false, foreign_key: true
      t.references :trader, null: false, foreign_key: true

      t.timestamps
    end
  end
end
