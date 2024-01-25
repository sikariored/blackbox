class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  def index
    @roles = Role.all.order created_at: :desc
  end

  def show
  end

  def new
    if current_user.can_create_role?
      @role = Role.new
    else
      redirect_to roles_path
      flash[:alert] = "У вас нет прав для создания роли"
    end
  end

  def create
    @role = Role.new roles_params
    if @role.save
      redirect_to roles_path
      flash[:notice] = "Роль успешно создана."
    else
      redirect_to new_role_path
      flash[:alert] = "Роль не создана."
    end

  end

  def edit
  end

  def update
    if @role.update roles_params
      flash.now[:notice] = "Роль успешно обновлена."
    else
      flash.now[:alert] = @user.errors.full_messages.join("<br>").html_safe
    end
  end

  def destroy
  end

  private

  def roles_params
    params.require(:role).permit(:key)
  end

  def set_role
    @role = Role.find(params[:id])
  end
end