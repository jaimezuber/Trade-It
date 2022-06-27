class Trade < ApplicationRecord
  belongs_to :trader, class_name: "User", foreign_key: "trader_id"
  has_many :positions

  before_validation :upcase
  validates :symbol, inclusion: { in: ['BTC', 'ETH', 'BCH', 'ZEC', 'RCN', 'MTB18', 'LTC', 'RPC', 'UBI'],
                                  message: `%{value} no es una criptomoneda listada` }
  validates :symbol, :entry_price, :take_profit, :stop_loss, :side, presence: true
  validates :side, inclusion: { in: ['BUY', 'SELL'] }
  validates :entry_price, :take_profit, :stop_loss, numericality: true
  validate :sl_logic
  validate :tp_logic

  private

  def sl_logic
    if side == 'SELL'
      errors.add(:stop_loss, "must be greater than entry price in a sell position") unless
        stop_loss > entry_price
    else
      errors.add(:stop_loss, "must be lower than entry price in a buy position") unless
        stop_loss < entry_price
    end
  end

  def tp_logic
    if side == 'BUY'
      errors.add(:take_profit, "must be greater than entry price in a buy position") unless
        take_profit > entry_price
    else
      errors.add(:take_profit, "must be lower than entry price in a sell position") unless
        take_profit < entry_price
    end
  end

  def upcase
    symbol&.upcase!
    side&.upcase!
  end
end
