class Trade < ApplicationRecord
  belongs_to :trader, class_name: "User", foreign_key: "trader_id"
  has_many :positions

  before_validation :upcase
  validates :symbol, inclusion: { in: ['BTC', 'ETH', 'BCH', 'ZEC', 'RCN', 'MTB18', 'LTC', 'RPC', 'UBI'],
                                  message: `%{value} no es una criptomoneda listada` }
  validates :symbol, :entry_price, :take_profit, :stop_loss, :side, presence: true
  validates :side, inclusion: { in: ['BUY', 'SELL'] }
  # validates :entry_price, :take_profit, :stop_loss, type: Numeric

  private

  def upcase
    symbol.upcase!
    side.upcase!
  end
end
