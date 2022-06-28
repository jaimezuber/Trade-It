class Bio < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :username, presence: true, length: { in: 4..30 }, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_username,
    against: [ :username ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
