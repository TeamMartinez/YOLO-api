class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  #protect_from_forgery with: :exception

  before_action :set_current_user

  private
  def set_current_user
  	user_ids = User.all.pluck(:id)
  	@current_user = User.find(user_ids.sample)
	end
end
