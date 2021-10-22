class PagesController < ApplicationController
  
  def about
    @user = User.find(current_user.id)
    @posts = Post.where(user_id: @user.id)
    @comments = Comment.where(user_id: @user.id)
  end
end
