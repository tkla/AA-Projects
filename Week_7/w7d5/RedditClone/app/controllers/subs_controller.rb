class SubsController < ApplicationController
    before_action :require_logged_in, only: [:new, :destroy, :edit]
    before_action :is_moderator?, only: [:edit, :destroy, :update]

    def new 
        @subs = Sub.new 
        render :new 
    end 

    def show 
        @sub = Sub.find_by(id: params[:id])
        if @sub
            render :show 
        else 
            flash[:errors] = ["No sub with that Id"]
            redirect_to subs_url 
        end 
    end 

    def index 
        @subs = Sub.all 
        render :index 
    end 

    def create
        @sub = Sub.new(sub_params) 
        @sub.moderator = params[:user_id] 

        if @sub.save 
            redirect_to sub_url(@sub) 
        else 
            flash.now[:errors] = ["Please include both title and description"]
            render :new 
        end
    end

    def destroy 
        @sub = current_user.subs.find_by(id: params[:id])
        if @sub && @sub.delete 
        else 
            flash[:errors] = ["Sub does not exist"] 
        end 
        redirect_to subs_url 
    end 

    def edit
    end 

    def update 
    end 

    def is_moderator? 
        sub = Sub.find_by(id: params[:id])

        if current_user != sub.creator
            flash[:errors] = ["You do not own this subreddit"] 
            redirect_to subs_url 
            false
        else 
            true
        end
    end

    private 
    def sub_params 
        params.require(:sub).permit(:title, :description)
    end

end
