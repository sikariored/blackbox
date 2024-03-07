class StaticController < ApplicationController
  before_action :authenticate_user!

  def upanel
    render 'upanel'
  end
end
