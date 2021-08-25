class PoemsController < ApplicationController
    before_action :require_logged_in, only: [:index, :edit, :update, :create, :new]

    def index 
        @poems = Poem.all
        render :index 
    end

    def new 
        @user = current_user 
        @poem = Poem.new
        render :new 
    end

    def create 
        @poem = Poem.new(poem_params) 
        @poem.author_id = current_user.id 
        if @poem.save
            redirect_to poems_url 
        else 
            if poem_params[:title].length < 1 
                flash.now[:errors] = ["Title can't be blank"]
            else 
                flash.now[:errors] = ["Stanzas can't be blank"]
            end
            render :new 
        end 
    end 

    def edit 
        @poem = Poem.find_by(id: params[:id])
        if @poem 
            render :edit 
        else 
            flash[:errors] = ["No poem with that id"]
        end 
    end

    def update 
        @poem = Poem.find_by(id: params[:id])
        if !@poem 
            flash[:errors] = ["No poem with that id"]
            redirect_to poems_url 
            return 
        end 

        if @poem.author_id != current_user.id 
            flash[:errors] = ["Something went wrong!"]
        elsif @poem.update(poem_params)
           
        else 
            flash[:errors] = ["Something went wrong!"]
            render :edit 
            return 
        end
        redirect_to poems_url 
    end 

    private 
    def poem_params 
        params.require(:poem).permit(:title, :stanzas, :complete)
    end
end
