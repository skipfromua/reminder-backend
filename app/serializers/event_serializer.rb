class EventSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :id, :name, :date
end
