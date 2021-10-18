class PagesController < ApplicationController
  
  def about
  end

  def profile
    p "params[:id] ====== #{params[:aid]}"
    post = Post.find(params[:id])
    @user = User.find(post.user_id)
  end
end
