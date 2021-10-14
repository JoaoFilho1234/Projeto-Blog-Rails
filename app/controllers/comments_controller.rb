class CommentsController < ApplicationController


    def create
        @post.comments.create(comment_params.to_h.merge!({user_id: current_user.id}))
        redirect_to post_path(@post)
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end

    def set_post
        @post = Post.find(params[:post_id])
    end

end
