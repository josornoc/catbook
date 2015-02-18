# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# Learn more: http://github.com/javan/whenever


set :output, { error: "log/error.log", standard: "log/cron.log" }

every 1.minute do
  runner "CronExample.create(current_time: Time.now)"
end

# Run whenever --set environment=development and review the config that will be included in your crontab
# Run whenever --update-crontab --set environment=development you update your crontab
# Review your crontab with crontab -l
# Check everything that you can do in the official website! https://github.com/javan/whenever
# REMEMBER AT THE END OF THE DAY CLEANUP THE CRONTAB CONFIG crontab -e



