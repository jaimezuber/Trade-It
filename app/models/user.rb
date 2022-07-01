class User < ApplicationRecord
  has_one :exchange, dependent: :destroy
  has_one :bio, dependent: :destroy
  has_many :trades, foreign_key: 'trader_id', dependent: :nullify
  has_many :subscriptions, foreign_key: 'trader_id'
  has_many :subscriptions_as_subscriber, class_name: :Subscription, foreign_key: 'subscriber_id'
  has_many :positions, through: :subscriptions_as_subscriber

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
