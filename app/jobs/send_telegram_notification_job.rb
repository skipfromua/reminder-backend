class SendTelegramNotificationJob < ApplicationJob
  def perform(user_telegram_id, event)
    text = "Don't forget about upcoming event! #{event.name} - #{event.date}"

    Telegram.bot.send_message(chat_id: user_telegram_id, text: text)
  end
end
