class Role < ApplicationRecord
  validates :key, presence: true, uniqueness: true
  audited
  has_many :users
end
