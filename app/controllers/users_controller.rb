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
    @user.update(user_params)
  end

  def destroy
    @user.destroy

  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :role_id, :department_id, :password, credential_ids: [])
  end

  def set_user!
    @user = User.find(params[:id]).decorate
  end
end