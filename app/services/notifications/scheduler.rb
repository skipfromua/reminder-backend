module Notifications
  class Scheduler
    def perform(user, notification)
      event = notification.event
      user_telegram_id = user.telegram_id
      debugger
      SendTelegramNotificationJob.set(wait_until: set_notification_datetime(notification)).perform_later(user_telegram_id, event)
    end

    private

    def set_notification_datetime(notification)
      send_at = notification.notify_at
      event_date = notification.event.date

      time_part = send_at.strftime("%H:%M")
      date_obj = event_date - notification.start_notifying_days_before.days

      DateTime.parse("#{date_obj} #{time_part}")
    end
  end
end
