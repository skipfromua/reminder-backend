class Rest::V1::NotificationsController < ::Rest::V1::BaseApiController
  def index
    render json: resource, status: :ok
  end

  def show
    notification = resource.find(params[:id])
    render json: notification
  end

  def create
    notification = Notification.new(permitted_params)
    if notification.save
      render json: notification, status: :created
    else
      render json: { error: 'Unable to create TodoList' }, status: :bad_request
    end
  end

  def update
    notification = resource.find(params[:id])
    if notification.present?
      notification.update(permitted_params)
      render json: { success: 'TodoList successfully updated' }, status: :ok
    else
      render json: { error: 'TodoList not found' }, status: :bad_request
    end
  end

  def destroy
    notification = resource.find(params[:id])
    if notification.present?
      notification.destroy
      render json: { success: 'TodoList successfully deleted' }, status: :ok
    else
      render json: { error: 'TodoList not found' }, status: :bad_request
    end
  end

  private

  def permitted_params
    params.required(:notification).permit(:event_id, :start_notifying, :notification_time)
  end
end
