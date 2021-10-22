class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id, status: true)
  end

  def feed
    @posts = current_user.feed
  end

end
