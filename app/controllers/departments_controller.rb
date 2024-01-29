class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new department_params
    if @department.save
      flash[:notice] = "Отдел успешно создан"
    else
      flash[:alert] = @department.errors.full_messages.join("<br>").html_safe
    end
  end

  def edit
  end

  def update
    if @department.update department_params
      flash.now[:notice] = "Отдел успешно обновлён."
    else
      flash.now[:alert] = @department.errors.full_messages.join("<br>").html_safe
    end
  end



  def destroy
    if @department.users.present?
      flash.now[:alert] = "Отдел не может быть удалён, так как в нём присутствуют пользователи."
      return
    end

    if @department.destroy
      flash.now[:alert] = "Отдел успешно удалён."
    else
      flash.now[:alert] = @department.errors.full_messages.join("<br>").html_safe
    end
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:key, :name, user_ids: [])
  end

end