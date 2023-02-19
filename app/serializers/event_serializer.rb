class EventSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :id, :name

  attribute :date do |event|
    event.date&.strftime("%m-%d")
  end
end
