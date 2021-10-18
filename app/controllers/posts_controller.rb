class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.where(status: true).order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def show
		set_post
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		set_post
	end

	def update
		set_post

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		set_post
		@post.destroy

		redirect_to posts_path
	end

	def profile
		set_post
		@user = User.find(@post.user_id)

	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :status)
	end
end
