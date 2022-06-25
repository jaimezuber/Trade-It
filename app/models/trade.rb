class Trade < ApplicationRecord
  belongs_to :trader, class_name: "User", foreign_key: "trader_id"
  has_many :positions
end
