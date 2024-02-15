class NotesController < ApplicationController
  before_action :set_note!, only: %i[show edit update destroy]

  def index
    @notes = Note.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new note_params
    if @note.save
      flash.now[:notice] = "Заметка создана"
    else
      flash.now[:alert] = "Ошибка при создании заметки"
    end
  end

  def edit
  end

  def update
    @note.update note_params
  end

  def destroy
    @note.destroy
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :user_id)
  end

  def set_note!
    @note = Note.find(params[:id]).decorate
  end

end