class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	
	#protect_from_forgery with: :exception
	before_action :current_user

	def current_user
		# If we are in a development environment, hardcode the
		# current user and bypass authentication
		if ENV["RAILS_ENV"].eql?("development")
			@current_user ||= User.find 1
		else
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end
	end
end
