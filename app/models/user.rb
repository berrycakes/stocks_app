class User < ApplicationRecord
  enum role: %i[admin trader]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :trader, dependent: :destroy
  has_one :admin, dependent: :destroy
  has_many :transactions
  accepts_nested_attributes_for :trader
  accepts_nested_attributes_for :admin
  before_create :build_association

  def build_association
    return unless trader.nil?

    case role
    when 'admin'
      build_admin
    when 'trader'
      build_trader
      trader.build_wallet
    else
      'Error'
    end
  end
end
