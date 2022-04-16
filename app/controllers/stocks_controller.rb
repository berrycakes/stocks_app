class StocksController < ApplicationController
  before_action :set_stock, only: %i[ show edit update destroy get_market_data watchlist]

  def index
    @stocks = Stock.page(params[:page])
  end

  # GET /stocks/1 or /stocks/1.json
  def show
    @transaction = Transaction.new
    if @stock.available_shares
      @available = @stock.available_shares
    else  
      @available = 0
    end
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks or /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to stock_url(@stock), notice: "Stock was successfully created." }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1 or /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to stock_url(@stock), notice: "Stock was successfully updated." }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1 or /stocks/1.json
  def destroy
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to stocks_url, notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def watchlist
    type = params[:type]
    
    if type == "watchlist"
      watchlist = Watchlist.new(:trader_id => current_user.trader.id, :stock_id => @stock.id)
      watchlist.save
      redirect_to root_url, notice: "Added #{@stock.name} to watchlist"

    elsif type == "unwatchlist"
      watchlist = Watchlist.where(:trader_id => current_user.trader.id, :stock_id => @stock.id).ids[0]
      Watchlist.destroy(watchlist)
      redirect_to root_url, notice: "Removed #{@stock.name} from watchlist"

    else
      redirect_to stocks_url, notice: 'No action'
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:name, :description, :maxsupply, :currency_symbol, :slug)
    end

end
