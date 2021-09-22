class ApplicationController < ActionController::Base
	helper_method :current_user, :logged_in?
	skip_before_action :verify_authenticity_token

	def current_user 
		@current_user = User.find_by(session_token: session[:session_token])
	end

	def require_login
		if !logged_in? 
			redirect_to new_session_url 
		end 
	end

	def require_logout 
		if logged_in?
			redirect_to users_url 
		end 
	end

	def logged_in?
		!!current_user
	end

	def login(user)
		@current_user = user 
		session[:session_token] = user.reset_session_token! 
	end

	def logout!
		current_user.reset_session_token! if logged_in?
		current_user = nil 
		session[:session_token] = nil 
	end
end