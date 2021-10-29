desc "This task is called by the Heroku scheduler add-on"


task :accept_old_commits => :environment do
  ApplicationJob.perform_later("check_comment_status")
end