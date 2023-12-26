class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :source
end
