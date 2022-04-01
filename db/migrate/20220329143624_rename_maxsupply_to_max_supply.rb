class RenameMaxsupplyToMaxSupply < ActiveRecord::Migration[6.1]
  def change
    rename_column :stocks, :maxsupply, :max_supply
  end
end
