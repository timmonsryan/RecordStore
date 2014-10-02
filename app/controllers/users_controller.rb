class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	flash[:success] = "You have registered for RecordStore.  Welcome!"
  	redirect_to home_path
  end

  def edit
  end

  private
  	def user_params
  		params.require(:user).permit(:email, :name, :password, :password_confirmation)
  	end
end
