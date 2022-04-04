class User < ApplicationRecord
  enum role: %i[admin trader]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :trader
  has_one :admin
  accepts_nested_attributes_for :trader
  accepts_nested_attributes_for :admin

  has_many :transactions
end
