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
every 1.hours do
  # runner "Task.schedule_upcoming_occurrences"
  # runner "TaskOccurrence.send_reminders"
  rake "necura:schedule_upcoming_occurrences"
  rake "necura:schedule_repeatable_items"
  rake "necura:send_reminders"
  # rake "necura:send_comment_notifications"
end