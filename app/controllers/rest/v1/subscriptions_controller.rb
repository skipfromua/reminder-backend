class Rest::V1::SubscriptionsController < Rest::V1::BaseApiController
  def index
    render json: SubscriptionSerializer.new(resource), status: :ok
  end

  def create
    # sub creation action
  end

  def destroy
    # sub destroying action
  end
end
