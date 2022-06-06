class Rest::V1::EventsController < ::Rest::V1::BaseApiController
  def index
    @events = current_user.events
    render json: @events, status: :ok
  end

  def show
    @event = current_user.events.find(params[:id])
    render json: @event
  end

  def create
    @event = Event.new(permitted_params.merge({ user: current_user }))
    if @event.save
      render json: @event, status: :created
    else
      render json: { error: 'Unable to create event' }, status: :bad_request
    end
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event
      @event.update(permitted_params)
      render json: { success: 'Event successfully updated' }, status: :ok
    else
      render json: { error: 'Event not found' }, status: :bad_request
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    if @event
      @event.destroy
      render json: { success: 'Event successfully deleted' }, status: :ok
    else
      render json: { error: 'Event not found' }, status: :bad_request
    end
  end

  private

  def permitted_params
    params.required(:event).permit(:name, :repeatable, :date, :starts_at, :finished_at)
  end
end
