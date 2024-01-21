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
end
