class CommentsController < ApplicationController

    def create 
        @comment = Comment.new(comment_params)
        if @comment.save 
            redirect_to blog_url(@comment.blog_id)
        else 
            redirect_to blog_url(@comment.blog_id)
        end
    end

    def destroy
        @Comment = Comment.find_by(id: params[:id])
        blog = @Comment.blog_id 

        @Comment.destroy 
        redirect_to blog_url(blog)
    end


    private 
    def comment_params 
        params.require(:comment).permit(:body, :author_id, :blog_id)
    end
end
