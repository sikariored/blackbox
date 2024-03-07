class Department < ApplicationRecord
  validates :key, :name, presence: true, uniqueness: true
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
