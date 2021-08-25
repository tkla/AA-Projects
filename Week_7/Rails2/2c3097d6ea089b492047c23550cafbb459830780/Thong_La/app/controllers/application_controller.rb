class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :auth_token 

    def auth_token 
        html = "<input type='hidden' 
            name='authenticity_token' 
            value='#{form_authenticity_token}'>
            ".html_safe
    end

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in 
        if !logged_in? 
            redirect_to new_session_url 
        end 
    end

    def require_logged_out 
        if logged_in? 
            redirect_to users_url 
        end 
    end

    def logged_in?
        !!current_user 
    end

    def login!(user)
        @current_user = user 
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        @current_user.reset_session_token!
        @current_user = nil 
        session[:session_token] = nil 
    end
end
