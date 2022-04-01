json.extract! stock, :id, :name, :description, :maxsupply, :currency_symbol, :slug, :created_at, :updated_at
json.url stock_url(stock, format: :json)
