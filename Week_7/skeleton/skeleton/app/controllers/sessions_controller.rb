class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(user_params[:username], user_params[:password])

        if @user == nil 
            redirect_to users_url 
        else 
            login_user!(@user)
            redirect_to cats_url 
        end

    end

    def destroy
        logout_user!
        render :new 
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end
