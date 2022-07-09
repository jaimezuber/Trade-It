class Exchange < ApplicationRecord
  belongs_to :user
  validates :public_key, :private_key, presence: true, length: { is: 64 }, uniqueness: true
  validates :user, presence: true, uniqueness: true
end
