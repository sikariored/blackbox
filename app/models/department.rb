class Department < ApplicationRecord
  validates :key, :name, uniqueness: true
  validates :key, presence: true

  has_many :users
end
