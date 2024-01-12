class UsersController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def edit
    @user = User.find(params[:id])
    @credentials = Credential.all
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
    params.require(:user).permit(:login, :email, credential_ids: [])
  end
end