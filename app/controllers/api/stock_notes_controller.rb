class Api::StockNotesController < ApplicationController

	def index
		binding.pry
		@stock_notes = @current_user.stock_notes
		render json: @stock_notes
	end
end