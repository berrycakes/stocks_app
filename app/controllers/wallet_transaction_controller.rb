class WalletTransactionController < ApplicationController
  before_action :authenticate_user!, :authenticate_trader
  before_action :authenticate_approval, only: %i[new create]
  before_action :set_wallet, only: %i[show new create]

  def show
    @wallet_transaction = @wallet.wallet_transactions
  end

  def new
    @wallet_transaction = @wallet.wallet_transactions.build
  end

  def create
    @wallet_transaction = @wallet.wallet_transactions.build(wallet_params)

    if @wallet_transaction.save
      redirect_to wallet_transaction_path
    else
      render :new
    end
  end

  private

  def set_wallet
    @wallet = current_user.trader.wallet
  end

  def wallet_params
    params.require(:wallet_transaction).permit(:transaction_type, :amount, :wallet_id, :id)
  end
end
