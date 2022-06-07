class TodoListSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :memo, :created_at
end
