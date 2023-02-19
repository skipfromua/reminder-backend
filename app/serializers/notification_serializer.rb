class NotificationSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :id, :enabled, :start_notifying_days_before

  attribute :notify_at do |notification|
    notification.notify_at&.strftime("%H:%M")
  end
end
