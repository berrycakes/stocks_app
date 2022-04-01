class RenameCurrencySymbolToSymbol < ActiveRecord::Migration[6.1]
  def change
    rename_column :stocks, :currency_symbol, :symbol
  end
end
