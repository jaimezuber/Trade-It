class Bio < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  before_validation :two_digits
  validates :username, presence: true, length: { in: 4..30 }, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_username,
                  against: [:username],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }

  private

  def two_digits
    self.rendimiento = rendimiento.round(2)
    self.volatilidad = volatilidad.round(2)
  end
end
