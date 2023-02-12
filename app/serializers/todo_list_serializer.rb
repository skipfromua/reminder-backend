class TodoListSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :id, :memo, :created_at
end
