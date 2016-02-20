class Api::StockNotesController < ApplicationController

	api :GET, '/stock_notes', 'Get all stock notes for the authenticated user'
	def index
		binding.pry
		@stock_notes = @current_user.stock_notes
		render json: @stock_notes
	end

	api :POST, '/stock_notes', 'Create a stock note associated with the current user'
	param :stock_note, Hash, 'Stock Note to create' do
		param :stock_abbreviation, String, 'The abbreviation of the stock'
		param :note, String, 'The note regarding the stock'
	end
	def create
		binding.pry
		if @current_user.stock_notes.create(stock_note_params)
			render json: @current_user.stock_notes
		end
	end

	private
	def stock_note_params
		params.require(:stock_note).permit(:stock_abbreviation, :note)
	end
end