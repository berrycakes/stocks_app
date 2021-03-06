class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_approval, only: %i[create]
  before_action :authenticate_trader, only: %i[portfolio show_portfolio create]
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /transactions or /transactions.json
  def index
    @transactions = if current_user.trader
                      Transaction.where(trader_id: current_user.trader.id).order(date: :desc).page(params[:page])
                    else
                      Transaction.all.order(date: :desc).page(params[:page])
                    end
  end

  # GET /transactions/1 or /transactions/1.json
  def show; end

  def new
    @stocks = Stock.all
  end

  # GET /transactions/portfolio
  def portfolio
    @stocks = Stock.all
    @transactions = current_user.trader.transactions.select(:stock_id).distinct if current_user && current_user.trader
  end

  def show_portfolio
    @stock = Stock.find(params[:id])
    if current_user && current_user.trader
      @transactions = Transaction.where(trader_id: current_user.trader.id).where(stock_id: params.dig('id')).order(date: :desc)
    else
      @transactions = Transaction.where(stock_id: params.dig('id')).order(date: :desc)
    end
  end

  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transaction_url(@transaction), notice: 'Transaction was successfully created.' }
        format.json { render :portfolio, status: :created, location: @transaction }
      else
        @stock = @transaction.stock
        format.html { render 'stocks/show', status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:stock_id, :trader_id, :transaction_type, :stock_share, :date, :price)
  end

  def transaction_buys(stock_id)
    @transactions.where(stock_id: stock_id).where(transaction_type: 'buy').sum('price * stock_share')
  end
end
