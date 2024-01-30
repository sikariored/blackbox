class UserDecorator < Draper::Decorator
  delegate_all

  def formatted_created_at
    l created_at, format: :long
  end

  def formatted_updated_at
    l updated_at, format: :long
  end

  def formatted_last_sign_in_at
    l last_sign_in_at, format: :long
  end

  def show_full_name
    full_name = self.first_name + ' ' + self.last_name
    if self.first_name.present? && self.last_name.present?
      full_name
    else
      self.login
    end
  end

  def show_role
    if self.role.name.present?
      self.role.name
    else
      self.role.key
    end
  end

end
