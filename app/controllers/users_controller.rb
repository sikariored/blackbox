class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user!, only: %i[show edit update destroy]

  def index
    @users = User.order created_at: :desc
  end

  def show
  end

  def edit
  end

  def update
    if @user.update user_params
      flash.now[:notice] = "Пользователь успешно обновлен"
    else
      flash.now[:alert] = @user.errors.full_messages.join("<br>").html_safe
    end
  end

  def destroy
    if @user.admin?
      flash.now[:alert] = "Нельзя удалить администратора"
      return
    end

    if @user.destroy
      flash.now[:alert] = "Пользователь успешно удален"
    else
      flash.now[:alert] = @user.errors.full_messages.join("<br>").html_safe
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :department_id, :password, :role_id, credential_ids: [])
  end

  def set_user!
    @user = User.find(params[:id]).decorate
  end

end