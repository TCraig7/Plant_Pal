class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @note.plant_id = params[:plant_id]

    @note.save

    redirect_to plant_path(@note.plant)
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
