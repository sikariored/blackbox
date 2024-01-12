class RegistrationsController < Devise::RegistrationsController
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
end