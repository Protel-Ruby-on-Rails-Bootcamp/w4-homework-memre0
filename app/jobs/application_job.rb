class ApplicationJob < ActiveJob::Base

  def perform(action_type)

    case action_type
    when "check_comment_status"
      check_comment_status
    end
  end

  private

  def check_comment_status
    comments = Comment.all
    comments.each do |comment|
      comment.status = true if !comment_time_past?(comment)
      comment.save
    end
  end
end
