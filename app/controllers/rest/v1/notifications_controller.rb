class Rest::V1::NotificationsController < ::Rest::V1::BaseApiController
  def index
    render json: NotificationSerializer.new(resource), status: :ok
  end

  def show
    notification = resource.find(params[:id])
    render json: NotificationSerializer.new(notification), status: :ok
  end

  def create
    notification = Notification.new(permitted_params)
    if notification.save
      render json: NotificationSerializer.new(notification), status: :created
    else
      render json: { error: 'Unable to create Notification' }, status: :bad_request
    end
  end

  def update
    notification = resource.find(params[:id])
    if notification.update(permitted_params)
      render json: { success: 'Notification successfully updated' }, status: :ok
    else
      render json: { error: 'Notification cannot be updated' }, status: :bad_request
    end
  end

  def destroy
    notification = resource.find(params[:id])

    notification.destroy
    render json: { success: 'Notification successfully deleted' }, status: :ok
  end

  private

  def permitted_params
    params.required(:notification).permit(:event_id, :enabled, :start_notifying_days_before, notifying_at: [])
  end
end
