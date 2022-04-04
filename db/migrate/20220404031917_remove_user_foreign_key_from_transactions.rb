class RemoveUserForeignKeyFromTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :transactions, column: :user_id
  end
end
