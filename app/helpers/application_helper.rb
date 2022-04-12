module ApplicationHelper
  def role_options
    User.roles.map { |key, _value| [key.humanize, key] }
  end

  def no_admin_role_options
    arr = User.roles.map { |key, _value| [key.humanize, key] }
    arr.delete_at(0)
    arr
  end

  def display_currency(number)
    if number > 1 || number < (-1)
      number_to_currency(number, unit: "₱ ", separator: ".", delimiter: ",").to_s
    else
      number_to_currency(number, unit: "₱ ", separator: ".", delimiter: ",", precision: 6).to_s
    end
  end

  def get_watchlist
    current_user.trader.watchlists.pluck(:stock_id)
  end

end
