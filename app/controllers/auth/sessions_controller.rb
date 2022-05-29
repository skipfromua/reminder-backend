class Auth::SessionsController < DeviseController
  skip_before_action :preflight_request, only: :create

  def create
    if user&.valid_password?(permitted_params[:password])
      sign_in user, store: false

      render json: {
        user: user.email,
        auth_token: user.generate_auth_token
      }, status: :ok
    else
      render_unprocessable_entity
    end
  end

  private

  def user
    User.find_by(email: permitted_params[:email])
  end

  def permitted_params
    params.permit(:email, :password)
  end

  def render_unprocessable_entity
    render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
  end
end
