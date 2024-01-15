class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user!, only: %i[show edit update]

  def index
    @users = User.order created_at: :desc
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :department_id, credential_ids: [])
  end

  def set_user!
    @user = User.find(params[:id])
  end
end