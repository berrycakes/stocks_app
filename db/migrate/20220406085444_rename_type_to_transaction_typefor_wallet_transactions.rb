class RenameTypeToTransactionTypeforWalletTransactions < ActiveRecord::Migration[6.1]
  rename_column :wallet_transactions, :type, :transaction_type
end
