module Notifications
  class Send
    attr_reader :bot

    def initialize(bot: Telegram.bot)
      @bot = bot
    end

    def perform
      Subscription.find_each do |sub|
        user_events = sub.user.events.where(date: Date.tomorrow)

        bot.send_message(chat_id: sub.chat_id,
                         text: "Tomorrow events:\n#{prettified_events(user_events)}")
      end
    end

    private

    def prettified_events(events)
      events.map(&:name).join("\n")
    end
  end
end
