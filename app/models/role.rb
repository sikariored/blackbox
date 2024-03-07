class Role < ApplicationRecord
  validates :key, presence: true, uniqueness: true
  audited
  has_many :users

  def show_name
    if self.name.present?
      self.name
    else
      self.key
    end
  end
end
