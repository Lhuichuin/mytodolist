class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :require_login, only: [:edit, :update, :destroy]

	private 

	def current_user 
		@current_user ||= session[:user_id] &&
		User.find_by(id: session[:user_id])
	end 
	helper_method :current_user

	def require_login
		unless session[:user_id] 
			flash[:error] = "You must be logged in."
			redirect_to user_path
		end
	end
end
