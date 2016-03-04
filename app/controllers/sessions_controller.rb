class SessionsController < ApplicationController   
  
  # blacklist all methods of sessions_controller from the
  # invokation of :current_user in applications_controller middleware
  skip_before_filter :current_user
  
  # create a session
  def create
    auth = request.env["omniauth.auth"]     
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to "/", :notice => "Signed in!"
  end

  # destroy a session
  def destroy
    session[:user_id] = nil
    redirect_to "/", :notice => "Signed out!"
  end

  # verify the user is authenticated
  def verify_auth
    # verify authentication based on presence of session[:user_id]
    if session[:user_id]
      user = User.find(session[:user_id])
      render json: {authenticated: true, user: user}
    else
      render json: {authenticated: false}
    end
  end
end
