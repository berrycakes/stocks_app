class AddTypeToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :type, :string
  end
end
