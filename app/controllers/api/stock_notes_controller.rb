class Api::StockNotesController < ApplicationController

  def index
    @stock_notes = @current_user.stock_notes
    render json: @stock_notes
  end

  def create
    if @current_user.stock_notes.create(stock_note_params)
      render json: @current_user.stock_notes
    end
  end

  private
  def stock_note_params
    params.permit(:stock_abbreviation, :note)
  end
end