class Role < ApplicationRecord
  validates :key, presence: true, uniqueness: true

  has_many :users
end
