class Rest::V1::EventsController < ::Rest::V1::BaseApiController
  def index
    render json: resource, status: :ok
  end

  def show
    event = resource.find(params[:id])
    render json: event
  end

  def create
    event = Event.new(permitted_params)
    if event.save
      render json: event, status: :created
    else
      render json: { error: 'Unable to create event' }, status: :bad_request
    end
  end

  def update
    event = resource.find(params[:id])
    if event.exists?
      event.update(permitted_params)
      render json: { success: 'Event successfully updated' }, status: :ok
    else
      render json: { error: 'Event not found' }, status: :bad_request
    end
  end

  def destroy
    event = resource.find(params[:id])
    if event.exists?
      event.destroy
      render json: { success: 'Event successfully deleted' }, status: :ok
    else
      render json: { error: 'Event not found' }, status: :bad_request
    end
  end

  private

  def permitted_params
    params.required(:event).permit(:name, :repeatable, :date, :starts_at, :finished_at, :user_id)
  end
end
