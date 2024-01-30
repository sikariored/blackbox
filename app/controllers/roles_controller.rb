class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all.order created_at: :desc
  end

  def show
    @search_results = User.search_everywhere(params[:query])
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new roles_params
    if @role.save
      flash[:notice] = "Роль успешно создана."
    else
      flash[:alert] = @role.errors.full_messages.join("<br>").html_safe
    end
  end

  def edit
  end

  def update
    if @role.update roles_params
      flash.now[:notice] = "Роль успешно обновлена."
    else
      flash.now[:alert] = @role.errors.full_messages.join("<br>").html_safe
    end
  end

  def destroy
    if @role.users.present?
      flash.now[:alert] = "Роль не может быть удалена, так как в ней присутствуют пользователи."
    elsif @role.destroy
      flash.now[:alert] = "Роль успешно удалена."
    else
      flash.now[:alert] = @role.errors.full_messages.join("<br>").html_safe
    end
  end

  private

  def roles_params
    params.require(:role).permit(:key, :name, user_ids: [])
  end

  def set_role
    @role = Role.find(params[:id])
  end
end