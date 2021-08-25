class UsersController < ApplicationController
    def new 
        @user = User.new 
        render :new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to poems_url 
        else 
            if user_params[:password].length < 6 
                flash.now[:errors] = ["Password is too short (minimum is 6 characters)"]
            else
                flash.now[:errors] = ["Username can't be blank"]
            end
            render :new 
        end
    end 

    private 
    def user_params 
        params.require(:user).permit(:username, :password)
    end
end
