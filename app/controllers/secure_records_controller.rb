class SecureRecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]


  def index
    @all_records = SecureRecord.where(user_id: current_user.id)
  end

  def show
    record_author_full_name = @record.user.first_name + ' ' + @record.user.last_name
    @record_author = record_author_full_name.present? ? record_author_full_name : @record.user.login
  end

  def new
    @record = SecureRecord.new
  end

  def create
    @record = SecureRecord.new secure_record_params
    if @record.save
      flash.now[:notice] = "Запись успешно создана."
    else
      flash.now[:alert] = @record.errors.full_messages.join("<br>").html_safe
    end
  end

  def edit
  end

  def update
    if @record.update(secure_record_params)
      flash.now[:notice] = "Запись успешно обновлена."
    else
      flash.now[:alert] = @record.errors.full_messages.join("<br>").html_safe
    end
  end

  def destroy
    if @record.destroy
      flash.now[:alert] = "Запись успешно удалена."
    else
      flash.now[:alert] = @record.errors.full_messages.join("<br>").html_safe
    end
  end

  private

  def set_record
    @record = SecureRecord.find(params[:id]).decorate
  end

  def secure_record_params
    params.require(:secure_record).permit(:title, :description, :login, :password, :user_id)
  end
end
