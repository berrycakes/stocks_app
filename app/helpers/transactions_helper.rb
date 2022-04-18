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
        get_profit_loss(transaction) / (get_average_purchase_price(transaction.stock_id) * get_total_stock_share(transaction.stock_id))
    end

    def donut_chart_data
        assets = []
        current_user.trader.stocks.distinct.each do |stock|
            value = stock.available_shares * stock.current_price
            if value > 0
                new_asset = {name: stock.name, data: value.to_f}
                assets.push(new_asset)
            end
        end
        return assets
    end

    # profit for currently owned assets
    def current_profit_loss
        total_value = 0
        amount = 0
        percent = 0
        current_user.trader.stocks.distinct.each do |stock|
            if stock.available_shares > 0
                value = (stock.available_shares * stock.current_price)
                average_value = stock.available_shares * get_average_purchase_price(stock.id)
                total_value += value
                amount += value - average_value
                percent += (value - average_value) / value
            end
        end
        return {total_value: total_value, amount: amount, percent: percent}
    end

end
