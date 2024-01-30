class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin?

  def cpanel
    render 'admin/cpanel'
  end

  private

  def require_admin?
    unless current_user.admin?
      render :plain => 'Вы не администратор'
    end
  end

end