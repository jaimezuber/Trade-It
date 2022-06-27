class Trade < ApplicationRecord
  belongs_to :trader, class_name: "User", foreign_key: "trader_id"
  has_many :positions

  before_validation :upcase
  validates :symbol, inclusion: { in: ['BTC', 'ETH', 'BCH', 'ZEC', 'RCN', 'MTB18', 'LTC', 'RPC', 'UBI'],
                                  message: `%{value} no es una criptomoneda listada` }
  validates :symbol, :entry_price, :take_profit, :stop_loss, :side, presence: true

  private

  def upcase
    symbol.upcase!
  end
end
