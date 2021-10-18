class CommentsController < ApplicationController
    def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to post_path(@post)
	end


	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy!

		redirect_to post_path(@post)
	end

	def change_status
    @post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

    @comment.update!(status: params[:status])

    redirect_to post_path(@post)
  end

	def manage_comment
		@post = Post.find(params[:id])
		p "sdsa"
	end

	private

	def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
