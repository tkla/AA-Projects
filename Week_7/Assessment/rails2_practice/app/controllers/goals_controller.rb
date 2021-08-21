class GoalsController < ApplicationController

    def create 
        @goal = Goal.new(goal_params)
        @goal.user_id = params[:user_id]
        
        if !logged_in?
            redirect_to new_session_url
            return 
        end 

        if @goal.save 
            redirect_to user_url(@goal.user)
        else 
            flash[:errors] = ["Details can't be blank"]
            redirect_to user_url(@goal.user)
        end
    end

    def destroy 
        @goal = Goal.find_by(id: params[:id])

        if !logged_in? 
            redirect_to new_session_url 
            return 
        end

        if current_user.id == @goal.user_id
            @goal.delete 
            redirect_to users_url     
        end

    end 

    private 
    def goal_params
        params.require(:goal).permit(:name,:details, :status)
    end
end
