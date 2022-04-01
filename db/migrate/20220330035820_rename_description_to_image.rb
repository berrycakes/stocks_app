class RenameDescriptionToImage < ActiveRecord::Migration[6.1]
  def change
    rename_column :stocks, :description, :image
  end
end
