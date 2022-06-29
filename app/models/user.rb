class User < ApplicationRecord
  has_one :exchange, dependent: :destroy
  has_one :bio, dependent: :destroy
  has_many :trades, foreign_key: 'trader_id', dependent: :nullify
  has_many :subscriptions, foreign_key: 'trader_id'

  # Ver un has_many que le puedas cambiar el nombre ej: has_many :subscriptions_of_subscriber y que te de las subscripciones que sos subscriber nada mas
  # has_many :positions, through: :subscriptions  ---> esto te daria las posiciones en los traders lo cual esta mal. Es porque solo esta hecha la ruta con trader_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
