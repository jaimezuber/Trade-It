class Subscription < ApplicationRecord
  belongs_to :trader, class_name: "User", foreign_key: "trader_id"
  belongs_to :subscriber, class_name: "User", foreign_key: "subscriber_id"
  has_many :positions

  # scope :trader_suscriptions, -> { where(current_user.id == self.subscriber_id) }

  validate :amount_logic
  validates :subscriber, uniqueness: { scope: :trader, message: "you are already subscribed" }

  private

  def amount_logic
    errors.add(:amount_per_trade, "can't be greate than your total amount") unless
      amount_per_trade < max_amount
  end
end
