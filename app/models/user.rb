class User < ApplicationRecord
  enum role: %i[admin trader]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :trader, dependent: :destroy
  has_one :admin, dependent: :destroy
  accepts_nested_attributes_for :trader
  accepts_nested_attributes_for :admin
end
