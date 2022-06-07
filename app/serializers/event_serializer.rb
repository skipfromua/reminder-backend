class EventSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :name, :date
end
