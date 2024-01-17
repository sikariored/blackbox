class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication
  before_action :require_admin, only: %i[new create]
  def create
    super do |resource|
      if resource.role.key == 'user'
        resource.credential_ids = [1, 2]
      end
      if resource.role.key == 'admin'
        resource.credential_ids = Credential.pluck(:id)
      end
    end
  end

  protected def sign_up(resource_name, resource)
    # DISABLE AUTOLOGIN AFTER REGISTRATION
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