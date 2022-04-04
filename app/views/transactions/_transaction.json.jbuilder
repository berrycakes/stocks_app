json.extract! transaction, :id, :stock_id, :user_id, :stock_share, :date, :price, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
