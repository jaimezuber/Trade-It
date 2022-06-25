class Position < ApplicationRecord
  belongs_to :trade
  belongs_to :subscription
end
