class SessionsController < ApplicationController   
  skip_before_filter :current_user, only: [:create, :destroy]
  def create
    auth = request.env["omniauth.auth"]     
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to "http://vm344a.se.rit.edu/", :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to "http://vm344a.se.rit.edu/", :notice => "Signed out!"
  end
end
