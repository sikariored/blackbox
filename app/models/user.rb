class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :trackable, :timeoutable

  validates :login, :email, presence: true

  belongs_to :role
  has_and_belongs_to_many :credentials

  def can_create_role?
    User.find_by(id: self.id).credentials.include?(Credential.find_by(key: 'can_create_role'))
  end
end
