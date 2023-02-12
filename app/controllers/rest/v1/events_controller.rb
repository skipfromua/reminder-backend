class Rest::V1::EventsController < ::Rest::V1::BaseApiController
  def index
    render json: EventSerializer.new(resource), status: :ok
  end

  def show
    event = resource.find(params[:id])
    render json: EventSerializer.new(event), status: :ok
  end

  def create
    event = current_user.events.new(permitted_params)
    if event.save
      render json: EventSerializer.new(event), status: :created
    else
      render json: { error: 'Unable to create event' }, status: :bad_request
    end
  end

  def update
    event = resource.find(params[:id])
    if event.update(permitted_params)
      render json: { success: 'Event successfully updated' }, status: :ok
    else
      render json: { error: 'Event cannot be updated' }, status: :bad_request
    end
  end

  def destroy
    events = resource.where(id: params[:eventIds])

    render json: EventSerializer.new(events.destroy_all), status: :ok
  end

  private

  def permitted_params
    params.required(:event).permit(:name, :repeatable, :date, :starts_at, :finished_at, :user_id)
  end
end
