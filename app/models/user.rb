class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable, :timeoutable,
         :registerable

   validates :login, :email, presence: true

  belongs_to :role
  belongs_to :department
  has_and_belongs_to_many :credentials


  def admin?
    self.role.key == 'admin'
  end
  def can_create_role?
    User.find_by(id: self.id).credentials.include?(Credential.find_by(key: 'can_create_role'))
  end

  def can_assign_department_to_user?
    User.find_by(id: self.id).credentials.include?(Credential.find_by(key: 'can_assign_department_to_user'))
  end

  def can_edit_user?
    User.find_by(id: self.id).credentials.include?(Credential.find_by(key: 'can_edit_user'))
  end

  def can_create_user?
    User.find_by(id: self.id).credentials.include?(Credential.find_by(key: 'can_create_user'))
  end

  def can_assign_credentials_to_user?
    User.find_by(id: self.id).credentials.include?(Credential.find_by(key: 'can_assign_credentials_to_user'))
  end
end
