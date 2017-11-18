class SessionsController < ApplicationController

	def new

	end

	def create
		@user= User.find_by(email: params[:session][:email])
		if @user and @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			redirect_to user_url(@user.id)
		else
			flash[:notice] = "Invalid Username or Password."
			redirect_to root_url
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have successfully logged out."
		redirect_to root_url
	end
end
