# frozen_string_literal: true

task send_notification_to_subscriptions: :environment do
  Notifications::Send.new.perform
end
