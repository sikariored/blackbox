class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication
  before_action :require_admin, only: [:new]
  def create
    super do |resource|
      if resource.role_id == 2
        resource.credential_ids = [1, 2]
      end
      if resource.role_id == 1
        resource.credential_ids = Credential.pluck(:id)
      end
    end
  end

  private

  def require_admin
    if current_user != nil
      unless current_user.admin?
        redirect_to root_path, alert: 'Доступ запрещен. Вы не администратор.'
      end
    end
  end
end