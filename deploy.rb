namespace :mailman do
  desc "Mailman::Start"
  task :start, :roles => [:app] do
    run "cd #{current_path};RAILS_ENV=#{rack_env} bundle exec script/mailman_daemon start"
  end
  
  desc "Mailman::Stop"
  task :stop, :roles => [:app] do
    run "cd #{current_path};RAILS_ENV=#{rack_env} bundle exec script/mailman_daemon stop"
  end
  
  desc "Mailman::Restart"
  task :restart, :roles => [:app] do
    mailman.stop
    mailman.start
  end
end