class Rest::V1::TodoListsController < ::Rest::V1::BaseApiController
  def index
    render json: resource, status: :ok
  end

  def show
    todo_list = resource.find(params[:id])
    render json: todo_list
  end

  def create
    todo_list = TodoList.new(permitted_params)
    if todo_list.save
      render json: todo_list, status: :created
    else
      render json: { error: 'Unable to create TodoList' }, status: :bad_request
    end
  end

  def update
    todo_list = resource.find(params[:id])
    if todo_list.present?
      todo_list.update(permitted_params)
      render json: { success: 'TodoList successfully updated' }, status: :ok
    else
      render json: { error: 'TodoList not found' }, status: :bad_request
    end
  end

  def destroy
    todo_list = resource.find(params[:id])
    if todo_list.present?
      todo_list.destroy
      render json: { success: 'TodoList successfully deleted' }, status: :ok
    else
      render json: { error: 'TodoList not found' }, status: :bad_request
    end
  end

  private

  def permitted_params
    params.required(:todo_list).permit(:event_id, :memo)
  end
end
