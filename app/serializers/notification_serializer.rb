class NotificationSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :id, :enabled, :start_notifying_days_before, :notify_at
end
