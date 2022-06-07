class NotificationSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :enabled, :start_notifying_days_before, :notifying_at
end
