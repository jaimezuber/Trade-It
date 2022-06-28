class Exchange < ApplicationRecord
  belongs_to :user
  validates :read_key, :write_key, presence: true, length: { is: 64 }, uniqueness: true

end
