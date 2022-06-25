class User < ApplicationRecord
  has_many :exchanges, dependent: :destroy
  has_one :bio
  has_many :trades, foreign_key: 'trader_id'
  has_many :subscriptions, foreign_key: 'trader_id'
  # has_many :positions, through: :subscriptions  ---> esto te daria las posiciones en los traders lo cual esta mal. Es porque solo esta hecha la ruta con trader_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def subscribers

  end
end
