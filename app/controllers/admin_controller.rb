class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin?

  def index
  end

  private

  def require_admin?
    if current_user.admin?
    else
      render :plain => 'Вы не администратор'
    end
  end

end