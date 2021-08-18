class ApplicationController < ActionController::Base
    #crrlll 
    helper_method :current_user

    def current_user 
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end 

    def require_logged_in?
        redirect_to new_session_url if !logged_in? 
    end

    def require_logged_out?
        redirect_to new_user_url if logged_in?
    end

    def logged_in?
        !!@current_user
    end

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        @current_user.reset_session_token! if logged_in?
        session[:session_token] = nil 
        @current_user = nil 
    end
end
