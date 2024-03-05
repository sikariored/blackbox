class Department < ApplicationRecord
  validates :key, :name, presence: true, uniqueness: true
  audited
  has_many :users
end
