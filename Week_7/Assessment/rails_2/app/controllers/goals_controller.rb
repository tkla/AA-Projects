class GoalsController < ApplicationController
    before_action :require_login, only: [:create, :destroy] 
    before_action :verify_owner, only: [:destroy]
    def new 
        @goal = Goal.new 
        render :new 
    end 

    def create 
        @goal = Goal.new(goal_params) 
        @goal.user_id = params[:user_id]

        if @goal.save 
            redirect_to user_url(@goal.user_id)
        else 
            flash[:errors] = ["Details can't be blank"]
            redirect_to user_url(@goal.user_id)
        end 
    end

    def destroy 
        @goal = Goal.find_by(id: params[:id])
        @goal.delete 
        redirect_to users_url 
    end

    def verify_owner 
        @goal = Goal.find_by(id: params[:id])
        redirect_to user_url(@goal.user_id) unless @goal.user_id == current_user.id 
    end
    
    private 
    def goal_params
        params.require(:goal).permit(:name, :details, :status)
    end
end
