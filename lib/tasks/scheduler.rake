desc "This task is called by the Heroku scheduler add-on"
task :run_daily_job => :environment do
  puts "==> [DailyJob] Running..."
  DailyJob.perform_now
  puts "==> [DailyJob] Done..."
end
