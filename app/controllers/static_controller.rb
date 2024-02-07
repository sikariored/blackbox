class StaticController < ApplicationController
  before_action :authenticate_user!
  def home
  end

  def upanel
    render 'upanel'
  end
end
