module ApplicationHelper
  def my_comment?(current_user, comment_user_id)
    current_user.id == comment_user_id
  end

  def my_post(current_user, post_user_id)
    current_user.id == post_user_id
  end

  def comment_time_past?(comment)
    (Time.now - (2.day)) > comment.created_at
  end
end
