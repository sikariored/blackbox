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

  def remove_from_department
    @user = User.find(params[:id])
    @user.department_id = Department.find_by(key: "nil_department", name: "Нулевой отдел").id
    if @user.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update("user-info", partial: "user_info") }
      end
    else
      flash.now[:alert] = @user.errors.full_messages.join("<br>").html_safe
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :first_name, :last_name, :department_id, :password, :role_id, credential_ids: [])
  end

  def set_user!
    @user = User.find(params[:id]).decorate
  end

end