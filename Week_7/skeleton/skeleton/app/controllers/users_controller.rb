class UsersController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]

    def create 
        @user = User.new(user_params) 

        if @user.save 
            login_user!(@user)
            redirect_to cats_url 
        else 
            render :new 
        end
    end

    def new 
        @user = User.new 
        render :new 
    end

    private 

    def user_params
       params.require(:user).permit(:username, :password)  
    end
end
