module TransactionsHelper

    def aggregate_transactions(stock_id)
        current_user.trader.transactions.where(:stock_id => stock_id)
    end

    def get_total_stock_share(stock_id)
        transactions = aggregate_transactions(stock_id)
        total_buy_shares = transactions.where(:transaction_type => "buy").sum(:stock_share)
        total_sell_shares = transactions.where(:transaction_type => "sell").sum(:stock_share)
        total_sell_shares ? total_buy_shares - total_sell_shares : total_buy_shares
    end

    def get_average_purchase_price(stock_id)
        transactions = aggregate_transactions(stock_id)
        total_stock_share = get_total_stock_share(stock_id)
        total_buy_price = transactions.where(:transaction_type => "buy").sum("price * stock_share")
        total_sell_price = transactions.where(:transaction_type => "sell").sum("price * stock_share")
        total_sell_price ? (total_buy_price - total_sell_price) / total_stock_share : ( total_buy_price / total_stock_share )
    end

    def get_current_value(transaction)
        total_stock_share = get_total_stock_share(transaction.stock_id)
        total_stock_share * transaction.current_price
    end

    def get_profit_loss(transaction)
        get_current_value(transaction) - (get_average_purchase_price(transaction.stock_id) * get_total_stock_share(transaction.stock_id))
    end

    def get_percent_change(transaction)
        get_profit_loss(transaction) / get_average_purchase_price(transaction.stock_id)
    end
end
