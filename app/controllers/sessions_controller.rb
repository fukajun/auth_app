class SessionsController < ApplicationController
  def new
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_by_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def failure
    flash[:notice] = params[:message]
    redirect_to new_session_url
  end
end
