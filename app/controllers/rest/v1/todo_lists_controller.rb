class Rest::V1::TodoListsController < Rest::V1::BaseApiController
  def index
    render json: TodoListSerializer.new(resource), status: :ok
  end

  def show
    todo_list = resource.find(params[:id])
    render json: TodoListSerializer.new(todo_list), status: :ok
  end

  def create
    todo_list = TodoList.new(permitted_params)
    if todo_list.save
      render json: TodoListSerializer.new(todo_list), status: :created
    else
      render json: { error: 'Unable to create TodoList' }, status: :bad_request
    end
  end

  def update
    todo_list = resource.find(params[:id])
    if todo_list.update(permitted_params)
      render json: { success: 'TodoList successfully updated' }, status: :ok
    else
      render json: { error: 'TodoList cannot be updated' }, status: :bad_request
    end
  end

  def destroy
    todo_lists = resource.where(id: params[:eventIds])

    render json: TodoListSerializer.new(todo_lists.destroy_all), status: :ok
  end

  private

  def permitted_params
    params.required(:todo_list).permit(:event_id, :memo)
  end
end
