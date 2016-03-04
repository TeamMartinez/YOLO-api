class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  #protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    # attempt to set current user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    # if the current user was not set, render unauthorized response to client
    render json: {errors: "Current user was not able to be assigned"},
      status: 403 unless @current_user
  end
end
