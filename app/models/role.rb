class Role < ApplicationRecord
  validates :key, presence: true, uniqueness: true

  has_and_belongs_to_many :users
  has_and_belongs_to_many :credentials
end
