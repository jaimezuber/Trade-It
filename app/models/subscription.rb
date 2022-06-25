class Subscription < ApplicationRecord
  belongs_to :trader, class_name: "User", foreign_key: "trader_id"
  belongs_to :subscriber, class_name: "User", foreign_key: "subscriber_id"
  has_many :positions

  # scope :trader_suscriptions, -> { where(current_user.id == self.subscriber_id) }
end
