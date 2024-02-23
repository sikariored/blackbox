class Department < ApplicationRecord
  validates :key, :name, presence: true, uniqueness: true

  has_many :users
end
