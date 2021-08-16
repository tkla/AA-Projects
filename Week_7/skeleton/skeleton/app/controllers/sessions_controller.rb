class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        @user.password_digest = BCrypt::Password.create(@user.password)
        begin 
            @user.reset_session_token!
            if @user.save
                redirect_to cats_url
            else
                render :new
            end
        rescue StandardError
            render :new
        end

    end

    def destroy
        
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end
