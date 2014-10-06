class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to vinyls_path
  	else
  		flash.now[:error] = "Invalid Sign-In"
      render new_session_path
  	end
  end

  def destroy
  	session[:user_id] = nil
    session[:index_preference] = nil
  	redirect_to root_path
  end
end
