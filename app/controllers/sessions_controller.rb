class SessionsController < ApplicationController   
  def create
    auth = request.env["omniauth.auth"]     
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    # TODO: Instead, must redirect to YOLO-client
    redirect_to "https://google.com", :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    # TODO: Instead, must redirect to YOLO-client
    redirect_to "https://google.com", :notice => "Signed out!"
  end
end
