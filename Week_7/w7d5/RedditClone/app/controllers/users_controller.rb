class UsersController < ApplicationController

    def new 
        @user = User.new
        render :new 
    end 

    def index 
        @user = User.all 
        render :index 
    end 

    def create
        @user = User.new(user_params)
        if @user.save 
            login(@user)
            redirect_to user_url(@user)
        else 
            flash.now[:errors] = ["Password must be minimum length of 6"]
            render :new 
        end
    end 
    
    def show 
        @user = User.find_by(id: params[:id]) 
        if @user 
            render :show
        else 
            flash[:errors] = ["There is no user with that id"]
            redirect_to users_url 
        end
    end 

    private 
    def user_params 
        params.require(:user).permit(:username, :password) 
    end
end
