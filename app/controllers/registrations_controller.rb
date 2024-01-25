class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication
  before_action :require_admin, only: %i[new create]

  def create

    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        # set_flash_message! :notice, :signed_up
        flash.now[:notice] = "Пользователь успешно создан"
        sign_up(resource_name, resource)
        # respond_with resource, location: after_sign_up_path_for(resource) # ОТ МУЛЬТИПЕРЕНАПРАВЛЕНИЯ.НЕ УБИРАТЬ!
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        # respond_with resource, location: after_inactive_sign_up_path_for(resource) # ОТ МУЛЬТИПЕРЕНАПРАВЛЕНИЯ.НЕ УБИРАТЬ!
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render :new
    end

    # MY CODE
    if resource.role.key == 'user'
      resource.credential_ids = []
    end
    if resource.role.key == 'admin'
      resource.credential_ids = Credential.pluck(:id)
    end

    # respond_to do |format|
    #   format.html { super }
    #   format.turbo_stream {
    #     render turbo_stream: turbo_stream.replace("user-new", partial: "devise/registrations/success_registration")
    #   }
    # end
  end

  protected def sign_up(resource_name, resource)
    # DISABLE AUTOLOGIN AFTER REGISTRATION
  end

  protected def after_sign_up_path_for(resource)
    users_path
  end

  private

  def require_admin
    if current_user != nil
      unless current_user.admin?
        redirect_to root_path, alert: 'Доступ запрещен. Вы не администратор.'
        return
      end
    end
  end
end