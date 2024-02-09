class NotesController < ApplicationController
  def index
    @all_notes = Note.where(user_id: current_user.id)
  end
end