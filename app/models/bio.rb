class Bio < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :username, presence: true, length: { in: 4..30 }, uniqueness: true
end
