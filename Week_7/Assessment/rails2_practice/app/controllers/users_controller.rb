class UsersController < ApplicationController
    def new 
        @user = User.new 
        render :new 
    end 

    def create 
        @user = User.new(user_params)

        if @user.save 
            login(@user)
            redirect_to users_url 
        else 
            flash.now[:errors] = ["Password is too short (minimum is 6 characters)"]
            render :new 
        end
    end 

    def show 
        if logged_in? 
            @user = current_user
            render :show 
        else 
            redirect_to new_session_url
        end
    end 

    def index 
        @users = User.all 
        if logged_in? 
            render :index 
        else
            redirect_to new_session_url 
        end 
    end

    private 
    def user_params 
        params.require(:user).permit(:username, :password)
    end
end
