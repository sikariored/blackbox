class SecureRecordDecorator < Draper::Decorator
  delegate_all

  def formatted_created_at
    l created_at, format: :long
  end

  def formatted_updated_at
    l updated_at, format: :long
  end

end
