class User < ApplicationRecord
  
  audited

  include PgSearch::Model
  pg_search_scope :search_everywhere, against: [:login, :email, :first_name, :last_name]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable, :timeoutable,
         :registerable

  validates :login, :email, presence: true, uniqueness: true
  validates :department_id, allow_nil: true, presence: true

  belongs_to :role
  belongs_to :department
  has_and_belongs_to_many :credentials
  has_many :secure_records
  has_many :notes

  # role definition
  def admin?
    self.role.key == 'admin'
  end

  # credentials definition
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

  def can_assign_credentials_to_user? # ok
    User.find_by(id: self.id).credentials.include?(Credential.find_by(key: 'can_assign_credentials_to_user'))
  end

  def can_edit_own_profile? # ok
    self.credentials.include?(Credential.find_by(key: 'can_edit_own_profile'))
  end

end
