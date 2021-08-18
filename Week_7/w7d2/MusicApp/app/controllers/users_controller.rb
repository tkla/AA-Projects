class UsersController < ApplicationController
    before_action :require_logged_out?, except: :show

    def new 
        @user = User.new 
        render :new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            login(@user)
            redirect_to user_url(@user)
        else 
            redirect_to new_user_url 
        end
    end

    def show 
        @user = current_user 
        render :show 
    end

    def index 
        @user = User.new 
        render :index 
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
