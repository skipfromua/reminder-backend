# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

every 1.days, at: '12pm' do
  rake "update_events_date"
  rake "send_notification_to_subscriptions"
end

# Learn more: http://github.com/javan/whenever
