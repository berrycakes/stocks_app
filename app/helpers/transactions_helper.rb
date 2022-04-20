module TransactionsHelper
  def aggregate_transactions(stock_id)
    current_user.trader.transactions.where(stock_id: stock_id)
  end

  def get_total_stock_share(stock_id)
    transactions = aggregate_transactions(stock_id)
    total_buy_shares = transactions.where(transaction_type: 'buy').sum(:stock_share)
    total_sell_shares = transactions.where(transaction_type: 'sell').sum(:stock_share)
    total_sell_shares ? total_buy_shares - total_sell_shares : total_buy_shares
  end

  def get_average_purchase_price(stock_id)
    transactions = aggregate_transactions(stock_id)
    total_buy_shares = transactions.where(transaction_type: 'buy').sum(:stock_share)
    total_buy_price = transactions.where(transaction_type: 'buy').sum('price * stock_share')
    total_buy_price / total_buy_shares
  end

  def get_total_purchase_value(stock_id)
    transactions = aggregate_transactions(stock_id)
    total_buy_price = transactions.where(transaction_type: 'buy').sum('price * stock_share')
    total_sell_price = transactions.where(transaction_type: 'sell').sum('price * stock_share')
    total_buy_price - total_sell_price
  end

  def get_current_value(transaction)
    total_stock_share = get_total_stock_share(transaction.stock_id)
    total_stock_share * transaction.current_price
  end

  def get_profit_loss(transaction)
    get_current_value(transaction) - (get_average_purchase_price(transaction.stock_id) * get_total_stock_share(transaction.stock_id))
  end

  def get_percent_change(transaction)
    get_profit_loss(transaction) * 100 / (get_average_purchase_price(transaction.stock_id) * get_total_stock_share(transaction.stock_id))
  end

  def donut_chart_data
    assets = []
    current_user.trader.stocks.distinct.each do |stock|
      value = stock.available_shares(current_user.trader.id) * stock.current_price
      if value > 0
        new_asset = { name: stock.name, data: value.to_f }
        assets.push(new_asset)
      end
    end
    assets
  end

  # profit for currently owned assets
  def current_profit_loss
    total_value = 0
    total_average_value = 0
    # percent = profit_loss / total_value
    current_user.trader.stocks.distinct.each do |stock|
      next unless stock.available_shares(current_user.trader.id) > 0

      value = (stock.available_shares(current_user.trader.id) * stock.current_price)
      average_value = stock.available_shares(current_user.trader.id) * get_average_purchase_price(stock.id)
      total_average_value += average_value
      total_value += value
      # amount += value - average_value
    end
    profit_loss = total_value - total_average_value
    percent = total_average_value != 0 ? (profit_loss / total_average_value) * 100 : 0
    { total_value: total_value, amount: profit_loss, percent: percent }
  end
end
